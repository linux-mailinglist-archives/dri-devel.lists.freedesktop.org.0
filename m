Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805171040B8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1FD6E84B;
	Wed, 20 Nov 2019 16:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588FC6E861;
 Wed, 20 Nov 2019 16:25:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 08:25:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="200771372"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 20 Nov 2019 08:25:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Nov 2019 18:25:16 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/rect: Keep the clipped dst rectangle in place
Date: Wed, 20 Nov 2019 18:25:12 +0200
Message-Id: <20191120162512.12484-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191120162512.12484-1-ville.syrjala@linux.intel.com>
References: <20191120162512.12484-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk5v
dyB0aGF0IHdlJ3ZlIGNvbnN0cmFpbmVkIHRoZSBjbGlwcGVkIHNvdXJjZSByZWN0YW5nbGUgc3Vj
aAp0aGF0IGl0IGNhbid0IGhhdmUgbmVnYXRpdmUgZGltZW5zaW9ucyBkb2luZyB0aGUgc2FtZSBm
b3IgdGhlCmRzdCByZWN0YW5nbGUgc2VlbXMgYXBwcm9wcmlhdGUuIFNob3VsZCBhdCBsZWFzdCBy
ZXN1bHQgaW4KdGhlIGNsaXBwZWQgc3JjIGFuZCBkc3QgcmVjdGFuZ2xlcyBiZWluZyBhIGJpdCBt
b3JlIGNvbnNpc3RlbnQKd2l0aCBlYWNoIG90aGVyLgoKQ2M6IEJlbmphbWluIEdhaWduYXJkIDxi
ZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
cmVjdC5jIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcmVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKaW5kZXggNzc2MmI2ZTky
NzhkLi4yMjkzMjVmY2YzMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCkBAIC01MiwxNCArNTIsMTQgQEAgYm9v
bCBkcm1fcmVjdF9pbnRlcnNlY3Qoc3RydWN0IGRybV9yZWN0ICpyMSwgY29uc3Qgc3RydWN0IGRy
bV9yZWN0ICpyMikKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3JlY3RfaW50ZXJzZWN0KTsKIAotc3Rh
dGljIHUzMiBjbGlwX3NjYWxlZCh1MzIgc3JjLCB1MzIgZHN0LCB1MzIgY2xpcCkKK3N0YXRpYyB1
MzIgY2xpcF9zY2FsZWQoaW50IHNyYywgaW50IGRzdCwgaW50ICpjbGlwKQogewogCXU2NCB0bXA7
CiAKIAkvKiBPbmx5IGNsaXAgd2hhdCB3ZSBoYXZlLiBLZWVwcyB0aGUgcmVzdWx0IGJvdW5kZWQg
YXMgd2VsbC4gKi8KLQljbGlwID0gbWluKGNsaXAsIGRzdCk7CisJKmNsaXAgPSBtaW4oKmNsaXAs
IGRzdCk7CiAKLQl0bXAgPSBtdWxfdTMyX3UzMihzcmMsIGRzdCAtIGNsaXApOworCXRtcCA9IG11
bF91MzJfdTMyKHNyYywgZHN0IC0gKmNsaXApOwogCiAJLyoKIAkgKiBSb3VuZCB0b3dhcmQgMS4w
IHdoZW4gY2xpcHBpbmcgc28gdGhhdCB3ZSBkb24ndCBhY2NpZGVudGFsbHkKQEAgLTkyLDM0ICs5
MiwzNCBAQCBib29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBz
dHJ1Y3QgZHJtX3JlY3QgKmRzdCwKIAlkaWZmID0gY2xpcC0+eDEgLSBkc3QtPngxOwogCWlmIChk
aWZmID4gMCkgewogCQl1MzIgbmV3X3NyY193ID0gY2xpcF9zY2FsZWQoZHJtX3JlY3Rfd2lkdGgo
c3JjKSwKLQkJCQkJICAgIGRybV9yZWN0X3dpZHRoKGRzdCksIGRpZmYpOworCQkJCQkgICAgZHJt
X3JlY3Rfd2lkdGgoZHN0KSwgJmRpZmYpOwogCiAJCXNyYy0+eDEgPSBzcmMtPngyIC0gbmV3X3Ny
Y193OwotCQlkc3QtPngxID0gY2xpcC0+eDE7CisJCWRzdC0+eDEgKz0gZGlmZjsKIAl9CiAJZGlm
ZiA9IGNsaXAtPnkxIC0gZHN0LT55MTsKIAlpZiAoZGlmZiA+IDApIHsKIAkJdTMyIG5ld19zcmNf
aCA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X2hlaWdodChzcmMpLAotCQkJCQkgICAgZHJtX3JlY3Rf
aGVpZ2h0KGRzdCksIGRpZmYpOworCQkJCQkgICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksICZkaWZm
KTsKIAogCQlzcmMtPnkxID0gc3JjLT55MiAtIG5ld19zcmNfaDsKLQkJZHN0LT55MSA9IGNsaXAt
PnkxOworCQlkc3QtPnkxICs9IGRpZmY7CiAJfQogCWRpZmYgPSBkc3QtPngyIC0gY2xpcC0+eDI7
CiAJaWYgKGRpZmYgPiAwKSB7CiAJCXUzMiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVj
dF93aWR0aChzcmMpLAotCQkJCQkgICAgZHJtX3JlY3Rfd2lkdGgoZHN0KSwgZGlmZik7CisJCQkJ
CSAgICBkcm1fcmVjdF93aWR0aChkc3QpLCAmZGlmZik7CiAKIAkJc3JjLT54MiA9IHNyYy0+eDEg
KyBuZXdfc3JjX3c7Ci0JCWRzdC0+eDIgPSBjbGlwLT54MjsKKwkJZHN0LT54MiAtPSBkaWZmOwog
CX0KIAlkaWZmID0gZHN0LT55MiAtIGNsaXAtPnkyOwogCWlmIChkaWZmID4gMCkgewogCQl1MzIg
bmV3X3NyY19oID0gY2xpcF9zY2FsZWQoZHJtX3JlY3RfaGVpZ2h0KHNyYyksCi0JCQkJCSAgICBk
cm1fcmVjdF9oZWlnaHQoZHN0KSwgZGlmZik7CisJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0
KSwgJmRpZmYpOwogCiAJCXNyYy0+eTIgPSBzcmMtPnkxICsgbmV3X3NyY19oOwotCQlkc3QtPnky
ID0gY2xpcC0+eTI7CisJCWRzdC0+eTIgLT0gZGlmZjsKIAl9CiAKIAlyZXR1cm4gZHJtX3JlY3Rf
dmlzaWJsZShkc3QpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
