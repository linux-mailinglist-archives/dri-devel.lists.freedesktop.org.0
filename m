Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27734A306
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034766E1B5;
	Tue, 18 Jun 2019 13:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFF96E194
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:58:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BA12E3003B36;
 Tue, 18 Jun 2019 13:58:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E69C317B73;
 Tue, 18 Jun 2019 13:58:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4454716E1A; Tue, 18 Jun 2019 15:58:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to gem
 helper.
Date: Tue, 18 Jun 2019 15:58:10 +0200
Message-Id: <20190618135821.8644-3-kraxel@redhat.com>
In-Reply-To: <20190618135821.8644-1-kraxel@redhat.com>
References: <20190618135821.8644-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 18 Jun 2019 13:58:24 +0000 (UTC)
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
aW9jdGwoKS4KVGhpcyBhbHNvIG1ha2VzIHRoZSBpb2N0bCBydW4gbG9ja2xlc3MuCgpTaWduZWQt
b2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCAyNCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCmluZGV4IGFjNjBiZTliNWMxOS4uMzEzYzc3MGVh
MmM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwpAQCAtNDY0LDIzICs0
NjQsMTkgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3dhaXRfaW9jdGwoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJCSAgICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCiB7CiAJ
c3RydWN0IGRybV92aXJ0Z3B1XzNkX3dhaXQgKmFyZ3MgPSBkYXRhOwotCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqZ29iaiA9IE5VTEw7Ci0Jc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpxb2JqID0g
TlVMTDsKKwlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKKwlsb25nIHRpbWVvdXQgPSAxNSAq
IEhaOwogCWludCByZXQ7Ci0JYm9vbCBub3dhaXQgPSBmYWxzZTsKIAotCWdvYmogPSBkcm1fZ2Vt
X29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFuZGxlKTsKLQlpZiAoZ29iaiA9PSBOVUxMKQot
CQlyZXR1cm4gLUVOT0VOVDsKKwlpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlU
KSB7CisJCW9iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBhcmdzLT5oYW5kbGUpOwor
CQlyZXQgPSByZXNlcnZhdGlvbl9vYmplY3RfdGVzdF9zaWduYWxlZF9yY3Uob2JqLT5yZXN2LCB0
cnVlKTsKKwkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7CisJCXJldHVybiByZXQg
PyAwIDogLUVCVVNZOworCX0KIAotCXFvYmogPSBnZW1fdG9fdmlydGlvX2dwdV9vYmooZ29iaik7
Ci0KLQlpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRfTk9XQUlUKQotCQlub3dhaXQgPSB0
cnVlOwotCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3dhaXQocW9iaiwgbm93YWl0KTsKLQotCWRy
bV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnb2JqKTsKLQlyZXR1cm4gcmV0OworCXJldHVybiBk
cm1fZ2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0KGZpbGUsIGFyZ3MtPmhhbmRsZSwKKwkJCQkJ
ICAgICAgIHRydWUsIHRpbWVvdXQpOwogfQogCiBzdGF0aWMgaW50IHZpcnRpb19ncHVfZ2V0X2Nh
cHNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKLS0gCjIuMTguMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
