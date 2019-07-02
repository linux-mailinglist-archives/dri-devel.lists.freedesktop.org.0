Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2385D16E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 16:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B6E89F3C;
	Tue,  2 Jul 2019 14:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AF089F3C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 14:19:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 12EB085365;
 Tue,  2 Jul 2019 14:19:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C15E7DF56;
 Tue,  2 Jul 2019 14:19:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9DFDA9D75; Tue,  2 Jul 2019 16:19:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 12/18] drm/virtio: remove virtio_gpu_alloc_object
Date: Tue,  2 Jul 2019 16:18:57 +0200
Message-Id: <20190702141903.1131-13-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-1-kraxel@redhat.com>
References: <20190702141903.1131-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 02 Jul 2019 14:19:15 +0000 (UTC)
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
eCBmOGE1ODYwMjk0MDAuLjU3N2E4MTAzNjcwZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
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
bS92aXJ0aW8vdmlydGdwdV9nZW0uYwppbmRleCA4YTk1ODY0NDA0Y2EuLjZiYWY2NDE0MTY0NSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYwpAQCAtMjYsMzUgKzI2LDIwIEBACiAj
aW5jbHVkZSA8ZHJtL2RybVAuaD4KICNpbmNsdWRlICJ2aXJ0Z3B1X2Rydi5oIgogCi1zdHJ1Y3Qg
dmlydGlvX2dwdV9vYmplY3QqCi12aXJ0aW9fZ3B1X2FsbG9jX29iamVjdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAotCQkJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X3BhcmFtcyAqcGFyYW1zLAot
CQkJc3RydWN0IHZpcnRpb19ncHVfZmVuY2UgKmZlbmNlKQotewotCXN0cnVjdCB2aXJ0aW9fZ3B1
X2RldmljZSAqdmdkZXYgPSBkZXYtPmRldl9wcml2YXRlOwotCXN0cnVjdCB2aXJ0aW9fZ3B1X29i
amVjdCAqb2JqOwotCWludCByZXQ7Ci0KLQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUo
dmdkZXYsIHBhcmFtcywgJm9iaiwgZmVuY2UpOwotCWlmIChyZXQpCi0JCXJldHVybiBFUlJfUFRS
KHJldCk7Ci0KLQlyZXR1cm4gb2JqOwotfQotCiBpbnQgdmlydGlvX2dwdV9nZW1fY3JlYXRlKHN0
cnVjdCBkcm1fZmlsZSAqZmlsZSwKIAkJCSAgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCSAg
c3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X3BhcmFtcyAqcGFyYW1zLAogCQkJICBzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKipvYmpfcCwKIAkJCSAgdWludDMyX3QgKmhhbmRsZV9wKQogeworCXN0cnVj
dCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCB2
aXJ0aW9fZ3B1X29iamVjdCAqb2JqOwogCWludCByZXQ7CiAJdTMyIGhhbmRsZTsKIAotCW9iaiA9
IHZpcnRpb19ncHVfYWxsb2Nfb2JqZWN0KGRldiwgcGFyYW1zLCBOVUxMKTsKLQlpZiAoSVNfRVJS
KG9iaikpCi0JCXJldHVybiBQVFJfRVJSKG9iaik7CisJcmV0ID0gdmlydGlvX2dwdV9vYmplY3Rf
Y3JlYXRlKHZnZGV2LCBwYXJhbXMsICZvYmosIE5VTEwpOworCWlmIChyZXQgPCAwKQorCQlyZXR1
cm4gcmV0OwogCiAJcmV0ID0gZHJtX2dlbV9oYW5kbGVfY3JlYXRlKGZpbGUsICZvYmotPmJhc2Uu
YmFzZSwgJmhhbmRsZSk7CiAJaWYgKHJldCkgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
aW9jdGwuYwppbmRleCAxMDcwNTc4MTZlMWYuLjBkMGFjZjBiODVlZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKQEAgLTI1NCwxMCArMjU0LDEwIEBAIHN0YXRpYyBpbnQg
dmlydGlvX2dwdV9yZXNvdXJjZV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKIAlmZW5jZSA9IHZpcnRpb19ncHVfZmVuY2VfYWxsb2ModmdkZXYpOwogCWlm
ICghZmVuY2UpCiAJCXJldHVybiAtRU5PTUVNOwotCXFvYmogPSB2aXJ0aW9fZ3B1X2FsbG9jX29i
amVjdChkZXYsICZwYXJhbXMsIGZlbmNlKTsKKwlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9jcmVh
dGUodmdkZXYsICZwYXJhbXMsICZxb2JqLCBmZW5jZSk7CiAJZG1hX2ZlbmNlX3B1dCgmZmVuY2Ut
PmYpOwotCWlmIChJU19FUlIocW9iaikpCi0JCXJldHVybiBQVFJfRVJSKHFvYmopOworCWlmIChy
ZXQgPCAwKQorCQlyZXR1cm4gcmV0OwogCW9iaiA9ICZxb2JqLT5iYXNlLmJhc2U7CiAKIAlyZXQg
PSBkcm1fZ2VtX2hhbmRsZV9jcmVhdGUoZmlsZV9wcml2LCBvYmosICZoYW5kbGUpOwotLSAKMi4x
OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
