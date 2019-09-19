Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD014B76F8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 12:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE1A6FA61;
	Thu, 19 Sep 2019 10:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790FC6FAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1433D308FBA0;
 Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6CB860C18;
 Thu, 19 Sep 2019 10:02:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6F25C9D34; Thu, 19 Sep 2019 12:02:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Date: Thu, 19 Sep 2019 12:02:18 +0200
Message-Id: <20190919100223.13309-7-kraxel@redhat.com>
In-Reply-To: <20190919100223.13309-1-kraxel@redhat.com>
References: <20190919100223.13309-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmFjdG9yIG91dCB0dG0gdm1hIHNldHVwIHRvIGEgbmV3IGZ1bmN0aW9uLgpSZWR1Y2VzIGNvZGUg
ZHVwbGljYXRpb24gYSBiaXQuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgNDYgKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0
aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggNGFh
MDA3ZWRmZmIwLi5iNTMxNGVmODVhM2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtNDI2
LDYgKzQyNiwyOCBAQCBzdGF0aWMgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0dG1fYm9fdm1f
bG9va3VwKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCXJldHVybiBibzsKIH0KIAordm9p
ZCB0dG1fYm9fbW1hcF92bWFfc2V0dXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCit7CisJdm1hLT52bV9vcHMgPSAmdHRtX2JvX3ZtX29w
czsKKworCS8qCisJICogTm90ZTogV2UncmUgdHJhbnNmZXJyaW5nIHRoZSBibyByZWZlcmVuY2Ug
dG8KKwkgKiB2bWEtPnZtX3ByaXZhdGVfZGF0YSBoZXJlLgorCSAqLworCisJdm1hLT52bV9wcml2
YXRlX2RhdGEgPSBibzsKKworCS8qCisJICogV2UnZCBsaWtlIHRvIHVzZSBWTV9QRk5NQVAgb24g
c2hhcmVkIG1hcHBpbmdzLCB3aGVyZQorCSAqICh2bWEtPnZtX2ZsYWdzICYgVk1fU0hBUkVEKSAh
PSAwLCBmb3IgcGVyZm9ybWFuY2UgcmVhc29ucywKKwkgKiBidXQgZm9yIHNvbWUgcmVhc29uIFZN
X1BGTk1BUCArIHg4NiBQQVQgKyB3cml0ZS1jb21iaW5lIGlzIHZlcnkKKwkgKiBiYWQgZm9yIHBl
cmZvcm1hbmNlLiBVbnRpbCB0aGF0IGhhcyBiZWVuIHNvcnRlZCBvdXQsIHVzZQorCSAqIFZNX01J
WEVETUFQIG9uIGFsbCBtYXBwaW5ncy4gU2VlIGZyZWVkZXNrdG9wLm9yZyBidWcgIzc1NzE5CisJ
ICovCisJdm1hLT52bV9mbGFncyB8PSBWTV9NSVhFRE1BUDsKKwl2bWEtPnZtX2ZsYWdzIHw9IFZN
X0lPIHwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOworfQorCiBpbnQgdHRtX2JvX21tYXAo
c3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCQlzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldikKIHsKQEAgLTQ0OSwyNCArNDcxLDcgQEAgaW50IHR0bV9ib19t
bWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAlpZiAo
dW5saWtlbHkocmV0ICE9IDApKQogCQlnb3RvIG91dF91bnJlZjsKIAotCXZtYS0+dm1fb3BzID0g
JnR0bV9ib192bV9vcHM7Ci0KLQkvKgotCSAqIE5vdGU6IFdlJ3JlIHRyYW5zZmVycmluZyB0aGUg
Ym8gcmVmZXJlbmNlIHRvCi0JICogdm1hLT52bV9wcml2YXRlX2RhdGEgaGVyZS4KLQkgKi8KLQot
CXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gYm87Ci0KLQkvKgotCSAqIFdlJ2QgbGlrZSB0byB1c2Ug
Vk1fUEZOTUFQIG9uIHNoYXJlZCBtYXBwaW5ncywgd2hlcmUKLQkgKiAodm1hLT52bV9mbGFncyAm
IFZNX1NIQVJFRCkgIT0gMCwgZm9yIHBlcmZvcm1hbmNlIHJlYXNvbnMsCi0JICogYnV0IGZvciBz
b21lIHJlYXNvbiBWTV9QRk5NQVAgKyB4ODYgUEFUICsgd3JpdGUtY29tYmluZSBpcyB2ZXJ5Ci0J
ICogYmFkIGZvciBwZXJmb3JtYW5jZS4gVW50aWwgdGhhdCBoYXMgYmVlbiBzb3J0ZWQgb3V0LCB1
c2UKLQkgKiBWTV9NSVhFRE1BUCBvbiBhbGwgbWFwcGluZ3MuIFNlZSBmcmVlZGVza3RvcC5vcmcg
YnVnICM3NTcxOQotCSAqLwotCXZtYS0+dm1fZmxhZ3MgfD0gVk1fTUlYRURNQVA7Ci0Jdm1hLT52
bV9mbGFncyB8PSBWTV9JTyB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKKwl0dG1fYm9f
bW1hcF92bWFfc2V0dXAoYm8sIHZtYSk7CiAJcmV0dXJuIDA7CiBvdXRfdW5yZWY6CiAJdHRtX2Jv
X3B1dChibyk7CkBAIC00ODEsMTAgKzQ4Niw3IEBAIGludCB0dG1fZmJkZXZfbW1hcChzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIAogCXR0
bV9ib19nZXQoYm8pOwogCi0Jdm1hLT52bV9vcHMgPSAmdHRtX2JvX3ZtX29wczsKLQl2bWEtPnZt
X3ByaXZhdGVfZGF0YSA9IGJvOwotCXZtYS0+dm1fZmxhZ3MgfD0gVk1fTUlYRURNQVA7Ci0Jdm1h
LT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX0RPTlRFWFBBTkQ7CisJdHRtX2JvX21tYXBfdm1hX3Nl
dHVwKGJvLCB2bWEpOwogCXJldHVybiAwOwogfQogRVhQT1JUX1NZTUJPTCh0dG1fZmJkZXZfbW1h
cCk7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
