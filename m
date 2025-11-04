Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92913C30AF2
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E1610E5B9;
	Tue,  4 Nov 2025 11:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="LmJOOEoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B4610E5C9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 11:13:52 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b70fb7b531cso317758666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 03:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762254831; x=1762859631; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s94GaX5ziUst06zKBktu8domBKnJPpNxJWVCWIZ+Hqs=;
 b=LmJOOEoI8z7nbvNsLSoelOFgYAFJ9vk0QW2G6eDzJ1JJd1UeqzSFvdSQMq4YI1QDqY
 tZMGd7Lk0ivPrvR3DRECnZcb/wPAmIedKgVYNBiMy5QX1YHXCgGUOHmqBVEIH4imZZcB
 jF04rmvSwYh2F+GervdlxhRz8kvU79/PRZp1HeAN6GjWrdt410uqLxkSckz4yY6LsFGb
 Nme8gC9tVOrlPvCHtr7k4m64mG2ZM4Nfd2ChUUkIgG16ZusDUxta7iOfIkiDzvWunSIL
 ofiPActsU8j0Gqnf9LxPXiwvCYTSuPM1OfLkeSpADrNEOIFOHA2cWZciznkVkt6ng+2H
 qvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762254831; x=1762859631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s94GaX5ziUst06zKBktu8domBKnJPpNxJWVCWIZ+Hqs=;
 b=m4tgzLeNRcSkSQub9mstqpGWe63KTBsFWtgWfIeTi702N7qCqt78hWd6YTsS0sE3Xj
 O1B58bZD1F452Azcv9ouWCsl57drt7ROip4U6HH/WBOh8H5e50tcNzc0BW2/6V273toW
 +Vp+/w1hi0d3jNrJ9rejZMBMqdFtSVMuj11mHuLSd+ZjxYG7272DPPUAlXThufOQQOui
 xUgekEEp4U6GPmzbVIC62MIWz2nM+fL4dJc3C5ZgDGW8dPOV2nqXHsN//qCqNBI4F1RH
 vza2R6J82Bg/ogSL9xEahcdtisnrKZCyxF2h2HHZcLH5OQihKoWG78ORGTy6qn4yFWz0
 Jqkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSwafZdYJXxzbG0kRd4Gahxf+LQGjikE/c0QKUhO3HsklOzOkfW1NjBoaK0kGpnuUYadDhE7qbgpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT3xMzE73vhUlionBgsZoBv6+t/uiGdjyCoMAXPBpBePh6lWBQ
 uBXQG63ancQHtwkeURWkrd8ibHs9EM20kZg+O0MIAQ5WgUXhQqwDTLarGbt1BVV8Dqg=
X-Gm-Gg: ASbGnctSymBcoJPqKIqihzNZzniuq2GKgUlp42OBU37n3n4ItjmQStEIhVqfBqybaz2
 By7/Pt6q5Wa+QZ8Tva02Po3dHJwem1+Gp6Q0SQUTkvRBzDqq+0F/xTJDUlvXctj0+GHpJb2QZ7Y
 ME6nuPpPwy9itJrmFMYDXDYW/Q8dro2v0vFix07A0Ffsf6s707AkZpoVProZTZvzyO9ByloCB/Q
 5vIF4dxetnwWfRac2EyJqnXIji0uIqCQEc5fEj7GczJ5uo2tg9c0WUBlONpM7pvvZNIqCQSLu5+
 jGsP6uObIFqWO08i4wRT50CE2yoanok87bwbfDCHJCdbGRzxllvU071LaF1VzK2renh1N3Rv0jT
 pxXYU259RIbqQDGOHEfUEvBmXay7enD30F0+1Q1eSDtHrwZXCFsPhbcj+47F7Gj1otToeaLp26f
 HkrxE=
X-Google-Smtp-Source: AGHT+IGIKQ0i7VCw1+VrOGOFsyW3F2C7ehcgVweuycR8D6O6/kCL/ZfipETLPXIUcsBv9LNPdQBEJA==
X-Received: by 2002:a17:907:e8e:b0:b6d:606f:2aa9 with SMTP id
 a640c23a62f3a-b70708a8b76mr1463526366b.65.1762254830678; 
 Tue, 04 Nov 2025 03:13:50 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b723fa0828dsm184236966b.50.2025.11.04.03.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 03:13:50 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/bridge: replace use of system_wq with system_percpu_wq
Date: Tue,  4 Nov 2025 12:13:39 +0100
Message-ID: <20251104111339.128685-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index a094803ba7aa..37bb8123cf9b 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2048,7 +2048,7 @@ static void it6505_start_hdcp(struct it6505 *it6505)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 	it6505_reset_hdcp(it6505);
-	queue_delayed_work(system_wq, &it6505->hdcp_work,
+	queue_delayed_work(system_percpu_wq, &it6505->hdcp_work,
 			   msecs_to_jiffies(2400));
 }
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b80ee089f880..85fa3f8a747e 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -115,7 +115,7 @@ static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
 {
 	struct tfp410 *dvi = arg;
 
-	mod_delayed_work(system_wq, &dvi->hpd_work,
+	mod_delayed_work(system_percpu_wq, &dvi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 }
 
-- 
2.51.1

