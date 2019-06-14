Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F646C85
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 00:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A1189590;
	Fri, 14 Jun 2019 22:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC4489590
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 22:47:55 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 20so2313729pgr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B/paYYaNElnUhrLCMfr9aofzvSpDY7fIjtUGwDwrL/w=;
 b=kT3OL61hUhHwGIOyV35avdQ1XtN9U5Duo7IdrImWRB6kI6mXt+V+iOEGoia4j78uby
 jjgugJnzubzRIfZo5cKzhKJvyaown7fW+HYNDzh07C+qGUyRiqyHsqjln8emvtx1k402
 UBY1PgAs5ucRHSsX/WVhJGq7qksgO/deIJu3sE1d3m4clQ+9Vj0eWZER4TF37u2DOzAZ
 0zOT2IPE+4gJFAxTgfQfTfyPIg6bd7yNINaVfuxsePYOOdw/egJlGBb0DqBWwMjb5Z3h
 krYcaI1AHv27prqRe0ILx1MSGSEebQ+mRoASd/Yc9JPytXM0ZEf7VOB70tS43ZIo9Rq0
 Yyxw==
X-Gm-Message-State: APjAAAVK+4DZqPq5X53W7H9Gcd+DQNeCwyCKkSsOHNkaMcPVHvkcpeu3
 +oVS9t1A/M5LLOYRXIJLJ8NkNA==
X-Google-Smtp-Source: APXvYqwCFm4zexZwb/yHk0T7k2vyRVj2XJif4vKx4gUkaC3e6ysgiT29t7k5lmVupIUZSX9ZhqMjSw==
X-Received: by 2002:a63:441c:: with SMTP id r28mr37978657pga.255.1560552475017; 
 Fri, 14 Jun 2019 15:47:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x7sm3706087pfm.82.2019.06.14.15.47.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 15:47:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de, seanpaul@chromium.org
Subject: [PATCH 1/2] drm/rockchip: Properly adjust to a true clock in
 adjusted_mode
Date: Fri, 14 Jun 2019 15:47:29 -0700
Message-Id: <20190614224730.98622-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B/paYYaNElnUhrLCMfr9aofzvSpDY7fIjtUGwDwrL/w=;
 b=ApCzoYVFWJ+gmiLTLvrC4zRCv/sxTzAUuGigYReuCPkwv8+JbQtTQ1ujJvy8eXWLqB
 +IQTzppqRJKhqe+8V7UEuUHo4bd+AM07L3HjWFZQQdGpjnep077mDCdlHdC1RIk2DgQq
 5mJV4O++xveG92zkhvhU6kYaRMIla/IEBvu+I=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 urjaman@gmail.com, linux-rockchip@lists.infradead.org,
 Yakir Yang <ykk@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBmaXhpbmcgdXAgdGhlIGNsb2NrIGluIHZvcF9jcnRjX21vZGVfZml4dXAoKSB3ZSdyZSBu
b3QgZG9pbmcgaXQKcXVpdGUgY29ycmVjdGx5LiAgU3BlY2lmaWNhbGx5IGlmIHdlJ3ZlIGdvdCB0
aGUgdHJ1ZSBjbG9jayAyNjY2NjY2NjcgSHosCndlJ2xsIHBlcmZvcm0gdGhpcyBjYWxjdWxhdGlv
bjoKICAgMjY2NjY2NjY3IC8gMTAwMCA9PiAyNjY2NjYKCkxhdGVyIHdoZW4gd2UgdHJ5IHRvIHNl
dCB0aGUgY2xvY2sgd2UnbGwgZG8gY2xrX3NldF9yYXRlKDI2NjY2NiAqCjEwMDApLiAgVGhlIGNv
bW1vbiBjbG9jayBmcmFtZXdvcmsgd29uJ3QgYWN0dWFsbHkgcGljayB0aGUgcHJvcGVyIGNsb2Nr
CmluIHRoaXMgY2FzZSBzaW5jZSBpdCBhbHdheXMgd2FudHMgY2xvY2tzIDw9IHRoZSBzcGVjaWZp
ZWQgb25lLgoKTGV0J3Mgc29sdmUgdGhpcyBieSB1c2luZyBESVZfUk9VTkRfVVAuCgpGaXhlczog
YjU5YjhkZTMxNDk3ICgiZHJtL3JvY2tjaGlwOiByZXR1cm4gYSB0cnVlIGNsb2NrIHJhdGUgdG8g
YWRqdXN0ZWRfbW9kZSIpClNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJz
QGNocm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1
bS5vcmc+ClJldmlld2VkLWJ5OiBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Ci0tLQpC
YWNrIGluIDIwMTYgTWFyayBZYW8gc2FpZCBoZSBhcHBsaWVkIHRoaXMgdG8gaGlzIGRybSBmaXhl
cyBbMV0sIGJ1dCBpdCdzCjIwMTkgYW5kIGl0J3Mgc3RpbGwgbWlzc2luZyBzbyBJJ20gcG9zdGlu
ZyBhZ2Fpbi4KClsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMTAz
ODcyLwoKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCmluZGV4IGU0NTgwZDhmMjFl
MS4uZDEyNGYzNGFiOWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX3ZvcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fdm9wLmMKQEAgLTEwMDYsNyArMTAwNiw4IEBAIHN0YXRpYyBib29sIHZvcF9jcnRjX21vZGVf
Zml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXN0cnVjdCB2b3AgKnZvcCA9IHRvX3ZvcChj
cnRjKTsKIAogCWFkanVzdGVkX21vZGUtPmNsb2NrID0KLQkJY2xrX3JvdW5kX3JhdGUodm9wLT5k
Y2xrLCBtb2RlLT5jbG9jayAqIDEwMDApIC8gMTAwMDsKKwkJRElWX1JPVU5EX1VQKGNsa19yb3Vu
ZF9yYXRlKHZvcC0+ZGNsaywgbW9kZS0+Y2xvY2sgKiAxMDAwKSwKKwkJCSAgICAgMTAwMCk7CiAK
IAlyZXR1cm4gdHJ1ZTsKIH0KLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
