Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC3A26C77
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 08:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD7C10E270;
	Tue,  4 Feb 2025 07:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsQADw0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EFE10E5A2;
 Tue,  4 Feb 2025 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738652798; x=1770188798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rsfRfKzpbhXoDDzZRegtb5+DHG79J000tMDQM8JA+OI=;
 b=HsQADw0vFr+7XnjhMkoh0wbjLwMvahDWpt2bdBEHNfB1DZVrDGJvAM3j
 PNcjYWUp9EDjzyROv8G9PjTZZwBn6GhpORQFt2Iiw0ShM5OyweQII5axY
 Qqr4HpFIqk9Q9LjjeOoCBHYuzN8ItAdBFM16zfldx7bOl3mOsDgs7jGnz
 mCPC7wWPQHT471E6apKA0E6vLeyvV4f3hgZisMJCXh0ckusoagnqowLK+
 XS0Up7cZunu9pOa1V6hCgEyG2zJJrTnUcLfhmC0/0N4Ygo159Vgfd3v9v
 5l5o5eXSrZRMsJN3B0HKutPsPyqiI0pSGWjmZzeBY2B4hfXY3eam7p5u1 g==;
X-CSE-ConnectionGUID: Ca1I9/mtThyvzPY+DXnq8A==
X-CSE-MsgGUID: Ls00zsVoRVeCzY6H5HMsRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39196945"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39196945"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 23:06:37 -0800
X-CSE-ConnectionGUID: a+EyAW2ySDC/qZ6T4sgiTw==
X-CSE-MsgGUID: 9ln74R+oQ0Khly7LQC+Czg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110974904"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 03 Feb 2025 23:06:31 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, xaver.hugl@kde.org,
 pekka.paalanen@haloniitty.fi, Raag Jadav <raag.jadav@intel.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Subject: [PATCH v12 5/5] drm/amdgpu: Use device wedged event
Date: Tue,  4 Feb 2025 12:35:28 +0530
Message-Id: <20250204070528.1919158-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204070528.1919158-1-raag.jadav@intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
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
index d100bb7a137c..9e7219bff0c2 100644
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

