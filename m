Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B1F2932
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43AA6EEF8;
	Thu,  7 Nov 2019 08:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FED6EEEF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 113FEAF62;
 Thu,  7 Nov 2019 08:34:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 2/9] drm/ast: Check video-mode requirements against VRAM
 size
Date: Thu,  7 Nov 2019 09:33:57 +0100
Message-Id: <20191107083404.6852-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107083404.6852-1-tzimmermann@suse.de>
References: <20191107083404.6852-1-tzimmermann@suse.de>
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

RWFjaCB2aWRlbyBtb2RlJ3MgcHJpbWFyeSBwbGFuZSByZXF1aXJlcyBhIG1pbmltdW0gYW1vdW50
IG9mIHZpZGVvCm1lbW9yeS4gRm9yIGRvdWJsZSBidWZmZXJpbmcsIHRoaXMgaXMgYXQgbW9zdCBo
YWxmIHRoZSBhdmFpbGFibGUKVlJBTS4gQ2hlY2sgdGhpcyBjb25zdHJhaW50LgoKU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkFja2VkLWJ5OiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tYWluLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwpp
bmRleCAzYTliNGNiNzNmMmYuLjQ4ZDU3YWI0Mjk1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwpA
QCAtMzg3LDggKzM4NywzMSBAQCBzdGF0aWMgaW50IGFzdF9nZXRfZHJhbV9pbmZvKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK2VudW0gZHJtX21vZGVfc3RhdHVzIGFz
dF9tb2RlX2NvbmZpZ19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJCQkJCQlj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKK3sKKwlzdGF0aWMgY29uc3QgdW5z
aWduZWQgbG9uZyBtYXhfYnBwID0gNDsgLyogRFJNX0ZPUk1BVF9YUkdCQTg4ODggKi8KKworCXN0
cnVjdCBhc3RfcHJpdmF0ZSAqYXN0ID0gZGV2LT5kZXZfcHJpdmF0ZTsKKwl1bnNpZ25lZCBsb25n
IGZic2l6ZSwgZmJwYWdlcywgbWF4X2ZicGFnZXM7CisKKwkvKiBUbyBzdXBwb3J0IGRvdWJsZSBi
dWZmZXJpbmcsIGEgZnJhbWVidWZmZXIgbWF5IG5vdAorCSAqIGNvbnN1bWUgbW9yZSB0aGFuIGhh
bGYgb2YgdGhlIGF2YWlsYWJsZSBWUkFNLgorCSAqLworCW1heF9mYnBhZ2VzID0gKGFzdC0+dnJh
bV9zaXplIC8gMikgPj4gUEFHRV9TSElGVDsKKworCWZic2l6ZSA9IG1vZGUtPmhkaXNwbGF5ICog
bW9kZS0+dmRpc3BsYXkgKiBtYXhfYnBwOworCWZicGFnZXMgPSBESVZfUk9VTkRfVVAoZmJzaXpl
LCBQQUdFX1NJWkUpOworCisJaWYgKGZicGFnZXMgPiBtYXhfZmJwYWdlcykKKwkJcmV0dXJuIE1P
REVfTUVNOworCisJcmV0dXJuIE1PREVfT0s7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X21vZGVfY29uZmlnX2Z1bmNzIGFzdF9tb2RlX2Z1bmNzID0gewotCS5mYl9jcmVhdGUgPSBkcm1f
Z2VtX2ZiX2NyZWF0ZQorCS5mYl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZSwKKwkubW9kZV92
YWxpZCA9IGFzdF9tb2RlX2NvbmZpZ19tb2RlX3ZhbGlkLAogfTsKIAogc3RhdGljIHUzMiBhc3Rf
Z2V0X3ZyYW1faW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
