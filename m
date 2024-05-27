Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0668CF9D5
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 09:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9AB10E658;
	Mon, 27 May 2024 07:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="iy9ORCzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA7210E658
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:18:41 +0000 (UTC)
X-Envelope-To: val@packett.cool
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1716794318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/HcY+X0iAsHdzRuxUa8q7blOFA1qc44VzdOT0NN0pc=;
 b=iy9ORCzh7lapaOkZMTEJsmXVG/+BIMfnecYQMWgUjZ2+sq98W3zFVnqaDLifxgDJS2XrSH
 pqXfwVLJ8PIpmhN4yufkns0BlQG4ykCgGjQLMpzlINXF14ulgAuORgPV+1j9sJRxrbebzI
 b7hnSCmVc9jO6U7KghD6m/ICuf5rLFHDJ/1JqSIec75UTBjYmG6RDXz8/46cYrxAxT0iIY
 uGtYK/+pQc+T97tX+QT8gnz6JNrWV2k88u3VWgnHklhVArsgqcKwxOaBh7LbUh0KQOfJs0
 DEBJe40GfOwFR5n90lNX2zfx1KbjYxwvL4vg0SmjWklkoAiZL/M375No+Jnq1Q==
X-Envelope-To: stable@vger.kernel.org
X-Envelope-To: hjc@rock-chips.com
X-Envelope-To: heiko@sntech.de
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>, stable@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/rockchip: vop: clear DMA stop bit upon vblank on
 RK3066
Date: Mon, 27 May 2024 04:16:33 -0300
Message-ID: <20240527071736.21784-1-val@packett.cool>
In-Reply-To: <2024051930-canteen-produce-1ba7@gregkh>
References: <2024051930-canteen-produce-1ba7@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

On the RK3066, there is a bit that must be cleared, otherwise
the picture does not show up on the display (at least for RGB).

Fixes: f4a6de8 ("drm: rockchip: vop: add rk3066 vop definitions")
Cc: stable@vger.kernel.org
Signed-off-by: Val Packett <val@packett.cool>
---
v2: doing this on vblank makes more sense; added fixes tag
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 6 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a13473b2d..2731fe2b2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1766,6 +1766,12 @@ static void vop_handle_vblank(struct vop *vop)
 	}
 	spin_unlock(&drm->event_lock);
 
+	if (VOP_HAS_REG(vop, common, dma_stop)) {
+		spin_lock(&vop->reg_lock);
+		VOP_REG_SET(vop, common, dma_stop, 0);
+		spin_unlock(&vop->reg_lock);
+	}
+
 	if (test_and_clear_bit(VOP_PENDING_FB_UNREF, &vop->pending))
 		drm_flip_work_commit(&vop->fb_unref_work, system_unbound_wq);
 }
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index b33e5bdc2..0cf512cc1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -122,6 +122,7 @@ struct vop_common {
 	struct vop_reg lut_buffer_index;
 	struct vop_reg gate_en;
 	struct vop_reg mmu_en;
+	struct vop_reg dma_stop;
 	struct vop_reg out_mode;
 	struct vop_reg standby;
 };
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index b9ee02061..9bcb40a64 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -466,6 +466,7 @@ static const struct vop_output rk3066_output = {
 };
 
 static const struct vop_common rk3066_common = {
+	.dma_stop = VOP_REG(RK3066_SYS_CTRL0, 0x1, 0),
 	.standby = VOP_REG(RK3066_SYS_CTRL0, 0x1, 1),
 	.out_mode = VOP_REG(RK3066_DSP_CTRL0, 0xf, 0),
 	.cfg_done = VOP_REG(RK3066_REG_CFG_DONE, 0x1, 0),
-- 
2.45.1

