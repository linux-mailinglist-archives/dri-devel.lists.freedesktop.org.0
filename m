Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF0DA1B023
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5877410E8F0;
	Fri, 24 Jan 2025 05:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0il5SEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B53710E8E7;
 Fri, 24 Jan 2025 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737698009; x=1769234009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkfhQENhe98sC7gL83N/N2s0DhaAshkzCOBwZR2Y0Fc=;
 b=i0il5SEqPRricJ5cDzjhbqBpjTrw+BgTexASd3L1nkYukkK2hs+8fx3L
 ScP2KfrFbRUSVtjAVxLBEKYHIiCkum5IBJBaZ+NGRnCM4PK6DKiJFQ1JN
 7awuNkVZOAQsksjNrB3vIEs8podBHTX396J0KpOt6V0qFQnR0liIHnXzW
 LQ5lq9NuNcopOy6gSkV/yKclweOzcbYal21kTPCxwkXt3Voeo+PT+BPRU
 JPGXTJNZJKmGnesa5SzTEyUVkkM7gULcWJrpSaM/EK+F9KeFQlHpGyD+T
 53qfB+IkucUSjopZl/koTYYELOVSLYP7nltGw/oU4zyaOokBsxh5+ck/y A==;
X-CSE-ConnectionGUID: CPiAonsQR+eba43AnO85sQ==
X-CSE-MsgGUID: qPtlun8aQRutCSQYmpsGYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="60689227"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="60689227"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:53:29 -0800
X-CSE-ConnectionGUID: /DowfK/2TEyF38Qs00hzqQ==
X-CSE-MsgGUID: ahzXhuApSpKssBSaM9uOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="108218854"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 21:53:22 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, michal.wajdeczko@intel.com,
 christian.koenig@amd.com, xaver.hugl@kde.org
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 lina@asahilina.net, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Subject: [PATCH v11 5/5] drm/amdgpu: Use device wedged event
Date: Fri, 24 Jan 2025 11:23:00 +0530
Message-Id: <20250124055300.1111274-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124055300.1111274-1-raag.jadav@intel.com>
References: <20250124055300.1111274-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: André Almeida <andrealmeid@igalia.com>

Use DRM's device wedged event to notify userspace that a reset had
happened. For now, only use `none` method meant for telemetry
capture.

In the future we might want to report a recovery method if the reset didn't
succeed.

Acked-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 36053b3d48b3..83bc7f9faff1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6116,6 +6116,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
 
 	atomic_set(&adev->reset_domain->reset_res, r);
+
+	if (!r)
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
+
 	return r;
 }
 
-- 
2.34.1

