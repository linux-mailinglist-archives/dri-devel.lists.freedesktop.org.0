Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9523389DA29
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBFC112D9D;
	Tue,  9 Apr 2024 13:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HZk0uG4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CF7112DA7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:26:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 561B6240008;
 Tue,  9 Apr 2024 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712669162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vk8BNwGJAqLAVQ9fBvlyUPWgU+vNkf+DhOlg0zqa0Y=;
 b=HZk0uG4ti889oBfCdvCY1MxTUwOlSf/9ZUP2j5SU3IoAvZZDEupUSmVuU3dpKqyJyNKkE5
 +Zl5gz2P3W/MAs6qCJy2DBanyX+opk/f4gdvAhlMI2UpQhZnNcO+gsy3Gvp1CVU3CBDxgC
 tgEy1FUMfdEycuhGJfPucJNwuDn7XJ0rL+3dRzy+cz+nyZzGrWp2xPhFFJnin3HqCevKDp
 C+cNxtfbynlqLtt37JwkwGlmxGxigVj5wKyOHsPRFDz+9/eWD6m+Vw6tEx9Ar9Hp1FPX+U
 W5aWoMYkR1NA/mKXLJxPT166+T2AW9jiyg6nhQbe6eF6roIjIhIxuyPE8ngdJw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 15:25:34 +0200
Subject: [PATCH v6 16/17] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-yuv-v6-16-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
In-Reply-To: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jNe6Bg7KTpSpUer0keg/YQY7YaZCbb33mwHbW/nyqss=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFUHTMLf4/jCJUHnHT+Fa6Naia0FVWTgBVdY/R
 WVGrT779H+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhVB0wAKCRAgrS7GWxAs
 4gigEADYRmbR0OEQ2q8wVP/YVMKRdQzaQGbLpuwp2ZSY5c0rnsIdrEbcSL/ljP8Bhi7yvGp5L9N
 C6PJu8hhe6MJRWHolg5ah6CfB0ckL7KR+0oxdGUbVsGaYlvbMyjVIz/Z0vMoQ2OHRIX2s4S9LBO
 H9kuvAq7M6mnF0DCEIb4TeZCJxtAT/S1XBV3izXHzwguAND5PBlnCeRedCETea4DGjwk6Do1xgH
 VeDUpmh3+AgT4omzQDNZEzRjo5siLDS59gjCmJOWFM1fN0eK+mWCk9jEfpK9cZwy4qG8S8w1ldQ
 28OnlhY25qWozgisQkM27IvukZQUtEMhVfsPXeCDGbsEfyLdT4jvKH6fHdejxNR5Wg+yYdmdIgV
 52jFT4UUCda0zDsM+dDufAs0X+XH/RvQAPIu/fg6Nkmguz3z3oVl+oIaihmFEDk+KIsvpJaXI3s
 MQ0al+SSDqB9WYWOQoPny6M1sF9J45Gh7m6LqxTzz0p5v4wWtZ//8cx36N4mJx3w4zYvOp82ths
 AiHeBA4GEjjJ2TLUmvq2tOXXPMh9z6gv7VFuHAGpona7j55hw7R8X2PZw66h11HthHeZ63NsmZ0
 5Gr3nGLQHflUO5dZ6MfaDSPRbnJsfGLBV0N7wqPZuom5y8FPpKjo6mLLEQ1kfkkn+SQ62pkNiAM
 xTxSHObriauBylQ==
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

