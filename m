Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515F4D29A2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 08:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE7310E430;
	Wed,  9 Mar 2022 07:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D217710E301;
 Tue,  8 Mar 2022 18:04:14 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b24so2952134edu.10;
 Tue, 08 Mar 2022 10:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CgVekysIXZ1S8meBW6/yNZcDjCeuZzyIgdzrSYWDMac=;
 b=EZscrbA5uhtAe8xlUkyQFkZAlFYKwphWC0JQyawG7kzHmnzVtj9EiNi2S1WZRtVrsl
 e3jBAKZy0RFr/NzZPy6L/wkOGs3+q3nSbLjfjq0c2o14DOO3B+V8lgOMkbvaXhgccKl1
 K5eQecp9y9npb9ngn7zM1z+0mxUruEqRjSyKPoJEIkMkswTX2FL2aD3qmKY3hVmAWCuW
 lYZHI7J7yoEItVx5Rwx9XdG2f+grPb4LcdI0q6nd/qd7kBmUHg0IW6vaX8sb5l86wUoO
 LlGLqff7960fwFH0e1tdrwuvFV/LbSLEETxe875DNkABH87IWiylcBLdcWRwjOAZAF8q
 ed9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CgVekysIXZ1S8meBW6/yNZcDjCeuZzyIgdzrSYWDMac=;
 b=lXA/P3I7s/kzcBUdCAM5N+5D8XRhZ6RgeTAZXVkM10J31x4/Aq0Dz+hDPu4uZwYd3x
 zRZmK1vdsuN9KyB2l3C6kgY01Pr2RZWMPnlGiMIqAwkXzI0DEhKfXAx9lC2uFiTdN0OL
 fqCOjmaiCoJ+HuaCj7PUovosKf/rT6OR7/dbJRYO8tNqGSL3EIRFz1QwQaWU5IiID6+u
 TCyYOqY4Rs9hJfSu5x1yun2oo8GiZT9jNXKWINspPoia0kkvLyGMnz47JhqsjyOLgRB2
 pfOW6zJgWFYK9gJwwY8Jy/pR8E8v0FKm5kyDHmzyCZPUkOF9HcVN8AQbj0twjTJedxwS
 XSAw==
X-Gm-Message-State: AOAM533zEZQsXt9JVFefqxj9w0xy22ozQSLbGlTouhNmmdRLT6tZuLqH
 P2rfoSNBYeA7TSykeZ8xjNx4rs8LGkgWZ8ltB6dPhw==
X-Google-Smtp-Source: ABdhPJwiVoVjSum77dfzb8yIqZzUHAIM5Q1YVKWlS28TmmFWZ0Q9xpTLCIYScDMXVnjsUSPtnyzf2A==
X-Received: by 2002:a50:9fe1:0:b0:416:a97:e962 with SMTP id
 c88-20020a509fe1000000b004160a97e962mr17553537edf.315.1646762652958; 
 Tue, 08 Mar 2022 10:04:12 -0800 (PST)
Received: from shashanks-buildpc.amd.com
 (ip5f5bf208.dynamic.kabel-deutschland.de. [95.91.242.8])
 by smtp.gmail.com with ESMTPSA id
 fx3-20020a170906b74300b006daecedee44sm4515985ejb.220.2022.03.08.10.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:04:12 -0800 (PST)
From: Shashank Sharma <contactshashanksharma@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/amdgpu: add work function for GPU reset event
Date: Tue,  8 Mar 2022 19:04:03 +0100
Message-Id: <20220308180403.75566-2-contactshashanksharma@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220308180403.75566-1-contactshashanksharma@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Mar 2022 07:40:04 +0000
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
Cc: Alexander Deucher <alexander.deucher@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shashank Sharma <shashank.sharma@amd.com>

This patch adds a work function, which sends a GPU reset
uevent and some contextual infomration, like the PID and
some status flags. This work should be scheduled during
a GPU reset.

The userspace can do some recovery and post-processing work
based on this event and information.

V2: Addressed review comments from Christian
- Changed the name of the work to gpu_reset_event_work
- Added a structure to accommodate some additional information
  (like a PID and some flags)
- Do not add new structure in amdgpu.h

Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Amaranath Somalapuram <amaranath.somalapuram@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d8b854fcbffa..6a97c585bdfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -61,6 +61,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/gpu_scheduler.h>
+#include <drm/drm_sysfs.h>
 
 #include <kgd_kfd_interface.h>
 #include "dm_pp_interface.h"
@@ -813,6 +814,7 @@ struct amd_powerplay {
 #define AMDGPU_RESET_MAGIC_NUM 64
 #define AMDGPU_MAX_DF_PERFMONS 4
 #define AMDGPU_PRODUCT_NAME_LEN 64
+
 struct amdgpu_device {
 	struct device			*dev;
 	struct pci_dev			*pdev;
@@ -1063,6 +1065,7 @@ struct amdgpu_device {
 
 	int asic_reset_res;
 	struct work_struct		xgmi_reset_work;
+	struct work_struct		gpu_reset_event_work;
 	struct list_head		reset_list;
 
 	long				gfx_timeout;
@@ -1097,6 +1100,7 @@ struct amdgpu_device {
 	pci_channel_state_t		pci_channel_state;
 
 	struct amdgpu_reset_control     *reset_cntl;
+	struct drm_reset_event		reset_event_info;
 	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
 
 	bool				ram_is_direct_mapped;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ed077de426d9..1aef07fd0dff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -73,6 +73,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_sysfs.h>
 
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
@@ -3277,6 +3278,17 @@ bool amdgpu_device_has_dc_support(struct amdgpu_device *adev)
 	return amdgpu_device_asic_has_dc_support(adev->asic_type);
 }
 
+static void amdgpu_device_reset_event_func(struct work_struct *__work)
+{
+	struct amdgpu_device *adev = container_of(__work, struct amdgpu_device,
+						  gpu_reset_event_work);
+	/*
+	 * A GPU reset has happened, inform the userspace and pass the
+	 * reset related information.
+	 */
+	drm_sysfs_reset_event(&adev->ddev, &adev->reset_event_info);
+}
+
 static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 {
 	struct amdgpu_device *adev =
@@ -3525,6 +3537,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			  amdgpu_device_delay_enable_gfx_off);
 
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
+	INIT_WORK(&adev->gpu_reset_event_work, amdgpu_device_reset_event_func);
 
 	adev->gfx.gfx_off_req_count = 1;
 	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
-- 
2.32.0

