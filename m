Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF328636C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1643C6E853;
	Thu,  8 Aug 2019 13:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E384D6E84A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:44:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7B01E30EE12B;
 Thu,  8 Aug 2019 13:44:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2720D10016E9;
 Thu,  8 Aug 2019 13:44:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 276F19D20; Thu,  8 Aug 2019 15:44:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/17] drm: add mmap() to drm_gem_object_funcs
Date: Thu,  8 Aug 2019 15:44:05 +0200
Message-Id: <20190808134417.10610-6-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 08 Aug 2019 13:44:23 +0000 (UTC)
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

ZHJtX2dlbV9vYmplY3RfZnVuY3MtPnZtX29wcyBhbG9uZSBjYW4ndCBoYW5kbGUKZXZlcnl0aGlu
ZyBtbWFwKCkgbmVlZHMuICBBZGQgYSBuZXcgY2FsbGJhY2sgZm9yIGl0LgoKU2lnbmVkLW9mZi1i
eTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJt
X2dlbS5oICAgICB8IDkgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIHwgNiAr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaAppbmRleCBhZTY5M2Mw
NjY2Y2QuLmVlM2M0YWQ3NDJjNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCisr
KyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaApAQCAtMTUwLDYgKzE1MCwxNSBAQCBzdHJ1Y3QgZHJt
X2dlbV9vYmplY3RfZnVuY3MgewogCSAqLwogCXZvaWQgKCp2dW5tYXApKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqLCB2b2lkICp2YWRkcik7CiAKKwkvKioKKwkgKiBAbW1hcDoKKwkgKgorCSAq
IENhbGxlZCBieSBkcm1fZ2VtX21tYXAoKSBmb3IgYWRkaXRpb25hbCBjaGVja3Mvc2V0dXAuCisJ
ICoKKwkgKiBUaGlzIGNhbGxiYWNrIGlzIG9wdGlvbmFsLgorCSAqLworCWludCAoKm1tYXApKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7CisK
IAkvKioKIAkgKiBAdm1fb3BzOgogCSAqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwppbmRleCBhZmMzOGNlY2UzZjUuLjg0
ZGI4ZGUyMTdlMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCkBAIC0xMTA1LDYgKzExMDUsOCBAQCBpbnQgZHJtX2dl
bV9tbWFwX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdW5zaWduZWQgbG9uZyBvYmpf
c2l6ZSwKIAkJdm1hLT52bV9vcHMgPSBvYmotPmZ1bmNzLT52bV9vcHM7CiAJZWxzZSBpZiAoZGV2
LT5kcml2ZXItPmdlbV92bV9vcHMpCiAJCXZtYS0+dm1fb3BzID0gZGV2LT5kcml2ZXItPmdlbV92
bV9vcHM7CisJZWxzZSBpZiAob2JqLT5mdW5jcyAmJiBvYmotPmZ1bmNzLT5tbWFwKQorCQkvKiBv
YmotPmZ1bmNzLT5tbWFwIG11c3Qgc2V0IHZtYS0+dm1fb3BzICovOwogCWVsc2UKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKQEAgLTExOTIsNiArMTE5NCwxMCBAQCBpbnQgZHJtX2dlbV9tbWFwKHN0cnVj
dCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAlyZXQgPSBkcm1fZ2Vt
X21tYXBfb2JqKG9iaiwgZHJtX3ZtYV9ub2RlX3NpemUobm9kZSkgPDwgUEFHRV9TSElGVCwKIAkJ
CSAgICAgICB2bWEpOwogCisJaWYgKHJldCA9PSAwKQorCQlpZiAob2JqLT5mdW5jcy0+bW1hcCkK
KwkJCXJldCA9IG9iai0+ZnVuY3MtPm1tYXAob2JqLCB2bWEpOworCiAJZHJtX2dlbV9vYmplY3Rf
cHV0X3VubG9ja2VkKG9iaik7CiAKIAlyZXR1cm4gcmV0OwotLSAKMi4xOC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
