Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290E6160B
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6F789B68;
	Sun,  7 Jul 2019 18:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6D989B68
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:39:25 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCC59CC;
 Sun,  7 Jul 2019 20:39:06 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 53/60] drm/omap: dpi: Simplify clock setting API
Date: Sun,  7 Jul 2019 21:19:30 +0300
Message-Id: <20190707181937.6250-50-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562524764;
 bh=4umyWih/TfnNvD3tfo7d6LMp3KQNhES/1XPZJyYJFkg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PflISNmRVUs7lbpQ61h50qjMsch0kF2aY2AZKHo6tChweFDjEE79ZHYPLxAY0oHP+
 yU32dfEgSTxeTFjRIFhbZ9IE8ymiyGAvdSduTcEKdayoBa5k1e8ppoUJwggx/vtU3w
 RT+Zl/du81p9kSVukt97PQnISlM3DL9ETQBajz7w=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRwaV9zZXRfcGxsX2NsaygpIGFuZCBkcGlfc2V0X2Rpc3BjX2NsaygpIHJldHVybiB2YXJp
b3VzIGluZm9ybWF0aW9uCnRocm91Z2ggcG9pbnRlciBhcmd1bWVudHMgdGhhdCBhcmUgbmV2ZXIg
dXNlZCBieSB0aGUgY2FsbGVycy4gUmVtb3ZlCnRoZW0gdG8gc2ltcGxpZnkgdGhlIGNsb2NrIHNl
dHRpbmcgQVBJLgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9k
cGkuYyB8IDMyICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9k
cGkuYwppbmRleCAxMmE3MGI3MTYzZGEuLmE4M2JjZmU1ODhkZiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2RwaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rzcy9kcGkuYwpAQCAtMjk4LDkgKzI5OCw3IEBAIHN0YXRpYyBib29sIGRwaV9kc3NfY2xrX2Nh
bGMoc3RydWN0IGRwaV9kYXRhICpkcGksIHVuc2lnbmVkIGxvbmcgcGNrLAogCiAKIAotc3RhdGlj
IGludCBkcGlfc2V0X3BsbF9jbGsoc3RydWN0IGRwaV9kYXRhICpkcGksIGVudW0gb21hcF9jaGFu
bmVsIGNoYW5uZWwsCi0JCXVuc2lnbmVkIGxvbmcgcGNrX3JlcSwgdW5zaWduZWQgbG9uZyAqZmNr
LCBpbnQgKmxja19kaXYsCi0JCWludCAqcGNrX2RpdikKK3N0YXRpYyBpbnQgZHBpX3NldF9wbGxf
Y2xrKHN0cnVjdCBkcGlfZGF0YSAqZHBpLCB1bnNpZ25lZCBsb25nIHBja19yZXEpCiB7CiAJc3Ry
dWN0IGRwaV9jbGtfY2FsY19jdHggY3R4OwogCWludCByOwpAQCAtMzE0LDE5ICszMTIsMTUgQEAg
c3RhdGljIGludCBkcGlfc2V0X3BsbF9jbGsoc3RydWN0IGRwaV9kYXRhICpkcGksIGVudW0gb21h
cF9jaGFubmVsIGNoYW5uZWwsCiAJaWYgKHIpCiAJCXJldHVybiByOwogCi0JZHNzX3NlbGVjdF9s
Y2RfY2xrX3NvdXJjZShkcGktPmRzcywgY2hhbm5lbCwgZHBpLT5jbGtfc3JjKTsKKwlkc3Nfc2Vs
ZWN0X2xjZF9jbGtfc291cmNlKGRwaS0+ZHNzLCBkcGktPm91dHB1dC5kaXNwY19jaGFubmVsLAor
CQkJCSAgZHBpLT5jbGtfc3JjKTsKIAogCWRwaS0+bWdyX2NvbmZpZy5jbG9ja19pbmZvID0gY3R4
LmRpc3BjX2NpbmZvOwogCi0JKmZjayA9IGN0eC5wbGxfY2luZm8uY2xrb3V0W2N0eC5jbGtvdXRf
aWR4XTsKLQkqbGNrX2RpdiA9IGN0eC5kaXNwY19jaW5mby5sY2tfZGl2OwotCSpwY2tfZGl2ID0g
Y3R4LmRpc3BjX2NpbmZvLnBja19kaXY7Ci0KIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBk
cGlfc2V0X2Rpc3BjX2NsayhzdHJ1Y3QgZHBpX2RhdGEgKmRwaSwgdW5zaWduZWQgbG9uZyBwY2tf
cmVxLAotCQl1bnNpZ25lZCBsb25nICpmY2ssIGludCAqbGNrX2RpdiwgaW50ICpwY2tfZGl2KQor
c3RhdGljIGludCBkcGlfc2V0X2Rpc3BjX2NsayhzdHJ1Y3QgZHBpX2RhdGEgKmRwaSwgdW5zaWdu
ZWQgbG9uZyBwY2tfcmVxKQogewogCXN0cnVjdCBkcGlfY2xrX2NhbGNfY3R4IGN0eDsKIAlpbnQg
cjsKQEAgLTM0MiwyOSArMzM2LDE5IEBAIHN0YXRpYyBpbnQgZHBpX3NldF9kaXNwY19jbGsoc3Ry
dWN0IGRwaV9kYXRhICpkcGksIHVuc2lnbmVkIGxvbmcgcGNrX3JlcSwKIAogCWRwaS0+bWdyX2Nv
bmZpZy5jbG9ja19pbmZvID0gY3R4LmRpc3BjX2NpbmZvOwogCi0JKmZjayA9IGN0eC5mY2s7Ci0J
Kmxja19kaXYgPSBjdHguZGlzcGNfY2luZm8ubGNrX2RpdjsKLQkqcGNrX2RpdiA9IGN0eC5kaXNw
Y19jaW5mby5wY2tfZGl2OwotCiAJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgZHBpX3NldF9t
b2RlKHN0cnVjdCBkcGlfZGF0YSAqZHBpKQogewotCWludCBsY2tfZGl2ID0gMCwgcGNrX2RpdiA9
IDA7Ci0JdW5zaWduZWQgbG9uZyBmY2sgPSAwOwotCWludCByID0gMDsKKwlpbnQgcjsKIAogCWlm
IChkcGktPnBsbCkKLQkJciA9IGRwaV9zZXRfcGxsX2NsayhkcGksIGRwaS0+b3V0cHV0LmRpc3Bj
X2NoYW5uZWwsCi0JCQkJICAgIGRwaS0+cGl4ZWxjbG9jaywgJmZjaywgJmxja19kaXYsICZwY2tf
ZGl2KTsKKwkJciA9IGRwaV9zZXRfcGxsX2NsayhkcGksIGRwaS0+cGl4ZWxjbG9jayk7CiAJZWxz
ZQotCQlyID0gZHBpX3NldF9kaXNwY19jbGsoZHBpLCBkcGktPnBpeGVsY2xvY2ssICZmY2ssCi0J
CQkJJmxja19kaXYsICZwY2tfZGl2KTsKLQlpZiAocikKLQkJcmV0dXJuIHI7CisJCXIgPSBkcGlf
c2V0X2Rpc3BjX2NsayhkcGksIGRwaS0+cGl4ZWxjbG9jayk7CiAKLQlyZXR1cm4gMDsKKwlyZXR1
cm4gcjsKIH0KIAogc3RhdGljIHZvaWQgZHBpX2NvbmZpZ19sY2RfbWFuYWdlcihzdHJ1Y3QgZHBp
X2RhdGEgKmRwaSkKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
