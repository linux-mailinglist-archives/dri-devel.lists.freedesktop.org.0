Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5B85E9F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 11:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF906E7E2;
	Thu,  8 Aug 2019 09:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73C06E7E2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 09:37:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D91930C75BF;
 Thu,  8 Aug 2019 09:37:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 143DD5C541;
 Thu,  8 Aug 2019 09:37:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF0C39D22; Thu,  8 Aug 2019 11:37:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/8] gem/vram: use drm_gem_ttm_bo_driver_verify_access()
Date: Thu,  8 Aug 2019 11:37:01 +0200
Message-Id: <20190808093702.29512-8-kraxel@redhat.com>
In-Reply-To: <20190808093702.29512-1-kraxel@redhat.com>
References: <20190808093702.29512-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 08 Aug 2019 09:37:07 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5j
bHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICB8ICAzIC0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8IDIyICstLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuaAppbmRleCA3MDFkMmM0NmE0ZjQuLjc3MjNhZDU5YTBjNSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9nZW1fdnJhbV9oZWxwZXIuaApAQCAtOTgsOSArOTgsNiBAQCBpbnQgZHJtX2dlbV92cmFt
X2ZpbGxfY3JlYXRlX2R1bWIoc3RydWN0IGRybV9maWxlICpmaWxlLAogdm9pZCBkcm1fZ2VtX3Zy
YW1fYm9fZHJpdmVyX2V2aWN0X2ZsYWdzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJ
CQkJCXN0cnVjdCB0dG1fcGxhY2VtZW50ICpwbCk7CiAKLWludCBkcm1fZ2VtX3ZyYW1fYm9fZHJp
dmVyX3ZlcmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKLQkJCQkJIHN0
cnVjdCBmaWxlICpmaWxwKTsKLQogZXh0ZXJuIGNvbnN0IHN0cnVjdCBkcm1fdnJhbV9tbV9mdW5j
cyBkcm1fZ2VtX3ZyYW1fbW1fZnVuY3M7CiAKIC8qCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYwppbmRleCBiNzg4NjUwNTU5OTAuLjAyZDljZjAyNzJiYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5jCkBAIC00MTUsMjYgKzQxNSw2IEBAIHZvaWQgZHJtX2dlbV92
cmFtX2JvX2RyaXZlcl9ldmljdF9mbGFncyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAog
fQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX2V2aWN0X2ZsYWdzKTsKIAot
LyoqCi0gKiBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX3ZlcmlmeV9hY2Nlc3MoKSAtIFwKLQlJbXBs
ZW1lbnRzICZzdHJ1Y3QgdHRtX2JvX2RyaXZlci52ZXJpZnlfYWNjZXNzCi0gKiBAYm86CQlUVE0g
YnVmZmVyIG9iamVjdC4gUmVmZXJzIHRvICZzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdC5ibwot
ICogQGZpbHA6CUZpbGUgcG9pbnRlci4KLSAqCi0gKiBSZXR1cm5zOgotICogMCBvbiBzdWNjZXNz
LCBvcgotICogYSBuZWdhdGl2ZSBlcnJubyBjb2RlIG90aGVyd2lzZS4KLSAqLwotaW50IGRybV9n
ZW1fdnJhbV9ib19kcml2ZXJfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAotCQkJCQkgc3RydWN0IGZpbGUgKmZpbHApCi17Ci0Jc3RydWN0IGRybV9nZW1fdnJhbV9v
YmplY3QgKmdibyA9IGRybV9nZW1fdnJhbV9vZl9ibyhibyk7Ci0KLQlyZXR1cm4gZHJtX3ZtYV9u
b2RlX3ZlcmlmeV9hY2Nlc3MoJmdiby0+Ym8uYmFzZS52bWFfbm9kZSwKLQkJCQkJICBmaWxwLT5w
cml2YXRlX2RhdGEpOwotfQotRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX3Zl
cmlmeV9hY2Nlc3MpOwotCiAvKgogICogZHJtX2dlbV92cmFtX21tX2Z1bmNzIC0gRnVuY3Rpb25z
IGZvciAmc3RydWN0IGRybV92cmFtX21tCiAgKgpAQCAtNDQ0LDcgKzQyNCw3IEBAIEVYUE9SVF9T
WU1CT0woZHJtX2dlbV92cmFtX2JvX2RyaXZlcl92ZXJpZnlfYWNjZXNzKTsKICAqLwogY29uc3Qg
c3RydWN0IGRybV92cmFtX21tX2Z1bmNzIGRybV9nZW1fdnJhbV9tbV9mdW5jcyA9IHsKIAkuZXZp
Y3RfZmxhZ3MgPSBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX2V2aWN0X2ZsYWdzLAotCS52ZXJpZnlf
YWNjZXNzID0gZHJtX2dlbV92cmFtX2JvX2RyaXZlcl92ZXJpZnlfYWNjZXNzCisJLnZlcmlmeV9h
Y2Nlc3MgPSBkcm1fZ2VtX3R0bV9ib19kcml2ZXJfdmVyaWZ5X2FjY2VzcwogfTsKIEVYUE9SVF9T
WU1CT0woZHJtX2dlbV92cmFtX21tX2Z1bmNzKTsKIAotLSAKMi4xOC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
