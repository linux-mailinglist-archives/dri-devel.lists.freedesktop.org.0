Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605A9B16CA6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953FA10E718;
	Thu, 31 Jul 2025 07:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LYFKgB32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA3810E702;
 Thu, 31 Jul 2025 05:36:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso265860f8f.1; 
 Wed, 30 Jul 2025 22:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753940210; x=1754545010; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c1dd0Ga2iTCujV4ta9gqgLx9Y4mluBxA0AcKr2gNUmQ=;
 b=LYFKgB32r4n/ypTJVElUxt8NzhZ86zOmT6XDEHjhtnviLj10ukKtJAHSTmjDkjT6E+
 D8/hrEURRSc/HJ2YCRp4+QqVQGmT2/JjdAAKRB7c+d2M0IuHqAjtunMXYF47a2L3Ey+2
 1BHMcJJ8FyHzzTG7+2/jTJ5xnElJ/q8Zi9TX89spKfC+O2idRGXpt4tEnx/AIseW2z2F
 hpcA4zYz271Y/n9iGG6z2tzBPH0UXNsGg9kGwTe1RBL7Uc0tm9eMlh4gRCWnR8yAvjmG
 T7VimEOHMOVkL5wj5XbdGbex9159eOSbpzdLIt98735mYpJaYs5lQ8PW6fB1VXgwBJTZ
 7yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753940210; x=1754545010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1dd0Ga2iTCujV4ta9gqgLx9Y4mluBxA0AcKr2gNUmQ=;
 b=knt/Gj6IeknNZC4u2vZAPsFsMmq0fsi835QvmjFSPl1l6LqlTU2RnpKrG7L2YGvaMT
 yUJzlS56p4e5zyi6WjdlVTBYRLGQrhMnkBL4UMBXGez7bWUjGtPEl2iopVXWcxPLo0UE
 Fdde9H5x/pxG5SeS6cdi8X0w2EHecplcoWsT14KuU5tDZbqT+V/U2aEWlqvEkXlrVLdf
 +4rLiaZCFCtQLK7x5eUCjYeDG15vZxUEfX3Km5T/V7YYotzY98cFJhwU/6uP3/tMikOQ
 PEs2gRXUQv1z+g1vxRjDZqcbiBGOQqAO2HjaNylnIR3o0knRKec3cKNqlVnTjX43cpkT
 M6+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Nb8iRO7myWRNnJXJucT77GRdnPcoG/fKMUKeGfBsG70ZmBmMY3KopsMZ+A/MnTtczGUUuFBCBk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ2X14AMpK99O5W4mlHwwPZOKfHumIbTaRjZJlaza0zYh6ARho
 AMKrANbChmuHrtVdb/+R+sowz2uaI+I6/zgXV2ViC+yqdRKB9MYL47Qq
X-Gm-Gg: ASbGncv59wwTHwLUvxcPt/FfdLoVNvUDcwzo9+y1RN+Oa3XXIjyPp3F67NvYzeQGKlq
 GafndNQVulYKyZg4/nqflzWDR2fTkKKIBhVMwxlBjEJcTad25ExA2rlTypvRo/RlQHOerwVfqvj
 SSLtY/WHyLDsTNWjDXKIbxUE+OLYIGzJhlnUi14wm2sMdljLWn9ffFM+GRcLQmtl5K5r+ORmYhy
 09HGwC2aWhQC8hj/itZjIDiF/Uk99/0k8bJ85rxBZ/36GO3cUL8CJxnYC9omb0SWGUXsL2CzGIQ
 lMrZECxKazCrCHkydSeiMMqy1g/4hTspj0quNExpEzhPyFKJ13RhgBMw2qaOgKp0MqWsoE8YOwY
 vfbJIgu3u0yENG4zn9eNJ1uUClCzpmpKlOoCHhqoVoBmhUKD6fXcggASM43u/
