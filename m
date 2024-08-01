Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1292F943AE8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6B510E785;
	Thu,  1 Aug 2024 00:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i8vhpYEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329B110E784;
 Thu,  1 Aug 2024 00:21:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 936A56125E;
 Thu,  1 Aug 2024 00:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8C4C32786;
 Thu,  1 Aug 2024 00:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471707;
 bh=ZxUWa+uxSw23IaKRlMYlf2Vc48axf6PK4TusecTueHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i8vhpYEG3zw1NxCU+d2CvUxlrc8v5c79PlQJzlR4fZgfiIW9WP7048KeHL0ndU2sM
 A//ZfFMTHI+MvZxslqQH08Dr9M7VgRFughvXA0k0D01FauSda0q07k1LB+FueAM+RC
 fQ2R+/xXvZ02NfNfgeC9omXKK60Dzrmnq/HvqxJkj3z0QWXfMuP34OCVm5Q+k2f9iR
 ZbME+srrUbyGMgAeUJIJV9aQoTIGEhHtHUHypzS6Fi8jiMP6RI6SiMeWByifSARwcb
 PEQBKZM2UUikW3SA/UqaG3dW07MNVMcko58Rq44SLo+SpFExyfMpt6mV+cqCAZYGvf
 KpKknZY2MMkeQ==
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
Subject: [PATCH AUTOSEL 6.6 08/83] drm/amd/display: Add NULL pointer and
 OVERRUN check within amdgpu_dm irq register
Date: Wed, 31 Jul 2024 20:17:23 -0400
Message-ID: <20240801002107.3934037-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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
index 60db3800666ec..7fa95a81b69bd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3468,7 +3468,7 @@ static void handle_hpd_rx_irq(void *param)
 	mutex_unlock(&aconnector->hpd_lock);
 }
 
-static void register_hpd_handlers(struct amdgpu_device *adev)
+static int register_hpd_handlers(struct amdgpu_device *adev)
 {
 	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
@@ -3480,11 +3480,17 @@ static void register_hpd_handlers(struct amdgpu_device *adev)
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
@@ -3497,9 +3503,16 @@ static void register_hpd_handlers(struct amdgpu_device *adev)
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
@@ -3508,11 +3521,19 @@ static void register_hpd_handlers(struct amdgpu_device *adev)
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
@@ -3553,13 +3574,21 @@ static int dce60_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3575,14 +3604,21 @@ static int dce60_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3593,9 +3629,9 @@ static int dce60_register_irq_handlers(struct amdgpu_device *adev)
 		return r;
 	}
 
-	register_hpd_handlers(adev);
+	r = register_hpd_handlers(adev);
 
-	return 0;
+	return r;
 }
 #endif
 
@@ -3639,13 +3675,21 @@ static int dce110_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3660,13 +3704,21 @@ static int dce110_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3682,14 +3734,21 @@ static int dce110_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3700,9 +3759,9 @@ static int dce110_register_irq_handlers(struct amdgpu_device *adev)
 		return r;
 	}
 
-	register_hpd_handlers(adev);
+	r = register_hpd_handlers(adev);
 
-	return 0;
+	return r;
 }
 
 /* Register IRQ sources and initialize IRQ callbacks */
@@ -3754,13 +3813,21 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3778,9 +3845,11 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3789,8 +3858,10 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
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
 
@@ -3813,13 +3884,21 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3836,14 +3915,21 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
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
@@ -3854,9 +3940,9 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 		return r;
 	}
 
-	register_hpd_handlers(adev);
+	r = register_hpd_handlers(adev);
 
-	return 0;
+	return r;
 }
 /* Register Outbox IRQ sources and initialize IRQ callbacks */
 static int register_outbox_irq_handlers(struct amdgpu_device *adev)
@@ -3887,8 +3973,9 @@ static int register_outbox_irq_handlers(struct amdgpu_device *adev)
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

