Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9DA277D6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1511110E36E;
	Tue,  4 Feb 2025 17:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AZKc8AXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5500210E364
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:06:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAD66204B2;
 Tue,  4 Feb 2025 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738688797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPAqPmjbCcHhHjQH2AuZoszEfCmP6ldda6N/C5rtCJM=;
 b=AZKc8AXbLLCoXwXv8gNk+ScmFJNN6Megi5S/KU3kbI9rT2wx2bGvclim0h5I+AB4xE4Zid
 RRNg+uYZ9DhekdxLcv6H9xqWwJI/N2jcoBuFZHPt1GEbzJ2bfZKXrbu+yJh6+8/MCNnI7+
 aM+tV5LeG05QUKf5BuGu7PkSqX24H2XgHzNt9I8i7OX8vl8GbhYeF7lb43vCuLMtuQc9lh
 KBn77k9XT9B5BoNT2rLWRZaQGnMRyvtul89Hj6C9l+WGqbCd/MOBgnkWpnFWkCOz8irWPU
 XLxvHF+IeBrAgZhJUdqqM2OzcTjPh/636eAObWDOaz1vz35xUlIj4TpjvKf2sQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Feb 2025 18:06:15 +0100
Subject: [PATCH v17 4/7] drm: Export symbols to use in tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-yuv-v17-4-9c623880d0ac@bootlin.com>
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
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=b9ZKvWTMLH2pYM6W6wEY+mfsMMy4RKlJ6gwgcF34UR0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnokkUROSPi6QYkJNcGQyqtdAdIJ4muWPeNmmFv
 3Aig2EhPoOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ6JJFAAKCRAgrS7GWxAs
 4teCEAC/BSG25Nt3Pl+eMe6u0KBf6vvXIi28QeV/jdSUb4BagWe85YURdrYo3UpR28EljTv6q6v
 VskIdYK6tXCq/TwQs9OHxAZ0S8dLueI7C82W9yLl8NGfNzHm3nK2/TU9qD7rCzFeYF20SDwYVJ9
 +T8QCXQOiNYbEWstvOxaeFFV6UtujQuiXCRW4ZWfphaEh7kiDkcQyuIwLXAy7Yih7DyMsdAx2p2
 9LW/K5Iq8WZ7+yj4cicak86x673lfZ3zQfcEvXOLptDw5H0zVjwxEf2M0r8UaC99wp7rbiHZR0i
 /hD+UEcliDx4k9WkIrY5MI/UtwevktJpnv2JwFFsx7ozIKDyY+YQ4NhqnnAJbuLP1Vm2zY3Nis2
 52efL2l/VQjz+ecrNq5IJbk1lmzwY+mMEaFItI5mzWo1VOgFwXCuxQneLhY38sc143AqZFAvALJ
 kQbyMPRvd1Bpv5MzGPmzw5y+JN3Ah/VG/1T14yGHY1n6yEgdgt2JHNle6jIK1v6oWsku50BEuL5
 1KCaMRQpLg/52ZMvgY9kFGyeb8jAzYyxn1TIdnKt+1Eqbp4kp9X3M9kEHqyPaTrZG5D7XqRDUwZ
 ke9CNMtBWBGG5UI8CWxvVd9ZfcgSwHoq4f4UAyVlUXLPvT5TtFNsGYZHPG5yF4NDA479MW+JxIK
 /877zX/D2EfiJPg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehrohgurhhighhoshhiqhhuvghirhgrmhgvlhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehpvghkkhgrrdhprggrlhgrnhgvnheshhgrlhhonhhiihhtthihrdhfih
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

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..b73a998352d175a26c69e0878da28a6288cfc8b7 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -28,6 +28,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <kunit/visibility.h>
 
 #include "drm_crtc_internal.h"
 
@@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.48.1

