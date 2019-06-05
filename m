Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C436CCC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000908941D;
	Thu,  6 Jun 2019 07:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7412689C84
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 15:14:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5092115BF;
 Wed,  5 Jun 2019 08:14:34 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 0B1963F246; Wed,  5 Jun 2019 08:14:28 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] drivers: Add generic helper to match by of_node
Date: Wed,  5 Jun 2019 16:13:41 +0100
Message-Id: <1559747630-28065-5-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559747630-28065-1-git-send-email-suzuki.poulose@arm.com>
References: <1559747630-28065-1-git-send-email-suzuki.poulose@arm.com>
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thor Thayer <thor.thayer@linux.intel.com>,
 rafael@kernel.org, David Airlie <airlied@linux.ie>, linux-fpga@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Peter Rosin <peda@axentia.se>,
 Frank Rowand <frowand.list@gmail.com>, Alan Tull <atull@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Wolfram Sang <wsa@the-dreams.de>,
 Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org,
 suzuki.poulose@arm.com, Mark Brown <broonie@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 gregkh@linuxfoundation.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Joe Perches <joe@perches.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgaGVscGVyIHRvIG1hdGNoIGRldmljZSBieSB0aGUgb2Zfbm9kZS4gVGhpcyB3aWxsIGJl
IGxhdGVyIHVzZWQKdG8gcHJvdmlkZSBnZW5lcmljIGxvb2t1cCBmdW5jdGlvbnMgYnkgb2Zfbm9k
ZS4KCkNjOiBBbGFuIFR1bGwgPGF0dWxsQGtlcm5lbC5vcmc+CkNjOiBBbmRyZXcgTHVubiA8YW5k
cmV3QGx1bm4uY2g+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiAiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1A
ZGF2ZW1sb2Z0Lm5ldD4KQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxp
QGdtYWlsLmNvbT4KQ2M6IEZyYW5rIFJvd2FuZCA8ZnJvd2FuZC5saXN0QGdtYWlsLmNvbT4KQ2M6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBIZWlu
ZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgpDYzogSmlyaSBTbGFieSA8anNsYWJ5
QHN1c2UuY29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KQ2M6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CkNjOiBMaWFtIEdpcmR3b29kIDxsZ2ly
ZHdvb2RAZ21haWwuY29tPgpDYzogbGludXgtZnBnYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4
LWkyY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBN
YXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+CkNjOiBNYXRoaWV1IFBvaXJpZXIgPG1hdGhp
ZXUucG9pcmllckBsaW5hcm8ub3JnPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBi
b290bGluLmNvbT4KQ2M6IE1vcml0eiBGaXNjaGVyIDxtZGZAa2VybmVsLm9yZz4KQ2M6IFBldGVy
IFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+CkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwu
b3JnPgpDYzogU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8u
b3JnPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFRo
b3IgVGhheWVyIDx0aG9yLnRoYXllckBsaW51eC5pbnRlbC5jb20+CkNjOiBXb2xmcmFtIFNhbmcg
PHdzYUB0aGUtZHJlYW1zLmRlPgpDYzogIlJhZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5l
bC5vcmc+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
PgpDYzogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+CkNjOiBKb2UgUGVyY2hl
cyA8am9lQHBlcmNoZXMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdXp1a2kgSyBQb3Vsb3NlIDxzdXp1
a2kucG91bG9zZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvYmFzZS9jb3JlLmMgICAgfCA2ICsrKysr
KwogaW5jbHVkZS9saW51eC9kZXZpY2UuaCB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL2NvcmUuYyBiL2RyaXZlcnMvYmFz
ZS9jb3JlLmMKaW5kZXggZmQ3NTExZS4uOTIxMTkwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9iYXNl
L2NvcmUuYworKysgYi9kcml2ZXJzL2Jhc2UvY29yZS5jCkBAIC0zMzI4LDMgKzMzMjgsOSBAQCB2
b2lkIGRldmljZV9zZXRfb2Zfbm9kZV9mcm9tX2RldihzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0
IHN0cnVjdCBkZXZpY2UgKmRldjIpCiAJZGV2LT5vZl9ub2RlX3JldXNlZCA9IHRydWU7CiB9CiBF
WFBPUlRfU1lNQk9MX0dQTChkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9kZXYpOworCitpbnQgZGV2
aWNlX21hdGNoX29mX25vZGUoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCB2b2lkICpucCkKK3sK
KwlyZXR1cm4gZGV2LT5vZl9ub2RlID09IG5wOworfQorRVhQT1JUX1NZTUJPTF9HUEwoZGV2aWNl
X21hdGNoX29mX25vZGUpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kZXZpY2UuaCBiL2lu
Y2x1ZGUvbGludXgvZGV2aWNlLmgKaW5kZXggNGQ3Yzg4MS4uNzA5MzA4NSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9saW51eC9kZXZpY2UuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RldmljZS5oCkBAIC0x
NjMsNiArMTYzLDggQEAgdm9pZCBzdWJzeXNfZGV2X2l0ZXJfaW5pdChzdHJ1Y3Qgc3Vic3lzX2Rl
dl9pdGVyICppdGVyLAogc3RydWN0IGRldmljZSAqc3Vic3lzX2Rldl9pdGVyX25leHQoc3RydWN0
IHN1YnN5c19kZXZfaXRlciAqaXRlcik7CiB2b2lkIHN1YnN5c19kZXZfaXRlcl9leGl0KHN0cnVj
dCBzdWJzeXNfZGV2X2l0ZXIgKml0ZXIpOwogCitpbnQgZGV2aWNlX21hdGNoX29mX25vZGUoc3Ry
dWN0IGRldmljZSAqZGV2LCBjb25zdCB2b2lkICpucCk7CisKIGludCBidXNfZm9yX2VhY2hfZGV2
KHN0cnVjdCBidXNfdHlwZSAqYnVzLCBzdHJ1Y3QgZGV2aWNlICpzdGFydCwgdm9pZCAqZGF0YSwK
IAkJICAgICBpbnQgKCpmbikoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKSk7CiBzdHJ1
Y3QgZGV2aWNlICpidXNfZmluZF9kZXZpY2Uoc3RydWN0IGJ1c190eXBlICpidXMsIHN0cnVjdCBk
ZXZpY2UgKnN0YXJ0LAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
