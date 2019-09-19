Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B01B7700
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 12:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4416FB5E;
	Thu, 19 Sep 2019 10:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C846FAD9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 04799307D871;
 Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 304AD60C5E;
 Thu, 19 Sep 2019 10:02:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBAC79CA9; Thu, 19 Sep 2019 12:02:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/11] drm/ttm: add drm_gem_ttm_mmap()
Date: Thu, 19 Sep 2019 12:02:20 +0200
Message-Id: <20190919100223.13309-9-kraxel@redhat.com>
In-Reply-To: <20190919100223.13309-1-kraxel@redhat.com>
References: <20190919100223.13309-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 19 Sep 2019 10:02:31 +0000 (UTC)
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGhlbHBlciBmdW5jdGlvbiB0byBtbWFwIHR0bSBibydzIHVzaW5nICZkcm1fZ2VtX29iamVj
dF9mdW5jcy5tbWFwKCkuCgpOb3RlIHRoYXQgd2l0aCB0aGlzIGNvZGUgcGF0aCBhY2Nlc3MgdmVy
aWZpY2F0aW9uIGlzIGRvbmUgYnkKZHJtX2dlbV9tbWFwKCkgKHdoaWNoIGNhbGxzIGRybV92bWFf
bm9kZV9pc19hbGxvd2VkKCgpKS4KVGhlICZ0dG1fYm9fZHJpdmVyLnZlcmlmeV9hY2Nlc3MoKSBj
YWxsYmFjayBpcyBpcyBub3QgdXNlZC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oICAg
ICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgfCAxNyArKysr
KysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
Z2VtX3R0bV9oZWxwZXIuaAppbmRleCA2MjY4Zjg5YzVhNDguLjExOGNlZjc2Zjg0ZiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0v
ZHJtX2dlbV90dG1faGVscGVyLmgKQEAgLTE1LDUgKzE1LDcgQEAKIAogdm9pZCBkcm1fZ2VtX3R0
bV9wcmludF9pbmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVudCwK
IAkJCSAgICBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSk7CitpbnQgZHJtX2dlbV90
dG1fbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSwKKwkJICAgICBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSk7CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fdHRtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5j
CmluZGV4IDlhNGJhZmNmMjBkZi4uOTkwY2QyODZkMWJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
dHRtX2hlbHBlci5jCkBAIC01Miw1ICs1MiwyMiBAQCB2b2lkIGRybV9nZW1fdHRtX3ByaW50X2lu
Zm8oc3RydWN0IGRybV9wcmludGVyICpwLCB1bnNpZ25lZCBpbnQgaW5kZW50LAogfQogRVhQT1JU
X1NZTUJPTChkcm1fZ2VtX3R0bV9wcmludF9pbmZvKTsKIAorLyoqCisgKiBkcm1fZ2VtX3R0bV9t
bWFwKCkgLSBtbWFwICZ0dG1fYnVmZmVyX29iamVjdAorICogQGdlbTogR0VNIG9iamVjdC4KKyAq
IEB2bWE6IHZtIGFyZWEuCisgKgorICogVGhpcyBmdW5jdGlvbiBjYW4gYmUgdXNlZCBhcyAmZHJt
X2dlbV9vYmplY3RfZnVuY3MubW1hcAorICogY2FsbGJhY2suCisgKi8KK2ludCBkcm1fZ2VtX3R0
bV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtLAorCQkgICAgIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKQoreworCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBkcm1fZ2Vt
X3R0bV9vZl9nZW0oZ2VtKTsKKworCXJldHVybiB0dG1fYm9fbW1hcF9vYmoodm1hLCBibyk7Cit9
CitFWFBPUlRfU1lNQk9MKGRybV9nZW1fdHRtX21tYXApOworCiBNT0RVTEVfREVTQ1JJUFRJT04o
IkRSTSBnZW0gdHRtIGhlbHBlcnMiKTsKIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKLS0gCjIuMTgu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
