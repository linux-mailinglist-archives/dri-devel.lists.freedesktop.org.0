Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38077690D37
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A3310EB27;
	Thu,  9 Feb 2023 15:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9A10E22D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:41:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 995B25D111;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675957270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsGmey0iUuZZSoPIujbf6ocGueYvy3qO8I6teP4gKyQ=;
 b=tq+B1KfrZFaqjvJhyC4rJMbwdEvZPLndrmNf3ktllN4z9wG7BjvC/Pd7C8HjqbATrn8MQt
 BG4mqNXmF4i/lE2oIxMtmmwdPvziBLfxWOql4lNjfMqTgl5x/fIZfnqSagrA1Q/7FYPc1f
 GNWgFm6ibRr2LmoqkkwKo0N9Hr5k0lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675957270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsGmey0iUuZZSoPIujbf6ocGueYvy3qO8I6teP4gKyQ=;
 b=moegZmIJVc8JhD3vA/cK5j2VsrLg1BelK7L2W2CsOnIkIjG24vn2Z77vZK4iiSCBMO3oFx
 fdCAWJ8XntwaqiBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BE7913915;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6MaCGRYU5WM5PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 15:41:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jyri.sarha@iki.fi,
 tomba@kernel.org
Subject: [PATCH 5/6] drm/tidss: Remove return values from dispc_plane_{setup,
 enable}()
Date: Thu,  9 Feb 2023 16:41:06 +0100
Message-Id: <20230209154107.30680-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209154107.30680-1-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calls to dispc_plane_setup() and dispc_plane_enable() cannot fail.
Remove the return value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++--------
 drivers/gpu/drm/tidss/tidss_dispc.h |  8 ++++----
 drivers/gpu/drm/tidss/tidss_plane.c | 11 +----------
 3 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 165365b515e1..dca077411f77 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1985,9 +1985,9 @@ dma_addr_t dispc_plane_state_p_uv_addr(const struct drm_plane_state *state)
 		(y * fb->pitches[1] / fb->format->vsub);
 }
 
-int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
-		      const struct drm_plane_state *state,
-		      u32 hw_videoport)
+void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
+		       const struct drm_plane_state *state,
+		       u32 hw_videoport)
 {
 	bool lite = dispc->feat->vid_lite[hw_plane];
 	u32 fourcc = state->fb->format->format;
@@ -2066,15 +2066,11 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 	else
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
 				28, 28);
-
-	return 0;
 }
 
-int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
+void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
 {
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 0, 0);
-
-	return 0;
 }
 
 static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index e49432f0abf5..946ed769caaf 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -123,10 +123,10 @@ int dispc_runtime_resume(struct dispc_device *dispc);
 int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
 		      const struct drm_plane_state *state,
 		      u32 hw_videoport);
-int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
-		      const struct drm_plane_state *state,
-		      u32 hw_videoport);
-int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
+void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
+		       const struct drm_plane_state *state,
+		       u32 hw_videoport);
+void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
 const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
 
 int dispc_init(struct tidss_device *tidss);
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index fe2c41f0cd4f..0b12405edb47 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -113,7 +113,6 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	u32 hw_videoport;
-	int ret;
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
@@ -124,15 +123,7 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
 
 	hw_videoport = to_tidss_crtc(new_state->crtc)->hw_videoport;
 
-	ret = dispc_plane_setup(tidss->dispc, tplane->hw_plane_id,
-				new_state, hw_videoport);
-
-	if (ret) {
-		dev_err(plane->dev->dev, "%s: Failed to setup plane %d\n",
-			__func__, tplane->hw_plane_id);
-		dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
-		return;
-	}
+	dispc_plane_setup(tidss->dispc, tplane->hw_plane_id, new_state, hw_videoport);
 
 	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, true);
 }
-- 
2.39.1

