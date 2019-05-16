Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E17214EC
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6413898C2;
	Fri, 17 May 2019 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B76489613
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:15:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24D751715;
 Thu, 16 May 2019 07:15:08 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F9ED3F71E;
 Thu, 16 May 2019 07:15:05 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 3/3] drm/panfrost: Use drm_gem_shmem_map_offset()
Date: Thu, 16 May 2019 15:14:47 +0100
Message-Id: <20190516141447.46839-4-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516141447.46839-1-steven.price@arm.com>
References: <20190516141447.46839-1-steven.price@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
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
Cc: David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Sean Paul <sean@poorly.run>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGFuZnJvc3RfaW9jdGxfbW1hcF9ibygpIGNvbnRhaW5zIGEgcmVpbXBsZW1lbnRhdGlvbiBvZgpk
cm1fZ2VtX3NobWVtX21hcF9vZmZzZXQoKSBidXQgd2l0aCBhIGJ1ZyAtIGl0IGFsbG93cyBtYXBw
aW5nIGltcG9ydGVkCm9iamVjdHMgKHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUgZXhwb3J0ZXIp
LiBGaXggdGhpcyBieSBzd2l0Y2hpbmcgdG8KdXNlIHRoZSBuZXcgZHJtX2dlbV9zaG1lbV9tYXBf
b2Zmc2V0KCkgZnVuY3Rpb24gaW5zdGVhZCB3aGljaCBoYXMKdGhlIGJvbnVzIG9mIHNpbXBsaWZ5
aW5nIHRoZSBjb2RlLgoKQ0M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2FAcm9zZW56d2VpZy5p
bz4KU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAxNiArKy0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKaW5kZXggOTRiMDgxOWFkNTBi
Li5hMjYxYjU5MjA4ZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMK
QEAgLTI1NCwyNiArMjU0LDE0IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9jdGxfbW1hcF9ibyhz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQkgICAgICBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGVfcHJpdikKIHsKIAlzdHJ1Y3QgZHJtX3BhbmZyb3N0X21tYXBfYm8gKmFyZ3MgPSBk
YXRhOwotCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtX29iajsKLQlpbnQgcmV0OwogCiAJaWYg
KGFyZ3MtPmZsYWdzICE9IDApIHsKIAkJRFJNX0lORk8oInVua25vd24gbW1hcF9ibyBmbGFnczog
JWRcbiIsIGFyZ3MtPmZsYWdzKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JZ2VtX29iaiA9
IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlX3ByaXYsIGFyZ3MtPmhhbmRsZSk7Ci0JaWYgKCFn
ZW1fb2JqKSB7Ci0JCURSTV9ERUJVRygiRmFpbGVkIHRvIGxvb2sgdXAgR0VNIEJPICVkXG4iLCBh
cmdzLT5oYW5kbGUpOwotCQlyZXR1cm4gLUVOT0VOVDsKLQl9Ci0KLQlyZXQgPSBkcm1fZ2VtX2Ny
ZWF0ZV9tbWFwX29mZnNldChnZW1fb2JqKTsKLQlpZiAocmV0ID09IDApCi0JCWFyZ3MtPm9mZnNl
dCA9IGRybV92bWFfbm9kZV9vZmZzZXRfYWRkcigmZ2VtX29iai0+dm1hX25vZGUpOwotCWRybV9n
ZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnZW1fb2JqKTsKLQotCXJldHVybiByZXQ7CisJcmV0dXJu
IGRybV9nZW1fc2htZW1fbWFwX29mZnNldChmaWxlX3ByaXYsIGRldiwgYXJncy0+aGFuZGxlLAor
CQkJCSAgICAgICAmYXJncy0+b2Zmc2V0KTsKIH0KIAogc3RhdGljIGludCBwYW5mcm9zdF9pb2N0
bF9nZXRfYm9fb2Zmc2V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
