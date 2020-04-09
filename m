Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA531A383A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 18:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42DD6E25A;
	Thu,  9 Apr 2020 16:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666AD6E25A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 8AE093F383;
 Thu,  9 Apr 2020 18:49:40 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=omo5vOm/; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PtOgIRklFem5; Thu,  9 Apr 2020 18:49:39 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id F05013F40C;
 Thu,  9 Apr 2020 18:49:37 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 3FB9D360342;
 Thu,  9 Apr 2020 18:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1586450977; bh=v/X9MzDG5sUUYMo2Wk0FhvB0Z1K5keq+vu28R3KFGWI=;
 h=From:To:Cc:Subject:Date:From;
 b=omo5vOm/pNVWy1wdgwWrU6lf2EvEZlheLD5Eqc4NETbupE2wqTUYgAlepFCDRq8MF
 ALpxdpJp3exir4+OjqzoEPuybMyML/XfALNWLA8ljE1KoIjmomJSPvPrZIllf+VQ7d
 l4WfVfWJD/rHulrlu1SQwWwuNo4cz2A/yk2hoVJA=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: airlied@gmail.com,
	airlied@redhat.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Temporarily disable the huge_fault() callback
Date: Thu,  9 Apr 2020 18:49:25 +0200
Message-Id: <20200409164925.11912-1-thomas_os@shipmail.org>
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
ClRlc3RlZC1ieTogQWxleCBYdSAoSGVsbG83MSkgPGFsZXhfeV94dUB5YWhvby5jYT4KQWNrZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgNjMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3ZtLmMKaW5kZXggNmVlM2I5NmYwZDEzLi4wYWQzMGIxMTI5ODIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdm0uYwpAQCAtNDQyLDY2ICs0NDIsNiBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVs
dChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIH0KIEVYUE9SVF9TWU1CT0wodHRtX2JvX3ZtX2ZhdWx0
KTsKIAotI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQotLyoqCi0gKiB0dG1fcGdw
cm90X2lzX3dycHJvdGVjdGluZyAtIElzIGEgcGFnZSBwcm90ZWN0aW9uIHZhbHVlIHdyaXRlLXBy
b3RlY3Rpbmc/Ci0gKiBAcHJvdDogVGhlIHBhZ2UgcHJvdGVjdGlvbiB2YWx1ZQotICoKLSAqIFJl
dHVybjogdHJ1ZSBpZiBAcHJvdCBpcyB3cml0ZS1wcm90ZWN0aW5nLiBmYWxzZSBvdGhlcndpc2Uu
Ci0gKi8KLXN0YXRpYyBib29sIHR0bV9wZ3Byb3RfaXNfd3Jwcm90ZWN0aW5nKHBncHJvdF90IHBy
b3QpCi17Ci0JLyoKLQkgKiBUaGlzIGlzIG1lYW50IHRvIHNheSAicGdwcm90X3dycHJvdGVjdChw
cm90KSA9PSBwcm90IiBpbiBhIGdlbmVyaWMKLQkgKiB3YXkuIFVuZm9ydHVuYXRlbHkgdGhlcmUg
aXMgbm8gZ2VuZXJpYyBwZ3Byb3Rfd3Jwcm90ZWN0LgotCSAqLwotCXJldHVybiBwdGVfdmFsKHB0
ZV93cnByb3RlY3QoX19wdGUocGdwcm90X3ZhbChwcm90KSkpKSA9PQotCQlwZ3Byb3RfdmFsKHBy
b3QpOwotfQotCi1zdGF0aWMgdm1fZmF1bHRfdCB0dG1fYm9fdm1faHVnZV9mYXVsdChzdHJ1Y3Qg
dm1fZmF1bHQgKnZtZiwKLQkJCQkgICAgICAgZW51bSBwYWdlX2VudHJ5X3NpemUgcGVfc2l6ZSkK
LXsKLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwotCXBncHJvdF90IHBy
b3Q7Ci0Jc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRh
OwotCXZtX2ZhdWx0X3QgcmV0OwotCXBnb2ZmX3QgZmF1bHRfcGFnZV9zaXplID0gMDsKLQlib29s
IHdyaXRlID0gdm1mLT5mbGFncyAmIEZBVUxUX0ZMQUdfV1JJVEU7Ci0KLQlzd2l0Y2ggKHBlX3Np
emUpIHsKLQljYXNlIFBFX1NJWkVfUE1EOgotCQlmYXVsdF9wYWdlX3NpemUgPSBIUEFHRV9QTURf
U0laRSA+PiBQQUdFX1NISUZUOwotCQlicmVhazsKLSNpZmRlZiBDT05GSUdfSEFWRV9BUkNIX1RS
QU5TUEFSRU5UX0hVR0VQQUdFX1BVRAotCWNhc2UgUEVfU0laRV9QVUQ6Ci0JCWZhdWx0X3BhZ2Vf
c2l6ZSA9IEhQQUdFX1BVRF9TSVpFID4+IFBBR0VfU0hJRlQ7Ci0JCWJyZWFrOwotI2VuZGlmCi0J
ZGVmYXVsdDoKLQkJV0FSTl9PTl9PTkNFKDEpOwotCQlyZXR1cm4gVk1fRkFVTFRfRkFMTEJBQ0s7
Ci0JfQotCi0JLyogRmFsbGJhY2sgb24gd3JpdGUgZGlydHktdHJhY2tpbmcgb3IgQ09XICovCi0J
aWYgKHdyaXRlICYmIHR0bV9wZ3Byb3RfaXNfd3Jwcm90ZWN0aW5nKHZtYS0+dm1fcGFnZV9wcm90
KSkKLQkJcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLOwotCi0JcmV0ID0gdHRtX2JvX3ZtX3Jlc2Vy
dmUoYm8sIHZtZik7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKLQotCXByb3QgPSB2bV9nZXRf
cGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwotCXJldCA9IHR0bV9ib192bV9mYXVsdF9yZXNlcnZl
ZCh2bWYsIHByb3QsIDEsIGZhdWx0X3BhZ2Vfc2l6ZSk7Ci0JaWYgKHJldCA9PSBWTV9GQVVMVF9S
RVRSWSAmJiAhKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVCkpCi0JCXJldHVy
biByZXQ7Ci0KLQlkbWFfcmVzdl91bmxvY2soYm8tPmJhc2UucmVzdik7Ci0KLQlyZXR1cm4gcmV0
OwotfQotI2VuZGlmCi0KIHZvaWQgdHRtX2JvX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCiB7CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0
ZV9kYXRhOwpAQCAtNjA0LDkgKzU0NCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0
aW9uc19zdHJ1Y3QgdHRtX2JvX3ZtX29wcyA9IHsKIAkub3BlbiA9IHR0bV9ib192bV9vcGVuLAog
CS5jbG9zZSA9IHR0bV9ib192bV9jbG9zZSwKIAkuYWNjZXNzID0gdHRtX2JvX3ZtX2FjY2VzcywK
LSNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKLQkuaHVnZV9mYXVsdCA9IHR0bV9i
b192bV9odWdlX2ZhdWx0LAotI2VuZGlmCiB9OwogCiBzdGF0aWMgc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICp0dG1fYm9fdm1fbG9va3VwKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAotLSAK
Mi4yMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
