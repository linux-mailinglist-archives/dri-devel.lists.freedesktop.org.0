Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80776DD19C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 00:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894A489DFA;
	Fri, 18 Oct 2019 22:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1D589DFA;
 Fri, 18 Oct 2019 22:04:56 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB7E02245A;
 Fri, 18 Oct 2019 22:04:55 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 68/89] drm/amdgpu: fix memory leak
Date: Fri, 18 Oct 2019 18:03:03 -0400
Message-Id: <20191018220324.8165-68-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018220324.8165-1-sashal@kernel.org>
References: <20191018220324.8165-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571436296;
 bh=M2HzMP+l+Weo8FPbty/bQt2z8x2v4tAHox0FIemkwwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rNw6x9AZfiqn74/FDK4j/YtZpihauN+e0ozH2BJohw0gq2RwxpLked+47uzHi6nht
 9hgpyJnY10xYtsbMUhkdaDMONdGxga6XN+/iGY0iH1Wozb+5afXD+jk+1rWFh0uSgz
 +HQWVMDZDakqftpSSVCZnV0Bu3vt7/zwDaitYf08=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
MDgzMTY0ZGJkYjE3YzVlYTRhZDkyYzE3ODJiNTljOWQ3NTU2Nzc5MCBdCgpjbGVhbnVwIGVycm9y
IGhhbmRsaW5nIGNvZGUgYW5kIG1ha2Ugc3VyZSB0ZW1wb3JhcnkgaW5mbyBhcnJheQp3aXRoIHRo
ZSBoYW5kbGVzIGFyZSBmcmVlZCBieSBhbWRncHVfYm9fbGlzdF9wdXQoKSBvbgppZHJfcmVwbGFj
ZSgpJ3MgZmFpbHVyZS4KClNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYyB8IDE0ICsrKysrKyst
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jCmluZGV4IDdiY2Y4
NmM2MTk5OTUuLjYxZTM4ZTQzYWQxZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9ib19saXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2JvX2xpc3QuYwpAQCAtMjcwLDcgKzI3MCw3IEBAIGludCBhbWRncHVfYm9fbGlzdF9p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCiAJciA9IGFtZGdwdV9i
b19jcmVhdGVfbGlzdF9lbnRyeV9hcnJheSgmYXJncy0+aW4sICZpbmZvKTsKIAlpZiAocikKLQkJ
Z290byBlcnJvcl9mcmVlOworCQlyZXR1cm4gcjsKIAogCXN3aXRjaCAoYXJncy0+aW4ub3BlcmF0
aW9uKSB7CiAJY2FzZSBBTURHUFVfQk9fTElTVF9PUF9DUkVBVEU6CkBAIC0yODMsOCArMjgzLDcg
QEAgaW50IGFtZGdwdV9ib19saXN0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCiAJCXIgPSBpZHJfYWxsb2MoJmZwcml2LT5ib19saXN0X2hhbmRsZXMsIGxpc3QsIDEs
IDAsIEdGUF9LRVJORUwpOwogCQltdXRleF91bmxvY2soJmZwcml2LT5ib19saXN0X2xvY2spOwog
CQlpZiAociA8IDApIHsKLQkJCWFtZGdwdV9ib19saXN0X3B1dChsaXN0KTsKLQkJCXJldHVybiBy
OworCQkJZ290byBlcnJvcl9wdXRfbGlzdDsKIAkJfQogCiAJCWhhbmRsZSA9IHI7CkBAIC0zMDYs
OSArMzA1LDggQEAgaW50IGFtZGdwdV9ib19saXN0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKmRhdGEsCiAJCW11dGV4X3VubG9jaygmZnByaXYtPmJvX2xpc3RfbG9jayk7CiAK
IAkJaWYgKElTX0VSUihvbGQpKSB7Ci0JCQlhbWRncHVfYm9fbGlzdF9wdXQobGlzdCk7CiAJCQly
ID0gUFRSX0VSUihvbGQpOwotCQkJZ290byBlcnJvcl9mcmVlOworCQkJZ290byBlcnJvcl9wdXRf
bGlzdDsKIAkJfQogCiAJCWFtZGdwdV9ib19saXN0X3B1dChvbGQpOwpAQCAtMzI1LDggKzMyMywx
MCBAQCBpbnQgYW1kZ3B1X2JvX2xpc3RfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKIAogCXJldHVybiAwOwogCitlcnJvcl9wdXRfbGlzdDoKKwlhbWRncHVfYm9fbGlz
dF9wdXQobGlzdCk7CisKIGVycm9yX2ZyZWU6Ci0JaWYgKGluZm8pCi0JCWt2ZnJlZShpbmZvKTsK
KwlrdmZyZWUoaW5mbyk7CiAJcmV0dXJuIHI7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
