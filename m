Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD86B0B2D6
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F91C10E443;
	Sun, 20 Jul 2025 00:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VNDbzdBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3D210E443
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:10 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2349f096605so37014435ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969730; x=1753574530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wRoDb+voU8lgHdTpaHOsovTOL2n5XlnH2FXsWKtkNow=;
 b=VNDbzdBAYZrEwFCWQ2NV0EE17N4+2BZ7XAtBWwrA1CVzjaNzjYTR8eZtdXoRZ5a9wK
 jcJ1O/pdBfGBwdYvTTiBPPYbMRsoWnxSvIr+aql3ke2oKAV2OnJRvccxvstf3BMU4nNQ
 6ZC9+hboc3XXSRABEp3Iy826Z7/97xQw/XFcRQWzSUbRQRTXqNGK011XUOpWUltMYHY4
 o6uX3hTECDrWv+0eS7nzBZieELkYuvc4sI3IqOv/mmbndYKjoOyOdsW4p0ETs59h84Q+
 nB/ROvpyWU/WKj42gGN4ujqtubuWcNOYAoyxXuK/TPD9UepY+Fd3LG5sNxZONjjelWnP
 Uryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969730; x=1753574530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRoDb+voU8lgHdTpaHOsovTOL2n5XlnH2FXsWKtkNow=;
 b=RjR6qkVVnDZd593/3ctjLmdTShhPe93f9VcZ+JlZD9f862OBiIXwb+9BjytOBKBgLA
 UwVnXhm/xxC9FNTSdmh3lFqIhO/xFOCVB57MVPbKzh7Uus97XBp9+IbguKxviTkU+QeI
 gaZfEWQUFVmuZtIMlHQmj/wtimhF/E5Q6SX5+t5eiXQh5ynX8lulvDXoMCCpSw3A9AeK
 RuSgffuaI/b87j7l6PUCgvkIcXjT6WGvogSnzb+nthMhifbb2mC9FGro/pvbvVYKwz+r
 75fVkADQt8V8wNtoHiBe/hG52YJNIv5jdWchw6L+GQ1QuMqWWlnRlTDaGhExRaI9RNzB
 Bhjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY74bcGbtX6xJ8v4KygYIvWkgXmoieUN+A8apT3D00TsE3Ef41kOCzjXplfvj2yCQzhlLJ444OVaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqHxia+DEXnbvAj9uD3r2CAmyOIB2MyDrD4blBFJa/AGG6gkJz
 9seuc0N4OievtVQqko5uRMc//Tf8/yjB9XDDbJOX6daZHnJS+W/4iRMM
X-Gm-Gg: ASbGncua25HAp/xP2x386pB7Ecm/Tzt5g42Jh8mgQFGAT63InQ+JOiXSpfy8NxQdJVj
 wSps2RXsco4AQI7kmGxyFRO8sMWuySFjJr3n+scYd9loRUBB1Znw/+1XOUViBPhSjeCJmYUQdQh
 79MLFsBYaehlr9D7EAGzDjmEXOAsx3wG0bHQlPqGZxLT0g0xUGDpJgHa8ahj0YsDwfrOdcBLk97
 K73iDdfx9lwxZ9Xz2szEHnbDRrBsxCxdEflSLqP8m/fc8Vos7Edmd28n9JC37maPK62kaSIvguK
 FA8aW0bHmIZSrTLLPc6MqQMKhtos7Ea2T2TmfUc55ekrkYoR5aPGK2xbRvzsTR2f9r251qrf/aN
 dIwqCH4ivaXs9BYZeECOj1WiqX9nKaK2LnCGvgfWsX/VLy4mAjcODMLtGOjjOcsA=
