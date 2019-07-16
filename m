Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F56B731
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B7A6E268;
	Wed, 17 Jul 2019 07:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B9289BF8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 11:58:15 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u17so9336785pgi.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 04:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJ9T4k4yWMJOAaiUcAIMxLuNgP/0Z4a1nwB48vdQUdo=;
 b=H0Nh+JP04QwS5LISjlXYWzaUURbYQ7vmw0JMXm2MDA/+QhvCh9mmB24grUrvg5jNGy
 HmYWE0Fxq+9Lzl5Toq/RTsRTVvK9hea/0ZRjmU3adsT1PgD+V+sFvi7F0nHMCIVNQz5o
 jOoGJABFUmG17IU2yVYv/wQBN9Yl73zjhh3l3ErSePyjPY/r7UyLNeL+sO8FGIjHqAr9
 u+6Q1EYPHbjtU8OAUpvGpogA4MVRV3EjTsoLSU9XXASQfVYLXHq/XKIJGUkFnekShqvj
 SNu23Ah8HGYap0chSyjtZT3JvshyzKYyoFr61fET86VFVhR2mCnaW8MKsQGBY8avQ2YQ
 mr/w==
X-Gm-Message-State: APjAAAVC2yjEBWlECOHmui4k0XCfmWvdxpIwM9hQSTk3GMb6s3B9+reh
 SXAI0m3FD7MpaLAEz1pNMX3kiQ==
X-Google-Smtp-Source: APXvYqwdkiH5M0kTSkdfPzOar3C5PkahE8wVlfIIMiPgkUOHHGZc6jLK93Gia2KxwC6qXmvd1g14cQ==
X-Received: by 2002:a65:6415:: with SMTP id a21mr23688039pgv.98.1563278294634; 
 Tue, 16 Jul 2019 04:58:14 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id b136sm14339900pfb.73.2019.07.16.04.58.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 04:58:14 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] ASoC: rockchip_max98090: Add HDMI jack support
Date: Tue, 16 Jul 2019 19:57:25 +0800
Message-Id: <20190716115725.66558-6-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190716115725.66558-1-cychiang@chromium.org>
References: <20190716115725.66558-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nJ9T4k4yWMJOAaiUcAIMxLuNgP/0Z4a1nwB48vdQUdo=;
 b=DJg5FQ/b8ibX3/qRon/C0WjumXrFGskJlX4dLrfgPFdEW871DWyj4qj81OU4bpUBTm
 n6Gw9h9eyPBpd2Iu2dKRFO3vm5fnJHIoW8Tz1d/6SEhLhchpjqPCzv4eA90ZnjFIr975
 Y+qDKR3V68B0mGwbagz+uiNdKChKPFwbYRhk4=
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
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbWFjaGluZSBkcml2ZXIsIGNyZWF0ZSBhIGphY2sgYW5kIGxldCBoZG1pLWNvZGVjIHJlcG9y
dCBqYWNrIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPgotLS0KIHNvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5j
IHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMg
Yi9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYwppbmRleCBjODI5NDhlMzgz
ZGEuLmM4MWM0YWNkYTkxNyAxMDA2NDQKLS0tIGEvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlw
X21heDk4MDkwLmMKKysrIGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX21heDk4MDkwLmMK
QEAgLTEzNCw2ICsxMzQsMjUgQEAgZW51bSB7CiAJREFJTElOS19IRE1JLAogfTsKIAorc3RhdGlj
IHN0cnVjdCBzbmRfc29jX2phY2sgcmtfaGRtaV9qYWNrOworCitzdGF0aWMgaW50IHJrX2hkbWlf
aW5pdChzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAqcnVudGltZSkKK3sKKwlzdHJ1Y3Qgc25k
X3NvY19jYXJkICpjYXJkID0gcnVudGltZS0+Y2FyZDsKKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25l
bnQgKmNvbXBvbmVudCA9IHJ1bnRpbWUtPmNvZGVjX2RhaS0+Y29tcG9uZW50OworCWludCByZXQ7
CisKKwkvKiBlbmFibGUgamFjayBkZXRlY3Rpb24gKi8KKwlyZXQgPSBzbmRfc29jX2NhcmRfamFj
a19uZXcoY2FyZCwgIkhETUkgSmFjayIsIFNORF9KQUNLX0xJTkVPVVQsCisJCQkJICAgICZya19o
ZG1pX2phY2ssIE5VTEwsIDApOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihjYXJkLT5kZXYsICJD
YW4ndCBuZXcgSERNSSBKYWNrICVkXG4iLCByZXQpOworCQlyZXR1cm4gcmV0OworCX0KKworCXJl
dHVybiBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVjdChjb21wb25lbnQsICZya19oZG1pX2phY2sp
OworfQorCiAvKiBtYXg5ODA5MCBhbmQgSERNSSBjb2RlYyBkYWlfbGluayAqLwogc3RhdGljIHN0
cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2RhaWxpbmtzW10gPSB7CiAJW0RBSUxJTktfTUFYOTgw
OTBdID0gewpAQCAtMTUxLDYgKzE3MCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfbGlu
ayBya19kYWlsaW5rc1tdID0gewogCQkub3BzID0gJnJrX2FpZjFfb3BzLAogCQkuZGFpX2ZtdCA9
IFNORF9TT0NfREFJRk1UX0kyUyB8IFNORF9TT0NfREFJRk1UX05CX05GIHwKIAkJCVNORF9TT0Nf
REFJRk1UX0NCU19DRlMsCisJCS5pbml0ID0gcmtfaGRtaV9pbml0LAogCQlTTkRfU09DX0RBSUxJ
TktfUkVHKGhkbWkpLAogCX0KIH07Ci0tIAoyLjIyLjAuNTEwLmcyNjRmMmM4MTdhLWdvb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
