Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C42B3AB7F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EB710EABE;
	Thu, 28 Aug 2025 20:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f96K6BDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ED710EABE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:18:17 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b4c29d2ea05so1839670a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756412297; x=1757017097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RtNtHtpX6cwpdlCSf6IZNelTQKKXWtfsWOt1Fcnzscc=;
 b=f96K6BDAwEPxUK+9P7o6hTa6VA6BrKrvS9R3AArj3Tb3DogV1nGwpi+2BiAZhspoTm
 RUQT7yUIj9vSGQ5JWUnwzz0smu1A/AcR5j5PRuokuSWFfebXo2sUUzuddf6GCIlMIDDb
 chWHPu42zTN88y+dYI3uhHcyZE9yq5HiuFPIlL0hkCmHaQt6e6UkCPCjARmqhCn8FEyo
 zcQEC9e1+qSlL+ilnBye6yAzZZWMSdtvE1yt8XWPsPgu+Zie0y2BKlE3bQ5NejHTNM4O
 JOw1S4pCGiqwuJaDIHNm70cyZTljPzgyxH/EgKp3JdmXFLLf14Rj2ludq/6OKzoM9kzz
 L9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756412297; x=1757017097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RtNtHtpX6cwpdlCSf6IZNelTQKKXWtfsWOt1Fcnzscc=;
 b=IS1LgcHbXjDI9pPOeQHynigZkd1/L+rnwcH6booi0bJKOrImpdQVO6KPQkJKyrG1Ix
 rS79aqfcCBUy1f0OBkziDp8m6w7uI7M+Ku8dI0m8+IEMF3ClRddqoxSEquYLZtAkr6tI
 aEDceebp55Wog0yBYGtmiQVGtTpU9ygXsyx2KA75RViMP/9nXH7rUdtdl9q2kbtOvROe
 d3BrT5IGKI812rz7KbZERB/DnACWjcpsJ5uQWIJXcgVWO1DC9UeKTwElFjK/Ap+Bp/Di
 PljI8b1Gv9sjIMAfau2Vdp026RHyNtDUBGM81f66ZW2SG2ZDgSgO4sSb20rflB0DPo0T
 Or3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxcaIzBhhAC+4IKdh7G7OFm+eEP8buYapv8Axodg2rewjkOHLzsdj5h/ucGQtwz0jYj4N+PwSFZ5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCzax7bub2aedlzn0Y5jt1Bl4MsB7P4pzfH95qggoIUabAPd4g
 uNhzW1PqOP52AUCCFkEVuVF+spJ581pb9haIDWL+WU+fkL5/icR01hoW
X-Gm-Gg: ASbGncs7OYRqelYzl99kNb+797jWKGFobo5VU2n2GFwPy9ys4WOynt/RuygbGUl4UmX
 Vs2C/17xXjyD+vzgXsIaHZ3ebJihH8MR2SqIEjf6c3DKd7uKqzZRSwOQGuJEjhaHJY03jNAu6Bw
 Gev6PhGrOsOns/EV1RrA8hox58H6Dl2NVbrtg9H+YBrQLKsByXi67IcJ35OXFqlu88eLf5GvyGK
 tkm1J562vRtvYfyrr6t/xy7QV665xS2LmBz5M2biTJ+RanUpnV0tEgcMfVhUOY0p0xge/MogcPV
 DgqpPFAitOF23DmoBGdsr8srO31OoAjc9eD0Mi0LUY1kBZD2WRbeeuAcN5LJZbQ0Mu06li4TKB4
 xXuFKt1aFlaaKMIOY5Uv0OJtexcuX5w6tDgwYE3PHKu4XstwlPd5u5A==
X-Google-Smtp-Source: AGHT+IHdvgZE9elNuilpdJmHAmrR9bz/FHuSwffSn4LpAt/hyDZky5BitNwDNYRDvRChN9DFOLrWww==
X-Received: by 2002:a17:902:c408:b0:23f:fa47:f933 with SMTP id
 d9443c01a7336-248753a2734mr142729945ad.8.1756412296801; 
 Thu, 28 Aug 2025 13:18:16 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-24905da478fsm3754525ad.65.2025.08.28.13.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 13:18:16 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panthor: add asn-hash support
