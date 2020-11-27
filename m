Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031822C64E6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC56ECA2;
	Fri, 27 Nov 2020 12:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FF66EC8C;
 Fri, 27 Nov 2020 12:09:48 +0000 (UTC)
IronPort-SDR: iDEzKVTxIOxpEKHAgm0qw7/HMnREiQUBrWVSznW9aYIUzlUKI/GjX2mSYrk0nZuFFa7i5PqfUi
 IETRXxRrwaYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540714"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540714"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:48 -0800
IronPort-SDR: 4ez6kZ5atSeV0n1wl8k/HDe/EBOqGKDP9zLAD+ZKb6Y7Jj4HC3cQSs12enxsHxgdXKFHCncIkw
 ryqdePyPZHVQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029072"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:44 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 076/162] drm/i915: Untangle the vma pages_mutex
Date: Fri, 27 Nov 2020 12:05:52 +0000
Message-Id: <20201127120718.454037-77-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgoKTW92
ZSB0aGUgdm1hIHBhZ2VzX211dGV4IG91dCBvZiB0aGUgd2F5IGZyb20gdGhlIG9iamVjdCB3dyBs
b2Nrcy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9t
QGludGVsLmNvbT4KQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZtYS5jIHwgMzAgKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWEuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hLmMKaW5kZXggMGM3ZTQxOTE4MTFhLi43MjQzYWI1
OTNhZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWEuYwpAQCAtNzkyLDI4ICs3OTIsMzAgQEAgc3Rh
dGljIGludCB2bWFfZ2V0X3BhZ2VzKHN0cnVjdCBpOTE1X3ZtYSAqdm1hKQogCWlmIChhdG9taWNf
YWRkX3VubGVzcygmdm1hLT5wYWdlc19jb3VudCwgMSwgMCkpCiAJCXJldHVybiAwOwogCisJaWYg
KHZtYS0+b2JqKSB7CisJCWVyciA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXModm1hLT5vYmop
OworCQlpZiAoZXJyKQorCQkJcmV0dXJuIGVycjsKKwl9CisKIAkvKiBBbGxvY2F0aW9ucyBhaG95
ISAqLwotCWlmIChtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnZtYS0+cGFnZXNfbXV0ZXgpKQot
CQlyZXR1cm4gLUVJTlRSOworCWlmIChtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnZtYS0+cGFn
ZXNfbXV0ZXgpKSB7CisJCWVyciA9IC1FSU5UUjsKKwkJZ290byB1bnBpbjsKKwl9CiAKIAlpZiAo
IWF0b21pY19yZWFkKCZ2bWEtPnBhZ2VzX2NvdW50KSkgewotCQlpZiAodm1hLT5vYmopIHsKLQkJ
CWVyciA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXModm1hLT5vYmopOwotCQkJaWYgKGVycikK
LQkJCQlnb3RvIHVubG9jazsKLQkJfQotCiAJCWVyciA9IHZtYS0+b3BzLT5zZXRfcGFnZXModm1h
KTsKLQkJaWYgKGVycikgewotCQkJaWYgKHZtYS0+b2JqKQotCQkJCWk5MTVfZ2VtX29iamVjdF91
bnBpbl9wYWdlcyh2bWEtPm9iaik7CisJCWlmIChlcnIpCiAJCQlnb3RvIHVubG9jazsKLQkJfQog
CX0KIAlhdG9taWNfaW5jKCZ2bWEtPnBhZ2VzX2NvdW50KTsKIAogdW5sb2NrOgogCW11dGV4X3Vu
bG9jaygmdm1hLT5wYWdlc19tdXRleCk7Cit1bnBpbjoKKwlpZiAoZXJyICYmIHZtYS0+b2JqKQor
CQlfX2k5MTVfZ2VtX29iamVjdF91bnBpbl9wYWdlcyh2bWEtPm9iaik7CiAKIAlyZXR1cm4gZXJy
OwogfQpAQCAtODI2LDEwICs4MjgsMTAgQEAgc3RhdGljIHZvaWQgX192bWFfcHV0X3BhZ2VzKHN0
cnVjdCBpOTE1X3ZtYSAqdm1hLCB1bnNpZ25lZCBpbnQgY291bnQpCiAJaWYgKGF0b21pY19zdWJf
cmV0dXJuKGNvdW50LCAmdm1hLT5wYWdlc19jb3VudCkgPT0gMCkgewogCQl2bWEtPm9wcy0+Y2xl
YXJfcGFnZXModm1hKTsKIAkJR0VNX0JVR19PTih2bWEtPnBhZ2VzKTsKLQkJaWYgKHZtYS0+b2Jq
KQotCQkJaTkxNV9nZW1fb2JqZWN0X3VucGluX3BhZ2VzKHZtYS0+b2JqKTsKIAl9CiAJbXV0ZXhf
dW5sb2NrKCZ2bWEtPnBhZ2VzX211dGV4KTsKKwlpZiAodm1hLT5vYmopCisJCWk5MTVfZ2VtX29i
amVjdF91bnBpbl9wYWdlcyh2bWEtPm9iaik7CiB9CiAKIHN0YXRpYyB2b2lkIHZtYV9wdXRfcGFn
ZXMoc3RydWN0IGk5MTVfdm1hICp2bWEpCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
