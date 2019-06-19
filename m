Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888BF4B487
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4156E32B;
	Wed, 19 Jun 2019 09:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70206E31A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:04:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 87151811DE;
 Wed, 19 Jun 2019 09:04:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-86.ams2.redhat.com
 [10.36.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB6F15D969;
 Wed, 19 Jun 2019 09:04:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 983E717473; Wed, 19 Jun 2019 11:04:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/12] drm/virtio: drop no_wait argument from
 virtio_gpu_object_reserve
Date: Wed, 19 Jun 2019 11:04:14 +0200
Message-Id: <20190619090420.6667-7-kraxel@redhat.com>
In-Reply-To: <20190619090420.6667-1-kraxel@redhat.com>
References: <20190619090420.6667-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 19 Jun 2019 09:04:25 +0000 (UTC)
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

QWxsIGNhbGxlcnMgcGFzcyBub193YWl0ID0gZmFsc2UuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZHJ2LmggICB8IDUgKystLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9n
ZW0uYyAgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyB8
IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCmluZGV4IDJjZDk2MjU2YmEzNy4uMDZj
YzBlOTYxZGY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCkBAIC0zOTgsMTIg
KzM5OCwxMSBAQCBzdGF0aWMgaW5saW5lIHU2NCB2aXJ0aW9fZ3B1X29iamVjdF9tbWFwX29mZnNl
dChzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKQogCXJldHVybiBkcm1fdm1hX25vZGVfb2Zm
c2V0X2FkZHIoJmJvLT50Ym8udm1hX25vZGUpOwogfQogCi1zdGF0aWMgaW5saW5lIGludCB2aXJ0
aW9fZ3B1X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8sCi0JCQkJ
CSBib29sIG5vX3dhaXQpCitzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1X29iamVjdF9yZXNl
cnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCiB7CiAJaW50IHI7CiAKLQlyID0gdHRt
X2JvX3Jlc2VydmUoJmJvLT50Ym8sIHRydWUsIG5vX3dhaXQsIE5VTEwpOworCXIgPSB0dG1fYm9f
cmVzZXJ2ZSgmYm8tPnRibywgdHJ1ZSwgZmFsc2UsIE5VTEwpOwogCWlmICh1bmxpa2VseShyICE9
IDApKSB7CiAJCWlmIChyICE9IC1FUkVTVEFSVFNZUykgewogCQkJc3RydWN0IHZpcnRpb19ncHVf
ZGV2aWNlICpxZGV2ID0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYwppbmRleCAxZTQ5
ZTA4ZGQ1NDUuLjljOWFkM2IxNDA4MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0u
YwpAQCAtMTQwLDcgKzE0MCw3IEBAIGludCB2aXJ0aW9fZ3B1X2dlbV9vYmplY3Rfb3BlbihzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKIAlpZiAoIXZnZGV2LT5oYXNfdmlyZ2xfM2QpCiAJCXJl
dHVybiAwOwogCi0JciA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaiwgZmFsc2UpOwor
CXIgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmopOwogCWlmIChyKQogCQlyZXR1cm4g
cjsKIApAQCAtMTYxLDcgKzE2MSw3IEBAIHZvaWQgdmlydGlvX2dwdV9nZW1fb2JqZWN0X2Nsb3Nl
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAogCWlmICghdmdkZXYtPmhhc192aXJnbF8zZCkK
IAkJcmV0dXJuOwogCi0JciA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaiwgZmFsc2Up
OworCXIgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmopOwogCWlmIChyKQogCQlyZXR1
cm47CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5j
IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKaW5kZXggMzEzYzc3MGVh
MmM1Li41Y2ZmZDJlNTRjMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5j
CkBAIC0zNzUsNyArMzc1LDcgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3RyYW5zZmVyX2Zyb21f
aG9zdF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJcW9iaiA9IGdlbV90b192aXJ0
aW9fZ3B1X29iaihnb2JqKTsKIAotCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9i
aiwgZmFsc2UpOworCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaik7CiAJaWYg
KHJldCkKIAkJZ290byBvdXQ7CiAKQEAgLTQyNSw3ICs0MjUsNyBAQCBzdGF0aWMgaW50IHZpcnRp
b19ncHVfdHJhbnNmZXJfdG9faG9zdF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpkYXRhLAogCiAJcW9iaiA9IGdlbV90b192aXJ0aW9fZ3B1X29iaihnb2JqKTsKIAotCXJldCA9
IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaiwgZmFsc2UpOworCXJldCA9IHZpcnRpb19n
cHVfb2JqZWN0X3Jlc2VydmUocW9iaik7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAKLS0gCjIu
MTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