X-Google-Smtp-Source: AGHT+IHqeh5H+cwZXLynkz1KvJ7nhaok/k4EEbnFVlyCAAZG/xRcLSYxwJPT96memS9fpzyST0sY9g==
X-Received: by 2002:a17:902:e84f:b0:234:9094:3fb1 with SMTP id
 d9443c01a7336-23e25763da2mr244183835ad.35.1752969729849; 
 Sat, 19 Jul 2025 17:02:09 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23e3b6cfdb1sm34053625ad.139.2025.07.19.17.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:09 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/panthor: capture CSG state for devcoredump
Date: Sat, 19 Jul 2025 17:01:41 -0700
Message-ID: <20250720000146.1405060-5-olvaffe@gmail.com>
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

Capture interesting panthor_fw_csg_iface fields for devcoredump.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_coredump.c | 58 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_coredump.h | 23 +++++++++
 drivers/gpu/drm/panthor/panthor_sched.c    | 13 +++++
 3 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
index 44d711e2f310..e08bd33b3554 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.c
+++ b/drivers/gpu/drm/panthor/panthor_coredump.c
@@ -24,6 +24,7 @@ enum panthor_coredump_mask {
 	PANTHOR_COREDUMP_GROUP = BIT(0),
 	PANTHOR_COREDUMP_GPU = BIT(1),
 	PANTHOR_COREDUMP_GLB = BIT(2),
+	PANTHOR_COREDUMP_CSG = BIT(3),
 };
 
 /**
@@ -53,6 +54,7 @@ struct panthor_coredump {
 	struct panthor_coredump_group_state group;
 	struct panthor_coredump_gpu_state gpu;
 	struct panthor_coredump_glb_state glb;
+	struct panthor_coredump_csg_state csg;
 
 	/* @data: Serialized coredump data. */
 	void *data;
@@ -85,6 +87,28 @@ static const char *reason_str(enum panthor_coredump_reason reason)
 	}
 }
 
+static void print_csg(struct drm_printer *p,
+		      const struct panthor_coredump_csg_state *csg, u32 csg_id)
+{
+	drm_printf(p, "csg%d:\n", csg_id);
+	drm_printf(p, "  GROUP_FEATURES: 0x%x\n", csg->features);
+	drm_printf(p, "  GROUP_STREAM_NUM: 0x%x\n", csg->stream_num);
+
+	drm_printf(p, "  CSG_REQ: 0x%x\n", csg->req);
+	drm_printf(p, "  CSG_ALLOW_COMPUTE: 0x%llx\n", csg->allow_compute);
+	drm_printf(p, "  CSG_ALLOW_FRAGMENT: 0x%llx\n", csg->allow_fragment);
+	drm_printf(p, "  CSG_ALLOW_OTHER: 0x%x\n", csg->allow_other);
+	drm_printf(p, "  CSG_EP_REQ: 0x%x\n", csg->ep_req);
+	drm_printf(p, "  CSG_CONFIG: 0x%x\n", csg->config);
+
+	drm_printf(p, "  CSG_ACK: 0x%x\n", csg->ack);
+	drm_printf(p, "  CSG_STATUS_EP_CURRENT: 0x%x\n",
+		   csg->status_ep_current);
+	drm_printf(p, "  CSG_STATUS_EP_REQ: 0x%x\n", csg->status_ep_req);
+	drm_printf(p, "  CSG_STATUS_STATE: 0x%x\n", csg->status_state);
+	drm_printf(p, "  CSG_RESOURCE_DEP: 0x%x\n", csg->resource_dep);
+}
+
 static void print_glb(struct drm_printer *p,
 		      const struct panthor_coredump_glb_state *glb)
 {
@@ -193,6 +217,10 @@ static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd)
 
 	if (cd->mask & PANTHOR_COREDUMP_GLB)
 		print_glb(p, &cd->glb);
