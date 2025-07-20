Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3589B0B2D7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBF210E43F;
	Sun, 20 Jul 2025 00:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BEzd6bVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2834110E43E
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-23636167b30so29096065ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969732; x=1753574532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CVtZY+hbxyEft7E0UMwAw5SSHtVdumRHG0qI/Dby8iI=;
 b=BEzd6bVUlSrZN/9oXHq1QcsCXyqZoCcQHDu0LmdO57YeV48mDffdcxHx1P2AyasRHn
 tvWc9xU0W4cXp1JBHV/dhoN611kLeKxpxSO9UTv1AOkHJ4YQsxItoRSQWf9D0Fb3E8ue
 Cljzk4BjbjZ+EPS3aUSjsdw+KPwzrwPAbg8sncgrvQpXvMiHB0medYX9/vMF/koWpL5D
 1c915pgzGX3HMqvcLwjcTI1OxNCNJh5nPu3x2gHLW/70I0BLkLdbyC3vEG2uPOMfAksk
 UaXwEKc45mGPzpZbIGe+FaJQbMf6sy8Cs5x2/1LHkLWRQT0MXrDUnmshi0D6dqkWzntj
 wXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969732; x=1753574532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVtZY+hbxyEft7E0UMwAw5SSHtVdumRHG0qI/Dby8iI=;
 b=NQ+RmPAKCOoPNli1eeis4obx8AcAm7xqmeUoQ+LJGHgyTQUz9zqlTGvsXm6bLF2zZq
 YvT+Uys4HIoopXz1EG4FWMmDsy1bWp7FfhqPMxo8l/8wOUHCJIeGyHl7Fjkpu65vTVAk
 xdIoTWXaQlmsiM3F+A2TDUpcFAGIcneDZ4WXpEaIEelwBh7Nu6l1x5/5WnG8ODBxs+vS
 sPDUQkZDICTTBDAu/eR1QErMu0mqSfo3l1xnLVzKnQbpuGM0idI4Y0uVpN6p1PB0ft6U
 9g4xKg25huKx6lZ56xZO0eitfr7SIIweDi4O622mNQdIFFmcgwCMDxFtoaFF0Wh2+KDd
 fqsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGk/6MtwqwMq6VqHRbHPQdGUmXXePwv2Pdlz1Z8svtNhvxKOs+7htGF6nlcTngQSwYqQyEaQ/ZWYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnKzNCVFK7Q+nMcAWu8S2TLpzPnc7FmNN81xhMy7QiS1HXyj76
 fY2c7SlF9OGn5bxLerYEatU8Ns/onx7ggckfvyGxpzeroAc9yMsrSb+v
X-Gm-Gg: ASbGncsHJzL64jx6mDtjW3Ky1rB5VYWhXgEXdKIM6sd7j/PzCTyta47CBTm3VgaWKQO
 jr9j+y1GqszoATROgpK+hXU1Uz4f2Cio9HSTJl0f/kNSdxWWk8a+aJhtL85N/me+hVFVYYCQ83Y
 zY/93ovTizsQzaq7Kd/L3LNY/ZzmusA1lctKwV3+tBWRlnuitd+oyLsVwBW035DJXdX9Hk+qtso
 z1V+hyvfvDkoFfA0utWuhQB15zLpz2RPwsG9z61y9qmpZme0UsCKKgo1pHYzwt3YM5vpISxqWAb
 3pOQBgjEtbihga3658Py5/AaAeZeGHwTJRussv7ZxBBX5ZDpBbP7MwzjO49LSuSjDNJJLpY0ywa
 3tS26nk0glmzJzxCnbiObdIIHrWqF0d6RyqmcuxYtpbazt01GdppSY0lW31YsbmU=
X-Google-Smtp-Source: AGHT+IE3g0H2IGEty7OhpxZ667vS3887RUste0udZafjm+IR47P3+I/iGpe0nwovRH288hXuWM64KA==
X-Received: by 2002:a17:903:acb:b0:215:8d49:e2a7 with SMTP id
 d9443c01a7336-23e25791562mr203157935ad.50.1752969731631; 
 Sat, 19 Jul 2025 17:02:11 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23e3b6d672asm33905825ad.178.2025.07.19.17.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:11 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/panthor: capture CS state for devcoredump
Date: Sat, 19 Jul 2025 17:01:42 -0700
Message-ID: <20250720000146.1405060-6-olvaffe@gmail.com>
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

Capture interesting panthor_fw_cs_iface, panthor_fw_ringbuf_input_iface,
and panthor_fw_ringbuf_output_iface fields for devcoredump.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_coredump.c | 79 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_coredump.h | 32 +++++++++
 drivers/gpu/drm/panthor/panthor_sched.c    | 11 +++
 drivers/gpu/drm/panthor/panthor_sched.h    |  7 ++
 4 files changed, 129 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
