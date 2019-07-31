Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B17BBE4
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 10:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40323897F5;
	Wed, 31 Jul 2019 08:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EDA897F5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 08:40:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6V8eFfc078983;
 Wed, 31 Jul 2019 03:40:15 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6V8eFnW016389
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 31 Jul 2019 03:40:15 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 03:40:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 03:40:14 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6V8eCSn048437;
 Wed, 31 Jul 2019 03:40:13 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <lee.jones@linaro.org>, <jingoohan1@gmail.com>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v3] backlight: gpio-backlight: Correct initial power state
 handling
Date: Wed, 31 Jul 2019 11:40:18 +0300
Message-ID: <20190731084018.5318-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564562415;
 bh=f8OILjK+4xrFtumGGFPWPDxRCqrguz9p6urLvVz00sU=;
 h=From:To:CC:Subject:Date;
 b=j3PTc/Xcx9hTMnjgCer63vG17POH5udTLqEDNcL7ONFZFvIXCJVJLP5kzIGg7FLEA
 KndqyFc5myT8luPQYO/k/kOH7Ns6nR9mK5Lksp60mHMOnjL7uweKXLnrUSotuSJKLP
 8Fe8+VB6nfgo2URujZLmogYjukgy+uNa9s64fEH0=
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
Cc: paul.kocialkowski@bootlin.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRlZmF1bHQtb24gcHJvcGVydHkgLSBvciB0aGUgZGVmX3ZhbHVlIHZpYSBsZWdhY3kgcGRh
dGEpIHNob3VsZCBiZQpoYW5kbGVkIGFzOgppZiBpdCBpcyAxLCB0aGUgYmFja2xpZ2h0IG11c3Qg
YmUgZW5hYmxlZCAoa2VwdCBlbmFibGVkKQppZiBpdCBpcyAwLCB0aGUgYmFja2xpZ2h0IG11c3Qg
YmUgZGlzYWJsZWQgKGtlcHQgZGlzYWJsZWQpCgpUaGlzIG9ubHkgd29ya3MgZm9yIHRoZSBjYXNl
IHdoZW4gZGVmYXVsdC1vbiBpcyBzZXQuIElmIGl0IGlzIG5vdCBzZXQgdGhlbgp0aGUgYnJpZ2h0
bmVzcyBvZiB0aGUgYmFja2xpZ2h0IGlzIHNldCB0byAwLiBOb3cgaWYgdGhlIGJhY2tsaWdodCBp
cwplbmFibGVkIGJ5IGV4dGVybmFsIGRyaXZlciAoZ3JhcGhpY3MpIHRoZSBiYWNrbGlnaHQgd2ls
bCBzdGF5IGRpc2FibGVkIHNpbmNlCnRoZSBicmlnaHRuZXNzIGlzIGNvbmZpZ3VyZWQgYXMgMC4g
VGhlIGJhY2tsaWdodCB3aWxsIG5vdCB0dXJuIG9uLgoKSW4gb3JkZXIgdG8gbWluaW1pemUgc2Ny
ZWVuIGZsaWNrZXJpbmcgZHVyaW5nIGRldmljZSBib290OgoKVGhlIGluaXRpYWwgYnJpZ2h0bmVz
cyBzaG91bGQgYmUgc2V0IHRvIDEuCgpJZiBib290ZWQgaW4gbm9uIERUIG1vZGUgb3Igbm8gcGhh
bmRsZSBsaW5rIHRvIHRoZSBiYWNrbGlnaHQgbm9kZToKZm9sbG93IHRoZSBkZWZfdmFsdWUvZGVm
YXVsdC1vbiB0byBzZWxlY3QgVU5CTEFOSyBvciBQT1dFUkRPV04KCklmIGluIERUIGJvb3Qgd2Ug
aGF2ZSBwaGFuZGxlIGxpbmsgdGhlbiBsZWF2ZSB0aGUgR1BJTyBpbiBhIHN0YXRlIHdoaWNoIHRo
ZQpib290bG9hZGVyIGxlZnQgaXQgYW5kIGxldCB0aGUgdXNlciBvZiB0aGUgYmFja2xpZ2h0IHRv
IGNvbmZpZ3VyZSBpdApmdXJ0aGVyLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBl
dGVyLnVqZmFsdXNpQHRpLmNvbT4KLS0tCkhpLAoKc29ycnkgZm9yIHRoZSBkZWxheSwgYnV0IGdv
dCBkaXN0cmFjdGVkIGEgYml0IHdpdGggdGhlIHJlc2VuZCBvZiB0aGlzLi4uCkxldCdzIHRyeSBh
Z2FpbiA7KQoKQ2hhbmdlcyBzaW5jZSB2MiAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3
b3JrL3BhdGNoLzEwMDIzNTkvKToKLSBSZWJhc2VkIG9uIGRybS1uZXh0CgpDaGFuZ2VzIHNpbmNl
IHYxOgotIEltcGxlbWVudCBzaW1pbGlhciBpbml0aWFsIHBvd2VyIHN0YXRlIGhhbmRsaW5nIGFz
IHB3bSBiYWNrbGlnaHQgaGF2ZQoKUmVnYXJkcywKUGV0ZXIKCiBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9ncGlvX2JhY2tsaWdodC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKystLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwppbmRleCBlODRmMzA4N2UyOWYuLjE4ZTA1M2U0
NzE2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQu
YworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCkBAIC01OSwx
MyArNTksMTEgQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZV9kdChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LAogCQkJCSAgIHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQog
ewogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Ci0JZW51bSBncGlvZF9mbGFncyBm
bGFnczsKIAlpbnQgcmV0OwogCiAJZ2JsLT5kZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVh
ZF9ib29sKGRldiwgImRlZmF1bHQtb24iKTsKLQlmbGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJ
T0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOwogCi0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2Rf
Z2V0KGRldiwgTlVMTCwgZmxhZ3MpOworCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYs
IE5VTEwsIEdQSU9EX0FTSVMpOwogCWlmIChJU19FUlIoZ2JsLT5ncGlvZCkpIHsKIAkJcmV0ID0g
UFRSX0VSUihnYmwtPmdwaW9kKTsKIApAQCAtNzksNiArNzcsMjIgQEAgc3RhdGljIGludCBncGlv
X2JhY2tsaWdodF9wcm9iZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCXJldHVy
biAwOwogfQogCitzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUo
c3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmwpCit7CisJc3RydWN0IGRldmljZV9ub2RlICpub2Rl
ID0gZ2JsLT5kZXYtPm9mX25vZGU7CisKKwkvKiBOb3QgYm9vdGVkIHdpdGggZGV2aWNlIHRyZWUg
b3Igbm8gcGhhbmRsZSBsaW5rIHRvIHRoZSBub2RlICovCisJaWYgKCFub2RlIHx8ICFub2RlLT5w
aGFuZGxlKQorCQlyZXR1cm4gZ2JsLT5kZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJMQU5LIDogRkJf
QkxBTktfUE9XRVJET1dOOworCisJLyogaWYgdGhlIGVuYWJsZSBHUElPIGlzIGRpc2FibGVkLCBk
byBub3QgZW5hYmxlIHRoZSBiYWNrbGlnaHQgKi8KKwlpZiAoZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNs
ZWVwKGdibC0+Z3Bpb2QpID09IDApCisJCXJldHVybiBGQl9CTEFOS19QT1dFUkRPV047CisKKwly
ZXR1cm4gRkJfQkxBTktfVU5CTEFOSzsKK30KKworCiBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGdwaW9fYmFj
a2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0KQEAgLTEzNiw3ICsxNTAsOSBAQCBzdGF0aWMg
aW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
CXJldHVybiBQVFJfRVJSKGJsKTsKIAl9CiAKLQlibC0+cHJvcHMuYnJpZ2h0bmVzcyA9IGdibC0+
ZGVmX3ZhbHVlOworCWJsLT5wcm9wcy5wb3dlciA9IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93
ZXJfc3RhdGUoZ2JsKTsKKwlibC0+cHJvcHMuYnJpZ2h0bmVzcyA9IDE7CisKIAliYWNrbGlnaHRf
dXBkYXRlX3N0YXR1cyhibCk7CiAKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBibCk7Ci0t
IApQZXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwg
MDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlr
a2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
