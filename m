Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2220D625041
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 03:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D663310E18C;
	Fri, 11 Nov 2022 02:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96BF10E16B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 02:33:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FC7261E85;
 Fri, 11 Nov 2022 02:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91820C433B5;
 Fri, 11 Nov 2022 02:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668134037;
 bh=L9LEH3BsZlnsIKqkJQyyudYrCpgnyFcbsQzEgaFeCIc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZSccu8H8vHOOl1VWUTvc4fJcwnLKsY0YZZX/9qBRPd1Q57prLHyGqKdJxbvST0slc
 RxoqBEQZX1Ov7qrSfvJwfVw9xWnCY5rK3FtEIs0iVM9CsfhCb49Y97JWumKvjIlldk
 Gz1PXGQFWxU7UziqmzwAgr03L1unDR+hN10dtP1lCklnWn2ZOMRqooKsFIbqLrGQKm
 nL5sBwhjCmp6QWf5eVE5IRJkPJxnQQaHHYWXTk2p9YCDG7a8f46O9HMJzkTVnLoQ6p
 yP5Z+fkGeVgXUBrwYKTeGUDri9vFqV9pNN5ey8FM1iPc0k03WY39Fn+KZxtVr2F2yy
 4Y87GlWmLLIhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 08/30] drm/rockchip: vop2: disable planes when
 disabling the crtc
Date: Thu, 10 Nov 2022 21:33:16 -0500
Message-Id: <20221111023340.227279-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111023340.227279-1-sashal@kernel.org>
References: <20221111023340.227279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, Michael Tretter <m.tretter@pengutronix.de>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Tretter <m.tretter@pengutronix.de>

[ Upstream commit 447fb14bf07905b880c9ed1ea92c53d6dd0649d7 ]

The vop2 driver needs to explicitly disable the planes if the crtc is
disabled. Unless the planes are explicitly disabled, the address of the
last framebuffer is kept in the registers of the VOP2. When re-enabling
the encoder after it has been disabled by the driver, the VOP2 will
start and read the framebuffer that has been freed but is still pointed
to by the register. The iommu will catch these read accesses and print
errors.

Explicitly disable the planes when the crtc is disabled to reset the
registers.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20221028095206.2136601-3-m.tretter@pengutronix.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index bf9c3e92e1cd..1fc04019dfd8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -878,10 +878,14 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
 	struct vop2 *vop2 = vp->vop2;
+	struct drm_crtc_state *old_crtc_state;
 	int ret;
 
 	vop2_lock(vop2);
 
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, false);
+
 	drm_crtc_vblank_off(crtc);
 
 	/*
-- 
2.35.1

