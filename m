Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66821076D1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 18:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262AD6E48B;
	Fri, 22 Nov 2019 17:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1CF6E46D;
 Fri, 22 Nov 2019 17:56:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="210490435"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 22 Nov 2019 09:56:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2019 19:56:31 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/rect: Keep the scaled clip bounded
Date: Fri, 22 Nov 2019 19:56:21 +0200
Message-Id: <20191122175623.13565-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
References: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxp
bWl0IHRoZSBzY2FsZWQgY2xpcCB0byBvbmx5IGNsaXAgYXQgbW9zdCBkc3Rfdy9oIHBpeGVscy4K
VGhpcyBhdm9pZHMgdGhlIHByb2JsZW0gd2l0aCBjbGlwX3NjYWxlZCgpIG5vdCBiZWluZyBhYmxl
CnRvIHJldHVybiBuZWdhdGl2ZSB2YWx1ZXMuIFNpbmNlIG5ld19zcmNfdy9oIGlzIG5vdyBwcm9w
ZXJseQpib3VuZGVkIHdlIGNhbiByZW1vdmUgdGhlIGNsYW1wKClzLgoKQ2M6IEJlbmphbWluIEdh
aWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpUZXN0Y2FzZTogaWd0L2ttc19zZWxmdGVzdC9kcm1fcmVjdF9jbGlwX3Nj
YWxlZF9zaWduZWRfdnNfdW5zaWduZWQKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3Jl
Y3QuYyB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKaW5kZXggODE4NzM4ZTgzZDA2Li5hOWM3ZjkwODM2
ZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcmVjdC5jCkBAIC01OSw2ICs1OSw5IEBAIHN0YXRpYyB1MzIgY2xpcF9zY2Fs
ZWQodTMyIHNyYywgdTMyIGRzdCwgdTMyIGNsaXApCiAJaWYgKGRzdCA9PSAwKQogCQlyZXR1cm4g
MDsKIAorCS8qIE9ubHkgY2xpcCB3aGF0IHdlIGhhdmUuIEtlZXBzIHRoZSByZXN1bHQgYm91bmRl
ZC4gKi8KKwljbGlwID0gbWluKGNsaXAsIGRzdCk7CisKIAl0bXAgPSBtdWxfdTMyX3UzMihzcmMs
IGRzdCAtIGNsaXApOwogCiAJLyoKQEAgLTk0LDcgKzk3LDcgQEAgYm9vbCBkcm1fcmVjdF9jbGlw
X3NjYWxlZChzdHJ1Y3QgZHJtX3JlY3QgKnNyYywgc3RydWN0IGRybV9yZWN0ICpkc3QsCiAJCXUz
MiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAogCQkJCQkgICAg
ZHJtX3JlY3Rfd2lkdGgoZHN0KSwgZGlmZik7CiAKLQkJc3JjLT54MSA9IGNsYW1wX3QoaW50NjRf
dCwgc3JjLT54MiAtIG5ld19zcmNfdywgSU5UX01JTiwgSU5UX01BWCk7CisJCXNyYy0+eDEgPSBz
cmMtPngyIC0gbmV3X3NyY193OwogCQlkc3QtPngxID0gY2xpcC0+eDE7CiAJfQogCWRpZmYgPSBj
bGlwLT55MSAtIGRzdC0+eTE7CkBAIC0xMDIsNyArMTA1LDcgQEAgYm9vbCBkcm1fcmVjdF9jbGlw
X3NjYWxlZChzdHJ1Y3QgZHJtX3JlY3QgKnNyYywgc3RydWN0IGRybV9yZWN0ICpkc3QsCiAJCXUz
MiBuZXdfc3JjX2ggPSBjbGlwX3NjYWxlZChkcm1fcmVjdF9oZWlnaHQoc3JjKSwKIAkJCQkJICAg
IGRybV9yZWN0X2hlaWdodChkc3QpLCBkaWZmKTsKIAotCQlzcmMtPnkxID0gY2xhbXBfdChpbnQ2
NF90LCBzcmMtPnkyIC0gbmV3X3NyY19oLCBJTlRfTUlOLCBJTlRfTUFYKTsKKwkJc3JjLT55MSA9
IHNyYy0+eTIgLSBuZXdfc3JjX2g7CiAJCWRzdC0+eTEgPSBjbGlwLT55MTsKIAl9CiAJZGlmZiA9
IGRzdC0+eDIgLSBjbGlwLT54MjsKQEAgLTExMCw3ICsxMTMsNyBAQCBib29sIGRybV9yZWN0X2Ns
aXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBzdHJ1Y3QgZHJtX3JlY3QgKmRzdCwKIAkJ
dTMyIG5ld19zcmNfdyA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X3dpZHRoKHNyYyksCiAJCQkJCSAg
ICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsKIAotCQlzcmMtPngyID0gY2xhbXBfdChpbnQ2
NF90LCBzcmMtPngxICsgbmV3X3NyY193LCBJTlRfTUlOLCBJTlRfTUFYKTsKKwkJc3JjLT54MiA9
IHNyYy0+eDEgKyBuZXdfc3JjX3c7CiAJCWRzdC0+eDIgPSBjbGlwLT54MjsKIAl9CiAJZGlmZiA9
IGRzdC0+eTIgLSBjbGlwLT55MjsKQEAgLTExOCw3ICsxMjEsNyBAQCBib29sIGRybV9yZWN0X2Ns
aXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBzdHJ1Y3QgZHJtX3JlY3QgKmRzdCwKIAkJ
dTMyIG5ld19zcmNfaCA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X2hlaWdodChzcmMpLAogCQkJCQkg
ICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksIGRpZmYpOwogCi0JCXNyYy0+eTIgPSBjbGFtcF90KGlu
dDY0X3QsIHNyYy0+eTEgKyBuZXdfc3JjX2gsIElOVF9NSU4sIElOVF9NQVgpOworCQlzcmMtPnky
ID0gc3JjLT55MSArIG5ld19zcmNfaDsKIAkJZHN0LT55MiA9IGNsaXAtPnkyOwogCX0KIAotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
