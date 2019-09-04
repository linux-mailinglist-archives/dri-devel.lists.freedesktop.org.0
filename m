Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE93A7AE0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 07:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D348989A34;
	Wed,  4 Sep 2019 05:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF8789A14
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DF4EE81DE3;
 Wed,  4 Sep 2019 05:47:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12B5660610;
 Wed,  4 Sep 2019 05:47:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3FFA831EBC; Wed,  4 Sep 2019 07:47:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/vram: use drm_gem_ttm_print_info
Date: Wed,  4 Sep 2019 07:47:36 +0200
Message-Id: <20190904054740.20817-4-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-1-kraxel@redhat.com>
References: <20190904054740.20817-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 04 Sep 2019 05:47:44 +0000 (UTC)
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
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkFja2VkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KUmV2aWV3ZWQtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8IDQgKysrLQogZHJpdmVycy9ncHUvZHJtL0tjb25maWcg
ICAgICAgICAgICAgICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwppbmRleCBmZDc1
MTA3OGJhZTEuLjcxNTUyZjc1N2I0YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5jCkBAIC0xLDUgKzEsNiBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b3ItbGF0ZXIKIAorI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+
CiAjaW5jbHVkZSA8ZHJtL2RybV9tb2RlLmg+CkBAIC02MzMsNSArNjM0LDYgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNz
ID0gewogCS5waW4JPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3BpbiwKIAkudW5waW4JPSBkcm1fZ2Vt
X3ZyYW1fb2JqZWN0X3VucGluLAogCS52bWFwCT0gZHJtX2dlbV92cmFtX29iamVjdF92bWFwLAot
CS52dW5tYXAJPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3Z1bm1hcAorCS52dW5tYXAJPSBkcm1fZ2Vt
X3ZyYW1fb2JqZWN0X3Z1bm1hcCwKKwkucHJpbnRfaW5mbyA9IGRybV9nZW1fdHRtX3ByaW50X2lu
Zm8sCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZwppbmRleCBmN2IyNTUxOWY5NWMuLjFiZThhZDMwZDhmZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcK
QEAgLTE2OSw2ICsxNjksNyBAQCBjb25maWcgRFJNX1ZSQU1fSEVMUEVSCiAJdHJpc3RhdGUKIAlk
ZXBlbmRzIG9uIERSTQogCXNlbGVjdCBEUk1fVFRNCisJc2VsZWN0IERSTV9UVE1fSEVMUEVSCiAJ
aGVscAogCSAgSGVscGVycyBmb3IgVlJBTSBtZW1vcnkgbWFuYWdlbWVudAogCi0tIAoyLjE4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
