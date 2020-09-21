Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F6272F44
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21396E31C;
	Mon, 21 Sep 2020 16:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D1289DA8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 0DE81FB05;
 Mon, 21 Sep 2020 18:55:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXa4Z1C41mUZ; Mon, 21 Sep 2020 18:55:53 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0511245678; Mon, 21 Sep 2020 18:55:53 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 2/3] drm/panel: mantix: Fix panel reset
Date: Mon, 21 Sep 2020 18:55:51 +0200
Message-Id: <66973d8182164fca9fc0f57970a6cd8f110759bb.1600707235.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600707235.git.agx@sigxcpu.org>
References: <cover.1600707235.git.agx@sigxcpu.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1hbnRpeCBwYW5lbCBuZWVkcyB0d28gcmVzZXQgbGluZXMgKFJFU1ggYW5kIFRQX1JTVE4p
IGRlYXNzZXJ0ZWQgdG8Kb3V0cHV0IGFuIGltYWdlLiBPbmx5IGRlYXNzZXJ0aW5nIFJFU1ggaXMg
bm90IGVub3VnaCBhbmQgdGhlIGRpc3BsYXkKd2lsbCBzdGF5IGJsYW5rLiBEZWFzc2VydCBpbiBw
cmVwYXJlKCkgYW5kIGFzc2VydCBpbiB1bnByZXBhcmUoKSB0byBrZWVwCmRldmljZSBoZWxkIGlu
IHJlc2V0IHdoZW4gb2ZmLgoKU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4
Y3B1Lm9yZz4KLS0tCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEu
YyAgfCAzNyArKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LW1hbnRpeC1tbGFmMDU3d2U1MS5jCmluZGV4IDRhN2ZiZjY0YmI3YS4uMjlkMjhjNjNiYjcyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4LW1sYWYwNTd3ZTUx
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5j
CkBAIC0yMywxMCArMjMsMTMgQEAKICNkZWZpbmUgTUFOVElYX0NNRF9PVFBfU1RPUF9SRUxPQURf
TUlQSSAweDQxCiAjZGVmaW5lIE1BTlRJWF9DTURfSU5UX0NBTkNFTCAgICAgICAgICAgMHg0Qwog
CisjZGVmaW5lIE1BTlRJWF9OVU1fUkVTRVRTIDIKKwogc3RydWN0IG1hbnRpeCB7CiAJc3RydWN0
IGRldmljZSAqZGV2OwogCXN0cnVjdCBkcm1fcGFuZWwgcGFuZWw7Ci0Jc3RydWN0IGdwaW9fZGVz
YyAqcmVzZXRfZ3BpbzsKKwkvKiBSRVNYIGFuZCBUUF9SU1ROICovCisJc3RydWN0IGdwaW9fZGVz
Y3MgKnJlc2V0X2dwaW9zOwogCiAJc3RydWN0IHJlZ3VsYXRvciAqYXZkZDsKIAlzdHJ1Y3QgcmVn
dWxhdG9yICphdmVlOwpAQCAtMTIyLDggKzEyNSwxMyBAQCBzdGF0aWMgaW50IG1hbnRpeF9kaXNh
YmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCiBzdGF0aWMgaW50IG1hbnRpeF91bnByZXBh
cmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7CisJREVDTEFSRV9CSVRNQVAoYXNzZXJ0ZWRf
dmFsdWVzLCBCSVRTX1BFUl9UWVBFKDEpKTsKIAlzdHJ1Y3QgbWFudGl4ICpjdHggPSBwYW5lbF90
b19tYW50aXgocGFuZWwpOwogCisJZ3Bpb2Rfc2V0X2FycmF5X3ZhbHVlX2NhbnNsZWVwKGN0eC0+
cmVzZXRfZ3Bpb3MtPm5kZXNjcywKKwkJCQkgICAgICAgY3R4LT5yZXNldF9ncGlvcy0+ZGVzYywK
KwkJCQkgICAgICAgY3R4LT5yZXNldF9ncGlvcy0+aW5mbywgYXNzZXJ0ZWRfdmFsdWVzKTsKKwog
CXJlZ3VsYXRvcl9kaXNhYmxlKGN0eC0+YXZlZSk7CiAJcmVndWxhdG9yX2Rpc2FibGUoY3R4LT5h
dmRkKTsKIAkvKiBUMTEgKi8KQEAgLTEzNyw2ICsxNDUsNyBAQCBzdGF0aWMgaW50IG1hbnRpeF91
bnByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAKIHN0YXRpYyBpbnQgbWFudGl4X3By
ZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7CisJREVDTEFSRV9CSVRNQVAoZGVhc3Nl
cnRlZF92YWx1ZXMsIEJJVFNfUEVSX1RZUEUoMCkpOwogCXN0cnVjdCBtYW50aXggKmN0eCA9IHBh
bmVsX3RvX21hbnRpeChwYW5lbCk7CiAJaW50IHJldDsKIApAQCAtMTY1LDE0ICsxNzQsMTEgQEAg
c3RhdGljIGludCBtYW50aXhfcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAkJcmV0
dXJuIHJldDsKIAl9CiAKLQkvKiBUMytUNSAqLwotCXVzbGVlcF9yYW5nZSgxMDAwMCwgMTIwMDAp
OwotCi0JZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGN0eC0+cmVzZXRfZ3BpbywgMSk7Ci0JdXNs
ZWVwX3JhbmdlKDUxNTAsIDcwMDApOwotCi0JZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGN0eC0+
cmVzZXRfZ3BpbywgMCk7Ci0KKwkvKiBUMyArIFQ0ICsgdGltZSBmb3Igdm9sdGFnZSB0byBiZWNv
bWUgc3RhYmxlOiAqLworCXVzbGVlcF9yYW5nZSg2MDAwLCA3MDAwKTsKKwlncGlvZF9zZXRfYXJy
YXlfdmFsdWVfY2Fuc2xlZXAoY3R4LT5yZXNldF9ncGlvcy0+bmRlc2NzLAorCQkJCSAgICAgICBj
dHgtPnJlc2V0X2dwaW9zLT5kZXNjLAorCQkJCSAgICAgICBjdHgtPnJlc2V0X2dwaW9zLT5pbmZv
LCBkZWFzc2VydGVkX3ZhbHVlcyk7CiAJLyogVDYgKi8KIAltc2xlZXAoNTApOwogCkBAIC0yMzYs
MTAgKzI0MiwxNSBAQCBzdGF0aWMgaW50IG1hbnRpeF9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2
aWNlICpkc2kpCiAJaWYgKCFjdHgpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JY3R4LT5yZXNldF9n
cGlvID0gZGV2bV9ncGlvZF9nZXQoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfTE9XKTsKLQlpZiAo
SVNfRVJSKGN0eC0+cmVzZXRfZ3BpbykpIHsKLQkJZGV2X2VycihkZXYsICJjYW5ub3QgZ2V0IHJl
c2V0IGdwaW9cbiIpOwotCQlyZXR1cm4gUFRSX0VSUihjdHgtPnJlc2V0X2dwaW8pOworCWN0eC0+
cmVzZXRfZ3Bpb3MgPSBkZXZtX2dwaW9kX2dldF9hcnJheShkZXYsICJyZXNldCIsIEdQSU9EX09V
VF9ISUdIKTsKKwlpZiAoSVNfRVJSKGN0eC0+cmVzZXRfZ3Bpb3MpKSB7CisJCWRldl9lcnIoZGV2
LCAiY2Fubm90IGdldCByZXNldCBncGlvc1xuIik7CisJCXJldHVybiBQVFJfRVJSKGN0eC0+cmVz
ZXRfZ3Bpb3MpOworCX0KKworCWlmIChjdHgtPnJlc2V0X2dwaW9zLT5uZGVzY3MgIT0gTUFOVElY
X05VTV9SRVNFVFMpIHsKKwkJZGV2X2VycihkZXYsICJOZWVkIGV4YWN0bHkgJWQgcmVzZXQtZ3Bp
b3NcbiIsIE1BTlRJWF9OVU1fUkVTRVRTKTsKKwkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCiAJbWlw
aV9kc2lfc2V0X2RydmRhdGEoZHNpLCBjdHgpOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
