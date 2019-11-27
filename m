Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408D910B4F7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0997C6E429;
	Wed, 27 Nov 2019 18:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27E46E3F9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:00:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a131so3749473wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BpOgvjxM4sKKd7VkKkuDj6mkq+/hG5T/j3DPRAARKwQ=;
 b=Omtm9RpBGlLbjv7rME7f4vLaDoH9DCyNeLPu8ZVpTL6wTZFytMDILKJPvAILvPiaKr
 ou6/MYAIknRo3p4J/y2HiS+90x0n1yxoqwgZLraOuVKiB9jrliFgBlZeeKa8sgxzzGDF
 NG7qf9uK7GE83H5zT6aWFQ4djckctKX1jKInv3J6mJ1cFBYg06hhBM9VQovIEcIFsHt7
 ZojU2qjZNDzxVhX/z5n9JC740gKt2vzbsQ/y21IXAZqdXq8qlIqYpEN+2/CeLzYfrvrC
 JSLw4cpdErOw30DgFtGANlnjWWIJQTG4YKWdmdasb3z3nPQ2/8ivwIJFMAymnCSVC8lL
 /lTg==
X-Gm-Message-State: APjAAAXfJQh8GB7cYGF9Jh+IebMlpERcturwt427YspI48TjsyHtftl2
 Kzc16zIVoWF318yceMmMefMD+Ioy8ZI=
X-Google-Smtp-Source: APXvYqz46T0HWQ8pzpwreZfkTMdj8kYk6kJTppF1wGbW+JAKUBYuyKdq15Vo2Pkn1m8UGn9tTBM/ZQ==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr5772162wmk.98.1574877642244; 
 Wed, 27 Nov 2019 10:00:42 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m15sm19940165wrq.97.2019.11.27.10.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:00:41 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/rockchip: Use drm_gem_fb_create_with_dirty
Date: Wed, 27 Nov 2019 19:00:33 +0100
Message-Id: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BpOgvjxM4sKKd7VkKkuDj6mkq+/hG5T/j3DPRAARKwQ=;
 b=ik1xcvFH2pBkK2xynTjF/Jfx6VAN9i/CkxI/GQzuSvouOKQr0EGI79/zxOxqLCTS/u
 2b9Si/8Tuchp/hVhJ2HaAUakdjZsxwJqtlZ4mZQ4uE8luoxK4Nw9ixR36+7pVamV9Tou
 H7NWtUKw2WfrBQ4XhAB2MnN4lbiH6W6iZeLks=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgcm9ja2NoaXAgd291bGQgc3dpdGNoIG92ZXIgdG8gdGhlIGdlbmVyaWMgZmJkZXYgc2V0dXAg
