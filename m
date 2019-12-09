Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4AB116816
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 09:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40596E09C;
	Mon,  9 Dec 2019 08:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A879B6E09C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 08:27:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB98RGUZ008665;
 Mon, 9 Dec 2019 02:27:16 -0600
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB98RGNW090938
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 02:27:16 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 02:27:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 02:27:15 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB98RDnC078329;
 Mon, 9 Dec 2019 02:27:13 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Subject: [PATCH] drm/bridge: tc358767: fix poll timeouts
Date: Mon, 9 Dec 2019 10:27:07 +0200
Message-ID: <20191209082707.24531-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575880036;
 bh=gr+id/kVHkGklUKISNfvxtpwWhp0KZPGQr4zeHj1NHo=;
 h=From:To:CC:Subject:Date;
 b=AvTKbmcknRyE0CPyu92wFYbwqYO+gfgI6bDdIJxkZM1ESlB+0Z/dAdPwTvIsrBz39
 0UBMxIk1Z/6KS8/W6EN8c53g6X1DnIkgX8v+LccrYuvvwCDzwbLVM2vjBzVDoaVrBf
 sG2uEz3FrJievtdaztsGpyy6xb0989Dh05UaQ660=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGluayB0cmFpbmluZyBmYWlscyB3aXRoOgoKICBMaW5rIHRyYWluaW5nIHRpbWVvdXQgd2FpdGlu
