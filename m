Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BB2A277D8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FAF10E36F;
	Tue,  4 Feb 2025 17:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YnhrbhC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1072A10E36F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:06:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9357D204B4;
 Tue,  4 Feb 2025 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738688799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQWqdBZeS98Fx3dq4V1eu9RdpUqn69nGfYSW7odK4Pc=;
 b=YnhrbhC+1zUvYapwOIM8YjPHtmd0k7jCuG2VhCUYYO9D/0DFTOBH+K3Kdi7FjXIOe7etH8
 oWeMYl7sfF8QZW5fDxxmk7DPgKQikYyRrJgmtHkg5I/dbjXqHA6SpZSbAwGf16qDk6Hrm0
 fj5di01VEV5Kcu85dJ8DrqSZiYzPHWiKPOqQuaNtT8MP2cGoevAyeFHYCpwBzkqzFg3LAc
 7FwGCHES4JgRqEN7nJIlAOmrua5KkPxgvzz+tE5xIbwfXiVPdj0HzBcPf9Lxz748vWLnJV
 wLTe98qr60BINs/n5QcIkr4yAG7q+My1u/MGHmMpsyj+wVIsAaxPoLQGPSfYgg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Feb 2025 18:06:17 +0100
Subject: [PATCH v17 6/7] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-yuv-v17-6-9c623880d0ac@bootlin.com>
References: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
In-Reply-To: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=apJqDFu1gBe/iJYQGCEO8k8I8h/LbDRkCROTkmqCrOo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnokkUHKYzM7hb02tMHQoPQTi84P5MmXVx/7KyL
 PzxtDUGDfSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ6JJFAAKCRAgrS7GWxAs
 4imYEADFLHio5tjJVRy7M5Kl1XaKitZATOY5tRTvzDlrAHa7GKl6XigqDmczJV1P+W15f1RnluR
 QvEiP6wCrg/jo8llZsyVbfP/aV3q1kOh66U3wcLCyBGLHFkhH0ywPGwzHURjfxL4Hoyeq8sXqQ0
 XfepMXpW2cn9/ptP/JjmgaQVEOdaeJtWF6mmwoVgM4JMgT5FtD4OfDo7CrMgCxbeJG3wHCToMjm
 QZwoqLp4uzdzgmZeZxs1NK3xG9yIxpDKZXwOJrQj7DQpXc5bdmSemoRUcKcsLcBuBehxrnMOduz
 BCkiQruoOXAFJaTogXoOzQmbVNnorYs0E1JuBH4JSNanOkOzxmQTiK0Q3RAE26tsnEwbvCEeUMm
 PLDO5ZrxmYCHFYOdJbl4ed2BBIB2NLikLqTKG+znxBpgAaWIc3tBZHyvMWLrSdgozNq/pPz8Taz
 QJIhBdnaDhSRzNq9HjHDvYlhAdc75v8z34N8X1LKLEshPatcCEjwTnHVTA3+J9nsgFTRzpU3L8A
 +PTUQKA86q44IWoWqRUj2WIwk+Iy3KgEujYquRpyEbIS4qCnKumz/8BuI7+5F3RExA+1TGqWtJ5
 eZfBdZ5p8X3SKagQgGR1Bg4lc3L37iY8kqR6Naf9hPlheP95AF8+I/ASxQA5V2ZaFQPe9O3PZnl
 r6E7ZASawhDsDaw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleeffffhfffhueekhfdvfedtjefhveefhfffffehieffleeijeekhedvtedtffevnecuffhomhgrihhnpehrshhtrdhtohenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtoheprhhoughrihhgohhsihhquhgvihhrrghmvghlohesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepnhhitgholhgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtohept
 hhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepphgvkhhkrgdrphgrrghlrghnvghnsegtohhllhgrsghorhgrrdgtohhm
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
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 88e0913ca33a83255f40411472f48a849002e76d..8a8b1002931f81366595b935ae145661b171fc2d 100644
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
2.48.1

