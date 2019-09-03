Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F897A62DB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 09:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954FB89590;
	Tue,  3 Sep 2019 07:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA5689718
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 06:56:08 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 205so7719246pfw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 23:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=63naJTzVpAIq0B9AEz7oC56daTv5sIo3itON2f7HCdg=;
 b=kZyr3DEpKhxPLpDJorFMz/u4Vkq2oFyEtXDpNku8/j0HfxwRkvHOcOoqUnxrNHYzVH
 wryZSZ6sh83oYzYDyFRbkA0s8WTOrNfa+bk5ptVlzMZ7XaRHPlzsxf5n+9BVkPgRN/3K
 ktufATsYyt1YG2XCXZKNx+wztabU6w7fZoaIYL36NIRkCvHkuHk+LwlhDmGWIqArWPOr
 C/quWAgfMCR3h1zhc4n4VQsRWZ1u8DVv0MtiPlRgPCufg3+AL3YfFoKp66evhc+ttEdd
 aFqeWuNaSXnaipiE5z9WFjzLSJhyiymEPRLooILlBuHxQbNyLQ6oq5lyqopPvhtVOdMs
 yypw==
X-Gm-Message-State: APjAAAW493+TN7+BMQFR5pfYakm/mZs8FyF0Yidl7IFkO1h5U4nnUUOD
 cbc/ZRUa10yzp9Hfj7ICCEN8o83XlFakYw==
X-Google-Smtp-Source: APXvYqxd/j+T8QJmSIsIzaygKzKALx+cde7roGbSkff1Tptv3dOOMPVjCFVwg3YlkwTTrw/JnG/gHw==
X-Received: by 2002:a17:90a:b108:: with SMTP id
 z8mr17183365pjq.108.1567493767618; 
 Mon, 02 Sep 2019 23:56:07 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id e189sm19370762pgc.15.2019.09.02.23.56.03
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Sep 2019 23:56:07 -0700 (PDT)
From: Baolin Wang <baolin.wang@linaro.org>
To: stable@vger.kernel.org,
	chris@chris-wilson.co.uk,
	airlied@linux.ie
Subject: [BACKPORT 4.14.y 1/8] drm/i915/fbdev: Actually configure untiled
 displays
