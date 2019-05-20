Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95715265F8
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4692D89B55;
	Wed, 22 May 2019 14:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9914A892FE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:23:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EA8115AD;
 Mon, 20 May 2019 02:23:31 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89AF43F575;
 Mon, 20 May 2019 02:23:28 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v3 2/2] drm/panfrost: Use drm_gem_shmem_map_offset()
Date: Mon, 20 May 2019 10:23:06 +0100
Message-Id: <20190520092306.27633-3-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520092306.27633-1-steven.price@arm.com>
References: <20190520092306.27633-1-steven.price@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
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
cm1fZ2VtX21hcF9vZmZzZXQoKSBidXQgd2l0aCBhIGJ1ZyAtIGl0IGFsbG93cyBtYXBwaW5nIGlt
cG9ydGVkIG9iamVjdHMKKHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUgZXhwb3J0ZXIpLiBGaXgg
dGhpcyBieSBzd2l0Y2hpbmcgdG8gdXNlIHRoZQpuZXdseSByZW5hbWVkIGRybV9nZW1fbWFwX29m
ZnNldCgpIGZ1bmN0aW9uIGluc3RlYWQgd2hpY2ggaGFzIHRoZSBib251cwpvZiBzaW1wbGlmeWlu
ZyB0aGUgY29kZS4KCkNDOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2VuendlaWcuaW8+
ClNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+ClJldmll
d2VkLWJ5OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2VuendlaWcuaW8+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgMTYgKystLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmluZGV4IGQxMWUyMjgxZGRlNi4uOGJl
MGNkNWQ2YzdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCkBAIC0y
NTUsMjYgKzI1NSwxNCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX21tYXBfYm8oc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJICAgICAgc3RydWN0IGRybV9maWxlICpm
aWxlX3ByaXYpCiB7CiAJc3RydWN0IGRybV9wYW5mcm9zdF9tbWFwX2JvICphcmdzID0gZGF0YTsK
LQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmo7Ci0JaW50IHJldDsKIAogCWlmIChhcmdz
LT5mbGFncyAhPSAwKSB7CiAJCURSTV9JTkZPKCJ1bmtub3duIG1tYXBfYm8gZmxhZ3M6ICVkXG4i
LCBhcmdzLT5mbGFncyk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCWdlbV9vYmogPSBkcm1f
Z2VtX29iamVjdF9sb29rdXAoZmlsZV9wcml2LCBhcmdzLT5oYW5kbGUpOwotCWlmICghZ2VtX29i
aikgewotCQlEUk1fREVCVUcoIkZhaWxlZCB0byBsb29rIHVwIEdFTSBCTyAlZFxuIiwgYXJncy0+
aGFuZGxlKTsKLQkJcmV0dXJuIC1FTk9FTlQ7Ci0JfQotCi0JcmV0ID0gZHJtX2dlbV9jcmVhdGVf
bW1hcF9vZmZzZXQoZ2VtX29iaik7Ci0JaWYgKHJldCA9PSAwKQotCQlhcmdzLT5vZmZzZXQgPSBk
cm1fdm1hX25vZGVfb2Zmc2V0X2FkZHIoJmdlbV9vYmotPnZtYV9ub2RlKTsKLQlkcm1fZ2VtX29i
amVjdF9wdXRfdW5sb2NrZWQoZ2VtX29iaik7Ci0KLQlyZXR1cm4gcmV0OworCXJldHVybiBkcm1f
Z2VtX21hcF9vZmZzZXQoZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwKKwkJCQkgICAgICAg
JmFyZ3MtPm9mZnNldCk7CiB9CiAKIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9jdGxfZ2V0X2JvX29m
ZnNldChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
