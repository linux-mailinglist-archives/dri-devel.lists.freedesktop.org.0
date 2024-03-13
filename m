Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5141087ADF6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFD510F81E;
	Wed, 13 Mar 2024 17:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bLW3cNJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3D810F82F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C1AD40006;
 Wed, 13 Mar 2024 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vk8BNwGJAqLAVQ9fBvlyUPWgU+vNkf+DhOlg0zqa0Y=;
 b=bLW3cNJRdq9O69RxPLYwYn6gVkVh9n1OZD37GkUSiUe/lcj91kk1cnaUzNfeFuy3gc72KS
 SCvwMXpkDxQA8vedGwSz1IrrxOfEoCatKQEUzN4h3qUuihkDaLrDr6FVPk7ngF34nOeMPD
 668mmp6IiX3f+P4xsY9R987a4PQo5C7Yar2VCeqrOGz03F7zzQ1YVGFuJYupY9x599CXQf
 H+wlLImP9gysyEkJgrxDnl5ZisuYDPX5xzi9XF7RjbOLm609rj0+tzf246r9thI+cJQXVE
 qHszhokmo00bvsDSZhy/DzUliC2G1ifUZ7lSoOdJ4w628TCIzUT+dpWtzUcSNw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:45:09 +0100
Subject: [PATCH v5 15/16] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-yuv-v5-15-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
In-Reply-To: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jNe6Bg7KTpSpUer0keg/YQY7YaZCbb33mwHbW/nyqss=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eY12s9vTfK6gwWnR4reCKg4IXVlpGyhmzhmWrto
 MPwKF5SJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmNQAKCRAgrS7GWxAs4hTVEA
 C2PHQezur5a6ktgpKuZBu6etHWoSjMt8FaDmTTzOXNY+P6s0IYJ23vG2KymK/KwyY9llh20XM74lsm
 3BsShoiasnrBMOQhUm3R5EajOLFC+vw2h1RjuOTbVzAZCCpNOwuSMmFGDUMau/FCQRd646pUu4f0gI
 kBQCbicjKmWk0rmtdRw4694pmILamnfehF2LBsywpXOmU3nFHd6xSsqcJZv9f6/qJXqOhIRbvPKe4H
 iTM3bGLyYZjD66MSfHHgFcVyIOC24wKxWwYegNmfK4Fo+Z3EyGQ2rckh37eo4KPje1hYVY4eoj4YJd
 s1MXh7/PdhuqbcIu8gODqsriyLtOR3fm/cEtIeYl4n4Au3v4p/fHew0bZSrjYSYg5t4iCSuRNrjr6I
 Pq89f7LtAodaO6k6SAVKRXscIGdGF4psqQYs3cuElgu8p8iw+gVQG7rs141cWbD3risexzxiLtqrtg
 QtrJqC4b4hruBbCNCyO3a8ObB0iHK9XuzBHgH+M0tQfNLNCKIpPQ43Vg1U1M/T+JvM9r1T/mpYds/K
 Tmz86+RNrI6ALMHSUNqX65awQZhBvnGKzFRalB0LnTxtMqAFbwWKP3IhoLJ6Z39VHy0eyY7mZrvlJ5
 Q9CFGTTESlMpuUh9xNWVDIj4JgTu6UsgXzzxEGy+YmVSQblv9PMiPKzWi63Q==
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
2.43.0

