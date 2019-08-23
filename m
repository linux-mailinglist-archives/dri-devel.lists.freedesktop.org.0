Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96859AC31
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5196EC71;
	Fri, 23 Aug 2019 09:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9030B6EC59
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:55:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2BF701057866;
 Fri, 23 Aug 2019 09:55:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C61A5D772;
 Fri, 23 Aug 2019 09:55:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE1C631EB4; Fri, 23 Aug 2019 11:55:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 15/18] drm/virtio: remove virtio_gpu_alloc_object
Date: Fri, 23 Aug 2019 11:55:00 +0200
Message-Id: <20190823095503.2261-16-kraxel@redhat.com>
In-Reply-To: <20190823095503.2261-1-kraxel@redhat.com>
References: <20190823095503.2261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 23 Aug 2019 09:55:12 +0000 (UTC)
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
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpbiB3cmFwcGVyIGFyb3VuZCB2aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUoKSwKYnV0IGNhbGxp
bmcgdGhhdCBkaXJlY3RseSB3b3JrcyBlcXVhbGx5IHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rydi5oICAgfCAgNCAtLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMg
ICB8IDIzICsrKystLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfaW9jdGwuYyB8ICA2ICsrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDI2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRl
eCBiNjdkMjNlZjJiMTEuLjNlNWIyZDFkYjQyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9kcnYuaApAQCAtMjI5LDEwICsyMjksNiBAQCBpbnQgdmlydGlvX2dwdV9nZW1fb2JqZWN0X29w
ZW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJCQkgICAgICAgc3RydWN0IGRybV9maWxl
ICpmaWxlKTsKIHZvaWQgdmlydGlvX2dwdV9nZW1fb2JqZWN0X2Nsb3NlKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqLAogCQkJCSBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpOwotc3RydWN0IHZpcnRp
b19ncHVfb2JqZWN0KgotdmlydGlvX2dwdV9hbGxvY19vYmplY3Qoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKLQkJCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdF9wYXJhbXMgKnBhcmFtcywKLQkJCXN0
cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICpmZW5jZSk7CiBpbnQgdmlydGlvX2dwdV9tb2RlX2R1bWJf
Y3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAogCQkJCXN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsCiAJCQkJc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdzKTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9nZW0uYwppbmRleCA0NTJhZDdhYzU0YTUuLjNhNDVhODY1ZjljMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYwpAQCAtMjgsMzUgKzI4LDIwIEBACiAK
ICNpbmNsdWRlICJ2aXJ0Z3B1X2Rydi5oIgogCi1zdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QqCi12
aXJ0aW9fZ3B1X2FsbG9jX29iamVjdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAotCQkJc3RydWN0
IHZpcnRpb19ncHVfb2JqZWN0X3BhcmFtcyAqcGFyYW1zLAotCQkJc3RydWN0IHZpcnRpb19ncHVf
ZmVuY2UgKmZlbmNlKQotewotCXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYgPSBkZXYt
PmRldl9wcml2YXRlOwotCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqb2JqOwotCWludCByZXQ7
Ci0KLQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUodmdkZXYsIHBhcmFtcywgJm9iaiwg
ZmVuY2UpOwotCWlmIChyZXQpCi0JCXJldHVybiBFUlJfUFRSKHJldCk7Ci0KLQlyZXR1cm4gb2Jq
OwotfQotCiBpbnQgdmlydGlvX2dwdV9nZW1fY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwK
IAkJCSAgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCSAgc3RydWN0IHZpcnRpb19ncHVfb2Jq
ZWN0X3BhcmFtcyAqcGFyYW1zLAogCQkJICBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKipvYmpfcCwK
IAkJCSAgdWludDMyX3QgKmhhbmRsZV9wKQogeworCXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAq
dmdkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqb2Jq
OwogCWludCByZXQ7CiAJdTMyIGhhbmRsZTsKIAotCW9iaiA9IHZpcnRpb19ncHVfYWxsb2Nfb2Jq
ZWN0KGRldiwgcGFyYW1zLCBOVUxMKTsKLQlpZiAoSVNfRVJSKG9iaikpCi0JCXJldHVybiBQVFJf
RVJSKG9iaik7CisJcmV0ID0gdmlydGlvX2dwdV9vYmplY3RfY3JlYXRlKHZnZGV2LCBwYXJhbXMs
ICZvYmosIE5VTEwpOworCWlmIChyZXQgPCAwKQorCQlyZXR1cm4gcmV0OwogCiAJcmV0ID0gZHJt
X2dlbV9oYW5kbGVfY3JlYXRlKGZpbGUsICZvYmotPmJhc2UuYmFzZSwgJmhhbmRsZSk7CiAJaWYg
KHJldCkgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3Rs
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwppbmRleCAxZTI1YzY1
MDg3MGMuLmUxMGJlNGJjZWJhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2lvY3RsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3Rs
LmMKQEAgLTI1NiwxMCArMjU2LDEwIEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9yZXNvdXJjZV9j
cmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlmZW5jZSA9
IHZpcnRpb19ncHVfZmVuY2VfYWxsb2ModmdkZXYpOwogCWlmICghZmVuY2UpCiAJCXJldHVybiAt
RU5PTUVNOwotCXFvYmogPSB2aXJ0aW9fZ3B1X2FsbG9jX29iamVjdChkZXYsICZwYXJhbXMsIGZl
bmNlKTsKKwlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUodmdkZXYsICZwYXJhbXMsICZx
b2JqLCBmZW5jZSk7CiAJZG1hX2ZlbmNlX3B1dCgmZmVuY2UtPmYpOwotCWlmIChJU19FUlIocW9i
aikpCi0JCXJldHVybiBQVFJfRVJSKHFvYmopOworCWlmIChyZXQgPCAwKQorCQlyZXR1cm4gcmV0
OwogCW9iaiA9ICZxb2JqLT5iYXNlLmJhc2U7CiAKIAlyZXQgPSBkcm1fZ2VtX2hhbmRsZV9jcmVh
dGUoZmlsZV9wcml2LCBvYmosICZoYW5kbGUpOwotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
