Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E4DAE48
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C586EA99;
	Thu, 17 Oct 2019 13:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B1B6EA85;
 Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6755FC04AC50;
 Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A9CE1001B23;
 Thu, 17 Oct 2019 13:26:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91CDC9AD6; Thu, 17 Oct 2019 15:26:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/qxl: switch qxl to &drm_gem_object_funcs.mmap
Date: Thu, 17 Oct 2019 15:26:35 +0200
Message-Id: <20191017132638.9693-3-kraxel@redhat.com>
In-Reply-To: <20191017132638.9693-1-kraxel@redhat.com>
References: <20191017132638.9693-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
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
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2lyZSB1cCB0aGUgbmV3IGRybV9nZW1fdHRtX21tYXAoKSBoZWxwZXIgZnVuY3Rpb24uClVzZSBn
ZW5lcmljIGRybV9nZW1fbW1hcCgpIGFuZCByZW1vdmUgcXhsX21tYXAoKS4KClNpZ25lZC1vZmYt
Ynk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX2Rydi5oICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMg
ICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMgfCAgMSArCiBkcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyAgICB8IDE2IC0tLS0tLS0tLS0tLS0tLS0KIDQgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X2Rydi5oCmluZGV4IGQ0MDUxNDA5Y2U2NC4uYTVjYjM4NjRkNjg2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9k
cnYuaApAQCAtMzU1LDcgKzM1NSw2IEBAIGludCBxeGxfbW9kZV9kdW1iX21tYXAoc3RydWN0IGRy
bV9maWxlICpmaWxwLAogLyogcXhsIHR0bSAqLwogaW50IHF4bF90dG1faW5pdChzdHJ1Y3QgcXhs
X2RldmljZSAqcWRldik7CiB2b2lkIHF4bF90dG1fZmluaShzdHJ1Y3QgcXhsX2RldmljZSAqcWRl
dik7Ci1pbnQgcXhsX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKTsKIAogLyogcXhsIGltYWdlICovCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKaW5kZXggNDgz
YjRjNTc1NTRhLi42NTQ2NDYzMGFjOTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCkBAIC0xNTcsNyAr
MTU3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgcXhsX2ZvcHMgPSB7
CiAJLnVubG9ja2VkX2lvY3RsID0gZHJtX2lvY3RsLAogCS5wb2xsID0gZHJtX3BvbGwsCiAJLnJl
YWQgPSBkcm1fcmVhZCwKLQkubW1hcCA9IHF4bF9tbWFwLAorCS5tbWFwID0gZHJtX2dlbV9tbWFw
LAogfTsKIAogc3RhdGljIGludCBxeGxfZHJtX2ZyZWV6ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYwppbmRleCBjMDEzYzUxNmY1NjEuLjkyN2FiOTE3Yjgz
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKQEAgLTg2LDYgKzg2LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBxeGxfb2JqZWN0X2Z1bmNzID0gewogCS5n
ZXRfc2dfdGFibGUgPSBxeGxfZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKIAkudm1hcCA9IHF4bF9n
ZW1fcHJpbWVfdm1hcCwKIAkudnVubWFwID0gcXhsX2dlbV9wcmltZV92dW5tYXAsCisJLm1tYXAg
PSBkcm1fZ2VtX3R0bV9tbWFwLAogCS5wcmludF9pbmZvID0gZHJtX2dlbV90dG1fcHJpbnRfaW5m
bywKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKaW5kZXggZGJhOTI1NTg5ZTE3Li42MjlhYzhlNzdh
MjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCkBAIC00OCwyMiArNDgsNiBAQCBzdGF0aWMgc3RydWN0
IHF4bF9kZXZpY2UgKnF4bF9nZXRfcWRldihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKIAly
ZXR1cm4gcWRldjsKIH0KIAotaW50IHF4bF9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkKLXsKLQlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiA9IGZp
bHAtPnByaXZhdGVfZGF0YTsKLQlzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiA9IGZpbGVfcHJpdi0+
bWlub3ItPmRldi0+ZGV2X3ByaXZhdGU7Ci0KLQlpZiAocWRldiA9PSBOVUxMKSB7Ci0JCURSTV9F
UlJPUigKLQkJICJmaWxwLT5wcml2YXRlX2RhdGEtPm1pbm9yLT5kZXYtPmRldl9wcml2YXRlID09
IE5VTExcbiIpOwotCQlyZXR1cm4gLUVJTlZBTDsKLQl9Ci0JRFJNX0RFQlVHX0RSSVZFUigiZmls
cC0+cHJpdmF0ZV9kYXRhID0gMHglcCwgdm1hLT52bV9wZ29mZiA9ICVseFxuIiwKLQkJICBmaWxw
LT5wcml2YXRlX2RhdGEsIHZtYS0+dm1fcGdvZmYpOwotCi0JcmV0dXJuIHR0bV9ib19tbWFwKGZp
bHAsIHZtYSwgJnFkZXYtPm1tYW4uYmRldik7Ci19Ci0KIHN0YXRpYyBpbnQgcXhsX2ludmFsaWRh
dGVfY2FjaGVzKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCBmbGFncykKIHsK
IAlyZXR1cm4gMDsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