+
+	if (cd->mask & PANTHOR_COREDUMP_CSG) {
+		print_csg(p, &cd->csg, cd->group.csg_id);
+	}
 }
 
 static void process_cd(struct panthor_device *ptdev,
@@ -219,6 +247,29 @@ static void process_cd(struct panthor_device *ptdev,
 	print_cd(&p, cd);
 }
 
+static void capture_csg(struct panthor_device *ptdev,
+			struct panthor_coredump_csg_state *csg, u32 csg_id)
+{
+	const struct panthor_fw_csg_iface *csg_iface =
+		panthor_fw_get_csg_iface(ptdev, csg_id);
+
+	csg->features = csg_iface->control->features;
+	csg->stream_num = csg_iface->control->stream_num;
+
+	csg->req = csg_iface->input->req;
+	csg->allow_compute = csg_iface->input->allow_compute;
+	csg->allow_fragment = csg_iface->input->allow_fragment;
+	csg->allow_other = csg_iface->input->allow_other;
+	csg->ep_req = csg_iface->input->endpoint_req;
+	csg->config = csg_iface->input->config;
+
+	csg->ack = csg_iface->output->ack;
+	csg->status_ep_current = csg_iface->output->status_endpoint_current;
+	csg->status_ep_req = csg_iface->output->status_endpoint_req;
+	csg->status_state = csg_iface->output->status_state;
+	csg->resource_dep = csg_iface->output->resource_dep;
+}
+
 static void capture_glb(struct panthor_device *ptdev,
 			struct panthor_coredump_glb_state *glb)
 {
@@ -264,6 +315,13 @@ static void capture_cd(struct panthor_device *ptdev,
 
 	capture_glb(ptdev, &cd->glb);
 	cd->mask |= PANTHOR_COREDUMP_GLB;
+
+	/* remaining states require an active group */
+	if (!group || cd->group.csg_id < 0)
+		return;
+
+	capture_csg(ptdev, &cd->csg, cd->group.csg_id);
+	cd->mask |= PANTHOR_COREDUMP_CSG;
 }
 
 static void panthor_coredump_free(void *data)
diff --git a/drivers/gpu/drm/panthor/panthor_coredump.h b/drivers/gpu/drm/panthor/panthor_coredump.h
index e578298e9b57..d965ebc545d3 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.h
+++ b/drivers/gpu/drm/panthor/panthor_coredump.h
@@ -69,6 +69,29 @@ struct panthor_coredump_glb_state {
 	u32 ack;
 };
 
+/**
+ * struct panthor_coredump_csg_state - Coredump CSG state
+ *
+ * Interesting panthor_fw_csg_iface fields.
+ */
+struct panthor_coredump_csg_state {
+	u32 features;
+	u32 stream_num;
+
+	u32 req;
+	u64 allow_compute;
+	u64 allow_fragment;
+	u32 allow_other;
+	u32 ep_req;
+	u32 config;
+
+	u32 ack;
+	u32 status_ep_current;
+	u32 status_ep_req;
+	u32 status_state;
+	u32 resource_dep;
+};
+
 #ifdef CONFIG_DEV_COREDUMP
 
 struct panthor_coredump *
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a9fd71fa984b..504fc097ebfe 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3681,6 +3681,19 @@ static void panthor_sched_coredump_locked(struct panthor_device *ptdev,
 
 	pm_active = pm_runtime_get_if_active(ptdev->base.dev);
 
+	/* force a CSG_STATUS_UPDATE */
+	if (pm_active && group && group->csg_id >= 0) {
+		struct panthor_fw_csg_iface *csg_iface;
+		u32 acked;
+
+		csg_iface = panthor_fw_get_csg_iface(ptdev, group->csg_id);
+
+		panthor_fw_toggle_reqs(csg_iface, req, ack, CSG_STATUS_UPDATE);
+		panthor_fw_ring_csg_doorbells(ptdev, BIT(group->csg_id));
+		panthor_fw_csg_wait_acks(ptdev, group->csg_id,
+					 CSG_STATUS_UPDATE, &acked, 100);
+	}
+
 	panthor_coredump_capture(cd, group);
 
 	if (pm_active == 1)
-- 
2.50.0.727.gbf7dc18ff4-goog

