Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B5B0B2D5
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C8010E444;
	Sun, 20 Jul 2025 00:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wt/0hNXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A560D10E111
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:08 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7490702fc7cso2013827b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969728; x=1753574528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PZeYcpA6IdS13N6yNi+0iixf2PMyZBsbsEjnpcTFZhg=;
 b=Wt/0hNXHizdcbI3OgCdQZ8C53MSggIknoGmsZSmh6070jyKnHpRYQ/OCaew5yBKCRp
 Agv7RAc5Kouj6ijG7+ClDMnvjR75MoyYScWcDr/wZjsuw/wt6IAE8Z15EJY14cKJhuvG
 yTLS8QIG+S8mdRv908Fwt4Dp1MT03IWSmOtr+ZevOTj0nbp8xRE+JifZtfVK66Eyn0L6
 RPQDq7VGTjWORKJgzpzWQ13X/Z5ZuZLj7E0gtE/T0ta1q2wot4zhxVogmRxTup8bRCWK
 P1sRVN4MUDZFCRzvNn0RQTCnu6mZFDbKbV311W7Dd7xI/XroWxIj5DkI7WQIQ/YLv3wF
 KfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969728; x=1753574528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZeYcpA6IdS13N6yNi+0iixf2PMyZBsbsEjnpcTFZhg=;
 b=HODjFYqzNA7INTrYhUuF2+sEpc8FJ6v9rwVkHw2AGSt/WBH1c7/6sv4yNKXQ9SotLU
 vag45THd67Ojw6F3/u9XxjPdlkADsbkN8//G+5ers8X6Kp9rdzqeFCPipn5EQhdEbxhs
 lTPYlyYxOtybss19eAUgO0spA2ay5VblQP/Loaz8Vsap4lZIdqu+QDAohkVbBlqwEoy4
 AiDTzVVQ+y7FYkHrrLyDwezMLnGg+7Aiv1PMG7R4gkgnB8oEr6GZ3W09qoHQgj7xmC3/
 p+IrpO3W0Xxl25c5mLb4iS0l7013IPz5Ta0SZniecWBrQhSRsyBsiF2/dmlouruWQDMB
 XB6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPEpLy5gou1JxnAAIdUUVDiPrjs4LwHX4pOBDLIAfcN+nJiidOEA5aDj1QWJoYLpxlrd9aF6K6FSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz/lbX6+JBFQs4/O1rECmWZfIjxzXdbHUWr/rTKM01afEKeZx/
 BefbphI8AOq4ZMQUtKzIRRILraBdVWgf19zK65HAIK3sNKyCpzi6IFJf
X-Gm-Gg: ASbGncugyl47Fsm3R01Z3hiuOJRFA2PFy1kSmuWeO4DRosINyoTfU6I5K29jB1HKy+B
 yztBIff6i2g8u1McQfoHtBVh6GZZkAG5Rra/qdj18cQCCRAV2FyaDnNXS0J0i8gDDYfd0FuCsr3
 TEpx6xFEtEMD54Ff/cx/T7fpPczDzTJHqaSwssn+zxaloYMh77YT45TFSpwnLGq1VrOWxpRhBfQ
 7Qye1jRvrzEx7D3/CKbb8YUsMiE8u2rzWXWdRfcMYxbCP8eM0khkeRUGCh5ut7A3Q26BXXDI30B
 lwc2mIoTMqowBkAAPxe7Xta39GAvQ0rB24EGQ/kTCnYbIw5PuDldFHfvdQRUcsRh3Ji+TlKW1VT
 Bv3+A7UdMag5AvUwBg4zIJMn58bFfAjcuYArpWmHbLkpGnbj+Dkyf
X-Google-Smtp-Source: AGHT+IE0yL2u0gWC2G8gFvnVzCy8pgRZN9a5E7q265PK7M+9WprYx0FEIcD+l9N/ZjvdqeMkM4NFCQ==
X-Received: by 2002:a05:6a00:1248:b0:748:f6a0:7731 with SMTP id
 d2e1a72fcca58-756ea6c7d8amr23238232b3a.23.1752969728038; 
 Sat, 19 Jul 2025 17:02:08 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-759c89d31c1sm3386221b3a.48.2025.07.19.17.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:07 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/panthor: capture GLB state for devcoredump
Date: Sat, 19 Jul 2025 17:01:40 -0700
Message-ID: <20250720000146.1405060-4-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250720000146.1405060-1-olvaffe@gmail.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
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

