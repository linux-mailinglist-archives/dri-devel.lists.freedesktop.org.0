Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D6829F5B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D71910E799;
	Wed, 10 Jan 2024 17:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669A610E787;
 Wed, 10 Jan 2024 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704908379; x=1736444379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ykZ03P15HHHdtkAazjV4WJ0Unrb8VCy2usHG2O8G+Q=;
 b=bf49bykl49wW4h+p/BAed8A+74vGoozZ3i/Qr2/w9ZwZQ5Lx1tnZmtV8
 MQ4ui6iq0yU135ISEEGiXN4KzQ4RqX8G+vUib0pvAc4RlyiOGxPz5rLB6
 p3m8N53/txGVr0UxBUaaUy+TEqMAHQ88SLZcVp5UDvrahRtTfacJK8m3s
 QM4Ho/n+zFonc8UR8si0qNnWooIzMzDNJL0/aIZx1byT1Ae/yggWyFGn1
 5bbK6T4nGl1BcTDyvPIQN5aKVi7wlJS6PQMCOfFh0ChmJ5bCT+jAsPi0e
 mQ8yO9B7OOveme04E6I0AVRXg8abS0+D9G+eMpeLU1NCQsV0uAEG6oVZJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389029350"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389029350"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="785675954"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="785675954"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.36.240])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amdgpu: prefer snprintf over sprintf
Date: Wed, 10 Jan 2024 19:39:13 +0200
Message-Id: <fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704908087.git.jani.nikula@intel.com>
References: <cover.1704908087.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
	Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will trade the W=1 warning -Wformat-overflow to
-Wformat-truncation. This lets us enable -Wformat-overflow subsystem
wide.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index b9674c57c436..82b4b2019fca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -329,7 +329,8 @@ int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *adev,
 
 	ring->eop_gpu_addr = kiq->eop_gpu_addr;
 	ring->no_scheduler = true;
-	sprintf(ring->name, "kiq_%d.%d.%d.%d", xcc_id, ring->me, ring->pipe, ring->queue);
+	snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
+		 xcc_id, ring->me, ring->pipe, ring->queue);
 	r = amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_DRIVER0,
 			     AMDGPU_RING_PRIO_DEFAULT, NULL);
 	if (r)
-- 
2.39.2

