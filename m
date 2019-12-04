Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6F112C84
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2214F6E907;
	Wed,  4 Dec 2019 13:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3886F6F467
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:24:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95F5BAC12;
 Wed,  4 Dec 2019 13:24:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH 3/7] drm/udl: Vmap framebuffer after all tests succeeded in
 damage handling
Date: Wed,  4 Dec 2019 14:24:26 +0100
Message-Id: <20191204132430.16874-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204132430.16874-1-tzimmermann@suse.de>
References: <20191204132430.16874-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugbm93IGRvIHRoZSBmYXN0IHRlc3RzIGJlZm9yZSB0aGUgcG90ZW50aWFsbHkgZXhwZW5zaXZl
IHZtYXAgb3BlcmF0aW9uLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYyAgICAgICB8
IDE5ICsrKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX3RyYW5zZmVy
LmMgfCAgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYyBiL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2ZiLmMKaW5kZXggZWQ2ZDk0NzZiMjViLi5kZDdiYTdmNjMyMTQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZmIuYwpAQCAtODUsMTIgKzg1LDYgQEAgaW50IHVkbF9oYW5kbGVfZGFtYWdl
KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCiAJfQogCXNwaW5fdW5s
b2NrKCZ1ZGwtPmFjdGl2ZV9mYl8xNl9sb2NrKTsKIAotCXZhZGRyID0gZHJtX2dlbV9zaG1lbV92
bWFwKGZiLT5vYmpbMF0pOwotCWlmIChJU19FUlIodmFkZHIpKSB7Ci0JCURSTV9FUlJPUigiZmFp
bGVkIHRvIHZtYXAgZmJcbiIpOwotCQlyZXR1cm4gMDsKLQl9Ci0KIAlhbGlnbmVkX3ggPSBETF9B
TElHTl9ET1dOKHgsIHNpemVvZih1bnNpZ25lZCBsb25nKSk7CiAJd2lkdGggPSBETF9BTElHTl9V
UCh3aWR0aCArICh4LWFsaWduZWRfeCksIHNpemVvZih1bnNpZ25lZCBsb25nKSk7CiAJeCA9IGFs
aWduZWRfeDsKQEAgLTk4LDggKzkyLDEzIEBAIGludCB1ZGxfaGFuZGxlX2RhbWFnZShzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyICpmYiwgaW50IHgsIGludCB5LAogCWlmICgod2lkdGggPD0gMCkgfHwK
IAkgICAgKHggKyB3aWR0aCA+IGZiLT53aWR0aCkgfHwKIAkgICAgKHkgKyBoZWlnaHQgPiBmYi0+
aGVpZ2h0KSkgewotCQlyZXQgPSAtRUlOVkFMOwotCQlnb3RvIGVycl9kcm1fZ2VtX3NobWVtX3Z1
bm1hcDsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJdmFkZHIgPSBkcm1fZ2VtX3NobWVtX3Zt
YXAoZmItPm9ialswXSk7CisJaWYgKElTX0VSUih2YWRkcikpIHsKKwkJRFJNX0VSUk9SKCJmYWls
ZWQgdG8gdm1hcCBmYlxuIik7CisJCXJldHVybiAwOwogCX0KIAogCXVyYiA9IHVkbF9nZXRfdXJi
KGRldik7CkBAIC0xMzEsMTAgKzEzMCw2IEBAIGludCB1ZGxfaGFuZGxlX2RhbWFnZShzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyICpmYiwgaW50IHgsIGludCB5LAogCWRybV9nZW1fc2htZW1fdnVubWFw
KGZiLT5vYmpbMF0sIHZhZGRyKTsKIAogCXJldHVybiAwOwotCi1lcnJfZHJtX2dlbV9zaG1lbV92
dW5tYXA6Ci0JZHJtX2dlbV9zaG1lbV92dW5tYXAoZmItPm9ialswXSwgdmFkZHIpOwotCXJldHVy
biByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgdWRsX3VzZXJfZnJhbWVidWZmZXJfZGlydHkoc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF90cmFuc2Zlci5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfdHJhbnNmZXIuYwppbmRleCA2
ODYzNThkMWY2NjkuLjVmYWU0ODcyMzI4NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Vk
bC91ZGxfdHJhbnNmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF90cmFuc2Zlci5j
CkBAIC0yNDksNCArMjQ5LDMgQEAgaW50IHVkbF9yZW5kZXJfaGxpbmUoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgaW50IGxvZ19icHAsIHN0cnVjdCB1cmIgKip1cmJfcHRyLAogCiAJcmV0dXJuIDA7
CiB9Ci0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
