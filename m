Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6D4C72F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 08:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAC86E4D4;
	Thu, 20 Jun 2019 06:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EC66E4C5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:07:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0DACD30872C3;
 Thu, 20 Jun 2019 06:07:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B50BD60FAB;
 Thu, 20 Jun 2019 06:07:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 092E01753A; Thu, 20 Jun 2019 08:07:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/12] drm/virtio: add virtio_gpu_object_array & helpers
Date: Thu, 20 Jun 2019 08:07:21 +0200
Message-Id: <20190620060726.926-8-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-1-kraxel@redhat.com>
References: <20190620060726.926-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 20 Jun 2019 06:07:37 +0000 (UTC)
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
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBoZWxwZXIgZnVuY3Rpb25zIHRvIG1hbmFnZSBhbiBhcnJheSBvZiBnZW0gb2JqZWN0cy4K
CnY0OiBtYWtlIHRoZW0gdmlydGlvLXByaXZhdGUgaW5zdGVhZCBvZiBnZW5lcmljIGhlbHBlcnMu
CgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggfCAxMCArKysrKysKIGRyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9kcnYuaAppbmRleCAwN2Y2MDAxZWE5MWUuLjk4ZDY0Njc4OWQyMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtODQsNiArODQsMTEgQEAgc3RydWN0IHZp
cnRpb19ncHVfb2JqZWN0IHsKICNkZWZpbmUgZ2VtX3RvX3ZpcnRpb19ncHVfb2JqKGdvYmopIFwK
IAljb250YWluZXJfb2YoKGdvYmopLCBzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QsIGdlbV9iYXNl
KQogCitzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkgeworCXUzMiBuZW50czsKKwlzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9ianNbXTsKK307CisKIHN0cnVjdCB2aXJ0aW9fZ3B1X3ZidWZm
ZXI7CiBzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2U7CiAKQEAgLTI1MSw2ICsyNTYsMTEgQEAgaW50
IHZpcnRpb19ncHVfbW9kZV9kdW1iX21tYXAoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsCiAJ
CQkgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJICAgICAgdWludDMyX3QgaGFuZGxl
LCB1aW50NjRfdCAqb2Zmc2V0X3ApOwogCitzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkg
KnZpcnRpb19ncHVfYXJyYXlfYWxsb2ModTMyIG5lbnRzKTsKK3N0cnVjdCB2aXJ0aW9fZ3B1X29i
amVjdF9hcnJheSoKK3ZpcnRpb19ncHVfYXJyYXlfZnJvbV9oYW5kbGVzKHN0cnVjdCBkcm1fZmls
ZSAqZHJtX2ZpbGUsIHUzMiAqaGFuZGxlcywgdTMyIG5lbnRzKTsKK3ZvaWQgdmlydGlvX2dwdV9h
cnJheV9wdXRfZnJlZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJyYXkgKm9ianMpOworCiAv
KiB2aXJ0aW8gdmcgKi8KIGludCB2aXJ0aW9fZ3B1X2FsbG9jX3ZidWZzKHN0cnVjdCB2aXJ0aW9f
Z3B1X2RldmljZSAqdmdkZXYpOwogdm9pZCB2aXJ0aW9fZ3B1X2ZyZWVfdmJ1ZnMoc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlICp2Z2Rldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMK
aW5kZXggOWM5YWQzYjE0MDgwLi40NTZjYzM4MmNlNjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZ2VtLmMKQEAgLTE2OSwzICsxNjksNTMgQEAgdm9pZCB2aXJ0aW9fZ3B1X2dlbV9vYmpl
Y3RfY2xvc2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJCQkJCQlxb2JqLT5od19yZXNf
aGFuZGxlKTsKIAl2aXJ0aW9fZ3B1X29iamVjdF91bnJlc2VydmUocW9iaik7CiB9CisKK3N0cnVj
dCB2aXJ0aW9fZ3B1X29iamVjdF9hcnJheSAqdmlydGlvX2dwdV9hcnJheV9hbGxvYyh1MzIgbmVu
dHMpCit7CisJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X2FycmF5ICpvYmpzOworCXNpemVfdCBz
aXplID0gc2l6ZW9mKCpvYmpzKSArIHNpemVvZihvYmpzLT5vYmpzWzBdKSAqIG5lbnRzOworCisJ
b2JqcyA9IGt6YWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFvYmpzKQorCQlyZXR1cm4g
TlVMTDsKKworCW9ianMtPm5lbnRzID0gbmVudHM7CisJcmV0dXJuIG9ianM7Cit9CisKK3N0YXRp
YyB2b2lkIHZpcnRpb19ncHVfYXJyYXlfZnJlZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfYXJy
YXkgKm9ianMpCit7CisJa2ZyZWUob2Jqcyk7Cit9CisKK3N0cnVjdCB2aXJ0aW9fZ3B1X29iamVj
dF9hcnJheSoKK3ZpcnRpb19ncHVfYXJyYXlfZnJvbV9oYW5kbGVzKHN0cnVjdCBkcm1fZmlsZSAq
ZHJtX2ZpbGUsIHUzMiAqaGFuZGxlcywgdTMyIG5lbnRzKQoreworCXN0cnVjdCB2aXJ0aW9fZ3B1
X29iamVjdF9hcnJheSAqb2JqczsKKwl1MzIgaTsKKworCW9ianMgPSB2aXJ0aW9fZ3B1X2FycmF5
X2FsbG9jKG5lbnRzKTsKKwlpZiAoIW9ianMpCisJCXJldHVybiBOVUxMOworCisJZm9yIChpID0g
MDsgaSA8IG5lbnRzOyBpKyspIHsKKwkJb2Jqcy0+b2Jqc1tpXSA9IGRybV9nZW1fb2JqZWN0X2xv
b2t1cChkcm1fZmlsZSwgaGFuZGxlc1tpXSk7CisJCWlmICghb2Jqcy0+b2Jqc1tpXSkgeworCQkJ
dmlydGlvX2dwdV9hcnJheV9wdXRfZnJlZShvYmpzKTsKKwkJCXJldHVybiBOVUxMOworCQl9CisJ
fQorCXJldHVybiBvYmpzOworfQorCit2b2lkIHZpcnRpb19ncHVfYXJyYXlfcHV0X2ZyZWUoc3Ry
dWN0IHZpcnRpb19ncHVfb2JqZWN0X2FycmF5ICpvYmpzKQoreworCXUzMiBpOworCisJZm9yIChp
ID0gMDsgaSA8IG9ianMtPm5lbnRzOyBpKyspIHsKKwkJaWYgKCFvYmpzLT5vYmpzW2ldKQorCQkJ
Y29udGludWU7CisJCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChvYmpzLT5vYmpzW2ldKTsK
Kwl9CisJdmlydGlvX2dwdV9hcnJheV9mcmVlKG9ianMpOworfQotLSAKMi4xOC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
