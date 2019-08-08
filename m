Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA08E86380
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E9D6E857;
	Thu,  8 Aug 2019 13:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E26E856;
 Thu,  8 Aug 2019 13:44:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0FD713007F2A;
 Thu,  8 Aug 2019 13:44:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9386608AB;
 Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9AAA19CAA; Thu,  8 Aug 2019 15:44:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 13/17] drm/qxl: use drm_gem_object_funcs
Date: Thu,  8 Aug 2019 15:44:13 +0200
Message-Id: <20190808134417.10610-14-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 08 Aug 2019 13:44:25 +0000 (UTC)
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
dmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMgICAgfCAgOCAtLS0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL3F4bC9xeGxfb2JqZWN0LmMgfCAxMiArKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCmluZGV4
IDEyY2Y4NWEwNmJlZC4uMzg0Njc0NzhjN2IyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwpAQCAtMjU3
LDE2ICsyNTcsOCBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgcXhsX2RyaXZlciA9IHsKICNl
bmRpZgogCS5wcmltZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwK
IAkucHJpbWVfZmRfdG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdl
bV9wcmltZV9waW4gPSBxeGxfZ2VtX3ByaW1lX3BpbiwKLQkuZ2VtX3ByaW1lX3VucGluID0gcXhs
X2dlbV9wcmltZV91bnBpbiwKLQkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IHF4bF9nZW1fcHJp
bWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gcXhsX2dlbV9w
cmltZV9pbXBvcnRfc2dfdGFibGUsCi0JLmdlbV9wcmltZV92bWFwID0gcXhsX2dlbV9wcmltZV92
bWFwLAotCS5nZW1fcHJpbWVfdnVubWFwID0gcXhsX2dlbV9wcmltZV92dW5tYXAsCiAJLmdlbV9w
cmltZV9tbWFwID0gcXhsX2dlbV9wcmltZV9tbWFwLAotCS5nZW1fZnJlZV9vYmplY3RfdW5sb2Nr
ZWQgPSBxeGxfZ2VtX29iamVjdF9mcmVlLAotCS5nZW1fb3Blbl9vYmplY3QgPSBxeGxfZ2VtX29i
amVjdF9vcGVuLAotCS5nZW1fY2xvc2Vfb2JqZWN0ID0gcXhsX2dlbV9vYmplY3RfY2xvc2UsCiAJ
LmZvcHMgPSAmcXhsX2ZvcHMsCiAJLmlvY3RscyA9IHF4bF9pb2N0bHMsCiAJLmlycV9oYW5kbGVy
ID0gcXhsX2lycV9oYW5kbGVyLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
b2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYwppbmRleCA1NDhkZmU2
ZjNiMjYuLjI5YWFiN2IxNDUxMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
b2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKQEAgLTc3LDYg
Kzc3LDE3IEBAIHZvaWQgcXhsX3R0bV9wbGFjZW1lbnRfZnJvbV9kb21haW4oc3RydWN0IHF4bF9i
byAqcWJvLCB1MzIgZG9tYWluLCBib29sIHBpbm5lZCkKIAl9CiB9CiAKK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgcXhsX29iamVjdF9mdW5jcyA9IHsKKwkuZnJlZSA9
IHF4bF9nZW1fb2JqZWN0X2ZyZWUsCisJLm9wZW4gPSBxeGxfZ2VtX29iamVjdF9vcGVuLAorCS5j
bG9zZSA9IHF4bF9nZW1fb2JqZWN0X2Nsb3NlLAorCS5waW4gPSBxeGxfZ2VtX3ByaW1lX3BpbiwK
KwkudW5waW4gPSBxeGxfZ2VtX3ByaW1lX3VucGluLAorCS5nZXRfc2dfdGFibGUgPSBxeGxfZ2Vt
X3ByaW1lX2dldF9zZ190YWJsZSwKKwkudm1hcCA9IHF4bF9nZW1fcHJpbWVfdm1hcCwKKwkudnVu
bWFwID0gcXhsX2dlbV9wcmltZV92dW5tYXAsCit9OworCiBpbnQgcXhsX2JvX2NyZWF0ZShzdHJ1
Y3QgcXhsX2RldmljZSAqcWRldiwKIAkJICB1bnNpZ25lZCBsb25nIHNpemUsIGJvb2wga2VybmVs
LCBib29sIHBpbm5lZCwgdTMyIGRvbWFpbiwKIAkJICBzdHJ1Y3QgcXhsX3N1cmZhY2UgKnN1cmYs
CkBAIC0xMDAsNiArMTExLDcgQEAgaW50IHF4bF9ib19jcmVhdGUoc3RydWN0IHF4bF9kZXZpY2Ug
KnFkZXYsCiAJCWtmcmVlKGJvKTsKIAkJcmV0dXJuIHI7CiAJfQorCWJvLT50Ym8uYmFzZS5mdW5j
cyA9ICZxeGxfb2JqZWN0X2Z1bmNzOwogCWJvLT50eXBlID0gZG9tYWluOwogCWJvLT5waW5fY291
bnQgPSBwaW5uZWQgPyAxIDogMDsKIAliby0+c3VyZmFjZV9pZCA9IDA7Ci0tIAoyLjE4LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
