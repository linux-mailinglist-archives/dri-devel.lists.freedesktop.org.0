Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF6E91155
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4BF6E9EB;
	Sat, 17 Aug 2019 15:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D51046E14B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 09:31:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F1311570;
 Fri, 16 Aug 2019 02:31:15 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1F233F706;
 Fri, 16 Aug 2019 02:31:14 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Remove opp table when unloading
Date: Fri, 16 Aug 2019 10:31:07 +0100
Message-Id: <20190816093107.30518-3-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRldmZyZXEgb3BwIHRhYmxlIG5lZWRzIHRvIGJlIHJlbW92ZWQgd2hlbiB1bmxvYWRpbmcg
dGhlIGRyaXZlciB0bwpmcmVlIHRoZSBtZW1vcnkgYXNzb2NpYXRlZCB3aXRoIGl0LgoKU2lnbmVk
LW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgNiArKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggfCAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyAgICAgfCA1ICsrKystCiAzIGZpbGVzIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCA3N2UxYWQyNGRlNTMuLjcxMGQ5MDNmOGUwZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCkBAIC0xNjAs
MTIgKzE2MCwxOCBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5mcm9zdF9k
ZXZpY2UgKnBmZGV2KQogCQlEUk1fREVWX0VSUk9SKCZwZmRldi0+cGRldi0+ZGV2LCAiQ291bGRu
J3QgaW5pdGlhbGl6ZSBHUFUgZGV2ZnJlcVxuIik7CiAJCXJldCA9IFBUUl9FUlIocGZkZXYtPmRl
dmZyZXEuZGV2ZnJlcSk7CiAJCXBmZGV2LT5kZXZmcmVxLmRldmZyZXEgPSBOVUxMOworCQlkZXZf
cG1fb3BwX29mX3JlbW92ZV90YWJsZSgmcGZkZXYtPnBkZXYtPmRldik7CiAJCXJldHVybiByZXQ7
CiAJfQogCiAJcmV0dXJuIDA7CiB9CiAKK3ZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQoreworCWRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxl
KCZwZmRldi0+cGRldi0+ZGV2KTsKK30KKwogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc3VtZShz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIHsKIAlpbnQgaTsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oCmluZGV4IGViOTk5NTMxZWQ5MC4uZTNiYzYz
ZTgyODQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
ZnJlcS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgK
QEAgLTUsNiArNSw3IEBACiAjZGVmaW5lIF9fUEFORlJPU1RfREVWRlJFUV9IX18KIAogaW50IHBh
bmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldik7Cit2b2lk
IHBhbmZyb3N0X2RldmZyZXFfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldik7CiAK
IHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9yZXN1bWUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZk
ZXYpOwogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3N1c3BlbmQoc3RydWN0IHBhbmZyb3N0X2Rldmlj
ZSAqcGZkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmluZGV4IGFl
NzAyMDBiZTQ0YS4uNDRhNTU4YzZlMTdlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2Rydi5jCkBAIC01NDcsMTIgKzU0NywxNCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJICovCiAJZXJyID0gZHJtX2Rldl9yZWdp
c3RlcihkZGV2LCAwKTsKIAlpZiAoZXJyIDwgMCkKLQkJZ290byBlcnJfb3V0MTsKKwkJZ290byBl
cnJfb3V0MjsKIAogCXBhbmZyb3N0X2dlbV9zaHJpbmtlcl9pbml0KGRkZXYpOwogCiAJcmV0dXJu
IDA7CiAKK2Vycl9vdXQyOgorCXBhbmZyb3N0X2RldmZyZXFfZmluaShwZmRldik7CiBlcnJfb3V0
MToKIAlwYW5mcm9zdF9kZXZpY2VfZmluaShwZmRldik7CiBlcnJfb3V0MDoKQEAgLTU3MSw2ICs1
NzMsNyBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCXBtX3J1bnRpbWVfZ2V0X3N5bmMocGZkZXYtPmRldik7CiAJcG1fcnVudGltZV9w
dXRfc3luY19hdXRvc3VzcGVuZChwZmRldi0+ZGV2KTsKIAlwbV9ydW50aW1lX2Rpc2FibGUocGZk
ZXYtPmRldik7CisJcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHBmZGV2KTsKIAlwYW5mcm9zdF9kZXZp
Y2VfZmluaShwZmRldik7CiAJZHJtX2Rldl9wdXQoZGRldik7CiAJcmV0dXJuIDA7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
