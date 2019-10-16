Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D4D9007
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 13:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69CE6E949;
	Wed, 16 Oct 2019 11:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDB76E945
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 11:52:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F0CCC010931;
 Wed, 16 Oct 2019 11:52:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1034160C57;
 Wed, 16 Oct 2019 11:52:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C1A4E31E94; Wed, 16 Oct 2019 13:52:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Date: Wed, 16 Oct 2019 13:51:58 +0200
Message-Id: <20191016115203.20095-7-kraxel@redhat.com>
In-Reply-To: <20191016115203.20095-1-kraxel@redhat.com>
References: <20191016115203.20095-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 16 Oct 2019 11:52:10 +0000 (UTC)
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
ZHVwbGljYXRpb24gYSBiaXQuCgp2MjogZG9uJ3QgY2hhbmdlIHZtX2ZsYWdzIChtb3ZlZCB0byBz
ZXBhcmF0ZSBwYXRjaCkuCnY0OiBtYWtlIHR0bV9ib19tbWFwX3ZtYV9zZXR1cCBzdGF0aWMuCgpT
aWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgNDYgKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggNGFhMDA3ZWRmZmIwLi41MzM0NWMwODU0
ZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtNDI2LDYgKzQyNiwyOCBAQCBzdGF0aWMg
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0dG1fYm9fdm1fbG9va3VwKHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LAogCXJldHVybiBibzsKIH0KIAorc3RhdGljIHZvaWQgdHRtX2JvX21tYXBf
dm1hX3NldHVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQoreworCXZtYS0+dm1fb3BzID0gJnR0bV9ib192bV9vcHM7CisKKwkvKgorCSAq
IE5vdGU6IFdlJ3JlIHRyYW5zZmVycmluZyB0aGUgYm8gcmVmZXJlbmNlIHRvCisJICogdm1hLT52
bV9wcml2YXRlX2RhdGEgaGVyZS4KKwkgKi8KKworCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gYm87
CisKKwkvKgorCSAqIFdlJ2QgbGlrZSB0byB1c2UgVk1fUEZOTUFQIG9uIHNoYXJlZCBtYXBwaW5n
cywgd2hlcmUKKwkgKiAodm1hLT52bV9mbGFncyAmIFZNX1NIQVJFRCkgIT0gMCwgZm9yIHBlcmZv
cm1hbmNlIHJlYXNvbnMsCisJICogYnV0IGZvciBzb21lIHJlYXNvbiBWTV9QRk5NQVAgKyB4ODYg
UEFUICsgd3JpdGUtY29tYmluZSBpcyB2ZXJ5CisJICogYmFkIGZvciBwZXJmb3JtYW5jZS4gVW50
aWwgdGhhdCBoYXMgYmVlbiBzb3J0ZWQgb3V0LCB1c2UKKwkgKiBWTV9NSVhFRE1BUCBvbiBhbGwg
bWFwcGluZ3MuIFNlZSBmcmVlZGVza3RvcC5vcmcgYnVnICM3NTcxOQorCSAqLworCXZtYS0+dm1f
ZmxhZ3MgfD0gVk1fTUlYRURNQVA7CisJdm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX0RPTlRF
WFBBTkQgfCBWTV9ET05URFVNUDsKK30KKwogaW50IHR0bV9ib19tbWFwKHN0cnVjdCBmaWxlICpm
aWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYpCiB7CkBAIC00NDksMjQgKzQ3MSw3IEBAIGludCB0dG1fYm9fbW1hcChzdHJ1Y3QgZmls
ZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJaWYgKHVubGlrZWx5KHJldCAh
PSAwKSkKIAkJZ290byBvdXRfdW5yZWY7CiAKLQl2bWEtPnZtX29wcyA9ICZ0dG1fYm9fdm1fb3Bz
OwotCi0JLyoKLQkgKiBOb3RlOiBXZSdyZSB0cmFuc2ZlcnJpbmcgdGhlIGJvIHJlZmVyZW5jZSB0
bwotCSAqIHZtYS0+dm1fcHJpdmF0ZV9kYXRhIGhlcmUuCi0JICovCi0KLQl2bWEtPnZtX3ByaXZh
dGVfZGF0YSA9IGJvOwotCi0JLyoKLQkgKiBXZSdkIGxpa2UgdG8gdXNlIFZNX1BGTk1BUCBvbiBz
aGFyZWQgbWFwcGluZ3MsIHdoZXJlCi0JICogKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQpICE9
IDAsIGZvciBwZXJmb3JtYW5jZSByZWFzb25zLAotCSAqIGJ1dCBmb3Igc29tZSByZWFzb24gVk1f
UEZOTUFQICsgeDg2IFBBVCArIHdyaXRlLWNvbWJpbmUgaXMgdmVyeQotCSAqIGJhZCBmb3IgcGVy
Zm9ybWFuY2UuIFVudGlsIHRoYXQgaGFzIGJlZW4gc29ydGVkIG91dCwgdXNlCi0JICogVk1fTUlY
RURNQVAgb24gYWxsIG1hcHBpbmdzLiBTZWUgZnJlZWRlc2t0b3Aub3JnIGJ1ZyAjNzU3MTkKLQkg
Ki8KLQl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOwotCXZtYS0+dm1fZmxhZ3MgfD0gVk1f
SU8gfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7CisJdHRtX2JvX21tYXBfdm1hX3NldHVw
KGJvLCB2bWEpOwogCXJldHVybiAwOwogb3V0X3VucmVmOgogCXR0bV9ib19wdXQoYm8pOwpAQCAt
NDgxLDEwICs0ODYsNyBAQCBpbnQgdHRtX2ZiZGV2X21tYXAoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAKIAl0dG1fYm9fZ2V0KGJvKTsK
IAotCXZtYS0+dm1fb3BzID0gJnR0bV9ib192bV9vcHM7Ci0Jdm1hLT52bV9wcml2YXRlX2RhdGEg
PSBibzsKLQl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOwotCXZtYS0+dm1fZmxhZ3MgfD0g
Vk1fSU8gfCBWTV9ET05URVhQQU5EOworCXR0bV9ib19tbWFwX3ZtYV9zZXR1cChibywgdm1hKTsK
IAlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0wodHRtX2ZiZGV2X21tYXApOwotLSAKMi4xOC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
