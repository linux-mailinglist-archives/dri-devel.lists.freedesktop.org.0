Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEAC58FA6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B306E862;
	Fri, 28 Jun 2019 01:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 059FC6E7F7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:53:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B109C1477;
 Thu, 27 Jun 2019 08:53:31 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78AA33F246;
 Thu, 27 Jun 2019 08:53:29 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v4 2/2] drm/panfrost: Use drm_gem_map_offset()
Date: Thu, 27 Jun 2019 16:53:18 +0100
Message-Id: <20190627155318.38053-3-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627155318.38053-1-steven.price@arm.com>
References: <20190627155318.38053-1-steven.price@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
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
cG9ydGVkCm9iamVjdHMgKHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUgZXhwb3J0ZXIpLiBGaXgg
dGhpcyBieSBzd2l0Y2hpbmcgdG8KdXNlIHRoZSBuZXdseSByZW5hbWVkIGRybV9nZW1fbWFwX29m
ZnNldCgpIGZ1bmN0aW9uIGluc3RlYWQgd2hpY2ggaGFzCnRoZSBib251cyBvZiBzaW1wbGlmeWlu
ZyB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFy
bS5jb20+ClJldmlld2VkLWJ5OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2VuendlaWcu
aW8+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgMTYgKyst
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmluZGV4IGUzNGU4
NmE3Mzc4YS4uMTQ5OGI5YjA3YThmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2Rydi5jCkBAIC0yNTksMjYgKzI1OSwxNCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX21t
YXBfYm8oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJICAgICAgc3RydWN0
IGRybV9maWxlICpmaWxlX3ByaXYpCiB7CiAJc3RydWN0IGRybV9wYW5mcm9zdF9tbWFwX2JvICph
cmdzID0gZGF0YTsKLQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmo7Ci0JaW50IHJldDsK
IAogCWlmIChhcmdzLT5mbGFncyAhPSAwKSB7CiAJCURSTV9JTkZPKCJ1bmtub3duIG1tYXBfYm8g
ZmxhZ3M6ICVkXG4iLCBhcmdzLT5mbGFncyk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCWdl
bV9vYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZV9wcml2LCBhcmdzLT5oYW5kbGUpOwot
CWlmICghZ2VtX29iaikgewotCQlEUk1fREVCVUcoIkZhaWxlZCB0byBsb29rIHVwIEdFTSBCTyAl
ZFxuIiwgYXJncy0+aGFuZGxlKTsKLQkJcmV0dXJuIC1FTk9FTlQ7Ci0JfQotCi0JcmV0ID0gZHJt
X2dlbV9jcmVhdGVfbW1hcF9vZmZzZXQoZ2VtX29iaik7Ci0JaWYgKHJldCA9PSAwKQotCQlhcmdz
LT5vZmZzZXQgPSBkcm1fdm1hX25vZGVfb2Zmc2V0X2FkZHIoJmdlbV9vYmotPnZtYV9ub2RlKTsK
LQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoZ2VtX29iaik7Ci0KLQlyZXR1cm4gcmV0Owor
CXJldHVybiBkcm1fZ2VtX21hcF9vZmZzZXQoZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwK
KwkJCQkgICAgICAgJmFyZ3MtPm9mZnNldCk7CiB9CiAKIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9j
dGxfZ2V0X2JvX29mZnNldChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
