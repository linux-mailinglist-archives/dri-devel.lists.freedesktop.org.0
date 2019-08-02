Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5BD80059
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 20:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDF36EF4D;
	Fri,  2 Aug 2019 18:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C40A6EF4D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 18:46:41 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id b3so33995972plr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 11:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIy8h5wSfDH2K7xzDnBEs97s43/jf77iM8+1t5qbcTA=;
 b=GjKmFEInnh29PCbD4CQssDVXjHfPMkdxArd7wEnDxhB/idrQmP6HqkAtpdCoPQtLvK
 RgM0g5n0seT91dzAuNYIJK5x/UNM5h1q39BbWz8mJ4tuA0Ozh/V8iFtNi9m2VGzIBQAf
 Rbn/3PuxEVaF1zS3er/9iuxed8cAx/jMYsLVeKwX7bkqe8OhrmAEOrL8XFTBMLwdVD+b
 0LkI+xbDfyB+7UgDoip5zSXmSu/c2zDXDmY58MMIAiykcEDVvX+BOSOHaUbgtPg3zNZv
 wrGocTQy3AHPNEAmMqkJBLcQoCVazL+Glts/91t88NRPCpFf6XjZINAwH8gz4I3RlYVo
 OPjg==
X-Gm-Message-State: APjAAAUlbpD/HpqV3hFrUTgFzKUG9YWvOMN13WLtzEpLTBKdlE0BdcBO
 IJlV/9HftXwY+QvajEYtlIVp5Q==
X-Google-Smtp-Source: APXvYqyzzypa/BIcIJw4+CL+ZCerUphjYpafPzUroZSN13bv9VpeTF9YJah3URQns8ZT10F1jhisNA==
X-Received: by 2002:a17:902:2aa8:: with SMTP id
 j37mr126464818plb.316.1564771600984; 
 Fri, 02 Aug 2019 11:46:40 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id f19sm112071104pfk.180.2019.08.02.11.46.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 11:46:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, seanpaul@chromium.org
Subject: [PATCH] drm/rockchip: Suspend DP late
Date: Fri,  2 Aug 2019 11:46:16 -0700
Message-Id: <20190802184616.44822-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIy8h5wSfDH2K7xzDnBEs97s43/jf77iM8+1t5qbcTA=;
 b=dM2JCKG4ZUdCfNsWMCALyfKMUlMYXJR1Ny3J8w66b56pgCzx9krV9g/X89YcVbqo19
 05Hw1m1UpMW0MmMsBYCojTQBt56r4WJImUvbKsmgjzA/PcpjOl/lII2MX/R4BfBJH5fG
 XEBK2PEP1UZjsjFqxDsMfeIoZ0TIeDfIePL1s=
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
 linux-rockchip@lists.infradead.org, mka@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY29tbWl0IGZlNjRiYTVjNjMyMyAoImRybS9yb2NrY2hpcDogUmVzdW1lIERQIGVhcmx5Iikg
d2UgbW92ZWQKcmVzdW1lIHRvIGJlIGVhcmx5IGJ1dCBsZWZ0IHN1c3BlbmQgYXQgaXRzIG5vcm1h
bCB0aW1lLiAgVGhpcyBzZWVtcwpsaWtlIGl0IGNvdWxkIGJlIE9LLCBidXQgY2FzdWVzIHByb2Js
ZW1zIGlmIGEgc3VzcGVuZCBnZXRzIGludGVycnVwdGVkCnBhcnR3YXkgdGhyb3VnaC4gIFRoZSBP
UyBvbmx5IGJhbGFuY2VzIG1hdGNoaW5nIHN1c3BlbmQvcmVzdW1lIGxldmVscy4KLi4uc28gaWYg
c3VzcGVuZCB3YXMgY2FsbGVkIHRoZW4gcmVzdW1lIHdpbGwgYmUgY2FsbGVkLiAgSWYgc3VzcGVu
ZApsYXRlIHdhcyBjYWxsZWQgdGhlbiByZXN1bWUgZWFybHkgd2lsbCBiZSBjYWxsZWQuICAuLi5i
dXQgaWYgc3VzcGVuZAp3YXMgY2FsbGVkIHJlc3VtZSBlYXJseSBtaWdodCBub3QgZ2V0IGNhbGxl
ZC4gIFRoaXMgbGVhZHMgdG8gYW4KdW5iYWxhbmNlIGluIHRoZSBjbG9jayBlbmFibGVzIC8gZGlz
YWJsZXMuCgpMZXRzIHRha2UgdGhlIHNpbXBsZSBmaXggYW5kIGp1c3QgbW92ZSBzdXNwZW5kIHRv
IGJlIGxhdGUgdG8gbWF0Y2guClRoaXMgbWFrZXMgdGhlIFBNIGNvcmUgdGFrZSBwcm9wZXIgY2Fy
ZSBpbiBrZWVwaW5nIHRoaW5ncyBiYWxhbmNlZC4KCkZpeGVzOiBmZTY0YmE1YzYzMjMgKCJkcm0v
cm9ja2NoaXA6IFJlc3VtZSBEUCBlYXJseSIpClNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJz
b24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KLS0tCgogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2FuYWxvZ2l4X2RwLXJvY2tjaGlwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvYW5hbG9naXhfZHAtcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9hbmFs
b2dpeF9kcC1yb2NrY2hpcC5jCmluZGV4IDdkN2NiNTc0MTBmYy4uZjM4ZjVlMTEzYzZiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvYW5hbG9naXhfZHAtcm9ja2NoaXAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvYW5hbG9naXhfZHAtcm9ja2NoaXAuYwpAQCAt
NDM2LDcgKzQzNiw3IEBAIHN0YXRpYyBpbnQgcm9ja2NoaXBfZHBfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHJvY2tjaGlwX2RwX3Bt
X29wcyA9IHsKICNpZmRlZiBDT05GSUdfUE1fU0xFRVAKLQkuc3VzcGVuZCA9IHJvY2tjaGlwX2Rw
X3N1c3BlbmQsCisJLnN1c3BlbmRfbGF0ZSA9IHJvY2tjaGlwX2RwX3N1c3BlbmQsCiAJLnJlc3Vt
ZV9lYXJseSA9IHJvY2tjaGlwX2RwX3Jlc3VtZSwKICNlbmRpZgogfTsKLS0gCjIuMjIuMC43NzAu
ZzBmMmM0YTM3ZmQtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
