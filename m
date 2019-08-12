Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B673F8E6B1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D0B6E8FC;
	Thu, 15 Aug 2019 08:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779436E4FE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r1so5243966wrl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMduQLcYqJa9E1xoRdmMO8whZQuhJA1DUXAc3zPrO3g=;
 b=X8RkSLPazg3n1/ZLEN+rjVKZQFc48MXL0Xq8muWGbzZ+yOdBqITvqbfpNWvKJNmBP8
 DV5P2vL443j4RIRkRDAk3T0BPlzNY8eKez5iKBbzReEntvgJd/H8I2gxC+1apcXgHWNf
 N2BP1zbpzqkpdhUu0EshtlhICihGOfLsp0rBiAvtT4xs4j2lDFmZdgIq8q4BY5vxq1HA
 NWzfeWmhJdGP7dYH7MzwRzpF2fDdFXYdzSXVkINmIehTRRctkSRgGT0uGi2Zcx5iXOqU
 bPmzP5JYPxYS105cvHUZR0JR2RVftjnN0tmDdelKWxfPlz6eslOJsP0c4xsXKqPo4dKJ
 gs8Q==
X-Gm-Message-State: APjAAAWJSvGNhaHoRm9eN/20GOjgaDauBpHCs06cCuK69Cm8l/gm1e2+
 FHJZV2fVEoCP/j1h8ngZFwMMgw==
X-Google-Smtp-Source: APXvYqwBXFdcnSm3N9WSnk3H4/5r6eeqaMC73NAcum/+jEQe399Q3DLr4ex5iwjbxozzlPA6mgZt0w==
X-Received: by 2002:adf:e887:: with SMTP id d7mr24777870wrm.282.1565611649905; 
 Mon, 12 Aug 2019 05:07:29 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/8] drm/bridge: dw-hdmi: improve i2s support
Date: Mon, 12 Aug 2019 14:07:18 +0200
Message-Id: <20190812120726.1528-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PMduQLcYqJa9E1xoRdmMO8whZQuhJA1DUXAc3zPrO3g=;
 b=ZSHKMJha6yfzKyUtd06NcDFZ3gN6HThtYSZHVhI1dWDon6ToPzcz/3Own8XjxQ6mgY
 cNZxnu/TVZ+61qFCnUFdEJLOgky25gQCDhsH/+hNfvo1/tuwRFVAYIZ0rlF6tlIm0KyF
 iUCMnmfJERpt/DBw38nE6bUD0UhHm32KkD+TwpX8kS784VDRNuZ4zM0XGH1+eHhHNIGF
 rfG1P9vlqoj1SknmEStYhp/BpCNJvZPevmhinSS3o/GeDoPPCkItQDqi5o7p0o/Z19H4
 V/l1fiLnkQUc1tJTXSRA6hZMqewIKizbra1XnWkTwB1TSx5TgqY0slk6QhUZjZoyT3JS
 G5FA==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaHNldCBpcyB0byBpbXByb3ZlIHRoZSBzdXBwb3J0IG9m