X-Google-Smtp-Source: AGHT+IGlIhfe1+ha/9LeqXoxdlGCP3fC0KLx/czzY6T8qRlm4KfCZ4cgQx6QeotUnn1aepuzecDbCQ==
X-Received: by 2002:a05:6000:288a:b0:3b7:9477:f4ad with SMTP id
 ffacd0b85a97d-3b794fe92c2mr4075356f8f.36.1753940209428; 
 Wed, 30 Jul 2025 22:36:49 -0700 (PDT)
Received: from [192.168.1.205]
 (dynamic-176-005-138-071.176.5.pool.telefonica.de. [176.5.138.71])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac093sm1149137f8f.9.2025.07.30.22.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 22:36:48 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
Date: Thu, 31 Jul 2025 07:36:37 +0200
Subject: [PATCH RFC 4/6] drm/amdgpu: don't wake up the GPU for some
 AMDGPU_INFO queries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-b4-dont-wake-next-v1-4-e51bdc347fa3@gmail.com>
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
In-Reply-To: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Philipp Zabel <philipp.zabel@gmail.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Mailman-Approved-At: Thu, 31 Jul 2025 07:23:44 +0000
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

Don't wake the GPU if the AMDGPU_INFO query doesn't need to power up the
GPU.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 59 +++++++++++++++++++++++++++------
 2 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 732f398922da5..79d31ac6a7b37 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2961,6 +2961,7 @@ static const unsigned int no_wake_ioctl_list[] = {
 	DRM_IOCTL_MODE_LIST_LESSEES,
 	DRM_IOCTL_MODE_GET_LEASE,
 	DRM_IOCTL_MODE_REVOKE_LEASE,
+	DRM_IOCTL_AMDGPU_INFO,
 };
 
 long amdgpu_drm_ioctl(struct file *filp,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 190602bacbcdf..fe1347a4075c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -732,7 +732,17 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		return copy_to_user(out, &count, min(size, 4u)) ? -EFAULT : 0;
 	}
 	case AMDGPU_INFO_TIMESTAMP:
+		ret = pm_runtime_get_sync(dev->dev);
+		if (ret < 0) {
+			pm_runtime_put_autosuspend(dev->dev);
+			return ret;
+		}
+
 		ui64 = amdgpu_gfx_get_gpu_clock_counter(adev);
