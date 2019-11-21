Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2602B1050AF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 11:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60DD6ED9E;
	Thu, 21 Nov 2019 10:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94866ED9E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:38:19 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-hrfRQkw1MkazqJtpqYN2wg-1; Thu, 21 Nov 2019 05:38:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19AD06A6;
 Thu, 21 Nov 2019 10:38:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F6EE70537;
 Thu, 21 Nov 2019 10:38:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0ADF17536; Thu, 21 Nov 2019 11:38:07 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: call drm_gem_object_funcs.mmap with fake offset
Date: Thu, 21 Nov 2019 11:38:06 +0100
Message-Id: <20191121103807.18424-2-kraxel@redhat.com>
In-Reply-To: <20191121103807.18424-1-kraxel@redhat.com>
References: <20191121103807.18424-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: hrfRQkw1MkazqJtpqYN2wg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574332698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIac5SPOmc9oxHIYzV9hFqqBc5xVMgS7zIDXwEB9xaw=;
 b=jIDkN6U9JgqtI7VhOYQT4bv56VVXA4LtKvztwgjLNJUV6OOT3xqlDJeN4wIkt0tArZOp42
 4JdK564sAJu0fNFeCh1UzynYp+wGWrloAXeTODslVHnAi3EIOsokdQjmkJLi5bEb4w2oHP
 A0id4RZp7YGOUhV1hUAbMnsEhcFTauI=
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>,
 Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZha2Ugb2Zmc2V0IGlzIGdvaW5nIHRvIHN0YXksIHNvIGNoYW5nZSB0aGUgY2FsbGluZyBj
b252ZW50aW9uIGZvcgpkcm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwIHRvIGluY2x1ZGUgdGhlIGZh
a2Ugb2Zmc2V0LiAgVXBkYXRlIGFsbCB1c2VycwphY2NvcmRpbmdseS4KClNpZ25lZC1vZmYtYnk6
IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9n
ZW0uaCAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5j
ICAgICAgICAgICAgICB8IDMgLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxw
ZXIuYyB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgICAgICAgICAgICB8IDMg
KysrCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAgICAgICB8IDcgLS0tLS0tLQog
NSBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaAppbmRl
eCA5N2E0ODE2NTY0MmMuLjBiMzc1MDY5Y2Q0OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2dlbS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaApAQCAtMTU5LDkgKzE1OSw3IEBAIHN0
cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyB7CiAJICoKIAkgKiBUaGUgY2FsbGJhY2sgaXMgdXNl
ZCBieSBieSBib3RoIGRybV9nZW1fbW1hcF9vYmooKSBhbmQKIAkgKiBkcm1fZ2VtX3ByaW1lX21t
YXAoKS4gIFdoZW4gQG1tYXAgaXMgcHJlc2VudCBAdm1fb3BzIGlzIG5vdAotCSAqIHVzZWQsIHRo
ZSBAbW1hcCBjYWxsYmFjayBtdXN0IHNldCB2bWEtPnZtX29wcyBpbnN0ZWFkLiBUaGUgQG1tYXAK
LQkgKiBjYWxsYmFjayBpcyBhbHdheXMgY2FsbGVkIHdpdGggYSAwIG9mZnNldC4gVGhlIGNhbGxl
ciB3aWxsIHJlbW92ZQotCSAqIHRoZSBmYWtlIG9mZnNldCBhcyBuZWNlc3NhcnkuCisJICogdXNl
ZCwgdGhlIEBtbWFwIGNhbGxiYWNrIG11c3Qgc2V0IHZtYS0+dm1fb3BzIGluc3RlYWQuCiAJICov
CiAJaW50ICgqbW1hcCkoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKaW5kZXggMmYyYjg4OTA5NmIwLi41NmY0MmUwZjI1
ODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW0uYwpAQCAtMTEwNiw5ICsxMTA2LDYgQEAgaW50IGRybV9nZW1fbW1hcF9v
Ymooc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHVuc2lnbmVkIGxvbmcgb2JqX3NpemUsCiAJ
CXJldHVybiAtRUlOVkFMOwogCiAJaWYgKG9iai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+bW1hcCkg
ewotCQkvKiBSZW1vdmUgdGhlIGZha2Ugb2Zmc2V0ICovCi0JCXZtYS0+dm1fcGdvZmYgLT0gZHJt
X3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2RlKTsKLQogCQlyZXQgPSBvYmotPmZ1bmNzLT5t
bWFwKG9iaiwgdm1hKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5jCmluZGV4IDA4MTBkM2VmNjk2MS4uYTQyMWEyZWVkNDhhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwpAQCAtNTI4LDYgKzUyOCw5IEBA
IGludCBkcm1fZ2VtX3NobWVtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCXN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2ht
ZW07CiAJaW50IHJldDsKIAorCS8qIFJlbW92ZSB0aGUgZmFrZSBvZmZzZXQgKi8KKwl2bWEtPnZt
X3Bnb2ZmIC09IGRybV92bWFfbm9kZV9zdGFydCgmb2JqLT52bWFfbm9kZSk7CisKIAlzaG1lbSA9
IHRvX2RybV9nZW1fc2htZW1fb2JqKG9iaik7CiAKIAlyZXQgPSBkcm1fZ2VtX3NobWVtX2dldF9w
YWdlcyhzaG1lbSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKaW5kZXggMDgxNDIxMWIwZjNmLi5hOTYzM2JkMjQx
YmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW1lLmMKQEAgLTcxNCw2ICs3MTQsOSBAQCBpbnQgZHJtX2dlbV9wcmlt
ZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSkKIAlpbnQgcmV0OwogCiAJaWYgKG9iai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+bW1hcCkg
eworCQkvKiBBZGQgdGhlIGZha2Ugb2Zmc2V0ICovCisJCXZtYS0+dm1fcGdvZmYgKz0gZHJtX3Zt
YV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2RlKTsKKwogCQlyZXQgPSBvYmotPmZ1bmNzLT5tbWFw
KG9iaiwgdm1hKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dm0uYwppbmRleCBlNjQ5NWNhMjYzMGIuLjNlOGMzZGU5MWFlNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b192bS5jCkBAIC01MTQsMTMgKzUxNCw2IEBAIEVYUE9SVF9TWU1CT0wodHRtX2JvX21tYXApOwog
aW50IHR0bV9ib19tbWFwX29iaihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibykKIHsKIAl0dG1fYm9fZ2V0KGJvKTsKLQotCS8qCi0JICogRklY
TUU6ICZkcm1fZ2VtX29iamVjdF9mdW5jcy5tbWFwIGlzIGNhbGxlZCB3aXRoIHRoZSBmYWtlIG9m
ZnNldAotCSAqIHJlbW92ZWQuIEFkZCBpdCBiYWNrIGhlcmUgdW50aWwgdGhlIHJlc3Qgb2YgVFRN
IHdvcmtzIHdpdGhvdXQgaXQuCi0JICovCi0Jdm1hLT52bV9wZ29mZiArPSBkcm1fdm1hX25vZGVf
c3RhcnQoJmJvLT5iYXNlLnZtYV9ub2RlKTsKLQogCXR0bV9ib19tbWFwX3ZtYV9zZXR1cChibywg
dm1hKTsKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