ZyBmb3IgTFRfTE9PUERPTkUhCiAgbWFpbiBsaW5rIGVuYWJsZSBlcnJvcjogLTExMAoKVGhpcyBp
cyBjYXVzZWQgYnkgdG9vIHRpZ2h0IHRpbWVvdXRzLCB3aGljaCB3ZXJlIGNoYW5nZWQgcmVjZW50
bHkgaW4KYWE5MjIxM2YzODhiICgiZHJtL2JyaWRnZTogdGMzNTg3Njc6IFNpbXBsaWZ5IHBvbGxp
bmcgaW4gdGNfbGlua190cmFpbmluZygpIikuCgpXaXRoIGEgcXVpY2sgZ2xhbmNlLCB0aGUgY29t
bWl0IGRvZXMgbm90IGNoYW5nZSB0aGUgdGltZW91dHMuIEhvd2V2ZXIsCnRoZSBtZXRob2Qgb2Yg
ZGVsYXlpbmcvc2xlZXBpbmcgaXMgZGlmZmVyZW50LCBhbmQgYXMgdGhlIHRpbWVvdXQgaW4gdGhl
CnByZXZpb3VzIGltcGxlbWVudGF0aW9uIHdhcyBub3QgZXhwbGljaXQsIHRoZSBuZXcgdmVyc2lv
biBpbiBwcmFjdGljZQpoYXMgbXVjaCB0aWdodGVyIHRpbWVvdXQuCgpUaGUgc2FtZSBjaGFuZ2Ug
d2FzIG1hZGUgdG8gb3RoZXIgcGFydHMgaW4gdGhlIGRyaXZlciwgYnV0IHRoZSBsaW5rCnRyYWlu
aW5nIHRpbWVvdXQgaXMgdGhlIG9ubHkgb25lIEkgaGF2ZSBzZWVuIGNhdXNpbmcgaXNzdWVzLgpO
ZXZlcnRoZWxlc3MsIDEgdXMgc2xlZXAgaXMgbm90IHZlcnkgc2FuZSwgYW5kIHRoZSB0aW1lb3V0
cyBsb29rIHByZXR0eQp0aWdodCwgc28gbGV0cyBmaXggYWxsIHRoZSB0aW1lb3V0cy4KCk9uZSBl
eGNlcHRpb24gd2FzIHRoZSBhdXggYnVzeSBwb2xsLCB3aGVyZSB0aGUgcG9sbCBzbGVlcCB3YXMg
bXVjaApsb25nZXIgdGhhbiBuZWNlc3NhcnkgKG9yIG9wdGltYWwpLgoKSSBtZWFzdXJlZCB0aGUg
dGltZXMgb24gbXkgc2V0dXAsIGFuZCBub3cgdGhlIHNsZWVwIHRpbWVzIGFyZSBzZXQgdG8Kc3Vj
aCB2YWx1ZXMgdGhhdCB0aGV5IHJlc3VsdCBpbiBtdWx0aXBsZSBsb29wcywgYnV0IG5vdCB0b28g
bWFueSAoc2F5LAo1LTEwIGxvb3BzKS4gVGhlIHRpbWVvdXRzIHdlcmUgYWxsIGluY3JlYXNlZCB0
byAxMDBtcywgd2hpY2ggc2hvdWxkIGJlCm1vcmUgdGhhbiBlbm91Z2ggZm9yIGFsbCBvZiB0aGVz
ZSwgYnV0IGluIGNhc2Ugb2YgYmFkIGVycm9ycywgc2hvdWxkbid0CnN0b3AgdGhlIGRyaXZlciBh
cyBtdWx0aS1zZWNvbmQgdGltZW91dHMgY291bGQgZG8uCgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpGaXhlczogYWE5MjIxM2YzODhiICgiZHJt
L2JyaWRnZTogdGMzNTg3Njc6IFNpbXBsaWZ5IHBvbGxpbmcgaW4gdGNfbGlua190cmFpbmluZygp
IikKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCA4ICsrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwppbmRleCA4YThkNjA1MDIxZjAuLjA0NTQ2NzVhNDRjYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMjk0LDcgKzI5NCw3IEBAIHN0YXRpYyBpbmxpbmUg
aW50IHRjX3BvbGxfdGltZW91dChzdHJ1Y3QgdGNfZGF0YSAqdGMsIHVuc2lnbmVkIGludCBhZGRy
LAogCiBzdGF0aWMgaW50IHRjX2F1eF93YWl0X2J1c3koc3RydWN0IHRjX2RhdGEgKnRjKQogewot
CXJldHVybiB0Y19wb2xsX3RpbWVvdXQodGMsIERQMF9BVVhTVEFUVVMsIEFVWF9CVVNZLCAwLCAx
MDAwLCAxMDAwMDApOworCXJldHVybiB0Y19wb2xsX3RpbWVvdXQodGMsIERQMF9BVVhTVEFUVVMs
IEFVWF9CVVNZLCAwLCAxMDAsIDEwMDAwMCk7CiB9CiAKIHN0YXRpYyBpbnQgdGNfYXV4X3dyaXRl
X2RhdGEoc3RydWN0IHRjX2RhdGEgKnRjLCBjb25zdCB2b2lkICpkYXRhLApAQCAtNjM3LDcgKzYz
Nyw3IEBAIHN0YXRpYyBpbnQgdGNfYXV4X2xpbmtfc2V0dXAoc3RydWN0IHRjX2RhdGEgKnRjKQog
CWlmIChyZXQpCiAJCWdvdG8gZXJyOwogCi0JcmV0ID0gdGNfcG9sbF90aW1lb3V0KHRjLCBEUF9Q
SFlfQ1RSTCwgUEhZX1JEWSwgUEhZX1JEWSwgMSwgMTAwMCk7CisJcmV0ID0gdGNfcG9sbF90aW1l
b3V0KHRjLCBEUF9QSFlfQ1RSTCwgUEhZX1JEWSwgUEhZX1JEWSwgMTAwLCAxMDAwMDApOwogCWlm
IChyZXQgPT0gLUVUSU1FRE9VVCkgewogCQlkZXZfZXJyKHRjLT5kZXYsICJUaW1lb3V0IHdhaXRp
bmcgZm9yIFBIWSB0byBiZWNvbWUgcmVhZHkiKTsKIAkJcmV0dXJuIHJldDsKQEAgLTg2MSw3ICs4
NjEsNyBAQCBzdGF0aWMgaW50IHRjX3dhaXRfbGlua190cmFpbmluZyhzdHJ1Y3QgdGNfZGF0YSAq
dGMpCiAJaW50IHJldDsKIAogCXJldCA9IHRjX3BvbGxfdGltZW91dCh0YywgRFAwX0xUU1RBVCwg
TFRfTE9PUERPTkUsCi0JCQkgICAgICBMVF9MT09QRE9ORSwgMSwgMTAwMCk7CisJCQkgICAgICBM
VF9MT09QRE9ORSwgNTAwLCAxMDAwMDApOwogCWlmIChyZXQpIHsKIAkJZGV2X2Vycih0Yy0+ZGV2
LCAiTGluayB0cmFpbmluZyB0aW1lb3V0IHdhaXRpbmcgZm9yIExUX0xPT1BET05FIVxuIik7CiAJ
CXJldHVybiByZXQ7CkBAIC05MzQsNyArOTM0LDcgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtf
ZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIAlkcF9waHlfY3RybCAmPSB+KERQX1BIWV9SU1Qg
fCBQSFlfTTFfUlNUIHwgUEhZX00wX1JTVCk7CiAJcmV0ID0gcmVnbWFwX3dyaXRlKHRjLT5yZWdt
YXAsIERQX1BIWV9DVFJMLCBkcF9waHlfY3RybCk7CiAKLQlyZXQgPSB0Y19wb2xsX3RpbWVvdXQo
dGMsIERQX1BIWV9DVFJMLCBQSFlfUkRZLCBQSFlfUkRZLCAxLCAxMDAwKTsKKwlyZXQgPSB0Y19w
b2xsX3RpbWVvdXQodGMsIERQX1BIWV9DVFJMLCBQSFlfUkRZLCBQSFlfUkRZLCA1MDAsIDEwMDAw
MCk7CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKGRldiwgInRpbWVvdXQgd2FpdGluZyBmb3IgcGh5
IGJlY29tZSByZWFkeSIpOwogCQlyZXR1cm4gcmV0OwotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