Date: Thu, 28 Aug 2025 13:18:06 -0700
Message-ID: <20250828201806.3541261-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
In-Reply-To: <20250828201806.3541261-1-olvaffe@gmail.com>
References: <20250828201806.3541261-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Parse asn-hash and enable custom ASN hash when the property exists.
This is required on some socs such as mt8196.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 28 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h |  6 +++++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 17 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  4 ++++
 4 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd87..19423c495d8d7 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -41,6 +41,30 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 	return -ENOTSUPP;
 }
 
+static int panthor_gpu_asn_hash_init(struct panthor_device *ptdev)
+{
+	int ret;
+
+	ret = of_property_read_u32_array(ptdev->base.dev->of_node, "asn-hash",
+					 ptdev->asn_hash,
+					 ARRAY_SIZE(ptdev->asn_hash));
+	if (ret) {
+		if (ret == -EINVAL)
+			ret = 0;
+		return ret;
+	}
+
+	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
+		drm_err(&ptdev->base,
+			"Custom ASN hash not supported by the device");
+		return -EOPNOTSUPP;
+	}
+
+	ptdev->has_asn_hash = true;
+
+	return 0;
+}
+
 static int panthor_clk_init(struct panthor_device *ptdev)
 {
 	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
@@ -257,6 +281,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_unplug_gpu;
 
+	ret = panthor_gpu_asn_hash_init(ptdev);
+	if (ret)
+		goto err_unplug_gpu;
+
 	ret = panthor_mmu_init(ptdev);
 	if (ret)
 		goto err_unplug_gpu;
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4fc7cf2aeed57..6f8e2b3b037e5 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -114,6 +114,12 @@ struct panthor_device {
 	/** @coherent: True if the CPU/GPU are memory coherent. */
 	bool coherent;
 
+	/** @has_asn_hash: True if custom ASN hash is enabled. */
+	bool has_asn_hash;
+
+	/** @asn_hash: ASN_HASH values for custom ASN hash */
+	u32 asn_hash[3];
+
 	/** @gpu_info: GPU information. */
 	struct drm_panthor_gpu_info gpu_info;
 
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index db69449a5be09..f9222b67f314d 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -52,6 +52,22 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
+static void panthor_gpu_asn_hash_set(struct panthor_device *ptdev)
+{
+	u32 l2_config;
+	u32 i;
+
+	if (!ptdev->has_asn_hash)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(ptdev->asn_hash); i++)
+		gpu_write(ptdev, ASN_HASH(i), ptdev->asn_hash[i]);
+
+	l2_config = gpu_read(ptdev, L2_CONFIG);
+	l2_config |= L2_CONFIG_ASN_HASH_ENABLE;
+	gpu_write(ptdev, L2_CONFIG, l2_config);
+}
+
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -243,6 +259,7 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
 
 	/* Set the desired coherency mode before the power up of L2 */
 	panthor_gpu_coherency_set(ptdev);
+	panthor_gpu_asn_hash_set(ptdev);
 
 	return panthor_gpu_power_on(ptdev, L2, 1, 20000);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf83..c9f795624e79b 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -64,6 +64,8 @@
 
 #define GPU_FAULT_STATUS				0x3C
 #define GPU_FAULT_ADDR					0x40
+#define L2_CONFIG					0x48
+#define   L2_CONFIG_ASN_HASH_ENABLE			BIT(24)
 
 #define GPU_PWR_KEY					0x50
 #define  GPU_PWR_KEY_UNLOCK				0x2968A819
@@ -110,6 +112,8 @@
 
 #define GPU_REVID					0x280
 
+#define ASN_HASH(n)					(0x2C0 + ((n) * 4))
+
 #define GPU_COHERENCY_FEATURES				0x300
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
-- 
2.51.0.318.gd7df087d1a-goog

