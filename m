Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29000114DDB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 10:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5463F6F976;
	Fri,  6 Dec 2019 09:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B64C6F976
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 08:59:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF431B089;
 Fri,  6 Dec 2019 08:59:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v2 3/7] drm/udl: Vmap framebuffer after all tests succeeded in
 damage handling
Date: Fri,  6 Dec 2019 09:59:50 +0100
Message-Id: <20191206085954.9697-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206085954.9697-1-tzimmermann@suse.de>
References: <20191206085954.9697-1-tzimmermann@suse.de>
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
ZXJtYW5uQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYyAgICAgICB8IDE5ICsrKysrKystLS0t
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX3RyYW5zZmVyLmMgfCAgMSAtCiAyIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X2ZiLmMKaW5kZXggZWQ2ZDk0NzZiMjViLi5kZDdiYTdmNjMyMTQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIu
YwpAQCAtODUsMTIgKzg1LDYgQEAgaW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBkcm1fZnJh
bWVidWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCiAJfQogCXNwaW5fdW5sb2NrKCZ1ZGwtPmFjdGl2
ZV9mYl8xNl9sb2NrKTsKIAotCXZhZGRyID0gZHJtX2dlbV9zaG1lbV92bWFwKGZiLT5vYmpbMF0p
OwotCWlmIChJU19FUlIodmFkZHIpKSB7Ci0JCURSTV9FUlJPUigiZmFpbGVkIHRvIHZtYXAgZmJc
biIpOwotCQlyZXR1cm4gMDsKLQl9Ci0KIAlhbGlnbmVkX3ggPSBETF9BTElHTl9ET1dOKHgsIHNp
emVvZih1bnNpZ25lZCBsb25nKSk7CiAJd2lkdGggPSBETF9BTElHTl9VUCh3aWR0aCArICh4LWFs
aWduZWRfeCksIHNpemVvZih1bnNpZ25lZCBsb25nKSk7CiAJeCA9IGFsaWduZWRfeDsKQEAgLTk4
LDggKzkyLDEzIEBAIGludCB1ZGxfaGFuZGxlX2RhbWFnZShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiwgaW50IHgsIGludCB5LAogCWlmICgod2lkdGggPD0gMCkgfHwKIAkgICAgKHggKyB3aWR0
aCA+IGZiLT53aWR0aCkgfHwKIAkgICAgKHkgKyBoZWlnaHQgPiBmYi0+aGVpZ2h0KSkgewotCQly
ZXQgPSAtRUlOVkFMOwotCQlnb3RvIGVycl9kcm1fZ2VtX3NobWVtX3Z1bm1hcDsKKwkJcmV0dXJu
IC1FSU5WQUw7CisJfQorCisJdmFkZHIgPSBkcm1fZ2VtX3NobWVtX3ZtYXAoZmItPm9ialswXSk7
CisJaWYgKElTX0VSUih2YWRkcikpIHsKKwkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdm1hcCBmYlxu
Iik7CisJCXJldHVybiAwOwogCX0KIAogCXVyYiA9IHVkbF9nZXRfdXJiKGRldik7CkBAIC0xMzEs
MTAgKzEzMCw2IEBAIGludCB1ZGxfaGFuZGxlX2RhbWFnZShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiwgaW50IHgsIGludCB5LAogCWRybV9nZW1fc2htZW1fdnVubWFwKGZiLT5vYmpbMF0sIHZh
ZGRyKTsKIAogCXJldHVybiAwOwotCi1lcnJfZHJtX2dlbV9zaG1lbV92dW5tYXA6Ci0JZHJtX2dl
bV9zaG1lbV92dW5tYXAoZmItPm9ialswXSwgdmFkZHIpOwotCXJldHVybiByZXQ7CiB9CiAKIHN0
YXRpYyBpbnQgdWRsX3VzZXJfZnJhbWVidWZmZXJfZGlydHkoc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF90cmFuc2Zlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfdHJhbnNmZXIuYwppbmRleCA2ODYzNThkMWY2NjkuLjVm
YWU0ODcyMzI4NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfdHJhbnNmZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF90cmFuc2Zlci5jCkBAIC0yNDksNCArMjQ5
LDMgQEAgaW50IHVkbF9yZW5kZXJfaGxpbmUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGxv
Z19icHAsIHN0cnVjdCB1cmIgKip1cmJfcHRyLAogCiAJcmV0dXJuIDA7CiB9Ci0KLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
