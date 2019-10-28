Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F18E79A8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 21:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038536E9E9;
	Mon, 28 Oct 2019 20:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 615936E9E9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 20:08:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8293531F;
 Mon, 28 Oct 2019 13:08:34 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4C9F3F71F;
 Mon, 28 Oct 2019 13:08:33 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH] drm/panfrost: Don't dereference bogus MMU pointers
Date: Mon, 28 Oct 2019 20:08:25 +0000
Message-Id: <9a0b09e6b5851f0d4428b72dd6b8b4c0d0ef4206.1572293305.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgc2VlbXMgdGhhdCBraWxsaW5nIGFuIGFwcGxpY2F0aW9uIHdoaWxlIGZhdWx0cyBhcmUgb2Nj
dXJyaW5nCihwYXJ0aWN1bGFybHkgd2l0aCBhIEdQVSBpbiBGUEdBIGF0IGEgd2hvcHBpbmcgNDBN
SHopIGNhbiBsZWFkIHRvCmhhbmRsaW5nIGEgbGluZ2VyaW5nIHBhZ2UgZmF1bHQgYWZ0ZXIgYWxs
IHRoZSBhZGRyZXNzIHNwYWNlIGNvbnRleHRzCmhhdmUgYWxyZWFkeSBiZWVuIGZyZWVkLiBJbiB0
aGlzIHNpdHVhdGlvbiwgdGhlIExSVSBsaXN0IGlzIGVtcHR5IHNvCmFkZHJfdG9fZHJtX21tX25v
ZGUoKSBlbmRzIHVwIGRlcmVmZXJlbmNpbmcgdGhlIGxpc3QgaGVhZCBhcyBpZiBpdCB3ZXJlCmEg
c3RydWN0IHBhbmZyb3N0X21tdSBlbnRyeTsgdGhpcyBsZWF2ZXMgIm1tdS0+YXMiIGFjdHVhbGx5
IHBvaW50aW5nIGF0CnRoZSBwZmRldi0+YWxsb2NfbWFzayBiaXRtYXAsIHdoaWNoIGlzIGFsc28g
ZW1wdHksIGFuZCBnaXZlbiB0aGF0IHRoZQpmYXVsdCBoYXMgYSBoaWdoIGxpa2VsaWhvb2Qgb2Yg
YmVpbmcgaW4gQVMwLCBoaWxhcml0eSBlbnN1ZXMuCgpTYWRseSwgdGhlIGNsZWFuZXN0IHNvbHV0
aW9uIHNlZW1zIHRvIGludm9sdmUgYW5vdGhlciBnb3RvLiBPaCB3ZWxsLCBhdApsZWFzdCBpdCdz
IHJvYnVzdC4uLgoKU2lnbmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKaW5kZXggZTYxOTg0ZTI2ZTBhLi41
MDg3NjVmODBjZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9tbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKQEAg
LTQxMywxMSArNDEzLDExIEBAIGFkZHJfdG9fZHJtX21tX25vZGUoc3RydWN0IHBhbmZyb3N0X2Rl
dmljZSAqcGZkZXYsIGludCBhcywgdTY0IGFkZHIpCiAJc3Bpbl9sb2NrKCZwZmRldi0+YXNfbG9j
ayk7CiAJbGlzdF9mb3JfZWFjaF9lbnRyeShtbXUsICZwZmRldi0+YXNfbHJ1X2xpc3QsIGxpc3Qp
IHsKIAkJaWYgKGFzID09IG1tdS0+YXMpCi0JCQlicmVhazsKKwkJCWdvdG8gZm91bmRfbW11Owog
CX0KLQlpZiAoYXMgIT0gbW11LT5hcykKLQkJZ290byBvdXQ7CisJZ290byBvdXQ7CiAKK2ZvdW5k
X21tdToKIAlwcml2ID0gY29udGFpbmVyX29mKG1tdSwgc3RydWN0IHBhbmZyb3N0X2ZpbGVfcHJp
diwgbW11KTsKIAogCXNwaW5fbG9jaygmcHJpdi0+bW1fbG9jayk7Ci0tIAoyLjIxLjAuZGlydHkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
