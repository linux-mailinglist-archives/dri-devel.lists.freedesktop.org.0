Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3B448053
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 13:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1860891AD;
	Mon, 17 Jun 2019 11:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6BA891AD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 11:14:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B0E6130BB554;
 Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13BAD691A5;
 Mon, 17 Jun 2019 11:14:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1672016E1A; Mon, 17 Jun 2019 13:14:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/virtio: switch virtio_gpu_wait_ioctl() to gem helper.
Date: Mon, 17 Jun 2019 13:14:04 +0200
Message-Id: <20190617111406.14765-3-kraxel@redhat.com>
In-Reply-To: <20190617111406.14765-1-kraxel@redhat.com>
References: <20190617111406.14765-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
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
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQoKSBpbiB2aXJ0aW9fZ3B1X3dhaXRf
aW9jdGwoKS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIHwgMTggKysrKy0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwu
YyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCmluZGV4IGMwYmExZWFk
NzQwZi4uZTM4YTZiYjQ2Y2M3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfaW9jdGwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwu
YwpAQCAtNDY0LDIzICs0NjQsMTMgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3dhaXRfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJCSAgICBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGUpCiB7CiAJc3RydWN0IGRybV92aXJ0Z3B1XzNkX3dhaXQgKmFyZ3MgPSBkYXRhOwot
CXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaiA9IE5VTEw7Ci0Jc3RydWN0IHZpcnRpb19ncHVf
b2JqZWN0ICpxb2JqID0gTlVMTDsKLQlpbnQgcmV0OwotCWJvb2wgbm93YWl0ID0gZmFsc2U7Ci0K
LQlnb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIGFyZ3MtPmhhbmRsZSk7Ci0JaWYg
KGdvYmogPT0gTlVMTCkKLQkJcmV0dXJuIC1FTk9FTlQ7Ci0KLQlxb2JqID0gZ2VtX3RvX3ZpcnRp
b19ncHVfb2JqKGdvYmopOworCWxvbmcgdGltZW91dCA9IDE1ICogSFo7CiAKIAlpZiAoYXJncy0+
ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlUKQotCQlub3dhaXQgPSB0cnVlOwotCXJldCA9IHZp
cnRpb19ncHVfb2JqZWN0X3dhaXQocW9iaiwgbm93YWl0KTsKKwkJdGltZW91dCA9IDA7CiAKLQlk
cm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoZ29iaik7Ci0JcmV0dXJuIHJldDsKKwlyZXR1cm4g
ZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdChmaWxlLCBhcmdzLT5oYW5kbGUsCisJCQkJ
CSAgICAgICB0cnVlLCB0aW1lb3V0KTsKIH0KIAogc3RhdGljIGludCB2aXJ0aW9fZ3B1X2dldF9j
YXBzX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0tIAoyLjE4LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
