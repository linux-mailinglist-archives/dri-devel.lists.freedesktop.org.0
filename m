Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF4328CBB5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 12:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D806E0F5;
	Tue, 13 Oct 2020 10:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D1E6E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id CB939FB02;
 Tue, 13 Oct 2020 12:32:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZmo5Bvm5eqH; Tue, 13 Oct 2020 12:32:49 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9411E402FA; Tue, 13 Oct 2020 12:32:48 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/panel: mantix: Fix panel reset
Date: Tue, 13 Oct 2020 12:32:47 +0200
Message-Id: <ba71a8ab010d263a8058dd4f711e3bcd95877bf2.1602584953.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1602584953.git.agx@sigxcpu.org>
References: <cover.1602584953.git.agx@sigxcpu.org>
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
YyAgfCAyMyArKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtbWFudGl4LW1sYWYwNTd3ZTUxLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
bWFudGl4LW1sYWYwNTd3ZTUxLmMKaW5kZXggNGE3ZmJmNjRiYjdhLi4wYzVmMjJlOTVjMmQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4LW1sYWYwNTd3ZTUxLmMK
QEAgLTI2LDcgKzI2LDkgQEAKIHN0cnVjdCBtYW50aXggewogCXN0cnVjdCBkZXZpY2UgKmRldjsK
IAlzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOworCiAJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3Bp
bzsKKwlzdHJ1Y3QgZ3Bpb19kZXNjICp0cF9yc3RuX2dwaW87CiAKIAlzdHJ1Y3QgcmVndWxhdG9y
ICphdmRkOwogCXN0cnVjdCByZWd1bGF0b3IgKmF2ZWU7CkBAIC0xMjQsNiArMTI2LDEwIEBAIHN0
YXRpYyBpbnQgbWFudGl4X3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlz
dHJ1Y3QgbWFudGl4ICpjdHggPSBwYW5lbF90b19tYW50aXgocGFuZWwpOwogCisJZ3Bpb2Rfc2V0
X3ZhbHVlX2NhbnNsZWVwKGN0eC0+dHBfcnN0bl9ncGlvLCAxKTsKKwl1c2xlZXBfcmFuZ2UoNTAw
MCwgNjAwMCk7CisJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGN0eC0+cmVzZXRfZ3BpbywgMSk7
CisKIAlyZWd1bGF0b3JfZGlzYWJsZShjdHgtPmF2ZWUpOwogCXJlZ3VsYXRvcl9kaXNhYmxlKGN0
eC0+YXZkZCk7CiAJLyogVDExICovCkBAIC0xNjUsMTMgKzE3MSwxMCBAQCBzdGF0aWMgaW50IG1h
bnRpeF9wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCQlyZXR1cm4gcmV0OwogCX0K
IAotCS8qIFQzK1Q1ICovCi0JdXNsZWVwX3JhbmdlKDEwMDAwLCAxMjAwMCk7Ci0KLQlncGlvZF9z
ZXRfdmFsdWVfY2Fuc2xlZXAoY3R4LT5yZXNldF9ncGlvLCAxKTsKLQl1c2xlZXBfcmFuZ2UoNTE1
MCwgNzAwMCk7Ci0KKwkvKiBUMyArIFQ0ICsgdGltZSBmb3Igdm9sdGFnZSB0byBiZWNvbWUgc3Rh
YmxlOiAqLworCXVzbGVlcF9yYW5nZSg2MDAwLCA3MDAwKTsKIAlncGlvZF9zZXRfdmFsdWVfY2Fu
c2xlZXAoY3R4LT5yZXNldF9ncGlvLCAwKTsKKwlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoY3R4
LT50cF9yc3RuX2dwaW8sIDApOwogCiAJLyogVDYgKi8KIAltc2xlZXAoNTApOwpAQCAtMjM2LDEy
ICsyMzksMTggQEAgc3RhdGljIGludCBtYW50aXhfcHJvYmUoc3RydWN0IG1pcGlfZHNpX2Rldmlj
ZSAqZHNpKQogCWlmICghY3R4KQogCQlyZXR1cm4gLUVOT01FTTsKIAotCWN0eC0+cmVzZXRfZ3Bp
byA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0xPVyk7CisJY3R4LT5y
ZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXQoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfSElHSCk7
CiAJaWYgKElTX0VSUihjdHgtPnJlc2V0X2dwaW8pKSB7CiAJCWRldl9lcnIoZGV2LCAiY2Fubm90
IGdldCByZXNldCBncGlvXG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoY3R4LT5yZXNldF9ncGlvKTsK
IAl9CiAKKwljdHgtPnRwX3JzdG5fZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgIm1hbnRpeCx0
cC1yc3RuIiwgR1BJT0RfT1VUX0hJR0gpOworCWlmIChJU19FUlIoY3R4LT50cF9yc3RuX2dwaW8p
KSB7CisJCWRldl9lcnIoZGV2LCAiY2Fubm90IGdldCB0cC1yc3RuIGdwaW9cbiIpOworCQlyZXR1
cm4gUFRSX0VSUihjdHgtPnRwX3JzdG5fZ3Bpbyk7CisJfQorCiAJbWlwaV9kc2lfc2V0X2RydmRh
dGEoZHNpLCBjdHgpOwogCWN0eC0+ZGV2ID0gZGV2OwogCi0tIAoyLjI4LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
