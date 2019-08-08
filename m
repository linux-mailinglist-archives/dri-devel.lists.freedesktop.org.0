Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736EE85EA3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 11:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7C36E802;
	Thu,  8 Aug 2019 09:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206B06E7B2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 09:37:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B145E316D798;
 Thu,  8 Aug 2019 09:37:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 647B560BE1;
 Thu,  8 Aug 2019 09:37:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE46F9D21; Thu,  8 Aug 2019 11:37:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/8] drm/ttm: add drm_gem_ttm_bo_driver_verify_access()
Date: Thu,  8 Aug 2019 11:37:00 +0200
Message-Id: <20190808093702.29512-7-kraxel@redhat.com>
In-Reply-To: <20190808093702.29512-1-kraxel@redhat.com>
References: <20190808093702.29512-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 08 Aug 2019 09:37:07 +0000 (UTC)
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
bHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmggICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3R0bV9oZWxwZXIuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bV9nZW1fdHRtX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmgKaW5k
ZXggNDNjOWRiMzU4M2NjLi43OGU0ZDg5MzBmZWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9nZW1fdHRtX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5o
CkBAIC0yNiw1ICsyNiw3IEBAIGludCBkcm1fZ2VtX3R0bV9ib19kZXZpY2VfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAogCQkJICAgICAgIHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAog
CQkJICAgICAgIHN0cnVjdCB0dG1fYm9fZHJpdmVyICpkcml2ZXIsCiAJCQkgICAgICAgYm9vbCBu
ZWVkX2RtYTMyKTsKK2ludCBkcm1fZ2VtX3R0bV9ib19kcml2ZXJfdmVyaWZ5X2FjY2VzcyhzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAorCQkJCQlzdHJ1Y3QgZmlsZSAqZmlscCk7CiAKICNl
bmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jCmluZGV4IDBjNTdlOWZkNTBiOS4u
MTU5NzY4YzdlYzYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVs
cGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jCkBAIC0zNCwz
ICszNCwyNSBAQCBpbnQgZHJtX2dlbV90dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKIAkJCQkJCSAgIG5lZWRfZG1hMzIpOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2Vt
X3R0bV9ib19kZXZpY2VfaW5pdCk7CisKKy8qKgorICogZHJtX2dlbV90dG1fYm9fZHJpdmVyX3Zl
cmlmeV9hY2Nlc3MoKSAtIFwKKwlJbXBsZW1lbnRzICZzdHJ1Y3QgdHRtX2JvX2RyaXZlci52ZXJp
ZnlfYWNjZXNzCisgKiBAYm86CQlUVE0gYnVmZmVyIG9iamVjdC4KKyAqIEBmaWxwOglGaWxlIHBv
aW50ZXIuCisgKgorICogVGhpcyBmdW5jdGlvbiBhc3N1bWVzIGZpbHAtPnByaXZhdGVfZGF0YSBy
ZWZlcnMgdG8gdGhlCisgKiBjb3JyZXNwb25kaW5nICZzdHJ1Y3QgZHJtX2ZpbGUuCisgKgorICog
UmV0dXJuczoKKyAqIDAgb24gc3VjY2Vzcywgb3IKKyAqIGEgbmVnYXRpdmUgZXJybm8gY29kZSBv
dGhlcndpc2UuCisgKi8KK2ludCBkcm1fZ2VtX3R0bV9ib19kcml2ZXJfdmVyaWZ5X2FjY2Vzcyhz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAorCQkJCQlzdHJ1Y3QgZmlsZSAqZmlscCkKK3sK
KwlzdHJ1Y3QgZHJtX2ZpbGUgKnB0ciA9IGZpbHAtPnByaXZhdGVfZGF0YTsKKworCXJldHVybiBk
cm1fdm1hX25vZGVfdmVyaWZ5X2FjY2VzcygmYm8tPmJhc2Uudm1hX25vZGUsIHB0cik7Cit9CitF
WFBPUlRfU1lNQk9MKGRybV9nZW1fdHRtX2JvX2RyaXZlcl92ZXJpZnlfYWNjZXNzKTsKLS0gCjIu
MTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
