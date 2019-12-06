Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92146115098
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 13:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5F36F9F8;
	Fri,  6 Dec 2019 12:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772AB6F9F4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 12:47:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05E7FB3F1;
 Fri,  6 Dec 2019 12:47:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v2 3/9] drm/udl: Switch to atomic suspend/resume helpers
Date: Fri,  6 Dec 2019 13:47:07 +0100
Message-Id: <20191206124713.5748-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206124713.5748-1-tzimmermann@suse.de>
References: <20191206124713.5748-1-tzimmermann@suse.de>
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

V2UgY2FuIHVzZSB0aGUgZ2VuZXJpYyBzdXNwZW5kL3Jlc3VtZSBoZWxwZXJzIGZvciBhdG9taWMg
bW9kZXNldHRpbmcuClN3aXRjaCB1ZGwgb3Zlci4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X2Rydi5jICAgICB8ICA3ICsrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oICAg
ICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyB8IDE0IC0tLS0tLS0t
LS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9kcnYuYwppbmRleCBhZWI5NjkyMDc1N2MuLmIzZmE2YmY0MWFjYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZHJ2LmMKQEAgLTIxLDE3ICsyMSwxNCBAQCBzdGF0aWMgaW50IHVkbF91c2Jf
c3VzcGVuZChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlLAogewogCXN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSB1c2JfZ2V0X2ludGZkYXRhKGludGVyZmFjZSk7CiAKLQlkcm1fa21zX2hl
bHBlcl9wb2xsX2Rpc2FibGUoZGV2KTsKLQlyZXR1cm4gMDsKKwlyZXR1cm4gZHJtX21vZGVfY29u
ZmlnX2hlbHBlcl9zdXNwZW5kKGRldik7CiB9CiAKIHN0YXRpYyBpbnQgdWRsX3VzYl9yZXN1bWUo
c3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSkKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2ID0gdXNiX2dldF9pbnRmZGF0YShpbnRlcmZhY2UpOwogCi0JZHJtX2ttc19oZWxwZXJfcG9s
bF9lbmFibGUoZGV2KTsKLQl1ZGxfbW9kZXNldF9yZXN0b3JlKGRldik7Ci0JcmV0dXJuIDA7CisJ
cmV0dXJuIGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfcmVzdW1lKGRldik7CiB9CiAKIERFRklORV9E
Uk1fR0VNX0ZPUFModWRsX2RyaXZlcl9mb3BzKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgKaW5kZXggMmVj
NTdmMzhhZWMwLi5iNDU1ZGJkZmUwY2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oCkBAIC03Myw3ICs3
Myw2IEBAIHN0cnVjdCB1ZGxfZGV2aWNlIHsKIAogLyogbW9kZXNldCAqLwogaW50IHVkbF9tb2Rl
c2V0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldik7Ci12b2lkIHVkbF9tb2Rlc2V0X3Jlc3Rv
cmUoc3RydWN0IGRybV9kZXZpY2UgKmRldik7CiB2b2lkIHVkbF9tb2Rlc2V0X2NsZWFudXAoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldik7CiBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqdWRsX2Nvbm5lY3Rv
cl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0
LmMKaW5kZXggM2U3NDY2NDgyZWYwLi43Mjg4NGNiZGExMzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9t
b2Rlc2V0LmMKQEAgLTQ0MCwyMCArNDQwLDYgQEAgaW50IHVkbF9tb2Rlc2V0X2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKIAlyZXR1cm4gcmV0OwogfQogCi12b2lkIHVkbF9tb2Rlc2V0X3Jl
c3RvcmUoc3RydWN0IGRybV9kZXZpY2UgKmRldikKLXsKLQlzdHJ1Y3QgdWRsX2RldmljZSAqdWRs
ID0gZGV2LT5kZXZfcHJpdmF0ZTsKLQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmdWRsLT5kaXNw
bGF5X3BpcGUuY3J0YzsKLQlzdHJ1Y3QgZHJtX3BsYW5lICpwcmltYXJ5ID0gJnVkbC0+ZGlzcGxh
eV9waXBlLnBsYW5lOwotCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gcHJpbWFyeS0+ZmI7
Ci0KLQlpZiAoIWZiKQotCQlyZXR1cm47Ci0KLQl1ZGxfY3J0Y19kcG1zKGNydGMsIERSTV9NT0RF
X0RQTVNfT04pOwotCXVkbF9oYW5kbGVfZGFtYWdlKGZiLCAwLCAwLCBmYi0+d2lkdGgsIGZiLT5o
ZWlnaHQpOwotfQotCiB2b2lkIHVkbF9tb2Rlc2V0X2NsZWFudXAoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKIHsKIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkZXYpOwotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
