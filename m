Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC8C2CEE8
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAB210E432;
	Mon,  3 Nov 2025 15:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="SXFu9WNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72F710E430
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:58:01 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-475d9de970eso30884015e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762185480; x=1762790280; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lG7NrqQN35AJ0Wq7ouL8uMkG/dwt+C79zv693rtI1Go=;
 b=SXFu9WNTEO4RVFyXdJPp8/FIVaUai7M747LbTJjpivbQkgC7Bl5QM6xIsa7w9YF/I6
 gCIRnu08crD3L4LI6Zji272IyJH/POGgG5TMdhP+n0UKS2Z7JvdX7Y1tlTlcaiv3a7Z+
 hxj3uV/mgC7A0App4Es0g5zIKt9nM2UeRJ/cAubu8iLsKrGzQ4jkFp4G6suCmQ/WrVvs
 dudk+uZah3v3DjZwpWICFXZ8SCDo/3lyfJ4N/7SCitu0R1w549dASKwJRyHbGpYvb0z/
 jvGZgLBGkx/yhIZVR4WPy5RDT5r/St0v4HzbalroHA489hZYAa+uZihSCffYWFuHhOds
 dabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762185480; x=1762790280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lG7NrqQN35AJ0Wq7ouL8uMkG/dwt+C79zv693rtI1Go=;
 b=uVKvDEYfytGfBPyzSpsMLiGeQkne+xPlBGZIsv8sN/SyYIvwYGFzyRcYNEynrKzFg0
 DJHF+ojDHL94c5LQQzfm+R6vV3rm3MGZn/Z0wI7cwKbRmO0OrrZpsbzXKjcYHjTDaBUq
 +O5zYUiGfwuvaURvs1x1lkGpuBupIZ9PqaIbuarNGdbVhM9louBa8upivJJOHsrrP1LN
 f2u6cXSRzay8GdAsujB/1dI5REKtFnipsBounCoGvFTndZHQ/USmvHcsodbCKJn/zjHB
 e4RpA/reR6Tvxx23SzsC4O5vSGPU4Y9HwVBwjj6o+9D7sZN6jNi5s7eNGLxbiHcKCaHI
 cyxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBnfgiPiJBWcNph9TWGv9Goe4l4BR4xzpe0AQaAhk5jjrP6qKe+8Z5U0VVslBv0gLNsXVGJ0WqV+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA3nvXJgQDQB0NgHpB2LD0dak+3reQlkFHQTFcKXTHkXvu4C8v
 10WTB1qx3yvOv7ZtLaIp0pRAYDH/u6uqgT2o83BIUuXmvvmmv10i4dAW6C2QTCs6rY8=
X-Gm-Gg: ASbGncs0EDFP3UbHWQO4mhT2AlWgBCWFClUj+NTExJvRZpp1/Xkhyyxaf3DC48PlDva
 7O1nTXVwQLZDq/dY0WjgCLgEzZmkL8QIe4EbeouAc7dKRxruD2Y5DMK1hVBLP9Vs3aDsKdpJADn
 OkJoeOTXAErbQPbzSgU17al4jQDJC2pAIAvng0uwIgX1Nb9NUcHIvn40OU4f+J4cnJAWvmNfbwp
 KEH4X7BUqIkFxVX9wHD7TVMjHpJ3YZ8dhFTrnVdptcMoprY3FUk1YB9Pcd1q/RIvAVK283/BLx9
 wwBMg/fMzpy+B+3IiTedFN0fXHwSVMKlfjS/9xRIZObuSxx5hpSb/GoXRX8B8UvYIoCUOi7FfN6
 RNQ82BITC8W+lTUpiDcVHGRP/wqOqHpD5iJWX0fh1eY0YvthKKqpVWk88KKKL2wGuE+zxYdbkF8
 OfcqyVduBTqMhG8HyngmLKc5o56AwnWbSA3DE=
X-Google-Smtp-Source: AGHT+IEYB4RcO6/T/F6GdUJRGz5Gj8k/fCh8UC0fYenTSuHKZJgZ81fKWDHYEdBWnPyUSDcJxcdkUw==
X-Received: by 2002:a05:600c:4f0b:b0:46e:4783:1a7a with SMTP id
 5b1f17b1804b1-47730793c43mr123205675e9.3.1762185480364; 
 Mon, 03 Nov 2025 07:58:00 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47754adcd08sm48245e9.5.2025.11.03.07.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 07:58:00 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <yangp@amd.com>
Subject: [PATCH v2 1/4] drm/amdgpu: replace use of system_unbound_wq with
 system_dfl_wq
Date: Mon,  3 Nov 2025 16:57:37 +0100
Message-ID: <20251103155740.250398-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103155740.250398-1-marco.crivellari@suse.com>
References: <20251103155740.250398-1-marco.crivellari@suse.com>
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

This lack of consistency cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

The above change introduced in the Workqueue API has been introduced by:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/amd/amdgpu/aldebaran.c     | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
index 9569dc16dd3d..7957e6c4c416 100644
--- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
@@ -175,7 +175,7 @@ aldebaran_mode2_perform_reset(struct amdgpu_reset_control *reset_ctl,
 	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
 		/* For XGMI run all resets in parallel to speed up the process */
 		if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-			if (!queue_work(system_unbound_wq,
+			if (!queue_work(system_dfl_wq,
 					&tmp_adev->reset_cntl->reset_work))
 				r = -EALREADY;
 		} else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3d032c4e2dce..041ee35684ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6040,7 +6040,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
 			/* For XGMI run all resets in parallel to speed up the process */
 			if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-				if (!queue_work(system_unbound_wq,
+				if (!queue_work(system_dfl_wq,
 						&tmp_adev->xgmi_reset_work))
 					r = -EALREADY;
 			} else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 28c4ad62f50e..9c4631608526 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -116,7 +116,7 @@ static int amdgpu_reset_xgmi_reset_on_init_perform_reset(
 	/* Mode1 reset needs to be triggered on all devices together */
 	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
 		/* For XGMI run all resets in parallel to speed up the process */
-		if (!queue_work(system_unbound_wq, &tmp_adev->xgmi_reset_work))
+		if (!queue_work(system_dfl_wq, &tmp_adev->xgmi_reset_work))
 			r = -EALREADY;
 		if (r) {
 			dev_err(tmp_adev->dev,
-- 
2.51.1

