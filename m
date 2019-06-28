Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B154B59A43
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5656E902;
	Fri, 28 Jun 2019 12:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205186E901
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:13:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B1BB8C059B9F;
 Fri, 28 Jun 2019 12:13:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2AE560BEC;
 Fri, 28 Jun 2019 12:13:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7FA7217538; Fri, 28 Jun 2019 14:13:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/12] drm/virtio: add virtio_gpu_object_array & helpers
Date: Fri, 28 Jun 2019 14:13:33 +0200
Message-Id: <20190628121338.24398-8-kraxel@redhat.com>
In-Reply-To: <20190628121338.24398-1-kraxel@redhat.com>
References: <20190628121338.24398-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 28 Jun 2019 12:13:54 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBoZWxwZXIgZnVuY3Rpb25zIHRvIG1hbmFnZSBhbiBhcnJheSBvZiBnZW0gb2JqZWN0cy4K
CnY1OiBzb21lIHNtYWxsIG9wdGltaXphdGlvbnMgKENoaWEtSSBXdSkuCnY0OiBtYWtlIHRoZW0g
dmlydGlvLXByaXZhdGUgaW5zdGVhZCBvZiBnZW5lcmljIGhlbHBlcnMuCgpTaWduZWQtb2ZmLWJ5
OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZHJ2LmggfCAxMCArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfZ2VtLmMgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2
LmgKaW5kZXggMDdmNjAwMWVhOTFlLi45OGQ2NDY3ODlkMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfZHJ2LmgKQEAgLTg0LDYgKzg0LDExIEBAIHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVj
dCB7CiAjZGVmaW5lIGdlbV90b192aXJ0aW9fZ3B1X29iaihnb2JqKSBcCiAJY29udGFpbmVyX29m
KChnb2JqKSwgc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0LCBnZW1fYmFzZSkKIAorc3RydWN0IHZp
cnRpb19ncHVfb2JqZWN0X2FycmF5IHsKKwl1MzIgbmVudHM7CisJc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmpzW107Cit9OworCiBzdHJ1Y3QgdmlydGlvX2dwdV92YnVmZmVyOwogc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlOwogCkBAIC0yNTEsNiArMjU2LDExIEBAIGludCB2aXJ0aW9fZ3B1X21v
ZGVfZHVtYl9tbWFwKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAogCQkJICAgICAgc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIAkJCSAgICAgIHVpbnQzMl90IGhhbmRsZSwgdWludDY0X3QgKm9m
ZnNldF9wKTsKIAorc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X2FycmF5ICp2aXJ0aW9fZ3B1X2Fy
cmF5X2FsbG9jKHUzMiBuZW50cyk7CitzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkqCit2
aXJ0aW9fZ3B1X2FycmF5X2Zyb21faGFuZGxlcyhzdHJ1Y3QgZHJtX2ZpbGUgKmRybV9maWxlLCB1
MzIgKmhhbmRsZXMsIHUzMiBuZW50cyk7Cit2b2lkIHZpcnRpb19ncHVfYXJyYXlfcHV0X2ZyZWUo
c3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X2FycmF5ICpvYmpzKTsKKwogLyogdmlydGlvIHZnICov
CiBpbnQgdmlydGlvX2dwdV9hbGxvY192YnVmcyhzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZn
ZGV2KTsKIHZvaWQgdmlydGlvX2dwdV9mcmVlX3ZidWZzKHN0cnVjdCB2aXJ0aW9fZ3B1X2Rldmlj
ZSAqdmdkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbS5jCmluZGV4IDljOWFkM2Ix
NDA4MC4uNzRiYTNmMGRiNGYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbS5jCkBA
IC0xNjksMyArMTY5LDQ4IEBAIHZvaWQgdmlydGlvX2dwdV9nZW1fb2JqZWN0X2Nsb3NlKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqLAogCQkJCQkJcW9iai0+aHdfcmVzX2hhbmRsZSk7CiAJdmly
dGlvX2dwdV9vYmplY3RfdW5yZXNlcnZlKHFvYmopOwogfQorCitzdHJ1Y3QgdmlydGlvX2dwdV9v
YmplY3RfYXJyYXkgKnZpcnRpb19ncHVfYXJyYXlfYWxsb2ModTMyIG5lbnRzKQoreworCXN0cnVj
dCB2aXJ0aW9fZ3B1X29iamVjdF9hcnJheSAqb2JqczsKKwlzaXplX3Qgc2l6ZSA9IHNpemVvZigq
b2JqcykgKyBzaXplb2Yob2Jqcy0+b2Jqc1swXSkgKiBuZW50czsKKworCW9ianMgPSBrbWFsbG9j
KHNpemUsIEdGUF9LRVJORUwpOworCXJldHVybiBvYmpzOworfQorCitzdGF0aWMgdm9pZCB2aXJ0
aW9fZ3B1X2FycmF5X2ZyZWUoc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X2FycmF5ICpvYmpzKQor
eworCWtmcmVlKG9ianMpOworfQorCitzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkqCit2
aXJ0aW9fZ3B1X2FycmF5X2Zyb21faGFuZGxlcyhzdHJ1Y3QgZHJtX2ZpbGUgKmRybV9maWxlLCB1
MzIgKmhhbmRsZXMsIHUzMiBuZW50cykKK3sKKwlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJy
YXkgKm9ianM7CisJdTMyIGk7CisKKwlvYmpzID0gdmlydGlvX2dwdV9hcnJheV9hbGxvYyhuZW50
cyk7CisJaWYgKCFvYmpzKQorCQlyZXR1cm4gTlVMTDsKKworCWZvciAoaSA9IDA7IGkgPCBuZW50
czsgaSsrKSB7CisJCW9ianMtPm5lbnRzID0gaTsKKwkJb2Jqcy0+b2Jqc1tpXSA9IGRybV9nZW1f
b2JqZWN0X2xvb2t1cChkcm1fZmlsZSwgaGFuZGxlc1tpXSk7CisJCWlmICghb2Jqcy0+b2Jqc1tp
XSkgeworCQkJdmlydGlvX2dwdV9hcnJheV9wdXRfZnJlZShvYmpzKTsKKwkJCXJldHVybiBOVUxM
OworCQl9CisJfQorCW9ianMtPm5lbnRzID0gaTsKKwlyZXR1cm4gb2JqczsKK30KKwordm9pZCB2
aXJ0aW9fZ3B1X2FycmF5X3B1dF9mcmVlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdF9hcnJheSAq
b2JqcykKK3sKKwl1MzIgaTsKKworCWZvciAoaSA9IDA7IGkgPCBvYmpzLT5uZW50czsgaSsrKQor
CQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2Jqcy0+b2Jqc1tpXSk7CisJdmlydGlvX2dw
dV9hcnJheV9mcmVlKG9ianMpOworfQotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
