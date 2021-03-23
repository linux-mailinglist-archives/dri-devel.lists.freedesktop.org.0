Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B9234641B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821646EC44;
	Tue, 23 Mar 2021 15:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF5B6EC22
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:45 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 42/70] drm/i915/selftests: Prepare client blit for
 obj->mm.lock removal.
Date: Tue, 23 Mar 2021 16:50:31 +0100
Message-Id: <20210323155059.628690-43-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RyYWlnaHRmb3J3YXJkIGNvbnZlcnNpb24sIGp1c3QgY29udmVydCBhIGJ1bmNoIG9mIGNhbGxz
IHRvCnVubG9ja2VkIHZlcnNpb25zLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBI
ZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2NsaWVudF9ibHQuYyB8IDggKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9j
bGllbnRfYmx0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2Vt
X2NsaWVudF9ibHQuYwppbmRleCAxNzU1ODE3MjRkNDQuLmJhZWM3YmQxZmE1MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jbGllbnRfYmx0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9jbGll
bnRfYmx0LmMKQEAgLTUyLDcgKzUyLDcgQEAgc3RhdGljIGludCBfX2lndF9jbGllbnRfZmlsbChz
dHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUpCiAJCQlnb3RvIGVycl9mbHVzaDsKIAkJfQog
Ci0JCXZhZGRyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQik7CisJ
CXZhZGRyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQob2JqLCBJOTE1X01BUF9X
Qik7CiAJCWlmIChJU19FUlIodmFkZHIpKSB7CiAJCQllcnIgPSBQVFJfRVJSKHZhZGRyKTsKIAkJ
CWdvdG8gZXJyX3B1dDsKQEAgLTE3MSw3ICsxNzEsNyBAQCBzdGF0aWMgaW50IHByZXBhcmVfYmxp
dChjb25zdCBzdHJ1Y3QgdGlsZWRfYmxpdHMgKnQsCiAJdTMyIHNyY19waXRjaCwgZHN0X3BpdGNo
OwogCXUzMiBjbWQsICpjczsKIAotCWNzID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAoYmF0Y2gs
IEk5MTVfTUFQX1dDKTsKKwljcyA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKGJh
dGNoLCBJOTE1X01BUF9XQyk7CiAJaWYgKElTX0VSUihjcykpCiAJCXJldHVybiBQVFJfRVJSKGNz
KTsKIApAQCAtMzkxLDcgKzM5MSw3IEBAIHN0YXRpYyBpbnQgdmVyaWZ5X2J1ZmZlcihjb25zdCBz
dHJ1Y3QgdGlsZWRfYmxpdHMgKnQsCiAJeSA9IGk5MTVfcHJhbmRvbV91MzJfbWF4X3N0YXRlKHQt
PmhlaWdodCwgcHJuZyk7CiAJcCA9IHkgKiB0LT53aWR0aCArIHg7CiAKLQl2YWRkciA9IGk5MTVf
Z2VtX29iamVjdF9waW5fbWFwKGJ1Zi0+dm1hLT5vYmosIEk5MTVfTUFQX1dDKTsKKwl2YWRkciA9
IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKGJ1Zi0+dm1hLT5vYmosIEk5MTVfTUFQ
X1dDKTsKIAlpZiAoSVNfRVJSKHZhZGRyKSkKIAkJcmV0dXJuIFBUUl9FUlIodmFkZHIpOwogCkBA
IC01NzgsNyArNTc4LDcgQEAgc3RhdGljIGludCB0aWxlZF9ibGl0c19wcmVwYXJlKHN0cnVjdCB0
aWxlZF9ibGl0cyAqdCwKIAlpbnQgZXJyOwogCWludCBpOwogCi0JbWFwID0gaTkxNV9nZW1fb2Jq
ZWN0X3Bpbl9tYXAodC0+c2NyYXRjaC52bWEtPm9iaiwgSTkxNV9NQVBfV0MpOworCW1hcCA9IGk5
MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKHQtPnNjcmF0Y2gudm1hLT5vYmosIEk5MTVf
TUFQX1dDKTsKIAlpZiAoSVNfRVJSKG1hcCkpCiAJCXJldHVybiBQVFJfRVJSKG1hcCk7CiAKLS0g
CjIuMzEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
