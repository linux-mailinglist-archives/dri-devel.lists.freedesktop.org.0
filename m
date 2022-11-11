Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A762503B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 03:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EDB10E16B;
	Fri, 11 Nov 2022 02:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6144610E16B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 02:33:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A494A61E89;
 Fri, 11 Nov 2022 02:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EABC433D6;
 Fri, 11 Nov 2022 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668134036;
 bh=COgMoRGC2qbClDmwoUTbT34A8Y2geTBApiLwhGghjDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eoLLaHiTxEU1n5m7Ma4nfWStmnyO1VsQ4A/gNbVa9gFcPtfbtUTljcb2jXDjaRtNb
 hPn5Ahr1Fu1n532v79Yu2UNNxxlMVJ6PgEQqj6z01ZlO8jg/mWPCBcQILSYs5GtDaN
 AC8J9wY7LladMxx8+DWTWjndA9EgtR3YepMm1T9dAHPaHPM/6UB8nPS2zv6zRMqjka
 kC6aBkyWcuV5tzo92gkOsn7zQao/DdkP7NaVrDiBoPtTtLLqJNPCGxzAAtQyJ5Uy96
 asznr3A/yXFNzSPPQZxuV1ulPcy4IZMRqciNfjd6bVwlddnge7Qf8l61geRDjD55gb
 CW13hdN1N0iqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 07/30] drm/rockchip: vop2: fix null pointer in
 plane_atomic_disable
Date: Thu, 10 Nov 2022 21:33:15 -0500
Message-Id: <20221111023340.227279-7-sashal@kernel.org>
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

[ Upstream commit 471bf2406c043491b1a8288e5f04bc278f7d7ca1 ]

If the vop2_plane_atomic_disable function is called with NULL as a
state, accessing the old_pstate runs into a null pointer exception.
However, the drm_atomic_helper_disable_planes_on_crtc function calls the
atomic_disable callback with state NULL.

Allow to disable a plane without passing a plane state by checking the
old_pstate only if a state is passed.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20221028095206.2136601-2-m.tretter@pengutronix.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index f9aa8b96c695..bf9c3e92e1cd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -997,13 +997,15 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 static void vop2_plane_atomic_disable(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *old_pstate = NULL;
 	struct vop2_win *win = to_vop2_win(plane);
 	struct vop2 *vop2 = win->vop2;
 
 	drm_dbg(vop2->drm, "%s disable\n", win->data->name);
 
-	if (!old_pstate->crtc)
+	if (state)
+		old_pstate = drm_atomic_get_old_plane_state(state, plane);
+	if (old_pstate && !old_pstate->crtc)
 		return;
 
 	vop2_win_disable(win);
-- 
2.35.1