d2UgY291bGQKZ3JhYmFnZSBjb2xsZWN0IGV2ZW4gbW9yZSBvZiBhbGwgdGhpcyBjb2RlIChhbGwg
b2YgdGhlIHJlbWFpbmluZyBmYgpoYW5kbGluZyBjb2RlIHJlYWxseSkuCgp2MjogQWN0dWFsbHkg
dXNlIF93aXRoX2RpcnR5IGxpa2UgdGhlIHBhdGNoIHN1YmplY3QgcHJvbWlzZWQgKEFuZHJ6ZWop
CgpDYzogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBT
YW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgpDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVp
a29Ac250ZWNoLmRlPgpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNj
OiBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCi0tLQogZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jIHwgNTQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKaW5kZXggY2EwMTIzNGMwMzdjLi4y
MjFlNzJlNzE0MzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Zi
LmMKQEAgLTUzLDY0ICs1MywxMiBAQCByb2NrY2hpcF9mYl9hbGxvYyhzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbQogCXJldHVybiBm
YjsKIH0KIAotc3RhdGljIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKgotcm9ja2NoaXBfdXNlcl9m
Yl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlX3By
aXYsCi0JCQljb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpCi17Ci0JY29u
c3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbyA9IGRybV9nZXRfZm9ybWF0X2luZm8oZGV2
LAotCQkJCQkJCQkgbW9kZV9jbWQpOwotCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOwotCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jqc1tST0NLQ0hJUF9NQVhfRkJfQlVGRkVSXTsKLQlzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKLQlpbnQgbnVtX3BsYW5lcyA9IG1pbl90KGludCwgaW5m
by0+bnVtX3BsYW5lcywgUk9DS0NISVBfTUFYX0ZCX0JVRkZFUik7Ci0JaW50IHJldDsKLQlpbnQg
aTsKLQotCWZvciAoaSA9IDA7IGkgPCBudW1fcGxhbmVzOyBpKyspIHsKLQkJdW5zaWduZWQgaW50
IHdpZHRoID0gbW9kZV9jbWQtPndpZHRoIC8gKGkgPyBpbmZvLT5oc3ViIDogMSk7Ci0JCXVuc2ln
bmVkIGludCBoZWlnaHQgPSBtb2RlX2NtZC0+aGVpZ2h0IC8gKGkgPyBpbmZvLT52c3ViIDogMSk7
Ci0JCXVuc2lnbmVkIGludCBtaW5fc2l6ZTsKLQotCQlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29r
dXAoZmlsZV9wcml2LCBtb2RlX2NtZC0+aGFuZGxlc1tpXSk7Ci0JCWlmICghb2JqKSB7Ci0JCQlE
Uk1fREVWX0VSUk9SKGRldi0+ZGV2LAotCQkJCSAgICAgICJGYWlsZWQgdG8gbG9va3VwIEdFTSBv
YmplY3RcbiIpOwotCQkJcmV0ID0gLUVOWElPOwotCQkJZ290byBlcnJfZ2VtX29iamVjdF91bnJl
ZmVyZW5jZTsKLQkJfQotCi0JCW1pbl9zaXplID0gKGhlaWdodCAtIDEpICogbW9kZV9jbWQtPnBp
dGNoZXNbaV0gKwotCQkJbW9kZV9jbWQtPm9mZnNldHNbaV0gKwotCQkJd2lkdGggKiBpbmZvLT5j
cHBbaV07Ci0KLQkJaWYgKG9iai0+c2l6ZSA8IG1pbl9zaXplKSB7Ci0JCQlkcm1fZ2VtX29iamVj
dF9wdXRfdW5sb2NrZWQob2JqKTsKLQkJCXJldCA9IC1FSU5WQUw7Ci0JCQlnb3RvIGVycl9nZW1f
b2JqZWN0X3VucmVmZXJlbmNlOwotCQl9Ci0JCW9ianNbaV0gPSBvYmo7Ci0JfQotCi0JZmIgPSBy
b2NrY2hpcF9mYl9hbGxvYyhkZXYsIG1vZGVfY21kLCBvYmpzLCBpKTsKLQlpZiAoSVNfRVJSKGZi
KSkgewotCQlyZXQgPSBQVFJfRVJSKGZiKTsKLQkJZ290byBlcnJfZ2VtX29iamVjdF91bnJlZmVy
ZW5jZTsKLQl9Ci0KLQlyZXR1cm4gZmI7Ci0KLWVycl9nZW1fb2JqZWN0X3VucmVmZXJlbmNlOgot
CWZvciAoaS0tOyBpID49IDA7IGktLSkKLQkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9i
anNbaV0pOwotCXJldHVybiBFUlJfUFRSKHJldCk7Ci19Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5jcyByb2NrY2hpcF9tb2RlX2NvbmZpZ19oZWxwZXJz
ID0gewogCS5hdG9taWNfY29tbWl0X3RhaWwgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFp
bF9ycG0sCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBy
b2NrY2hpcF9kcm1fbW9kZV9jb25maWdfZnVuY3MgPSB7Ci0JLmZiX2NyZWF0ZSA9IHJvY2tjaGlw
X3VzZXJfZmJfY3JlYXRlLAorCS5mYl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2Rp
cnR5LAogCS5vdXRwdXRfcG9sbF9jaGFuZ2VkID0gZHJtX2ZiX2hlbHBlcl9vdXRwdXRfcG9sbF9j
aGFuZ2VkLAogCS5hdG9taWNfY2hlY2sgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjaywKIAkuYXRv
bWljX2NvbW1pdCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCwKLS0gCjIuMjQuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
