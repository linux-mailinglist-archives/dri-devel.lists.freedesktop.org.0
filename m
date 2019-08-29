Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF16A1628
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3516E0C8;
	Thu, 29 Aug 2019 10:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B326E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C510B7FDEE;
 Thu, 29 Aug 2019 10:33:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9A6E5C1D6;
 Thu, 29 Aug 2019 10:33:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B33A31E84; Thu, 29 Aug 2019 12:33:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 02/18] drm/virtio: switch virtio_gpu_wait_ioctl() to gem
 helper.
Date: Thu, 29 Aug 2019 12:32:45 +0200
Message-Id: <20190829103301.3539-3-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 29 Aug 2019 10:33:07 +0000 (UTC)
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRybV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQoKSBpbiB2aXJ0aW9fZ3B1X3dhaXRf
aW9jdGwoKS4KVGhpcyBhbHNvIG1ha2VzIHRoZSBpb2N0bCBydW4gbG9ja2xlc3MuCgp2OTogZml4
IHJldHVybiB2YWx1ZS4KdjU6IGhhbmRsZSBsb29rdXAgZmFpbHVyZS4KdjI6IHVzZSByZXNlcnZh
dGlvbl9vYmplY3RfdGVzdF9zaWduYWxlZF9yY3UgZm9yIFZJUlRHUFVfV0FJVF9OT1dBSVQuCgpT
aWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KUmV2aWV3ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCAyOCArKysrKysrKysrKysrKystLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKaW5kZXggMGE4OGVmMTFiOWQzLi5h
NjYyMzk0ZjY4OTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9p
b2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCkBAIC00
NjMsMjUgKzQ2MywyOSBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfdHJhbnNmZXJfdG9faG9zdF9p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogfQogCiBzdGF0aWMgaW50
IHZpcnRpb19ncHVfd2FpdF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRh
LAotCQkJICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKKwkJCQkgc3RydWN0IGRybV9maWxlICpm
aWxlKQogewogCXN0cnVjdCBkcm1fdmlydGdwdV8zZF93YWl0ICphcmdzID0gZGF0YTsKLQlzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmogPSBOVUxMOwotCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVj
dCAqcW9iaiA9IE5VTEw7CisJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7CisJbG9uZyB0aW1l
b3V0ID0gMTUgKiBIWjsKIAlpbnQgcmV0OwotCWJvb2wgbm93YWl0ID0gZmFsc2U7CiAKLQlnb2Jq
ID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIGFyZ3MtPmhhbmRsZSk7Ci0JaWYgKGdvYmog
PT0gTlVMTCkKKwlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFuZGxl
KTsKKwlpZiAob2JqID09IE5VTEwpCiAJCXJldHVybiAtRU5PRU5UOwogCi0JcW9iaiA9IGdlbV90
b192aXJ0aW9fZ3B1X29iaihnb2JqKTsKKwlpZiAoYXJncy0+ZmxhZ3MgJiBWSVJUR1BVX1dBSVRf
Tk9XQUlUKSB7CisJCXJldCA9IGRtYV9yZXN2X3Rlc3Rfc2lnbmFsZWRfcmN1KG9iai0+cmVzdiwg
dHJ1ZSk7CisJfSBlbHNlIHsKKwkJcmV0ID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdShvYmot
PnJlc3YsIHRydWUsIHRydWUsCisJCQkJCQl0aW1lb3V0KTsKKwl9CisJaWYgKHJldCA9PSAwKQor
CQlyZXQgPSAtRUJVU1k7CisJZWxzZSBpZiAocmV0ID4gMCkKKwkJcmV0ID0gMDsKIAotCWlmIChh
cmdzLT5mbGFncyAmIFZJUlRHUFVfV0FJVF9OT1dBSVQpCi0JCW5vd2FpdCA9IHRydWU7Ci0JcmV0
ID0gdmlydGlvX2dwdV9vYmplY3Rfd2FpdChxb2JqLCBub3dhaXQpOwotCi0JZHJtX2dlbV9vYmpl
Y3RfcHV0X3VubG9ja2VkKGdvYmopOworCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChvYmop
OwogCXJldHVybiByZXQ7CiB9CiAKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
