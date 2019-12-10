Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9368119387
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B1E6E956;
	Tue, 10 Dec 2019 21:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362316E950
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:12:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31E1724679;
 Tue, 10 Dec 2019 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576011861;
 bh=G3pxgIYne46zikRD4f0dDWJlvjJHvRooIorjQRkUWwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1CyRwNEC0MH3udFRIzaIsCPy/bmeyAgnQYwENOJ68DWc+b9pYcsHXPgdP2n4pKOiJ
 2iMRld30xxreONK4bbXhnDnzvCuq8BWxEqrCqdK/kY5sqZdMZKt/MsNmJs/9WKQYeF
 MmcQkTSd25X4xJddrzxX0Hvy2yikMiopuXlMsHjc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 015/350] drm/ttm: return -EBUSY on pipelining with
 no_gpu_wait (v2)
Date: Tue, 10 Dec 2019 15:58:27 -0500
Message-Id: <20191210210402.8367-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210402.8367-1-sashal@kernel.org>
References: <20191210210402.8367-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgMzA4NGNmNDZjZjgxMTA4MjZhNDJkZThjOGVmMzBlOGZhNDg5NzRjMiBdCgpT
ZXR0aW5nIHRoZSBub19ncHVfd2FpdCBmbGFnIG1lYW5zIHRoYXQgdGhlIGFsbG9jYXRlIEJPIG11
c3QgYmUgYXZhaWxhYmxlCmltbWVkaWF0ZWx5IGFuZCB3ZSBjYW4ndCB3YWl0IGZvciBhbnkgR1BV
IG9wZXJhdGlvbiB0byBmaW5pc2guCgp2Mjogc3F1YXNoIGluIG1lbSBsZWFrIGZpeCwgcmViYXNl
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkFja2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jCmluZGV4IDk4ODE5NDYyZjAyNWYuLmYwNzgwMzY5OTgwOTIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwpAQCAtOTI2LDcgKzkyNiw4IEBAIEVYUE9SVF9TWU1CT0wodHRtX2JvX21l
bV9wdXQpOwogICovCiBzdGF0aWMgaW50IHR0bV9ib19hZGRfbW92ZV9mZW5jZShzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJCSBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
biwKLQkJCQkgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCisJCQkJIHN0cnVjdCB0dG1fbWVtX3Jl
ZyAqbWVtLAorCQkJCSBib29sIG5vX3dhaXRfZ3B1KQogewogCXN0cnVjdCBkbWFfZmVuY2UgKmZl
bmNlOwogCWludCByZXQ7CkBAIC05MzUsMTkgKzkzNiwyMiBAQCBzdGF0aWMgaW50IHR0bV9ib19h
ZGRfbW92ZV9mZW5jZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCWZlbmNlID0gZG1h
X2ZlbmNlX2dldChtYW4tPm1vdmUpOwogCXNwaW5fdW5sb2NrKCZtYW4tPm1vdmVfbG9jayk7CiAK
LQlpZiAoZmVuY2UpIHsKLQkJZG1hX3Jlc3ZfYWRkX3NoYXJlZF9mZW5jZShiby0+YmFzZS5yZXN2
LCBmZW5jZSk7CisJaWYgKCFmZW5jZSkKKwkJcmV0dXJuIDA7CiAKLQkJcmV0ID0gZG1hX3Jlc3Zf
cmVzZXJ2ZV9zaGFyZWQoYm8tPmJhc2UucmVzdiwgMSk7Ci0JCWlmICh1bmxpa2VseShyZXQpKSB7
Ci0JCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKLQkJCXJldHVybiByZXQ7Ci0JCX0KKwlpZiAobm9f
d2FpdF9ncHUpCisJCXJldHVybiAtRUJVU1k7CisKKwlkbWFfcmVzdl9hZGRfc2hhcmVkX2ZlbmNl
KGJvLT5iYXNlLnJlc3YsIGZlbmNlKTsKIAotCQlkbWFfZmVuY2VfcHV0KGJvLT5tb3ZpbmcpOwot
CQliby0+bW92aW5nID0gZmVuY2U7CisJcmV0ID0gZG1hX3Jlc3ZfcmVzZXJ2ZV9zaGFyZWQoYm8t
PmJhc2UucmVzdiwgMSk7CisJaWYgKHVubGlrZWx5KHJldCkpIHsKKwkJZG1hX2ZlbmNlX3B1dChm
ZW5jZSk7CisJCXJldHVybiByZXQ7CiAJfQogCisJZG1hX2ZlbmNlX3B1dChiby0+bW92aW5nKTsK
Kwliby0+bW92aW5nID0gZmVuY2U7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTk3OCw3ICs5ODIsNyBA
QCBzdGF0aWMgaW50IHR0bV9ib19tZW1fZm9yY2Vfc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKIAkJCXJldHVybiByZXQ7CiAJfSB3aGlsZSAoMSk7CiAKLQlyZXR1cm4gdHRtX2Jv
X2FkZF9tb3ZlX2ZlbmNlKGJvLCBtYW4sIG1lbSk7CisJcmV0dXJuIHR0bV9ib19hZGRfbW92ZV9m
ZW5jZShibywgbWFuLCBtZW0sIGN0eC0+bm9fd2FpdF9ncHUpOwogfQogCiBzdGF0aWMgdWludDMy
X3QgdHRtX2JvX3NlbGVjdF9jYWNoaW5nKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFu
LApAQCAtMTEyMCwxNCArMTEyNCwxOCBAQCBpbnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvLAogCQlpZiAodW5saWtlbHkocmV0KSkKIAkJCWdvdG8gZXJyb3I7
CiAKLQkJaWYgKG1lbS0+bW1fbm9kZSkgewotCQkJcmV0ID0gdHRtX2JvX2FkZF9tb3ZlX2ZlbmNl
KGJvLCBtYW4sIG1lbSk7Ci0JCQlpZiAodW5saWtlbHkocmV0KSkgewotCQkJCSgqbWFuLT5mdW5j
LT5wdXRfbm9kZSkobWFuLCBtZW0pOwotCQkJCWdvdG8gZXJyb3I7Ci0JCQl9Ci0JCQlyZXR1cm4g
MDsKKwkJaWYgKCFtZW0tPm1tX25vZGUpCisJCQljb250aW51ZTsKKworCQlyZXQgPSB0dG1fYm9f
YWRkX21vdmVfZmVuY2UoYm8sIG1hbiwgbWVtLCBjdHgtPm5vX3dhaXRfZ3B1KTsKKwkJaWYgKHVu
bGlrZWx5KHJldCkpIHsKKwkJCSgqbWFuLT5mdW5jLT5wdXRfbm9kZSkobWFuLCBtZW0pOworCQkJ
aWYgKHJldCA9PSAtRUJVU1kpCisJCQkJY29udGludWU7CisKKwkJCWdvdG8gZXJyb3I7CiAJCX0K
KwkJcmV0dXJuIDA7CiAJfQogCiAJZm9yIChpID0gMDsgaSA8IHBsYWNlbWVudC0+bnVtX2J1c3lf
cGxhY2VtZW50OyArK2kpIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
