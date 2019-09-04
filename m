Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D94A7AE5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 07:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A896089A7A;
	Wed,  4 Sep 2019 05:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DD489A1F;
 Wed,  4 Sep 2019 05:47:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2DFB57BDA5;
 Wed,  4 Sep 2019 05:47:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE8795D9C9;
 Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 931AB31ECC; Wed,  4 Sep 2019 07:47:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/qxl: use drm_gem_object_funcs callbacks
Date: Wed,  4 Sep 2019 07:47:38 +0200
Message-Id: <20190904054740.20817-6-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-1-kraxel@redhat.com>
References: <20190904054740.20817-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 04 Sep 2019 05:47:46 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3dpdGNoIHF4bCB0byB1c2UgZHJtX2dlbV9vYmplY3RfZnVuY3MgY2FsbGJhY2tzCmluc3RlYWQg
b2YgZHJtX2RyaXZlciBjYWxsYmFja3MuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jICAgIHwgIDggLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jIHwgMTIgKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kcnYuYwppbmRleCAyYjcyNmE1MWEzMDIuLjk5NmQ0MjhmYTdlNiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfZHJ2LmMKQEAgLTI1OCwxNiArMjU4LDggQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVy
IHF4bF9kcml2ZXIgPSB7CiAjZW5kaWYKIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9w
cmltZV9oYW5kbGVfdG9fZmQsCiAJLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVf
ZmRfdG9faGFuZGxlLAotCS5nZW1fcHJpbWVfcGluID0gcXhsX2dlbV9wcmltZV9waW4sCi0JLmdl
bV9wcmltZV91bnBpbiA9IHF4bF9nZW1fcHJpbWVfdW5waW4sCi0JLmdlbV9wcmltZV9nZXRfc2df
dGFibGUgPSBxeGxfZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX2ltcG9ydF9z
Z190YWJsZSA9IHF4bF9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAotCS5nZW1fcHJpbWVfdm1h
cCA9IHF4bF9nZW1fcHJpbWVfdm1hcCwKLQkuZ2VtX3ByaW1lX3Z1bm1hcCA9IHF4bF9nZW1fcHJp
bWVfdnVubWFwLAogCS5nZW1fcHJpbWVfbW1hcCA9IHF4bF9nZW1fcHJpbWVfbW1hcCwKLQkuZ2Vt
X2ZyZWVfb2JqZWN0X3VubG9ja2VkID0gcXhsX2dlbV9vYmplY3RfZnJlZSwKLQkuZ2VtX29wZW5f
b2JqZWN0ID0gcXhsX2dlbV9vYmplY3Rfb3BlbiwKLQkuZ2VtX2Nsb3NlX29iamVjdCA9IHF4bF9n
ZW1fb2JqZWN0X2Nsb3NlLAogCS5mb3BzID0gJnF4bF9mb3BzLAogCS5pb2N0bHMgPSBxeGxfaW9j
dGxzLAogCS5pcnFfaGFuZGxlciA9IHF4bF9pcnFfaGFuZGxlciwKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2Jq
ZWN0LmMKaW5kZXggNTQ4ZGZlNmYzYjI2Li4yOWFhYjdiMTQ1MTMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X29iamVjdC5jCkBAIC03Nyw2ICs3NywxNyBAQCB2b2lkIHF4bF90dG1fcGxhY2VtZW50X2Zyb21f
ZG9tYWluKHN0cnVjdCBxeGxfYm8gKnFibywgdTMyIGRvbWFpbiwgYm9vbCBwaW5uZWQpCiAJfQog
fQogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIHF4bF9vYmplY3Rf
ZnVuY3MgPSB7CisJLmZyZWUgPSBxeGxfZ2VtX29iamVjdF9mcmVlLAorCS5vcGVuID0gcXhsX2dl
bV9vYmplY3Rfb3BlbiwKKwkuY2xvc2UgPSBxeGxfZ2VtX29iamVjdF9jbG9zZSwKKwkucGluID0g
cXhsX2dlbV9wcmltZV9waW4sCisJLnVucGluID0gcXhsX2dlbV9wcmltZV91bnBpbiwKKwkuZ2V0
X3NnX3RhYmxlID0gcXhsX2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCisJLnZtYXAgPSBxeGxfZ2Vt
X3ByaW1lX3ZtYXAsCisJLnZ1bm1hcCA9IHF4bF9nZW1fcHJpbWVfdnVubWFwLAorfTsKKwogaW50
IHF4bF9ib19jcmVhdGUoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCiAJCSAgdW5zaWduZWQgbG9u
ZyBzaXplLCBib29sIGtlcm5lbCwgYm9vbCBwaW5uZWQsIHUzMiBkb21haW4sCiAJCSAgc3RydWN0
IHF4bF9zdXJmYWNlICpzdXJmLApAQCAtMTAwLDYgKzExMSw3IEBAIGludCBxeGxfYm9fY3JlYXRl
KHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAogCQlrZnJlZShibyk7CiAJCXJldHVybiByOwogCX0K
Kwliby0+dGJvLmJhc2UuZnVuY3MgPSAmcXhsX29iamVjdF9mdW5jczsKIAliby0+dHlwZSA9IGRv
bWFpbjsKIAliby0+cGluX2NvdW50ID0gcGlubmVkID8gMSA6IDA7CiAJYm8tPnN1cmZhY2VfaWQg
PSAwOwotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
