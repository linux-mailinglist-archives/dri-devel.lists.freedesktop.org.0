Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC12D5B9
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 08:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118D889E23;
	Wed, 29 May 2019 06:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C9C89E23
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 06:51:26 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EEF232610F4;
 Wed, 29 May 2019 07:51:24 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH] drm/gem_shmem: Use a writecombine mapping for ->vaddr
Date: Wed, 29 May 2019 08:51:21 +0200
Message-Id: <20190529065121.13485-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmlnaHQgbm93LCB0aGUgQk8gaXMgbWFwcGVkIGFzIGEgY2FjaGVkIHJlZ2lvbiB3aGVuIC0+dm1h
cCgpIGlzIGNhbGxlZAphbmQgdGhlIHVuZGVybHlpbmcgb2JqZWN0IGlzIG5vdCBhIGRtYWJ1Zi4K
RG9pbmcgdGhhdCBtYWtlcyBjYWNoZSBtYW5hZ2VtZW50IGEgYml0IG1vcmUgY29tcGxpY2F0ZWQg
KHlvdSdkIG5lZWQKdG8gY2FsbCBkbWFfbWFwL3VubWFwX3NnKCkgb24gdGhlIC0+c2d0IGZpZWxk
IGV2ZXJ5dGltZSB0aGUgQk8gaXMgYWJvdXQKdG8gYmUgcGFzc2VkIHRvIHRoZSBHUFUvQ1BVKSwg
c28gbGV0J3MgbWFwIHRoZSBCTyB3aXRoIHdyaXRlY29tYmluZQphdHRyaWJ1dGVzIGluc3RlYWQg
KGFzIGRvbmUgaW4gbW9zdCBkcml2ZXJzKS4KClNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Ci0tLQpGb3VuZCB0aGlzIGlzc3VlIHdo
aWxlIHdvcmtpbmcgb24gcGFuZnJvc3QgcGVyZmNudCB3aGVyZSB0aGUgR1BVIGR1bXBzCnBlcmYg
Y291bnRlciB2YWx1ZXMgaW4gbWVtb3J5IGFuZCB0aGUgQ1BVIHJlYWRzIHRoZW0gYmFjayBpbgpr
ZXJuZWwtc3BhY2UuIFRoaXMgcGF0Y2ggc2VlbXMgdG8gc29sdmUgdGhlIHVucHJlZGljdGFibGUg
YmVoYXZpb3IgSQpoYWQuCgpJIGNhbiBhbHNvIGdvIGZvciB0aGUgb3RoZXIgb3B0aW9uIChjYWxs
IGRtYV9tYXAvdW5tYXAvX3NnKCkgd2hlbgpuZWVkZWQpIGlmIHlvdSB0aGluayB0aGF0J3MgbW9y
ZSBhcHByb3ByaWF0ZS4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIu
YyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwppbmRleCAxZWUyMDhjMmM4NWUu
LjQ3MmVhNWQ4MWY4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1f
aGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKQEAg
LTI1NSw3ICsyNTUsOCBAQCBzdGF0aWMgdm9pZCAqZHJtX2dlbV9zaG1lbV92bWFwX2xvY2tlZChz
dHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtKQogCWlmIChvYmotPmltcG9ydF9hdHRh
Y2gpCiAJCXNobWVtLT52YWRkciA9IGRtYV9idWZfdm1hcChvYmotPmltcG9ydF9hdHRhY2gtPmRt
YWJ1Zik7CiAJZWxzZQotCQlzaG1lbS0+dmFkZHIgPSB2bWFwKHNobWVtLT5wYWdlcywgb2JqLT5z
aXplID4+IFBBR0VfU0hJRlQsIFZNX01BUCwgUEFHRV9LRVJORUwpOworCQlzaG1lbS0+dmFkZHIg
PSB2bWFwKHNobWVtLT5wYWdlcywgb2JqLT5zaXplID4+IFBBR0VfU0hJRlQsCisJCQkJICAgIFZN
X01BUCwgcGdwcm90X3dyaXRlY29tYmluZShQQUdFX0tFUk5FTCkpOwogCiAJaWYgKCFzaG1lbS0+
dmFkZHIpIHsKIAkJRFJNX0RFQlVHX0tNUygiRmFpbGVkIHRvIHZtYXAgcGFnZXNcbiIpOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
