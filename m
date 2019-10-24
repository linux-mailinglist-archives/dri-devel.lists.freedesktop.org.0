Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FDE35C3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DA66E428;
	Thu, 24 Oct 2019 14:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7B76E42B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:42:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED7A8B92E;
 Thu, 24 Oct 2019 14:42:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 3/5] drm/udl: Add GEM object functions for free(), vmap(),
 and vunmap()
Date: Thu, 24 Oct 2019 16:42:35 +0200
Message-Id: <20191024144237.8898-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024144237.8898-1-tzimmermann@suse.de>
References: <20191024144237.8898-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW1wbGVtZW50aW5nIHZtYXAoKSBhbmQgdnVubWFwKCkgb2Ygc3RydWN0IGRybV9nZW1fb2JqZWN0
X2Z1bmNzIGlzCnJlcXVpcmVkIGJ5IGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uLiBTdXBwb3J0aW5n
IGZyZWUoKSBpcyBlYXN5IGFzCndlbGwuIE1vcmUgdWRsLXNwZWNpZmljIGludGVyZmFjZXMgY2Fu
IHByb2JhYmx5IGJlIHJlcGxhY2VkIGJ5IEdFTQpvYmplY3QgZnVuY3Rpb25zIGluIGxhdGVyIHBh
dGNoZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyB8IDM0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9nZW0uYwppbmRleCAzZWEwY2Q5YWUyZDYuLjZjYTA5N2MyNzBkNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZ2VtLmMKQEAgLTExLDYgKzExLDggQEAKIAogI2luY2x1ZGUgInVkbF9kcnYu
aCIKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyB1ZGxfZ2VtX29i
amVjdF9mdW5jczsKKwogc3RydWN0IHVkbF9nZW1fb2JqZWN0ICp1ZGxfZ2VtX2FsbG9jX29iamVj
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCQkgICAgc2l6ZV90IHNpemUpCiB7CkBAIC0y
NSw2ICsyNyw3IEBAIHN0cnVjdCB1ZGxfZ2VtX29iamVjdCAqdWRsX2dlbV9hbGxvY19vYmplY3Qo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJcmV0dXJuIE5VTEw7CiAJfQogCisJb2JqLT5iYXNl
LmZ1bmNzID0gJnVkbF9nZW1fb2JqZWN0X2Z1bmNzOwogCW9iai0+ZmxhZ3MgPSBVRExfQk9fQ0FD
SEVBQkxFOwogCXJldHVybiBvYmo7CiB9CkBAIC0yMzAsMyArMjMzLDM0IEBAIGludCB1ZGxfZ2Vt
X21tYXAoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCW11
dGV4X3VubG9jaygmdWRsLT5nZW1fbG9jayk7CiAJcmV0dXJuIHJldDsKIH0KKworLyoKKyAqIEhl
bHBlcnMgZm9yIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcworICovCisKK3N0YXRpYyB2b2lk
IHVkbF9nZW1fb2JqZWN0X2ZyZWUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCit7CisJdWRs
X2dlbV9mcmVlX29iamVjdChvYmopOworfQorCitzdGF0aWMgdm9pZCAqdWRsX2dlbV9vYmplY3Rf
dm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKK3sKKwlzdHJ1Y3QgdWRsX2dlbV9vYmpl
Y3QgKnVvYmogPSB0b191ZGxfYm8ob2JqKTsKKwlpbnQgcmV0OworCisJcmV0ID0gdWRsX2dlbV92
bWFwKHVvYmopOworCWlmIChyZXQpCisJCXJldHVybiBFUlJfUFRSKHJldCk7CisJcmV0dXJuIHVv
YmotPnZtYXBwaW5nOworfQorCitzdGF0aWMgdm9pZCB1ZGxfZ2VtX29iamVjdF92dW5tYXAoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKQoreworCXJldHVybiB1ZGxfZ2Vt
X3Z1bm1hcCh0b191ZGxfYm8ob2JqKSk7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dl
bV9vYmplY3RfZnVuY3MgdWRsX2dlbV9vYmplY3RfZnVuY3MgPSB7CisJLmZyZWUJPSB1ZGxfZ2Vt
X29iamVjdF9mcmVlLAorCS52bWFwCT0gdWRsX2dlbV9vYmplY3Rfdm1hcCwKKwkudnVubWFwCT0g
dWRsX2dlbV9vYmplY3RfdnVubWFwLAorfTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