Date: Tue,  3 Sep 2019 14:55:26 +0800
Message-Id: <5723d9006de706582fb46f9e1e3eb8ce168c2126.1567492316.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1567492316.git.baolin.wang@linaro.org>
References: <cover.1567492316.git.baolin.wang@linaro.org>
X-Mailman-Approved-At: Tue, 03 Sep 2019 07:41:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=63naJTzVpAIq0B9AEz7oC56daTv5sIo3itON2f7HCdg=;
 b=qlIc1kZNUSEis4xPtAe2vGproYxzVQ4Sqyq9xvpjUKmmWltJv/1g/l4c/k7azDOSF7
 TMiWaxjoVaBFuIyIWWMpBTRxRQl2QSgi1TXErgRIgFS0/quWdUWJ06sEgwHatwbuZtzc
 ZppTe4/4kpyRpaSlYbExx9j+3L1X8gCS7TPK5bylEI6r/Y+5T/VG01xhyA65NM4pMuIH
 i1QwXYW0nH87NZWZNoULz9kv2StEte877lqujLvYnEK0MXiFMYBUBoLYVskwqkTwQwn8
 h+65MVd3gQ6oTiTiEnZzBJfMHswIF6ccifNGBiqmqFgMjq5ICFomUz3SdBVD6xeHpf47
 9QNg==
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
Cc: vincent.guittot@linaro.org, arnd@arndb.de, baolin.wang@linaro.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, orsonzhai@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpJZiB3ZSBza2lw
cGVkIGFsbCB0aGUgY29ubmVjdG9ycyB0aGF0IHdlcmUgbm90IHBhcnQgb2YgYSB0aWxlLCB3ZSB3
b3VsZApsZWF2ZSBjb25uX3NlcT0wIGFuZCBjb25uX2NvbmZpZ3VyZWQ9MCwgY29udmluY2luZyBv
dXJzZWx2ZXMgdGhhdCB3ZQpoYWQgc3RhZ25hdGVkIGluIG91ciBjb25maWd1cmF0aW9uIGF0dGVt
cHRzLiBBdm9pZCB0aGlzIHNpdHVhdGlvbiBieQpzdGFydGluZyBjb25uX3NlcT1BTExfQ09OTkVD
VE9SUywgYW5kIHJlcGVhdGluZyB1bnRpbCB3ZSBmaW5kIG5vIG1vcmUKY29ubmVjdG9ycyB0byBj
b25maWd1cmUuCgpGaXhlczogNzU0YTc2NTkxYjEyICgiZHJtL2k5MTUvZmJkZXY6IFN0b3AgcmVw
ZWF0aW5nIHRpbGUgY29uZmlndXJhdGlvbiBvbiBzdGFnbmF0aW9uIikKUmVwb3J0ZWQtYnk6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KUmV2aWV3
ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8y
MDE5MDIxNTEyMzAxOS4zMjI4My0xLWNocmlzQGNocmlzLXdpbHNvbi5jby51awpDYzogPHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjMuMTkrClNpZ25lZC1vZmYtYnk6IEJhb2xpbiBXYW5nIDxi
YW9saW4ud2FuZ0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Zi
ZGV2LmMgfCAgIDEyICsrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRl
bF9mYmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZmJkZXYuYwppbmRleCBkYTJk
MzA5Li4xNGViOGEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9mYmRl
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2ZiZGV2LmMKQEAgLTMyNiw4ICsz
MjYsOCBAQCBzdGF0aWMgYm9vbCBpbnRlbF9mYl9pbml0aWFsX2NvbmZpZyhzdHJ1Y3QgZHJtX2Zi
X2hlbHBlciAqZmJfaGVscGVyLAogCQkJCSAgICBib29sICplbmFibGVkLCBpbnQgd2lkdGgsIGlu
dCBoZWlnaHQpCiB7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkx
NShmYl9oZWxwZXItPmRldik7Ci0JdW5zaWduZWQgbG9uZyBjb25uX2NvbmZpZ3VyZWQsIGNvbm5f
c2VxLCBtYXNrOwogCXVuc2lnbmVkIGludCBjb3VudCA9IG1pbihmYl9oZWxwZXItPmNvbm5lY3Rv
cl9jb3VudCwgQklUU19QRVJfTE9ORyk7CisJdW5zaWduZWQgbG9uZyBjb25uX2NvbmZpZ3VyZWQs
IGNvbm5fc2VxOwogCWludCBpLCBqOwogCWJvb2wgKnNhdmVfZW5hYmxlZDsKIAlib29sIGZhbGxi
YWNrID0gdHJ1ZSwgcmV0ID0gdHJ1ZTsKQEAgLTM0NSwxMCArMzQ1LDkgQEAgc3RhdGljIGJvb2wg
aW50ZWxfZmJfaW5pdGlhbF9jb25maWcoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwK
IAkJZHJtX21vZGVzZXRfYmFja29mZigmY3R4KTsKIAogCW1lbWNweShzYXZlX2VuYWJsZWQsIGVu
YWJsZWQsIGNvdW50KTsKLQltYXNrID0gR0VOTUFTSyhjb3VudCAtIDEsIDApOworCWNvbm5fc2Vx
ID0gR0VOTUFTSyhjb3VudCAtIDEsIDApOwogCWNvbm5fY29uZmlndXJlZCA9IDA7CiByZXRyeToK
LQljb25uX3NlcSA9IGNvbm5fY29uZmlndXJlZDsKIAlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkr
KykgewogCQlzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9jb25uZWN0b3IgKmZiX2Nvbm47CiAJCXN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7CkBAIC0zNjEsNyArMzYwLDggQEAgc3RhdGljIGJv
b2wgaW50ZWxfZmJfaW5pdGlhbF9jb25maWcoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBl
ciwKIAkJaWYgKGNvbm5fY29uZmlndXJlZCAmIEJJVChpKSkKIAkJCWNvbnRpbnVlOwogCi0JCWlm
IChjb25uX3NlcSA9PSAwICYmICFjb25uZWN0b3ItPmhhc190aWxlKQorCQkvKiBGaXJzdCBwYXNz
LCBvbmx5IGNvbnNpZGVyIHRpbGVkIGNvbm5lY3RvcnMgKi8KKwkJaWYgKGNvbm5fc2VxID09IEdF
Tk1BU0soY291bnQgLSAxLCAwKSAmJiAhY29ubmVjdG9yLT5oYXNfdGlsZSkKIAkJCWNvbnRpbnVl
OwogCiAJCWlmIChjb25uZWN0b3ItPnN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3Rl
ZCkKQEAgLTQ2NSw4ICs0NjUsMTAgQEAgc3RhdGljIGJvb2wgaW50ZWxfZmJfaW5pdGlhbF9jb25m
aWcoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwKIAkJY29ubl9jb25maWd1cmVkIHw9
IEJJVChpKTsKIAl9CiAKLQlpZiAoKGNvbm5fY29uZmlndXJlZCAmIG1hc2spICE9IG1hc2sgJiYg
Y29ubl9jb25maWd1cmVkICE9IGNvbm5fc2VxKQorCWlmIChjb25uX2NvbmZpZ3VyZWQgIT0gY29u
bl9zZXEpIHsgLyogcmVwZWF0IHVudGlsIG5vIG1vcmUgYXJlIGZvdW5kICovCisJCWNvbm5fc2Vx
ID0gY29ubl9jb25maWd1cmVkOwogCQlnb3RvIHJldHJ5OworCX0KIAogCS8qCiAJICogSWYgdGhl
IEJJT1MgZGlkbid0IGVuYWJsZSBldmVyeXRoaW5nIGl0IGNvdWxkLCBmYWxsIGJhY2sgdG8gaGF2
ZSB0aGUKLS0gCjEuNy45LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
