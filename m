Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2151040B6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183586E853;
	Wed, 20 Nov 2019 16:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BCE6E89A;
 Wed, 20 Nov 2019 16:25:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 08:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="237795512"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 20 Nov 2019 08:25:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Nov 2019 18:25:12 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/rect: Keep the scaled clip bounded
Date: Wed, 20 Nov 2019 18:25:11 +0200
Message-Id: <20191120162512.12484-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
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
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fcmVjdC5jIHwgMTUgKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3JlY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCmluZGV4IGI4MzYzYWFh
OTAzMi4uNzc2MmI2ZTkyNzhkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3Qu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwpAQCAtNTQsNyArNTQsMTIgQEAgRVhQ
T1JUX1NZTUJPTChkcm1fcmVjdF9pbnRlcnNlY3QpOwogCiBzdGF0aWMgdTMyIGNsaXBfc2NhbGVk
KHUzMiBzcmMsIHUzMiBkc3QsIHUzMiBjbGlwKQogewotCXU2NCB0bXAgPSBtdWxfdTMyX3UzMihz
cmMsIGRzdCAtIGNsaXApOworCXU2NCB0bXA7CisKKwkvKiBPbmx5IGNsaXAgd2hhdCB3ZSBoYXZl
LiBLZWVwcyB0aGUgcmVzdWx0IGJvdW5kZWQgYXMgd2VsbC4gKi8KKwljbGlwID0gbWluKGNsaXAs
IGRzdCk7CisKKwl0bXAgPSBtdWxfdTMyX3UzMihzcmMsIGRzdCAtIGNsaXApOwogCiAJLyoKIAkg
KiBSb3VuZCB0b3dhcmQgMS4wIHdoZW4gY2xpcHBpbmcgc28gdGhhdCB3ZSBkb24ndCBhY2NpZGVu
dGFsbHkKQEAgLTg5LDcgKzk0LDcgQEAgYm9vbCBkcm1fcmVjdF9jbGlwX3NjYWxlZChzdHJ1Y3Qg
ZHJtX3JlY3QgKnNyYywgc3RydWN0IGRybV9yZWN0ICpkc3QsCiAJCXUzMiBuZXdfc3JjX3cgPSBj
bGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAogCQkJCQkgICAgZHJtX3JlY3Rfd2lkdGgo
ZHN0KSwgZGlmZik7CiAKLQkJc3JjLT54MSA9IGNsYW1wX3QoaW50NjRfdCwgc3JjLT54MiAtIG5l
d19zcmNfdywgSU5UX01JTiwgSU5UX01BWCk7CisJCXNyYy0+eDEgPSBzcmMtPngyIC0gbmV3X3Ny
Y193OwogCQlkc3QtPngxID0gY2xpcC0+eDE7CiAJfQogCWRpZmYgPSBjbGlwLT55MSAtIGRzdC0+
eTE7CkBAIC05Nyw3ICsxMDIsNyBAQCBib29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBk
cm1fcmVjdCAqc3JjLCBzdHJ1Y3QgZHJtX3JlY3QgKmRzdCwKIAkJdTMyIG5ld19zcmNfaCA9IGNs
aXBfc2NhbGVkKGRybV9yZWN0X2hlaWdodChzcmMpLAogCQkJCQkgICAgZHJtX3JlY3RfaGVpZ2h0
KGRzdCksIGRpZmYpOwogCi0JCXNyYy0+eTEgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eTIgLSBu
ZXdfc3JjX2gsIElOVF9NSU4sIElOVF9NQVgpOworCQlzcmMtPnkxID0gc3JjLT55MiAtIG5ld19z
cmNfaDsKIAkJZHN0LT55MSA9IGNsaXAtPnkxOwogCX0KIAlkaWZmID0gZHN0LT54MiAtIGNsaXAt
PngyOwpAQCAtMTA1LDcgKzExMCw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0
IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAogCQl1MzIgbmV3X3NyY193ID0g
Y2xpcF9zY2FsZWQoZHJtX3JlY3Rfd2lkdGgoc3JjKSwKIAkJCQkJICAgIGRybV9yZWN0X3dpZHRo
KGRzdCksIGRpZmYpOwogCi0JCXNyYy0+eDIgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eDEgKyBu
ZXdfc3JjX3csIElOVF9NSU4sIElOVF9NQVgpOworCQlzcmMtPngyID0gc3JjLT54MSArIG5ld19z
cmNfdzsKIAkJZHN0LT54MiA9IGNsaXAtPngyOwogCX0KIAlkaWZmID0gZHN0LT55MiAtIGNsaXAt
PnkyOwpAQCAtMTEzLDcgKzExOCw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0
IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAogCQl1MzIgbmV3X3NyY19oID0g
Y2xpcF9zY2FsZWQoZHJtX3JlY3RfaGVpZ2h0KHNyYyksCiAJCQkJCSAgICBkcm1fcmVjdF9oZWln
aHQoZHN0KSwgZGlmZik7CiAKLQkJc3JjLT55MiA9IGNsYW1wX3QoaW50NjRfdCwgc3JjLT55MSAr
IG5ld19zcmNfaCwgSU5UX01JTiwgSU5UX01BWCk7CisJCXNyYy0+eTIgPSBzcmMtPnkxICsgbmV3
X3NyY19oOwogCQlkc3QtPnkyID0gY2xpcC0+eTI7CiAJfQogCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
