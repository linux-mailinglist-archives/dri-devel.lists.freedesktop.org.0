Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A877B33FA1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD06389668;
	Tue,  4 Jun 2019 07:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F8F589267
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:51:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F0A715AB;
 Mon,  3 Jun 2019 08:51:06 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 8CD0C3F246; Mon,  3 Jun 2019 08:51:04 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 05/57] drm: mipi_dsi: Use bus_find_device_by_of_node()
 helper
Date: Mon,  3 Jun 2019 16:49:31 +0100
Message-Id: <1559577023-558-6-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
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
Cc: suzuki.poulose@arm.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 gregkh@linuxfoundation.org, rafael@kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3dpdGNoIHRvIHVzaW5nIHRoZSBidXNfZmluZF9kZXZpY2VfYnlfb2Zfbm9kZSgpIGhlbHBlci4K
CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTog
U3V6dWtpIEsgUG91bG9zZSA8c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX21pcGlfZHNpLmMgfCA3ICstLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X21pcGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNpLmMKaW5kZXggODBiNzU1
MC4uNGM1YTM5NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RzaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYwpAQCAtOTMsMTEgKzkzLDYgQEAgc3Rh
dGljIHN0cnVjdCBidXNfdHlwZSBtaXBpX2RzaV9idXNfdHlwZSA9IHsKIAkucG0gPSAmbWlwaV9k
c2lfZGV2aWNlX3BtX29wcywKIH07CiAKLXN0YXRpYyBpbnQgb2ZfZGV2aWNlX21hdGNoKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKLXsKLQlyZXR1cm4gZGV2LT5vZl9ub2RlID09IGRh
dGE7Ci19Ci0KIC8qKgogICogb2ZfZmluZF9taXBpX2RzaV9kZXZpY2VfYnlfbm9kZSgpIC0gZmlu
ZCB0aGUgTUlQSSBEU0kgZGV2aWNlIG1hdGNoaW5nIGEKICAqICAgIGRldmljZSB0cmVlIG5vZGUK
QEAgLTExMCw3ICsxMDUsNyBAQCBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpvZl9maW5kX21pcGlf
ZHNpX2RldmljZV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiB7CiAJc3RydWN0IGRl
dmljZSAqZGV2OwogCi0JZGV2ID0gYnVzX2ZpbmRfZGV2aWNlKCZtaXBpX2RzaV9idXNfdHlwZSwg
TlVMTCwgbnAsIG9mX2RldmljZV9tYXRjaCk7CisJZGV2ID0gYnVzX2ZpbmRfZGV2aWNlX2J5X29m
X25vZGUoJm1pcGlfZHNpX2J1c190eXBlLCBOVUxMLCBucCk7CiAKIAlyZXR1cm4gZGV2ID8gdG9f
bWlwaV9kc2lfZGV2aWNlKGRldikgOiBOVUxMOwogfQotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