Capture interesting panthor_fw_global_iface fields for devcoredump.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_coredump.c | 33 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_coredump.h | 13 +++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
index a41d0bbcb4f1..44d711e2f310 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.c
+++ b/drivers/gpu/drm/panthor/panthor_coredump.c
@@ -13,6 +13,7 @@
 
 #include "panthor_coredump.h"
 #include "panthor_device.h"
+#include "panthor_fw.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -22,6 +23,7 @@
 enum panthor_coredump_mask {
 	PANTHOR_COREDUMP_GROUP = BIT(0),
 	PANTHOR_COREDUMP_GPU = BIT(1),
+	PANTHOR_COREDUMP_GLB = BIT(2),
 };
 
 /**
@@ -50,6 +52,7 @@ struct panthor_coredump {
 
 	struct panthor_coredump_group_state group;
 	struct panthor_coredump_gpu_state gpu;
+	struct panthor_coredump_glb_state glb;
 
 	/* @data: Serialized coredump data. */
 	void *data;
@@ -82,6 +85,17 @@ static const char *reason_str(enum panthor_coredump_reason reason)
 	}
 }
 
+static void print_glb(struct drm_printer *p,
+		      const struct panthor_coredump_glb_state *glb)
+{
+	drm_puts(p, "glb:\n");
+	drm_printf(p, "  GLB_VERSION: 0x%x\n", glb->version);
+	drm_printf(p, "  GLB_FEATURES: 0x%x\n", glb->features);
+	drm_printf(p, "  GLB_GROUP_NUM: 0x%x\n", glb->group_num);
+	drm_printf(p, "  GLB_REQ: 0x%x\n", glb->req);
+	drm_printf(p, "  GLB_ACK: 0x%x\n", glb->ack);
+}
+
 static void print_gpu(struct drm_printer *p,
 		      const struct panthor_coredump_gpu_state *gpu,
 		      const struct drm_panthor_gpu_info *info)
@@ -176,6 +190,9 @@ static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd)
 	/* many gpu states are static and are captured in drm_panthor_gpu_info */
 	print_gpu(p, cd->mask & PANTHOR_COREDUMP_GPU ? &cd->gpu : NULL,
 		  &cd->ptdev->gpu_info);
+
+	if (cd->mask & PANTHOR_COREDUMP_GLB)
+		print_glb(p, &cd->glb);
 }
 
 static void process_cd(struct panthor_device *ptdev,
@@ -202,6 +219,19 @@ static void process_cd(struct panthor_device *ptdev,
 	print_cd(&p, cd);
 }
 
+static void capture_glb(struct panthor_device *ptdev,
+			struct panthor_coredump_glb_state *glb)
+{
+	const struct panthor_fw_global_iface *glb_iface =
+		panthor_fw_get_glb_iface(ptdev);
+
+	glb->version = glb_iface->control->version;
+	glb->features = glb_iface->control->features;
+	glb->group_num = glb_iface->control->group_num;
+	glb->req = glb_iface->input->req;
+	glb->ack = glb_iface->output->ack;
+}
+
 static void capture_gpu(struct panthor_device *ptdev,
 			struct panthor_coredump_gpu_state *gpu)
 {
@@ -231,6 +261,9 @@ static void capture_cd(struct panthor_device *ptdev,
 
 	capture_gpu(ptdev, &cd->gpu);
 	cd->mask |= PANTHOR_COREDUMP_GPU;
+
+	capture_glb(ptdev, &cd->glb);
+	cd->mask |= PANTHOR_COREDUMP_GLB;
 }
 
 static void panthor_coredump_free(void *data)
diff --git a/drivers/gpu/drm/panthor/panthor_coredump.h b/drivers/gpu/drm/panthor/panthor_coredump.h
index 9e30c02ab962..e578298e9b57 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.h
+++ b/drivers/gpu/drm/panthor/panthor_coredump.h
@@ -56,6 +56,19 @@ struct panthor_coredump_gpu_state {
 	u32 mcu_features;
 };
 
+/**
+ * struct panthor_coredump_glb_state - Coredump GLB state
+ *
+ * Interesting panthor_fw_global_iface fields.
+ */
+struct panthor_coredump_glb_state {
+	u32 version;
+	u32 features;
+	u32 group_num;
+	u32 req;
+	u32 ack;
+};
+
 #ifdef CONFIG_DEV_COREDUMP
 
 struct panthor_coredump *
-- 
2.50.0.727.gbf7dc18ff4-goog

