Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9B214F4
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AC6898ED;
	Fri, 17 May 2019 07:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0EB7C89612
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:15:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E46871AED;
 Thu, 16 May 2019 07:15:04 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF8893F71E;
 Thu, 16 May 2019 07:15:01 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 2/3] drm: shmem: Add drm_gem_shmem_map_offset() wrapper
Date: Thu, 16 May 2019 15:14:46 +0100
Message-Id: <20190516141447.46839-3-steven.price@arm.com>
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

UHJvdmlkZSBhIHdyYXBwZXIgZm9yIGRybV9nZW1fbWFwX29mZnNldCgpIGZvciBjbGllbnRzIG9m
IHNobWVtLiBUaGlzCndyYXBwZXIgcHJvdmlkZXMgdGhlIGNvcnJlY3Qgc2VtYW50aWNzIGZvciB0
aGUgZHJtX2dlbV9zaG1lbV9tbWFwKCkKY2FsbGJhY2suCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4g
UHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X3NobWVtX2hlbHBlci5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2Ry
bV9nZW1fc2htZW1faGVscGVyLmggICAgIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKaW5kZXggMWVl
MjA4YzJjODVlLi45ZGJlYmM0ODk3ZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hl
bHBlci5jCkBAIC00MDAsNiArNDAwLDI2IEBAIGludCBkcm1fZ2VtX3NobWVtX2R1bWJfY3JlYXRl
KHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIH0KIEVYUE9S
VF9TWU1CT0xfR1BMKGRybV9nZW1fc2htZW1fZHVtYl9jcmVhdGUpOwogCisvKioKKyAqIGRybV9n
ZW1fbWFwX29mZnNldCAtIHJldHVybiB0aGUgZmFrZSBtbWFwIG9mZnNldCBmb3IgYSBnZW0gb2Jq
ZWN0CisgKiBAZmlsZTogZHJtIGZpbGUtcHJpdmF0ZSBzdHJ1Y3R1cmUgY29udGFpbmluZyB0aGUg
Z2VtIG9iamVjdAorICogQGRldjogY29ycmVzcG9uZGluZyBkcm1fZGV2aWNlCisgKiBAaGFuZGxl
OiBnZW0gb2JqZWN0IGhhbmRsZQorICogQG9mZnNldDogcmV0dXJuIGxvY2F0aW9uIGZvciB0aGUg
ZmFrZSBtbWFwIG9mZnNldAorICoKKyAqIFRoaXMgcHJvdmlkZXMgYW4gb2Zmc2V0IHN1aXRhYmxl
IGZvciB1c2VyIHNwYWNlIHRvIHJldHVybiB0byB0aGUKKyAqIGRybV9nZW1fc2htZW1fbW1hcCgp
IGNhbGxiYWNrIHZpYSBhbiBtbWFwKCkgY2FsbC4KKyAqCisgKiBSZXR1cm5zOgorICogMCBvbiBz
dWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgorICovCitpbnQgZHJt
X2dlbV9zaG1lbV9tYXBfb2Zmc2V0KHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKKwkJCSAgICAgdTMyIGhhbmRsZSwgdTY0ICpvZmZzZXQpCit7CisJcmV0dXJu
IGRybV9nZW1fbWFwX29mZnNldChmaWxlLCBkZXYsIGhhbmRsZSwgb2Zmc2V0KTsKK30KK0VYUE9S
VF9TWU1CT0xfR1BMKGRybV9nZW1fc2htZW1fbWFwX29mZnNldCk7CisKIHN0YXRpYyB2bV9mYXVs
dF90IGRybV9nZW1fc2htZW1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7CiAJc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB2bWYtPnZtYTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9nZW1fc2htZW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBl
ci5oCmluZGV4IDAzOGI2ZDMxMzQ0Ny4uNDIzOWRkYWFhYTRmIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmgKQEAgLTEyOCw2ICsxMjgsOCBAQCBkcm1fZ2VtX3NobWVtX2NyZWF0ZV93aXRo
X2hhbmRsZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKIGludCBkcm1fZ2VtX3NobWVtX2R1
bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
IAkJCSAgICAgIHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfZHVtYiAqYXJncyk7CiAKK2ludCBkcm1f
Z2VtX3NobWVtX21hcF9vZmZzZXQoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAorCQkJICAgICB1MzIgaGFuZGxlLCB1NjQgKm9mZnNldCk7CiBpbnQgZHJtX2dl
bV9zaG1lbV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSk7CiAKIGV4dGVybiBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgZHJtX2dlbV9z
aG1lbV92bV9vcHM7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
