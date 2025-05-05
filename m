Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88BAAA2EB
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C440D10E5DC;
	Mon,  5 May 2025 23:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UorKPqXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1FE10E5DC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 23:06:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 819B4A4B4FE;
 Mon,  5 May 2025 23:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0373C4CEF1;
 Mon,  5 May 2025 23:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486382;
 bh=osrs3CyFZ2f+ksNPpjlzidOtyNYYoswmnpUkwfOmRGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UorKPqXMZbrvuqz7thL31WD4l35mAH6KBCk0FTkCueL+dqGwIkfmWZRUx/HovTebv
 B264HsnZ2kHn7ZirLyoeLJu9vjHNNkRLxvyB8izM48XRxUPNQ5NTVyvirM8q1wMkAc
 WXDQSI5YCz1ZQhWkC58wNIMt0/FV+e9uPKca8qMbOyKNdOzh+AGEA0FQHlGzXwXH/w
 GKbgOSdD5ZaM7zXPg8KDmSlPiPv15lVZIx8SoMcFlXB4kN6d2rv9E8Z55LOlfGpuBg
 tthmZN7kQwPdGtAC6XoV36QIQC88aZT/cr0H7PBo60ANPOjeO+OHF00o6NK/v4Fx2+
 /G4HGSD/eJRmQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 294/294] drm: Add valid clones check
Date: Mon,  5 May 2025 18:56:34 -0400
Message-Id: <20250505225634.2688578-294-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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

From: Jessica Zhang <quic_jesszhan@quicinc.com>

[ Upstream commit 41b4b11da02157c7474caf41d56baae0e941d01a ]

Check that all encoders attached to a given CRTC are valid
possible_clones of each other.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20241216-concurrent-wb-v4-3-fe220297a7f0@quicinc.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f3681970887cc..1aa59586c8f81 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -573,6 +573,30 @@ mode_valid(struct drm_atomic_state *state)
 	return 0;
 }
 
+static int drm_atomic_check_valid_clones(struct drm_atomic_state *state,
+					 struct drm_crtc *crtc)
+{
+	struct drm_encoder *drm_enc;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
+		if (!drm_enc->possible_clones) {
+			DRM_DEBUG("enc%d possible_clones is 0\n", drm_enc->base.id);
+			continue;
+		}
+
+		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
+		    crtc_state->encoder_mask) {
+			DRM_DEBUG("crtc%d failed valid clone check for mask 0x%x\n",
+				  crtc->base.id, crtc_state->encoder_mask);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * drm_atomic_helper_check_modeset - validate state object for modeset changes
  * @dev: DRM device
@@ -744,6 +768,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		ret = drm_atomic_add_affected_planes(state, crtc);
 		if (ret != 0)
 			return ret;
+
+		ret = drm_atomic_check_valid_clones(state, crtc);
+		if (ret != 0)
+			return ret;
 	}
 
 	/*
-- 
2.39.5

