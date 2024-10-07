Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA9A9932B2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB5C10E3D5;
	Mon,  7 Oct 2024 16:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aShXEHrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B09B10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:11:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDAB940012;
 Mon,  7 Oct 2024 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728317462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dr23WBAY8ZlBbMVkhnAU+t1UPEWAWhnUCz8S7CEndk=;
 b=aShXEHrONs/7rS4bqP9H684U7ISlZA2wLtsV0tzsWbwENgVR2HGJdl7BHewxUA6Sl+TQZm
 1qBPXcSSFDzAalMekNCP/ZCj0axn8AxzMPnvDWwtIm+D2P7EEMZVwxf5X5BQcin6kPzmL3
 W1y1/PF+RFIz4WiU6NvmJ0rU0b9ujKOv0soqJyomiEs59vX4mB3HTksaXhEbHX0lyta332
 3xmnULcQAMfDLAOPIzJsP9FtibIwdL3Aw6TNEwLeQnfv88vamiwU+K1Pp6KyQ/ZKpfBob/
 Do2TwKUDRqQb7y/QEoXJzDFZz93iS7ANpKrlsnkBf3N+hAt6kq2FwK/n3/uepA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 07 Oct 2024 18:10:48 +0200
Subject: [PATCH v12 14/15] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-yuv-v12-14-01c1ada6fec8@bootlin.com>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
In-Reply-To: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
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
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnBAgE40zHTxiatMRHM9aZFY+JrnSZSSetvhWQg
 MAa321tyr6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwQIBAAKCRAgrS7GWxAs
 4jOVD/4lmEATNrmbsR/mLiCxSC1E4SFS9kMxbODvJTE+a4khMPPeGL+GDgYGr+SbxdPqM37ZfTv
 Na8K8IoMXgw371than9uD32L9pq59/m1NiYOtd4ZU+JYQ13LqxVZFgHqzEp+mI4JxBv/eTMm+wM
 zsaeOBBCEPVw0+lNFi6MQu3RvDjQe7OQk/1FAB6SHhh7hoyRE/CD78rMSnVXydsZP2mm0fNY2VR
 1Y1qJ4I/Odkv+WegWzIAb2IqsDSVyi7eswlByNpQi0hTm6j5pdgus9r0rsaKRY47c0mUJpWOQwI
 afsX99NIaT4svvxUJfn/E96K79kVD1wWLB9oHslWj1qAVY4qcoWdzNSvkxYoJ6hMxey6g87H8hU
 tGZsmta1tEgdml5kDt2+FzMlAcgn/YmYRKfBSw7k/KVp330kKPSqf5o7pfix6s633fqTMHbxmv+
 KtESD9j26sBdf1869xmTaoJ98k1Dzpxm7GjEjW1Nf3RUspbmHfmjs76ewxUupPlLcDd3luS72lq
 mFigUmd0DitbXR2hF7oBjgAlZAVc2DkevX1UZEt7GBDH/f5r/2nxfAuqW8xE0Qwu/7hcV2qNz1n
 v86hiQNjFoU/gA8vicnjuyzl+Nj8kt8bXG360Jv/fUvlAHNDZ+v0pPMNPlziTG9bp9WbAbZ5erR
 /y9N3qU2cBH8RgA==
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