+
+		pm_runtime_mark_last_busy(dev->dev);
+		pm_runtime_put_autosuspend(dev->dev);
+
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_FW_VERSION: {
 		struct drm_amdgpu_info_firmware fw_info;
@@ -873,6 +883,12 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 
 		alloc_size = info->read_mmr_reg.count * sizeof(*regs);
 
+		ret = pm_runtime_get_sync(dev->dev);
+		if (ret < 0) {
+			pm_runtime_put_autosuspend(dev->dev);
+			goto out;
+		}
+
 		amdgpu_gfx_off_ctrl(adev, false);
 		for (i = 0; i < info->read_mmr_reg.count; i++) {
 			if (amdgpu_asic_read_register(adev, se_num, sh_num,
@@ -882,11 +898,16 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 					      info->read_mmr_reg.dword_offset + i);
 				kfree(regs);
 				amdgpu_gfx_off_ctrl(adev, true);
+				pm_runtime_mark_last_busy(dev->dev);
+				pm_runtime_put_autosuspend(dev->dev);
 				ret = -EFAULT;
 				goto out;
 			}
 		}
 		amdgpu_gfx_off_ctrl(adev, true);
+		pm_runtime_mark_last_busy(dev->dev);
+		pm_runtime_put_autosuspend(dev->dev);
+
 		n = copy_to_user(out, regs, min(size, alloc_size));
 		kfree(regs);
 		ret = (n ? -EFAULT : 0);
@@ -912,7 +933,8 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
 		/* return all clocks in KHz */
 		dev_info->gpu_counter_freq = adev->clock.xclk * 10;
-		if (adev->pm.dpm_enabled) {
+		ret = pm_runtime_get_if_active(dev->dev);
+		if (ret == 1 && adev->pm.dpm_enabled) {
 			dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
 			dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
 			dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
@@ -925,6 +947,10 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 				dev_info->min_memory_clock =
 					adev->clock.default_mclk * 10;
 		}
+		if (ret == 1) {
+			pm_runtime_mark_last_busy(dev->dev);
+			pm_runtime_put_autosuspend(dev->dev);
+		}
 		dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
 		dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
 			adev->gfx.config.max_shader_engines;
@@ -1125,13 +1151,19 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		if (!adev->pm.dpm_enabled)
 			return -ENOENT;
 
+		ret = pm_runtime_get_sync(dev->dev);
+		if (ret < 0) {
+			pm_runtime_put_autosuspend(dev->dev);
+			return ret;
+		}
+
 		switch (info->sensor_info.type) {
 		case AMDGPU_INFO_SENSOR_GFX_SCLK:
 			/* get sclk in Mhz */
 			if (amdgpu_dpm_read_sensor(adev,
 						   AMDGPU_PP_SENSOR_GFX_SCLK,
 						   (void *)&ui32, &ui32_size)) {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 			ui32 /= 100;
 			break;
@@ -1140,7 +1172,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			if (amdgpu_dpm_read_sensor(adev,
 						   AMDGPU_PP_SENSOR_GFX_MCLK,
 						   (void *)&ui32, &ui32_size)) {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 			ui32 /= 100;
 			break;
@@ -1149,7 +1181,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			if (amdgpu_dpm_read_sensor(adev,
 						   AMDGPU_PP_SENSOR_GPU_TEMP,
 						   (void *)&ui32, &ui32_size)) {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 			break;
 		case AMDGPU_INFO_SENSOR_GPU_LOAD:
@@ -1157,7 +1189,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			if (amdgpu_dpm_read_sensor(adev,
 						   AMDGPU_PP_SENSOR_GPU_LOAD,
 						   (void *)&ui32, &ui32_size)) {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 			break;
 		case AMDGPU_INFO_SENSOR_GPU_AVG_POWER:
@@ -1169,7 +1201,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 				if (amdgpu_dpm_read_sensor(adev,
 							   AMDGPU_PP_SENSOR_GPU_INPUT_POWER,
 							   (void *)&ui32, &ui32_size)) {
-					return -EINVAL;
+					ret = -EINVAL;
 				}
 			}
 			ui32 >>= 8;
@@ -1188,7 +1220,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			if (amdgpu_dpm_read_sensor(adev,
 						   AMDGPU_PP_SENSOR_VDDNB,
 						   (void *)&ui32, &ui32_size)) {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 			break;
 		case AMDGPU_INFO_SENSOR_VDDGFX:
@@ -1196,7 +1228,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			if (amdgpu_dpm_read_sensor(adev,
 						   AMDGPU_PP_SENSOR_VDDGFX,
 						   (void *)&ui32, &ui32_size)) {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 			break;
 		case AMDGPU_INFO_SENSOR_STABLE_PSTATE_GFX_SCLK:
@@ -1204,7 +1236,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			if (amdgpu_dpm_read_sensor(adev,
 						   AMDGPU_PP_SENSOR_STABLE_PSTATE_SCLK,
 						   (void *)&ui32, &ui32_size)) {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 			ui32 /= 100;
 			break;
@@ -1213,7 +1245,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			if (amdgpu_dpm_read_sensor(adev,
 						   AMDGPU_PP_SENSOR_STABLE_PSTATE_MCLK,
 						   (void *)&ui32, &ui32_size)) {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 			ui32 /= 100;
 			break;
@@ -1238,8 +1270,13 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		default:
 			DRM_DEBUG_KMS("Invalid request %d\n",
 				      info->sensor_info.type);
-			return -EINVAL;
+			ret = -EINVAL;
+			break;
 		}
+		pm_runtime_mark_last_busy(dev->dev);
+		pm_runtime_put_autosuspend(dev->dev);
+		if (ret < 0)
+			return ret;
 		return copy_to_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
 	}
 	case AMDGPU_INFO_VRAM_LOST_COUNTER:

-- 
2.50.1

