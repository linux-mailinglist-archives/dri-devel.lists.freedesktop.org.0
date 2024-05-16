Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84928C772C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2491010ED0A;
	Thu, 16 May 2024 13:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gu97EKuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8710ED04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:05:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32B3EC000F;
 Thu, 16 May 2024 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715864744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cJjr1rOvBelPGZzHZVBVCtP2dmTpPXKO+w4HPsDO+0=;
 b=gu97EKuPJWBMpU5dY8RaGqA/gulC8FYseQS6vq5Yyj4zRc8VdYWUFKcO2Spze2Fd4GRVSy
 olB6UNf0RtiwI4DSikf3Ko/wGHbfsVtPISmhM80Jaw7HJXRT3XQRRvCrdak+rOzsYtnY1b
 iz34In94gVSuDvj/d1rWV8/28PMcFz1pKt1HFHFmRts4xLw2CuF762+YVRn9hNn7LLf3UQ
 rskVuli+/UsoOiS4aenbzCl3n57sZsIgP7KH8Gd2oTnA8d2O8VD3nAayvixEfpnrYv4Zsi
 vyFkywYvRQr3uATmXa30Z0T9Gt4dhfF9BdH+dXCuhijIUIvDzjJK2gP/SivpeQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:05:01 +0200
Subject: [PATCH v8 16/17] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-yuv-v8-16-cf8d6f86430e@bootlin.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
In-Reply-To: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
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
 bh=O8c1f336kiVI3XlL4UTlw6eNE2rwuewoGBkUeNOYiPA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgSC5GoXWRSrnYV9ETBiVDH8Jn5fnArbqKwbL
 dLc8o09IUeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYEggAKCRAgrS7GWxAs
 4uE7D/wPP45RWpxBsLH8jQdqLtt/Vf6KHPDniSNlL5xLVgST6fco3JUUEBOdEXOOnjSKb6/+19a
 fpxu+4HhIesEzlPPN0xoKY9dnVb0ppVqhVJ7gvpKNROSE5hwhtFI+DAawHxyuxVbAV3BLV8hCkt
 yhOOEMSQ3yePbKxaOgDqE7aDL3WJeEO9mT+iKYi8jmHtxgUY00cEdq7BkVk3grUc2I+x3zEewUY
 6T/zBBfYi/8iJk2kNpfiArNOTrIandTmlCJx7BefeOLee7L24sLhdNl20xKQ12VQejQZ9wa1K2H
 z55CXGgkpSiGqMQS6Og04BxiJYwAHhOAimHW+mtk54Evzr47m9iGUrU3LeJCgwCbh90Hi8je/8D
 WPO/G7Uo3TObH1Tam1R78NMFjoNFxMwW4pTLBlj5JlgJXn7eC+kQEGTFPuDE7vOcGYJeZ/mecOz
 bW3ZuUuSGv3wgv9dJr0UafFZIo/W/fH1k/BkLueDlqyqv6LniYThbSlMn5TGUNv76hSWROlOdD9
 r0qB0T0qTfWmDeHLqJ/QE0Hy2vKHmHmFZRo39aDOy/j20sV/4zKjSG85PxZ+mOdcpY8k0DCq/Vu
 zKtNBm2Uz6ucdbZEpIiIqfWMz6g0hBoqIkXfpW5lu4MSo19kAHsCKXnOVJfzeeg2KQqzpdiEihH
 5eaGA/bIW7EyExQ==
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
2.43.2