index e08bd33b3554..60d651a8468a 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.c
+++ b/drivers/gpu/drm/panthor/panthor_coredump.c
@@ -25,6 +25,7 @@ enum panthor_coredump_mask {
 	PANTHOR_COREDUMP_GPU = BIT(1),
 	PANTHOR_COREDUMP_GLB = BIT(2),
 	PANTHOR_COREDUMP_CSG = BIT(3),
+	PANTHOR_COREDUMP_CS = BIT(4),
 };
 
 /**
@@ -55,6 +56,7 @@ struct panthor_coredump {
 	struct panthor_coredump_gpu_state gpu;
 	struct panthor_coredump_glb_state glb;
 	struct panthor_coredump_csg_state csg;
+	struct panthor_coredump_cs_state cs[MAX_CS_PER_CSG];
 
 	/* @data: Serialized coredump data. */
 	void *data;
@@ -87,6 +89,37 @@ static const char *reason_str(enum panthor_coredump_reason reason)
 	}
 }
 
+static void print_cs(struct drm_printer *p,
+		     const struct panthor_coredump_cs_state *cs, u32 cs_id)
+{
+	drm_printf(p, "cs%d:\n", cs_id);
+	drm_printf(p, "  STREAM_FEATURES: 0x%x\n", cs->features);
+
+	drm_printf(p, "  CS_REQ: 0x%x\n", cs->req);
+	drm_printf(p, "  CS_CONFIG: 0x%x\n", cs->config);
+	drm_printf(p, "  CS_BASE: 0x%llx\n", cs->base);
+	drm_printf(p, "  CS_SIZE: 0x%x\n", cs->size);
+
+	drm_printf(p, "  CS_ACK: 0x%x\n", cs->ack);
+	drm_printf(p, "  CS_STATUS_CMD_PTR: 0x%llx\n", cs->status_cmd_ptr);
+	drm_printf(p, "  CS_STATUS_WAIT: 0x%x\n", cs->status_wait);
+	drm_printf(p, "  CS_STATUS_REQ_RESOURCE: 0x%x\n",
+		   cs->status_req_resource);
+	drm_printf(p, "  CS_STATUS_SCOREBOARDS: 0x%x\n",
+		   cs->status_scoreboards);
+	drm_printf(p, "  CS_STATUS_BLOCKED_REASON: 0x%x\n",
+		   cs->status_blocked_reason);
+	drm_printf(p, "  CS_FAULT: 0x%x\n", cs->fault);
+	drm_printf(p, "  CS_FATAL: 0x%x\n", cs->fatal);
+	drm_printf(p, "  CS_FAULT_INFO: 0x%llx\n", cs->fault_info);
+	drm_printf(p, "  CS_FATAL_INFO: 0x%llx\n", cs->fatal_info);
+
+	drm_printf(p, "  CS_INSERT: 0x%llx\n", cs->insert);
+	drm_printf(p, "  CS_EXTRACT_INIT: 0x%llx\n", cs->extract_init);
+	drm_printf(p, "  CS_EXTRACT: 0x%llx\n", cs->extract);
+	drm_printf(p, "  CS_ACTIVE: 0x%x\n", cs->active);
+}
+
 static void print_csg(struct drm_printer *p,
 		      const struct panthor_coredump_csg_state *csg, u32 csg_id)
 {
@@ -221,6 +254,11 @@ static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd)
 	if (cd->mask & PANTHOR_COREDUMP_CSG) {
 		print_csg(p, &cd->csg, cd->group.csg_id);
 	}
