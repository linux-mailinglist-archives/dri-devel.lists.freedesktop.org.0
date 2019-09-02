Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C989A5669
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F9E899F0;
	Mon,  2 Sep 2019 12:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4349C899DC;
 Mon,  2 Sep 2019 12:41:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D240289AC9;
 Mon,  2 Sep 2019 12:41:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-67.ams2.redhat.com
 [10.36.117.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15FB25D9CC;
 Mon,  2 Sep 2019 12:41:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5951C31ECC; Mon,  2 Sep 2019 14:41:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/qxl: use drm_gem_object_funcs callbacks
Date: Mon,  2 Sep 2019 14:41:25 +0200
Message-Id: <20190902124126.7700-5-kraxel@redhat.com>
In-Reply-To: <20190902124126.7700-1-kraxel@redhat.com>
References: <20190902124126.7700-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 02 Sep 2019 12:41:30 +0000 (UTC)
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
cmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyAgICB8
ICA4IC0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYyB8IDEyICsrKysr
KysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL3F4bC9xeGxfZHJ2LmMKaW5kZXggMmI3MjZhNTFhMzAyLi45OTZkNDI4ZmE3ZTYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX2Rydi5jCkBAIC0yNTgsMTYgKzI1OCw4IEBAIHN0YXRpYyBzdHJ1Y3QgZHJt
X2RyaXZlciBxeGxfZHJpdmVyID0gewogI2VuZGlmCiAJLnByaW1lX2hhbmRsZV90b19mZCA9IGRy
bV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAogCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2Vt
X3ByaW1lX2ZkX3RvX2hhbmRsZSwKLQkuZ2VtX3ByaW1lX3BpbiA9IHF4bF9nZW1fcHJpbWVfcGlu
LAotCS5nZW1fcHJpbWVfdW5waW4gPSBxeGxfZ2VtX3ByaW1lX3VucGluLAotCS5nZW1fcHJpbWVf
Z2V0X3NnX3RhYmxlID0gcXhsX2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV9p
bXBvcnRfc2dfdGFibGUgPSBxeGxfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSwKLQkuZ2VtX3By
aW1lX3ZtYXAgPSBxeGxfZ2VtX3ByaW1lX3ZtYXAsCi0JLmdlbV9wcmltZV92dW5tYXAgPSBxeGxf
Z2VtX3ByaW1lX3Z1bm1hcCwKIAkuZ2VtX3ByaW1lX21tYXAgPSBxeGxfZ2VtX3ByaW1lX21tYXAs
Ci0JLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZCA9IHF4bF9nZW1fb2JqZWN0X2ZyZWUsCi0JLmdl
bV9vcGVuX29iamVjdCA9IHF4bF9nZW1fb2JqZWN0X29wZW4sCi0JLmdlbV9jbG9zZV9vYmplY3Qg
PSBxeGxfZ2VtX29iamVjdF9jbG9zZSwKIAkuZm9wcyA9ICZxeGxfZm9wcywKIAkuaW9jdGxzID0g
cXhsX2lvY3RscywKIAkuaXJxX2hhbmRsZXIgPSBxeGxfaXJxX2hhbmRsZXIsCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX29iamVjdC5jCmluZGV4IDU0OGRmZTZmM2IyNi4uMjlhYWI3YjE0NTEzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9vYmplY3QuYwpAQCAtNzcsNiArNzcsMTcgQEAgdm9pZCBxeGxfdHRtX3BsYWNlbWVu
dF9mcm9tX2RvbWFpbihzdHJ1Y3QgcXhsX2JvICpxYm8sIHUzMiBkb21haW4sIGJvb2wgcGlubmVk
KQogCX0KIH0KIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBxeGxf
b2JqZWN0X2Z1bmNzID0geworCS5mcmVlID0gcXhsX2dlbV9vYmplY3RfZnJlZSwKKwkub3BlbiA9
IHF4bF9nZW1fb2JqZWN0X29wZW4sCisJLmNsb3NlID0gcXhsX2dlbV9vYmplY3RfY2xvc2UsCisJ
LnBpbiA9IHF4bF9nZW1fcHJpbWVfcGluLAorCS51bnBpbiA9IHF4bF9nZW1fcHJpbWVfdW5waW4s
CisJLmdldF9zZ190YWJsZSA9IHF4bF9nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlLAorCS52bWFwID0g
cXhsX2dlbV9wcmltZV92bWFwLAorCS52dW5tYXAgPSBxeGxfZ2VtX3ByaW1lX3Z1bm1hcCwKK307
CisKIGludCBxeGxfYm9fY3JlYXRlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAogCQkgIHVuc2ln
bmVkIGxvbmcgc2l6ZSwgYm9vbCBrZXJuZWwsIGJvb2wgcGlubmVkLCB1MzIgZG9tYWluLAogCQkg
IHN0cnVjdCBxeGxfc3VyZmFjZSAqc3VyZiwKQEAgLTEwMCw2ICsxMTEsNyBAQCBpbnQgcXhsX2Jv
X2NyZWF0ZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKIAkJa2ZyZWUoYm8pOwogCQlyZXR1cm4g
cjsKIAl9CisJYm8tPnRiby5iYXNlLmZ1bmNzID0gJnF4bF9vYmplY3RfZnVuY3M7CiAJYm8tPnR5
cGUgPSBkb21haW47CiAJYm8tPnBpbl9jb3VudCA9IHBpbm5lZCA/IDEgOiAwOwogCWJvLT5zdXJm
YWNlX2lkID0gMDsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