IHRoZSBpMnMKaW50ZXJmYWNlIG9mIHRoZSBzeW5vcHN5cyBoZG1pIGNvbnRyb2xsZXIuCgpPbmNl
IGFwcGxpZWQsIHRoZSBpbnRlcmZhY2Ugc2hvdWxkIHN1cHBvcnQgYWxsIHRoZSB1c3VhbCBpMnMg
YnVzIGZvcm1hdHMsCjggY2hhbm5lbHMgcGxheWJhY2sgYW5kIHByb3Blcmx5IHNldHVwIHRoZSBj
aGFubmVsIG51bWJlciBhbmQgYWxsb2NhdGlvbgppbiB0aGUgaW5mb2ZyYW1lcy4KCkFsc28sIHRo
ZSBkdy1oZG1pIGkycyBpbnRlcmZhY2Ugd2lsbCBub3cgcHJvdmlkZSB0aGUgZWxkIHRvIHRoZSBn
ZW5lcmljCmhkbWktY29kZWMgc28gaXQgY2FuIGV4cG9zZSB0aGUgcmVsYXRlZCBjb250cm9scyB0
byB1c2VyIHNwYWNlLgoKVGhpcyB3b3JrIHdhcyBpbnNwaXJlZCBieSBKb25hcyBLYXJsbWFuJ3Mg
d29yaywgYXZhaWxhYmxlIGhlcmUgWzBdLgoKVGhpcyB3YXMgdGVzdGVkIHRoZSBBbWxvZ2ljIG1l
c29uLWcxMmEtc2VpNTEwIHBsYXRmb3JtLgpGb3IgdGhpcyBzcGVjaWZpYyBwbGF0Zm9ybSwgd2hp
Y2ggdXNlcyBjb2RlYzJjb2RlYyBsaW5rcywgdGhlcmUgaXMgYQpydW50aW1lIGRlcGVuZGVuY3kg
Zm9yIHBhdGNoIDggb24gdGhpcyBBU29DIHNlcmllcyBbMV0uCgpDaGFuZ2VzIHNpbmNlIHYxIFsy
XToKICogRml4IGNvcHkgc2l6ZSBpbiAuZ2V0X2VsZCgpCgpbMF06IGh0dHBzOi8vZ2l0aHViLmNv
bS9Ld2lib28vbGludXgtcm9ja2NoaXAvY29tbWl0cy9yb2NrY2hpcC01LjItZm9yLWxpYnJlZWxl
Yy12NS4yLjMKWzFdOiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMTkwNzI1MTY1OTQ5LjI5
Njk5LTEtamJydW5ldEBiYXlsaWJyZS5jb20KWzJdOiBodHRwczovL2xrbWwua2VybmVsLm9yZy9y
LzIwMTkwODA1MTM0MTAyLjI0MTczLTEtamJydW5ldEBiYXlsaWJyZS5jb20KCkplcm9tZSBCcnVu
ZXQgKDgpOgogIGRybS9icmlkZ2U6IGR3LWhkbWktaTJzOiBzdXBwb3J0IG1vcmUgaTJzIGZvcm1h
dAogIGRybS9icmlkZ2U6IGR3LWhkbWk6IG1vdmUgYXVkaW8gY2hhbm5lbCBzZXR1cCBvdXQgb2Yg
YWhiCiAgZHJtL2JyaWRnZTogZHctaGRtaTogc2V0IGNoYW5uZWwgY291bnQgaW4gdGhlIGluZm9m
cmFtZXMKICBkcm0vYnJpZGdlOiBkdy1oZG1pLWkyczogZW5hYmxlIGxwY20gbXVsdGkgY2hhbm5l
bHMKICBkcm0vYnJpZGdlOiBkdy1oZG1pLWkyczogc2V0IHRoZSBjaGFubmVsIGFsbG9jYXRpb24K
ICBkcm0vYnJpZGdlOiBkdy1oZG1pLWkyczogcmVzZXQgYXVkaW8gZmlmbyBiZWZvcmUgYXBwbHlp
bmcgbmV3IHBhcmFtcwogIGRybS9icmlkZ2U6IGR3LWhkbWktaTJzOiBlbmFibGUgb25seSB0aGUg
cmVxdWlyZWQgaTJzIGxhbmVzCiAgZHJtL2JyaWRnZTogZHctaGRtaS1pMnM6IGFkZCAuZ2V0X2Vs
ZCBzdXBwb3J0CgogLi4uL2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1haGItYXVkaW8uYyAg
IHwgMjAgKystLS0tLQogLi4uL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktYXVkaW8u
aCAgIHwgIDEgKwogLi4uL2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyAg
IHwgNjAgKysrKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMgICAgIHwgMzcgKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuaCAgICAgfCAxMyArKystCiBpbmNsdWRlL2RybS9icmlkZ2UvZHdf
aGRtaS5oICAgICAgICAgICAgICAgICAgfCAgMiArCiA2IGZpbGVzIGNoYW5nZWQsIDEwOCBpbnNl
cnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
