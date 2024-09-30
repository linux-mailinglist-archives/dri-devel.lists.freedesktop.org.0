Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44098A892
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7648F10E538;
	Mon, 30 Sep 2024 15:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hhs871b6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078C610E538
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 15:33:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E92A340004;
 Mon, 30 Sep 2024 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1727710400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dr23WBAY8ZlBbMVkhnAU+t1UPEWAWhnUCz8S7CEndk=;
 b=hhs871b6yomt3aiEOQLzbAETgn3FPHlVA+c+wddMHiE+PICwyWkbL9cn8G9eC9d1oTpvU2
 FnHOVhDUJW8yIRbjDQu1SR/QcLLnJ8DQr+sE6MOvedMOBV9B2B695uM16AesCqARR5E28H
 +wlDEzWi4jByXxZ48jFYERgGCmaqeEdOYb8uNpcP4W0hK9RHkZ0uikDJemky8n8qUjeWpo
 l7XORrkM/LoDPdSXdpSkxVxtdiW5Z5cFj77mI6Qb3qpkHQd2WfBkZuGf9GuOZG0G1oGfdT
 YkvyTl3xF/CDwD3RvIRFJ9k3ZOH8NxTalFubongesTVM3S2sQTltzBRkbmtc1w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Sep 2024 17:31:54 +0200
Subject: [PATCH v11 14/15] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-yuv-v11-14-4b1a26bcfc96@bootlin.com>
References: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
In-Reply-To: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cnp5oJy7nuzGGG9ERF9CFtbtr9GkJcMMWvS4L3S4Vps=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm+sRxxPH8PrtvYnvsiETBjlH2karQ9lUU50ydp
 BI9qSNHKoWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZvrEcQAKCRAgrS7GWxAs
 4kPIEACLPurbVFYWDcJD0z0ykYTymbh7Qp+oh/k/+1nKtC9zb//wF9oKwkJvktl1LD34crsEq0T
 RWeKdWGwwS5BuYVwW6SRYNLElT9NRZQJf9Uc/p0DZ+/M1tL3bGveEFSF5mLYiKpw1WeKa4E37Bj
 ve5ZRlAAJ5s7/r02vUnzaP0lpifngW5ujXJb6b5rSKTXV+eSJ0AWyOfzV47eVCWzHush9Ici8k1
 HLQ+gHL1S4r3lCDJnVhnL1SIxmvNqOlDCU2+fR2s6QzXTZKZUkjj5SCgDgVQnRBU9cAFfKkel7M
 wg0gmOIFANGCoWaoMGfWLhZrrnTDuorfAODPSVHcTQMuJn5ov1MaKv03y97qVHuf1fnxxGL4jpR
 2u6PHvpMbwATAJbJnTmwUwHvW6Xxykhozgh6uCTAbUHSSz0HXH59SQh68fbKGPz0eJhAZNVLfgK
 oujTlEt3QYV+MlElfnGxDZKsY8uDzOP/RwoKHfUR+b1wDX7bfz7KSr2kGMOpktrwa3B5kqzYLqD
 izZyQ7gRFKHVYBTFu34L+OcpgsqT44vSYDnwMeUuzaW9TQzK6MgiVKp0VumxmtyF2daDPz+X9sC
 TmzNmrIPoX3bxuW2HG1vboBcE0P/u+jnGQj4trqWZRSYcMfvv8cRQA0ul4jZCfi3RPLE6Eyi3Pm
 gUoYGrAoXjX5oIg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that we have KUnit tests, add instructions on how to run them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 13b866c3617c..5ef5ef2e6a21 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -89,6 +89,17 @@ You can also run subtests if you do not want to run the entire test::
   sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
   sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
 
+Testing With KUnit
+==================
+
+KUnit (Kernel unit testing framework) provides a common framework for unit tests
+within the Linux kernel.
+More information in ../dev-tools/kunit/index.rst .
+
+To run the VKMS KUnit tests::
+
+  tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/vkms/tests
+
 TODO
 ====
 

-- 
2.46.2

