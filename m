Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E846943A03
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D823910E6F1;
	Thu,  1 Aug 2024 00:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M2UVUzbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363CD10E6F0;
 Thu,  1 Aug 2024 00:09:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 94AB76246A;
 Thu,  1 Aug 2024 00:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD33C32786;
 Thu,  1 Aug 2024 00:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722470970;
 bh=6jjm4sK46/QFBy2SuZL1kv7tKZCasavK+06W0R0S/E8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M2UVUzbCtiRimp3u3enzBIF/d+YVC1AGAZgtXzaZQNjt31so9gW8npGlfVAuUvNYh
 V61Ld+tqDr+06dap4AMeSO9cbE4akNy0lrRzmrpbzUJOZcEgTxNUdKVm7nmHZzYA9g
 lxxr2J/l43KDSVdj+zgpX7rS98IPXie8W1+YGdITbkvgm646G27W1aCn8DAolreE4o
 C+6tJMI3bK92mm5ua27a6Ot/FwTqZWpy8FmsaMZis7RU4Rwkx2crGLrLKwYk44L95f
 Jf1Ydzqw0eI0q1bwiMGoSJbEjP0XoyZtxN7c5eU7m07G+rMBG0OJOPxpkDax7jV+Kf
 mja7hf3vZkoiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, alex.hung@amd.com,
 hamza.mahfooz@amd.com, roman.li@amd.com, mario.limonciello@amd.com,
 Wayne.Lin@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 011/121] drm/amd/display: Add NULL pointer and
 OVERRUN check within amdgpu_dm irq register
Date: Wed, 31 Jul 2024 19:59:09 -0400
Message-ID: <20240801000834.3930818-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Hersen Wu <hersenxs.wu@amd.com>

[ Upstream commit 6e41709eb1d9207d88e46026baf9cc850206b374 ]

[WHY]
Coverity reports OVERRUN issues within amdgpu_dm
interrupt registers. Do not check index value before
access array. Do not check NULL pointer.

[HOW]
Add index value check for array. Add check for
pointer from amdgpu_dm_irq_register_interrupt.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 169 +++++++++++++-----
 1 file changed, 128 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3cdcadd41be1a..e9aac7f7cfdce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3561,7 +3561,7 @@ static void handle_hpd_rx_irq(void *param)
 	mutex_unlock(&aconnector->hpd_lock);
 }
 
-static void register_hpd_handlers(struct amdgpu_device *adev)
+static int register_hpd_handlers(struct amdgpu_device *adev)
 {
 	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
@@ -3573,11 +3573,17 @@ static void register_hpd_handlers(struct amdgpu_device *adev)
 	int_params.current_polarity = INTERRUPT_POLARITY_DEFAULT;
 
 	if (dc_is_dmub_outbox_supported(adev->dm.dc)) {
-		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD, dmub_hpd_callback, true))
+		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD,
+			dmub_hpd_callback, true)) {
 			DRM_ERROR("amdgpu: fail to register dmub hpd callback");
+			return -EINVAL;
+		}
 
-		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD_IRQ, dmub_hpd_callback, true))
+		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD_IRQ,
+			dmub_hpd_callback, true)) {
 			DRM_ERROR("amdgpu: fail to register dmub hpd callback");
+			return -EINVAL;
+		}
 	}
 
 	list_for_each_entry(connector,
@@ -3593,9 +3599,16 @@ static void register_hpd_handlers(struct amdgpu_device *adev)
 			int_params.int_context = INTERRUPT_LOW_IRQ_CONTEXT;
 			int_params.irq_source = dc_link->irq_source_hpd;
 
-			amdgpu_dm_irq_register_interrupt(adev, &int_params,
-					handle_hpd_irq,
-					(void *) aconnector);
+			if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+				int_params.irq_source  < DC_IRQ_SOURCE_HPD1 ||
+				int_params.irq_source  > DC_IRQ_SOURCE_HPD6) {
+				DRM_ERROR("Failed to register hpd irq!\n");
+				return -EINVAL;
+			}
+
+			if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+				handle_hpd_irq, (void *) aconnector))
+				return -ENOMEM;
 		}
 
 		if (dc_link->irq_source_hpd_rx != DC_IRQ_SOURCE_INVALID) {
@@ -3604,11 +3617,19 @@ static void register_hpd_handlers(struct amdgpu_device *adev)
 			int_params.int_context = INTERRUPT_LOW_IRQ_CONTEXT;
 			int_params.irq_source =	dc_link->irq_source_hpd_rx;
 
-			amdgpu_dm_irq_register_interrupt(adev, &int_params,
-					handle_hpd_rx_irq,
-					(void *) aconnector);
+			if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+				int_params.irq_source  < DC_IRQ_SOURCE_HPD1RX ||
+				int_params.irq_source  > DC_IRQ_SOURCE_HPD6RX) {
+				DRM_ERROR("Failed to register hpd rx irq!\n");
+				return -EINVAL;
+			}
+
+			if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+				handle_hpd_rx_irq, (void *) aconnector))
+				return -ENOMEM;
 		}
 	}
