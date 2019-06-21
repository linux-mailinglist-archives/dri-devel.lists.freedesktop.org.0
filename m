Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4A4E78B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05606E88E;
	Fri, 21 Jun 2019 11:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093EF6E894
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:58:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8EEC259465;
 Fri, 21 Jun 2019 11:58:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE3555D9D2;
 Fri, 21 Jun 2019 11:58:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 298C8A1E8; Fri, 21 Jun 2019 13:57:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/18] drm/vram: drop drm_gem_vram_driver_gem_prime_mmap
Date: Fri, 21 Jun 2019 13:57:46 +0200
Message-Id: <20190621115755.8481-10-kraxel@redhat.com>
In-Reply-To: <20190621115755.8481-1-kraxel@redhat.com>
References: <20190621115755.8481-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 21 Jun 2019 11:58:03 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, ckoenig.leichtzumerken@gmail.com,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHdyYXBwZXIgZG9lc24ndCBkbyBhbnl0aGluZyBhbnkgbW9yZSwgZHJvcCBpdC4KClNpZ25l
ZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUv
ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgfCAgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuaAppbmRleCA3YjlmNTBiYTNmY2UuLjJhZGE2NzFhMmE2YiAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuaApAQCAtMTM3LDggKzEzNyw2IEBAIHZvaWQgZHJtX2dlbV92cmFtX2RyaXZl
cl9nZW1fcHJpbWVfdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwogdm9pZCAqZHJt
X2dlbV92cmFtX2RyaXZlcl9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9i
aik7CiB2b2lkIGRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiwKIAkJCQkJICB2b2lkICp2YWRkcik7Ci1pbnQgZHJtX2dlbV92cmFt
X2RyaXZlcl9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKLQkJCQkg
ICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwogCiAjZGVmaW5lIERSTV9HRU1fVlJB
TV9EUklWRVJfUFJJTUUgXAogCS5nZW1fcHJpbWVfZXhwb3J0ID0gZHJtX2dlbV9wcmltZV9leHBv
cnQsIFwKQEAgLTE0Nyw2ICsxNDUsNiBAQCBpbnQgZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fcHJp
bWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKIAkuZ2VtX3ByaW1lX3VucGluICA9
IGRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX3ByaW1lX3VucGluLCBcCiAJLmdlbV9wcmltZV92bWFw
CSAgPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV92bWFwLCBcCiAJLmdlbV9wcmltZV92
dW5tYXAgPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV92dW5tYXAsIFwKLQkuZ2VtX3By
aW1lX21tYXAJICA9IGRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX3ByaW1lX21tYXAKKwkuZ2VtX3By
aW1lX21tYXAJICA9IGRybV9nZW1fcHJpbWVfbW1hcAogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jCmluZGV4IDJlNDc0ZGVlMzBkZi4uZDc4NzYxODAyMzc0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTYxOSwyMCArNjE5LDMgQEAgdm9p
ZCBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV92dW5tYXAoc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpnZW0sCiAJZHJtX2dlbV92cmFtX3VucGluKGdibyk7CiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9nZW1fdnJhbV9kcml2ZXJfZ2VtX3ByaW1lX3Z1bm1hcCk7Ci0KLS8qKgotICogZHJtX2dlbV92
cmFtX2RyaXZlcl9nZW1fcHJpbWVfbW1hcCgpIC0gXAotCUltcGxlbWVudHMgJnN0cnVjdCBkcm1f
ZHJpdmVyLmdlbV9wcmltZV9tbWFwCi0gKiBAZ2VtOglUaGUgR0VNIG9iamVjdCB0byBtYXAKLSAq
IEB2bWE6CVRoZSBWTUEgZGVzY3JpYmluZyB0aGUgbWFwcGluZwotICoKLSAqIFJldHVybnM6Ci0g
KiAwIG9uIHN1Y2Nlc3MsIG9yCi0gKiBhIG5lZ2F0aXZlIGVycm5vIGNvZGUgb3RoZXJ3aXNlLgot
ICovCi1pbnQgZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKmdlbSwKLQkJCQkgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCi17
Ci0JcmV0dXJuIGRybV9nZW1fcHJpbWVfbW1hcChnZW0sIHZtYSk7Ci19Ci1FWFBPUlRfU1lNQk9M
KGRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX3ByaW1lX21tYXApOwotLSAKMi4xOC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
