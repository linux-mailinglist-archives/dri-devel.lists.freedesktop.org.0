Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46486381
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC376E854;
	Thu,  8 Aug 2019 13:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D782890BA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:44:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06A62316E536;
 Thu,  8 Aug 2019 13:44:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E22760A9D;
 Thu,  8 Aug 2019 13:44:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB02A9D2B; Thu,  8 Aug 2019 15:44:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/17] drm/ttm: factor out ttm_bo_mmap_vma_setup
Date: Thu,  8 Aug 2019 15:44:08 +0200
Message-Id: <20190808134417.10610-9-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 08 Aug 2019 13:44:28 +0000 (UTC)
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmFjdG9yIG91dCB0dG0gdm1hIHNldHVwIHRvIGEgbmV3IGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1i
eTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19hcGkuaCAgICB8ICA4ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dm0uYyB8IDQ3ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAzMyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaApp
bmRleCA2NWVmNTM3NmRlNTkuLjJjNWZhYjBmM2VkNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19hcGkuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCkBAIC03
MzQsNiArNzM0LDE0IEBAIGludCB0dG1fZmJkZXZfbW1hcChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7CiBpbnQgdHRtX2JvX21tYXAoc3Ry
dWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCQlzdHJ1Y3QgdHRt
X2JvX2RldmljZSAqYmRldik7CiAKKy8qKgorICogdHRtX2JvX21tYXBfdm1hX3NldHVwIC0gaW5p
dGlhbGl6ZSB2bWEgZm9yIHR0bSBibyBtbWFwCisgKgorICogQGJvOiBUaGUgYnVmZmVyIG9iamVj
dC4KKyAqIEB2bWE6IHZtYSBhcyBpbnB1dCBmcm9tIHRoZSBtbWFwIG1ldGhvZC4KKyAqLwordm9p
ZCB0dG1fYm9fbW1hcF92bWFfc2V0dXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOworCiB2b2lkICp0dG1fa21hcF9hdG9taWNfcHJvdChz
dHJ1Y3QgcGFnZSAqcGFnZSwgcGdwcm90X3QgcHJvdCk7CiAKIHZvaWQgdHRtX2t1bm1hcF9hdG9t
aWNfcHJvdCh2b2lkICphZGRyLCBwZ3Byb3RfdCBwcm90KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5j
CmluZGV4IGQ0ZWVjZGU4ZDA1MC4uOTAzNTYzYTc0OTZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib192bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMKQEAgLTQyNiw2ICs0MjYsMjkgQEAgc3RhdGljIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
dHRtX2JvX3ZtX2xvb2t1cChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAlyZXR1cm4gYm87
CiB9CiAKK3ZvaWQgdHRtX2JvX21tYXBfdm1hX3NldHVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQoreworCXZtYS0+dm1fb3BzID0gJnR0
bV9ib192bV9vcHM7CisKKwkvKgorCSAqIE5vdGU6IFdlJ3JlIHRyYW5zZmVycmluZyB0aGUgYm8g
cmVmZXJlbmNlIHRvCisJICogdm1hLT52bV9wcml2YXRlX2RhdGEgaGVyZS4KKwkgKi8KKworCXZt
YS0+dm1fcHJpdmF0ZV9kYXRhID0gYm87CisKKwkvKgorCSAqIFdlJ2QgbGlrZSB0byB1c2UgVk1f
UEZOTUFQIG9uIHNoYXJlZCBtYXBwaW5ncywgd2hlcmUKKwkgKiAodm1hLT52bV9mbGFncyAmIFZN
X1NIQVJFRCkgIT0gMCwgZm9yIHBlcmZvcm1hbmNlIHJlYXNvbnMsCisJICogYnV0IGZvciBzb21l
IHJlYXNvbiBWTV9QRk5NQVAgKyB4ODYgUEFUICsgd3JpdGUtY29tYmluZSBpcyB2ZXJ5CisJICog
YmFkIGZvciBwZXJmb3JtYW5jZS4gVW50aWwgdGhhdCBoYXMgYmVlbiBzb3J0ZWQgb3V0LCB1c2UK
KwkgKiBWTV9NSVhFRE1BUCBvbiBhbGwgbWFwcGluZ3MuIFNlZSBmcmVlZGVza3RvcC5vcmcgYnVn
ICM3NTcxOQorCSAqLworCXZtYS0+dm1fZmxhZ3MgfD0gVk1fTUlYRURNQVA7CisJdm1hLT52bV9m
bGFncyB8PSBWTV9JTyB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKK30KK0VYUE9SVF9T
WU1CT0wodHRtX2JvX21tYXBfdm1hX3NldHVwKTsKKwogaW50IHR0bV9ib19tbWFwKHN0cnVjdCBm
aWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYpCiB7CkBAIC00NDksMjQgKzQ3Miw3IEBAIGludCB0dG1fYm9fbW1hcChzdHJ1
Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJaWYgKHVubGlrZWx5
KHJldCAhPSAwKSkKIAkJZ290byBvdXRfdW5yZWY7CiAKLQl2bWEtPnZtX29wcyA9ICZ0dG1fYm9f
dm1fb3BzOwotCi0JLyoKLQkgKiBOb3RlOiBXZSdyZSB0cmFuc2ZlcnJpbmcgdGhlIGJvIHJlZmVy
ZW5jZSB0bwotCSAqIHZtYS0+dm1fcHJpdmF0ZV9kYXRhIGhlcmUuCi0JICovCi0KLQl2bWEtPnZt
X3ByaXZhdGVfZGF0YSA9IGJvOwotCi0JLyoKLQkgKiBXZSdkIGxpa2UgdG8gdXNlIFZNX1BGTk1B
UCBvbiBzaGFyZWQgbWFwcGluZ3MsIHdoZXJlCi0JICogKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFS
RUQpICE9IDAsIGZvciBwZXJmb3JtYW5jZSByZWFzb25zLAotCSAqIGJ1dCBmb3Igc29tZSByZWFz
b24gVk1fUEZOTUFQICsgeDg2IFBBVCArIHdyaXRlLWNvbWJpbmUgaXMgdmVyeQotCSAqIGJhZCBm
b3IgcGVyZm9ybWFuY2UuIFVudGlsIHRoYXQgaGFzIGJlZW4gc29ydGVkIG91dCwgdXNlCi0JICog
Vk1fTUlYRURNQVAgb24gYWxsIG1hcHBpbmdzLiBTZWUgZnJlZWRlc2t0b3Aub3JnIGJ1ZyAjNzU3
MTkKLQkgKi8KLQl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOwotCXZtYS0+dm1fZmxhZ3Mg
fD0gVk1fSU8gfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7CisJdHRtX2JvX21tYXBfdm1h
X3NldHVwKGJvLCB2bWEpOwogCXJldHVybiAwOwogb3V0X3VucmVmOgogCXR0bV9ib19wdXQoYm8p
OwpAQCAtNDgxLDEwICs0ODcsNyBAQCBpbnQgdHRtX2ZiZGV2X21tYXAoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAKIAl0dG1fYm9fZ2V0
KGJvKTsKIAotCXZtYS0+dm1fb3BzID0gJnR0bV9ib192bV9vcHM7Ci0Jdm1hLT52bV9wcml2YXRl
X2RhdGEgPSBibzsKLQl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOwotCXZtYS0+dm1fZmxh
Z3MgfD0gVk1fSU8gfCBWTV9ET05URVhQQU5EOworCXR0bV9ib19tbWFwX3ZtYV9zZXR1cChibywg
dm1hKTsKIAlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0wodHRtX2ZiZGV2X21tYXApOwotLSAK
Mi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
