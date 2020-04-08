Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F551A206C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 13:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837E66E0CD;
	Wed,  8 Apr 2020 11:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4206E0CD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 11:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 931943F4B0;
 Wed,  8 Apr 2020 13:53:42 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=oD3hPlaq; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Jb9IwpSpPPq; Wed,  8 Apr 2020 13:53:41 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id F023F3F449;
 Wed,  8 Apr 2020 13:53:39 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F3607360153;
 Wed,  8 Apr 2020 13:53:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586346819; bh=mg5OI4FDH03FsjJDVXccNUrYFPvUTJTOe0eIcPXBgZo=;
 h=From:To:Cc:Subject:Date:From;
 b=oD3hPlaqUxA8+3psDtZQArM4uaIR/uRw2q9at2W5pMsnHdZFMMayEUZI/YEDjM844
 TPAG88DBwfIVH5h52bCiGTDOcj4wOK6H7NGkyJTzPlVm91TyTAJizyTZdNKWldmCnv
 oN+el6aLdhL8NIQ24032r0WoAWk26MPSUT9VL5fI=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Temporarily disable the huge_fault() callback
Date: Wed,  8 Apr 2020 13:53:31 +0200
Message-Id: <20200408115331.5529-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "Thomas Hellstrom \(VMware\)" <thomas_os@shipmail.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Xu <alex_y_xu@yahoo.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIlRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkiIDx0aG9tYXNfb3NAc2hpcG1haWwub3Jn
PgoKV2l0aCBhbWRncHUgYW5kIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRV9BTFdBWVM9eSwg
dGhlcmUgYXJlCmVycm9ycyBsaWtlOgpCVUc6IG5vbi16ZXJvIHBndGFibGVzX2J5dGVzIG9uIGZy
ZWVpbmcgbW0KYW5kOgpCVUc6IEJhZCByc3MtY291bnRlciBzdGF0ZQp3aXRoIFRUTSB0cmFuc3Bh
cmVudCBodWdlLXBhZ2VzLgpVbnRpbCB3ZSd2ZSBmaWd1cmVkIG91dCB3aGF0IG90aGVyIFRUTSBk
cml2ZXJzIGRvIGRpZmZlcmVudGx5IGNvbXBhcmVkIHRvCnZtd2dmeCwgZGlzYWJsZSB0aGUgaHVn
ZV9mYXVsdCgpIGNhbGxiYWNrLCBlbGltaW5hdGluZyB0cmFuc2h1Z2UKcGFnZS10YWJsZSBlbnRy
aWVzLgoKQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSAoVk13YXJlKSA8dGhvbWFzX29zQHNoaXBtYWls
Lm9yZz4KUmVwb3J0ZWQtYnk6IEFsZXggWHUgKEhlbGxvNzEpIDxhbGV4X3lfeHVAeWFob28uY2E+
ClRlc3RlZC1ieTogQWxleCBYdSAoSGVsbG83MSkgPGFsZXhfeV94dUB5YWhvby5jYT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgNjMgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3ZtLmMKaW5kZXggNmVlM2I5NmYwZDEzLi4wYWQzMGIxMTI5ODIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYwpAQCAtNDQyLDY2ICs0NDIsNiBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9m
YXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIH0KIEVYUE9SVF9TWU1CT0wodHRtX2JvX3ZtX2Zh
dWx0KTsKIAotI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQotLyoqCi0gKiB0dG1f
cGdwcm90X2lzX3dycHJvdGVjdGluZyAtIElzIGEgcGFnZSBwcm90ZWN0aW9uIHZhbHVlIHdyaXRl
LXByb3RlY3Rpbmc/Ci0gKiBAcHJvdDogVGhlIHBhZ2UgcHJvdGVjdGlvbiB2YWx1ZQotICoKLSAq
IFJldHVybjogdHJ1ZSBpZiBAcHJvdCBpcyB3cml0ZS1wcm90ZWN0aW5nLiBmYWxzZSBvdGhlcndp
c2UuCi0gKi8KLXN0YXRpYyBib29sIHR0bV9wZ3Byb3RfaXNfd3Jwcm90ZWN0aW5nKHBncHJvdF90
IHByb3QpCi17Ci0JLyoKLQkgKiBUaGlzIGlzIG1lYW50IHRvIHNheSAicGdwcm90X3dycHJvdGVj
dChwcm90KSA9PSBwcm90IiBpbiBhIGdlbmVyaWMKLQkgKiB3YXkuIFVuZm9ydHVuYXRlbHkgdGhl
cmUgaXMgbm8gZ2VuZXJpYyBwZ3Byb3Rfd3Jwcm90ZWN0LgotCSAqLwotCXJldHVybiBwdGVfdmFs
KHB0ZV93cnByb3RlY3QoX19wdGUocGdwcm90X3ZhbChwcm90KSkpKSA9PQotCQlwZ3Byb3RfdmFs
KHByb3QpOwotfQotCi1zdGF0aWMgdm1fZmF1bHRfdCB0dG1fYm9fdm1faHVnZV9mYXVsdChzdHJ1
Y3Qgdm1fZmF1bHQgKnZtZiwKLQkJCQkgICAgICAgZW51bSBwYWdlX2VudHJ5X3NpemUgcGVfc2l6
ZSkKLXsKLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwotCXBncHJvdF90
IHByb3Q7Ci0Jc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9k
YXRhOwotCXZtX2ZhdWx0X3QgcmV0OwotCXBnb2ZmX3QgZmF1bHRfcGFnZV9zaXplID0gMDsKLQli
b29sIHdyaXRlID0gdm1mLT5mbGFncyAmIEZBVUxUX0ZMQUdfV1JJVEU7Ci0KLQlzd2l0Y2ggKHBl
X3NpemUpIHsKLQljYXNlIFBFX1NJWkVfUE1EOgotCQlmYXVsdF9wYWdlX3NpemUgPSBIUEFHRV9Q
TURfU0laRSA+PiBQQUdFX1NISUZUOwotCQlicmVhazsKLSNpZmRlZiBDT05GSUdfSEFWRV9BUkNI
X1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRAotCWNhc2UgUEVfU0laRV9QVUQ6Ci0JCWZhdWx0X3Bh
Z2Vfc2l6ZSA9IEhQQUdFX1BVRF9TSVpFID4+IFBBR0VfU0hJRlQ7Ci0JCWJyZWFrOwotI2VuZGlm
Ci0JZGVmYXVsdDoKLQkJV0FSTl9PTl9PTkNFKDEpOwotCQlyZXR1cm4gVk1fRkFVTFRfRkFMTEJB
Q0s7Ci0JfQotCi0JLyogRmFsbGJhY2sgb24gd3JpdGUgZGlydHktdHJhY2tpbmcgb3IgQ09XICov
Ci0JaWYgKHdyaXRlICYmIHR0bV9wZ3Byb3RfaXNfd3Jwcm90ZWN0aW5nKHZtYS0+dm1fcGFnZV9w
cm90KSkKLQkJcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLOwotCi0JcmV0ID0gdHRtX2JvX3ZtX3Jl
c2VydmUoYm8sIHZtZik7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKLQotCXByb3QgPSB2bV9n
ZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwotCXJldCA9IHR0bV9ib192bV9mYXVsdF9yZXNl
cnZlZCh2bWYsIHByb3QsIDEsIGZhdWx0X3BhZ2Vfc2l6ZSk7Ci0JaWYgKHJldCA9PSBWTV9GQVVM
VF9SRVRSWSAmJiAhKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVCkpCi0JCXJl
dHVybiByZXQ7Ci0KLQlkbWFfcmVzdl91bmxvY2soYm8tPmJhc2UucmVzdik7Ci0KLQlyZXR1cm4g
cmV0OwotfQotI2VuZGlmCi0KIHZvaWQgdHRtX2JvX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEpCiB7CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJp
dmF0ZV9kYXRhOwpAQCAtNjA0LDkgKzU0NCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3Bl
cmF0aW9uc19zdHJ1Y3QgdHRtX2JvX3ZtX29wcyA9IHsKIAkub3BlbiA9IHR0bV9ib192bV9vcGVu
LAogCS5jbG9zZSA9IHR0bV9ib192bV9jbG9zZSwKIAkuYWNjZXNzID0gdHRtX2JvX3ZtX2FjY2Vz
cywKLSNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKLQkuaHVnZV9mYXVsdCA9IHR0
bV9ib192bV9odWdlX2ZhdWx0LAotI2VuZGlmCiB9OwogCiBzdGF0aWMgc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICp0dG1fYm9fdm1fbG9va3VwKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAot
LSAKMi4yMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
