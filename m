Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27AC85E9D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 11:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0F76E7E3;
	Thu,  8 Aug 2019 09:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7CF6E7B2;
 Thu,  8 Aug 2019 09:37:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 29E0E3064FD3;
 Thu,  8 Aug 2019 09:37:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D660B5C231;
 Thu,  8 Aug 2019 09:37:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E6F6F9D2B; Thu,  8 Aug 2019 11:37:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 8/8] gem/qxl: use drm_gem_ttm_bo_driver_verify_access()
Date: Thu,  8 Aug 2019 11:37:02 +0200
Message-Id: <20190808093702.29512-9-kraxel@redhat.com>
In-Reply-To: <20190808093702.29512-1-kraxel@redhat.com>
References: <20190808093702.29512-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 08 Aug 2019 09:37:07 +0000 (UTC)
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgfCAxMCArLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3F4bC9xeGxfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYwppbmRl
eCAzYTI0MTQ1ZGQ1MTYuLmJjZjQ4YjA2MmE4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3F4bC9xeGxfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKQEAgLTE1
MSwxNCArMTUxLDYgQEAgc3RhdGljIHZvaWQgcXhsX2V2aWN0X2ZsYWdzKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCiAJKnBsYWNlbWVudCA9IHFiby0+cGxhY2VtZW50OwogfQogCi1zdGF0
aWMgaW50IHF4bF92ZXJpZnlfYWNjZXNzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0
cnVjdCBmaWxlICpmaWxwKQotewotCXN0cnVjdCBxeGxfYm8gKnFibyA9IHRvX3F4bF9ibyhibyk7
Ci0KLQlyZXR1cm4gZHJtX3ZtYV9ub2RlX3ZlcmlmeV9hY2Nlc3MoJnFiby0+dGJvLmJhc2Uudm1h
X25vZGUsCi0JCQkJCSAgZmlscC0+cHJpdmF0ZV9kYXRhKTsKLX0KLQogc3RhdGljIGludCBxeGxf
dHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCQkJCSAgc3Ry
dWN0IHR0bV9tZW1fcmVnICptZW0pCiB7CkBAIC0zMTAsNyArMzAyLDcgQEAgc3RhdGljIHN0cnVj
dCB0dG1fYm9fZHJpdmVyIHF4bF9ib19kcml2ZXIgPSB7CiAJLmV2aWN0aW9uX3ZhbHVhYmxlID0g
dHRtX2JvX2V2aWN0aW9uX3ZhbHVhYmxlLAogCS5ldmljdF9mbGFncyA9ICZxeGxfZXZpY3RfZmxh
Z3MsCiAJLm1vdmUgPSAmcXhsX2JvX21vdmUsCi0JLnZlcmlmeV9hY2Nlc3MgPSAmcXhsX3Zlcmlm
eV9hY2Nlc3MsCisJLnZlcmlmeV9hY2Nlc3MgPSBkcm1fZ2VtX3R0bV9ib19kcml2ZXJfdmVyaWZ5
X2FjY2VzcywKIAkuaW9fbWVtX3Jlc2VydmUgPSAmcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZSwKIAku
aW9fbWVtX2ZyZWUgPSAmcXhsX3R0bV9pb19tZW1fZnJlZSwKIAkubW92ZV9ub3RpZnkgPSAmcXhs
X2JvX21vdmVfbm90aWZ5LAotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