+	return 0;
 }
 
 #if defined(CONFIG_DRM_AMD_DC_SI)
@@ -3649,13 +3670,21 @@ static int dce60_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, i + 1, 0);
 
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source  < DC_IRQ_SOURCE_VBLANK1 ||
+			int_params.irq_source  > DC_IRQ_SOURCE_VBLANK6) {
+			DRM_ERROR("Failed to register vblank irq!\n");
+			return -EINVAL;
+		}
+
 		c_irq_params = &adev->dm.vblank_params[int_params.irq_source - DC_IRQ_SOURCE_VBLANK1];
 
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_crtc_high_irq, c_irq_params);
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_crtc_high_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	/* Use GRPH_PFLIP interrupt */
@@ -3671,14 +3700,21 @@ static int dce60_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, i, 0);
 
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source  < DC_IRQ_SOURCE_PFLIP_FIRST ||
+			int_params.irq_source  > DC_IRQ_SOURCE_PFLIP_LAST) {
+			DRM_ERROR("Failed to register pflip irq!\n");
+			return -EINVAL;
+		}
+
 		c_irq_params = &adev->dm.pflip_params[int_params.irq_source - DC_IRQ_SOURCE_PFLIP_FIRST];
 
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_pflip_high_irq, c_irq_params);
-
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_pflip_high_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	/* HPD */
@@ -3689,9 +3725,9 @@ static int dce60_register_irq_handlers(struct amdgpu_device *adev)
 		return r;
 	}
 
-	register_hpd_handlers(adev);
+	r = register_hpd_handlers(adev);
 
-	return 0;
+	return r;
 }
 #endif
 
@@ -3735,13 +3771,21 @@ static int dce110_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, i, 0);
 
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source  < DC_IRQ_SOURCE_VBLANK1 ||
+			int_params.irq_source  > DC_IRQ_SOURCE_VBLANK6) {
+			DRM_ERROR("Failed to register vblank irq!\n");
+			return -EINVAL;
+		}
+
 		c_irq_params = &adev->dm.vblank_params[int_params.irq_source - DC_IRQ_SOURCE_VBLANK1];
 
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_crtc_high_irq, c_irq_params);
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_crtc_high_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	/* Use VUPDATE interrupt */
@@ -3756,13 +3800,21 @@ static int dce110_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, i, 0);
 
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source  < DC_IRQ_SOURCE_VUPDATE1 ||
+			int_params.irq_source  > DC_IRQ_SOURCE_VUPDATE6) {
+			DRM_ERROR("Failed to register vupdate irq!\n");
+			return -EINVAL;
+		}
+
 		c_irq_params = &adev->dm.vupdate_params[int_params.irq_source - DC_IRQ_SOURCE_VUPDATE1];
 
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_vupdate_high_irq, c_irq_params);
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_vupdate_high_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	/* Use GRPH_PFLIP interrupt */
@@ -3778,14 +3830,21 @@ static int dce110_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, i, 0);
 
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source  < DC_IRQ_SOURCE_PFLIP_FIRST ||
+			int_params.irq_source  > DC_IRQ_SOURCE_PFLIP_LAST) {
+			DRM_ERROR("Failed to register pflip irq!\n");
+			return -EINVAL;
+		}
+
 		c_irq_params = &adev->dm.pflip_params[int_params.irq_source - DC_IRQ_SOURCE_PFLIP_FIRST];
 
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_pflip_high_irq, c_irq_params);
-
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_pflip_high_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	/* HPD */
@@ -3796,9 +3855,9 @@ static int dce110_register_irq_handlers(struct amdgpu_device *adev)
 		return r;
 	}
 