+
+	if (cd->mask & PANTHOR_COREDUMP_CS) {
+		for (u32 i = 0; i < cd->group.queue_count; i++)
+			print_cs(p, &cd->cs[i], i);
+	}
 }
 
 static void process_cd(struct panthor_device *ptdev,
@@ -247,6 +285,43 @@ static void process_cd(struct panthor_device *ptdev,
 	print_cd(&p, cd);
 }
 
+static void capture_cs(struct panthor_device *ptdev,
+		       struct panthor_coredump_cs_state *cs, u32 csg_id,
+		       u32 cs_id, const struct panthor_group *group)
+{
+	const struct panthor_fw_cs_iface *cs_iface =
+		panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
+	const struct panthor_fw_ringbuf_input_iface *input_iface;
+	const struct panthor_fw_ringbuf_output_iface *output_iface;
+
+	cs->features = cs_iface->control->features;
+
+	cs->req = cs_iface->input->req;
+	cs->config = cs_iface->input->config;
+	cs->base = cs_iface->input->ringbuf_base;
+	cs->size = cs_iface->input->ringbuf_size;
+
+	cs->ack = cs_iface->output->ack;
+	cs->status_cmd_ptr = cs_iface->output->status_cmd_ptr;
+	cs->status_wait = cs_iface->output->status_wait;
+	cs->status_req_resource = cs_iface->output->status_req_resource;
+	cs->status_scoreboards = cs_iface->output->status_scoreboards;
+	cs->status_blocked_reason = cs_iface->output->status_blocked_reason;
+	cs->fault = cs_iface->output->fault;
+	cs->fatal = cs_iface->output->fatal;
+	cs->fault_info = cs_iface->output->fault_info;
+	cs->fatal_info = cs_iface->output->fatal_info;
+
+	panthor_group_get_ringbuf_iface(group, cs_id, &input_iface,
+					&output_iface);
+
+	cs->insert = input_iface->insert;
+	cs->extract_init = input_iface->extract;
+
+	cs->extract = output_iface->extract;
+	cs->active = output_iface->active;
+}
+
 static void capture_csg(struct panthor_device *ptdev,
 			struct panthor_coredump_csg_state *csg, u32 csg_id)
 {
@@ -322,6 +397,10 @@ static void capture_cd(struct panthor_device *ptdev,
 
 	capture_csg(ptdev, &cd->csg, cd->group.csg_id);
 	cd->mask |= PANTHOR_COREDUMP_CSG;
+
+	for (u32 i = 0; i < cd->group.queue_count; i++)
+		capture_cs(ptdev, &cd->cs[i], cd->group.csg_id, i, group);
+	cd->mask |= PANTHOR_COREDUMP_CS;
 }
 
 static void panthor_coredump_free(void *data)
diff --git a/drivers/gpu/drm/panthor/panthor_coredump.h b/drivers/gpu/drm/panthor/panthor_coredump.h
index d965ebc545d3..44402c6142cb 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.h
+++ b/drivers/gpu/drm/panthor/panthor_coredump.h
@@ -92,6 +92,38 @@ struct panthor_coredump_csg_state {
 	u32 resource_dep;
 };
 
+/**
+ * struct panthor_coredump_cs_state - Coredump CS state
+ *
+ * Interesting panthor_fw_cs_iface, panthor_fw_ringbuf_input_iface, and
+ * panthor_fw_ringbuf_output_iface fields.
+ */
+struct panthor_coredump_cs_state {
+	u32 features;
+
+	u32 req;
+	u32 config;
+	u64 base;
+	u32 size;
+
+	u32 ack;
+	u64 status_cmd_ptr;
+	u32 status_wait;
+	u32 status_req_resource;
+	u32 status_scoreboards;
+	u32 status_blocked_reason;
+	u32 fault;
+	u32 fatal;
+	u64 fault_info;
+	u64 fatal_info;
+
+	u64 insert;
+	u64 extract_init;
+
+	u64 extract;
+	u32 active;
+};
+
 #ifdef CONFIG_DEV_COREDUMP
 
 struct panthor_coredump *
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 504fc097ebfe..4bc31c5f667d 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3715,6 +3715,17 @@ void panthor_group_capture_coredump(const struct panthor_group *group,
 	state->csg_id = group->csg_id;
 }
 
+void panthor_group_get_ringbuf_iface(
+	const struct panthor_group *group, u32 cs_id,
+	const struct panthor_fw_ringbuf_input_iface **input_iface,
+	const struct panthor_fw_ringbuf_output_iface **output_iface)
+{
+	const struct panthor_queue *queue = group->queues[cs_id];
+
+	*input_iface = queue->iface.input;
+	*output_iface = queue->iface.output;
+}
+
 int panthor_group_pool_create(struct panthor_file *pfile)
 {
 	struct panthor_group_pool *gpool;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 6c564153133e..284ba39f958a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -17,6 +17,8 @@ struct drm_panthor_queue_submit;
 struct panthor_coredump_group_state;
 struct panthor_device;
 struct panthor_file;
+struct panthor_fw_ringbuf_input_iface;
+struct panthor_fw_ringbuf_output_iface;
 struct panthor_group;
 struct panthor_group_pool;
 struct panthor_job;
@@ -31,6 +33,11 @@ int panthor_group_get_state(struct panthor_file *pfile,
 void panthor_group_capture_coredump(const struct panthor_group *group,
 				    struct panthor_coredump_group_state *state);
 
+void panthor_group_get_ringbuf_iface(
+	const struct panthor_group *group, u32 cs_id,
+	const struct panthor_fw_ringbuf_input_iface **input_iface,
+	const struct panthor_fw_ringbuf_output_iface **output_iface);
+
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
 		   u16 group_handle,
-- 
2.50.0.727.gbf7dc18ff4-goog

