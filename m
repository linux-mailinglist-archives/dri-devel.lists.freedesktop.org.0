Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A348CD7B2
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 17:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A7010E936;
	Thu, 23 May 2024 15:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGXAzZyw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3537210E934;
 Thu, 23 May 2024 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716479481; x=1748015481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFEqUVe6krk9OGtuAsBTyaSZZ/QIyp0OxOs/kRFPd2Q=;
 b=LGXAzZywLjnC6S83i0AuWSkF1EZL5j+WkxEmdZUiYUHOiHce/cJnnIVt
 EhCjYd76V9BDs5LsJTPq++9uMugtpBWWSRAQ8UNF5q63jjMsS1xRD5F5Q
 blECR/qL5DBZZlsTkMoHdrWhFdyBHpFDKmLgjEzNVG6NIvUiI5Wfez8TO
 wkFiZo4HLH1h2+usVU48fAXcJGBAMYkKDwQzj6Ngo7eXJlmeyjRHLM4xI
 lhVDJehB6DDUhtX/hVLswvbhgmGkeMK1Yhq6w7zoRNsbKvDtySx3feqqb
 B4imbPtmi9pDrFqTHIzxaegQ8Kzf4MebdND0yhMQMoypF+dLWEaU5J9HE g==;
X-CSE-ConnectionGUID: tu27MIc/S7KI9R4Pwdgd8w==
X-CSE-MsgGUID: 8PkIA6tZS3qidM5yuK965Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12982295"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12982295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:51:21 -0700
X-CSE-ConnectionGUID: hNSDpPw8Q12d8KM0nWxpHQ==
X-CSE-MsgGUID: GDJ3T2FGRTuYefEhWUQ1eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="38556335"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:51:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: fix -Wformat-truncation warning in
 amdgpu_gfx_kiq_init_ring()
Date: Thu, 23 May 2024 18:51:06 +0300
Message-Id: <4b9ca4a1bd8e77f2d9b912b4af5d4fbdec13e801.1716479340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716479340.git.jani.nikula@intel.com>
References: <cover.1716479340.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Enabling -Wformat-truncation yields the following warning:

../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function ‘amdgpu_gfx_kiq_init_ring’:
../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 8 [-Werror=format-truncation=]
  332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
      |                                                             ^~
../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:50: note: directive argument in the range [0, 2147483647]
  332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
      |                                                  ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:9: note: ‘snprintf’ output between 12 and 41 bytes into a destination of size 16
  332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  333 |                  xcc_id, ring->me, ring->pipe, ring->queue);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Silence the warning by checking the snprintf() return value.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 1d955652f3ba..92744d0d2c10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -329,8 +329,10 @@ int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *adev, int xcc_id)
 
 	ring->eop_gpu_addr = kiq->eop_gpu_addr;
 	ring->no_scheduler = true;
-	snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
-		 xcc_id, ring->me, ring->pipe, ring->queue);
+	r = snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
+		     xcc_id, ring->me, ring->pipe, ring->queue);
+	if (r >= sizeof(ring->name))
+		dev_warn(adev->dev, "kiq ring name truncated\n");
 	r = amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_DRIVER0,
 			     AMDGPU_RING_PRIO_DEFAULT, NULL);
 	if (r)
-- 
2.39.2