-	register_hpd_handlers(adev);
+	r = register_hpd_handlers(adev);
 
-	return 0;
+	return r;
 }
 
 /* Register IRQ sources and initialize IRQ callbacks */
@@ -3850,13 +3909,21 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, i, 0);
 
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source  < DC_IRQ_SOURCE_VBLANK1 ||
+			int_params.irq_source  > DC_IRQ_SOURCE_VBLANK6) {
+			DRM_ERROR("Failed to register vblank irq!\n");
+			return -EINVAL;
+		}
+
 		c_irq_params = &adev->dm.vblank_params[int_params.irq_source - DC_IRQ_SOURCE_VBLANK1];
 
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(
-			adev, &int_params, dm_crtc_high_irq, c_irq_params);
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_crtc_high_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	/* Use otg vertical line interrupt */
@@ -3874,9 +3941,11 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, vrtl_int_srcid[i], 0);
 
-		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID) {
-			DRM_ERROR("Failed to register vline0 irq %d!\n", vrtl_int_srcid[i]);
-			break;
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source < DC_IRQ_SOURCE_DC1_VLINE0 ||
+			int_params.irq_source > DC_IRQ_SOURCE_DC6_VLINE0) {
+			DRM_ERROR("Failed to register vline0 irq!\n");
+			return -EINVAL;
 		}
 
 		c_irq_params = &adev->dm.vline0_params[int_params.irq_source
@@ -3885,8 +3954,10 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_dcn_vertical_interrupt0_high_irq, c_irq_params);
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_dcn_vertical_interrupt0_high_irq,
+			c_irq_params))
+			return -ENOMEM;
 	}
 #endif
 
@@ -3909,13 +3980,21 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, i, 0);
 
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source  < DC_IRQ_SOURCE_VUPDATE1 ||
+			int_params.irq_source  > DC_IRQ_SOURCE_VUPDATE6) {
+			DRM_ERROR("Failed to register vupdate irq!\n");
+			return -EINVAL;
+		}
+
 		c_irq_params = &adev->dm.vupdate_params[int_params.irq_source - DC_IRQ_SOURCE_VUPDATE1];
 
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_vupdate_high_irq, c_irq_params);
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_vupdate_high_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	/* Use GRPH_PFLIP interrupt */
@@ -3932,14 +4011,21 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 		int_params.irq_source =
 			dc_interrupt_to_irq_source(dc, i, 0);
 
+		if (int_params.irq_source == DC_IRQ_SOURCE_INVALID ||
+			int_params.irq_source  < DC_IRQ_SOURCE_PFLIP_FIRST ||
+			int_params.irq_source  > DC_IRQ_SOURCE_PFLIP_LAST) {
+			DRM_ERROR("Failed to register pflip irq!\n");
+			return -EINVAL;
+		}
+
 		c_irq_params = &adev->dm.pflip_params[int_params.irq_source - DC_IRQ_SOURCE_PFLIP_FIRST];
 
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_pflip_high_irq, c_irq_params);
-
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_pflip_high_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	/* HPD */
@@ -3950,9 +4036,9 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 		return r;
 	}
 
-	register_hpd_handlers(adev);
+	r = register_hpd_handlers(adev);
 
-	return 0;
+	return r;
 }
 /* Register Outbox IRQ sources and initialize IRQ callbacks */
 static int register_outbox_irq_handlers(struct amdgpu_device *adev)
@@ -3983,8 +4069,9 @@ static int register_outbox_irq_handlers(struct amdgpu_device *adev)
 		c_irq_params->adev = adev;
 		c_irq_params->irq_src = int_params.irq_source;
 
-		amdgpu_dm_irq_register_interrupt(adev, &int_params,
-				dm_dmub_outbox1_low_irq, c_irq_params);
+		if (!amdgpu_dm_irq_register_interrupt(adev, &int_params,
+			dm_dmub_outbox1_low_irq, c_irq_params))
+			return -ENOMEM;
 	}
 
 	return 0;
-- 
2.43.0

