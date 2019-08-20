Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3F39532E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4659E6E595;
	Tue, 20 Aug 2019 01:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBC86E577
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:18:10 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CA5C9C5;
 Tue, 20 Aug 2019 03:18:03 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 43/50] drm/omap: dpi: Simplify clock setting API
Date: Tue, 20 Aug 2019 04:17:14 +0300
Message-Id: <20190820011721.30136-44-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263883;
 bh=kqgswpOm34Uj8ssPEq+me6IzANU+0ieYbfe6z8n7Bs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AmL2S0WLUh1ow4zssW7p/+RMz06cH3e3uPzqMyPdrrRWdIb6CHIOuTrzLgKGybJmP
 MtjoYeD0OW1IUMyC6pSbIX2rMiX27LS5122ygzrP8mwDgRzR9dd83qDvPVktI6O5IQ
 dPLjwmKGXK3s9/eSDk/rHx3A9ikpk4GzYWR0MM64=
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
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
cGkuYwppbmRleCBkY2NmODFlNGNlNjQuLmMxNjdiZDExMTZlYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2RwaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rzcy9kcGkuYwpAQCAtMjg3LDkgKzI4Nyw3IEBAIHN0YXRpYyBib29sIGRwaV9kc3NfY2xrX2Nh
bGMoc3RydWN0IGRwaV9kYXRhICpkcGksIHVuc2lnbmVkIGxvbmcgcGNrLAogCiAKIAotc3RhdGlj
IGludCBkcGlfc2V0X3BsbF9jbGsoc3RydWN0IGRwaV9kYXRhICpkcGksIGVudW0gb21hcF9jaGFu
bmVsIGNoYW5uZWwsCi0JCXVuc2lnbmVkIGxvbmcgcGNrX3JlcSwgdW5zaWduZWQgbG9uZyAqZmNr
LCBpbnQgKmxja19kaXYsCi0JCWludCAqcGNrX2RpdikKK3N0YXRpYyBpbnQgZHBpX3NldF9wbGxf
Y2xrKHN0cnVjdCBkcGlfZGF0YSAqZHBpLCB1bnNpZ25lZCBsb25nIHBja19yZXEpCiB7CiAJc3Ry
dWN0IGRwaV9jbGtfY2FsY19jdHggY3R4OwogCWludCByOwpAQCAtMzAzLDE5ICszMDEsMTUgQEAg
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
cjsKQEAgLTMzMSwyOSArMzI1LDE5IEBAIHN0YXRpYyBpbnQgZHBpX3NldF9kaXNwY19jbGsoc3Ry
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
