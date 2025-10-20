Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD5BF158E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 14:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC4810E296;
	Mon, 20 Oct 2025 12:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cWjnTjjw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5ySyAJHA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NNhYsqtE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YxYHRxt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DD210E296
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 12:52:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 785FF1F385;
 Mon, 20 Oct 2025 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760964763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PwyjRZHpE1gkMa7YSAQrmEHjHnacORfSEkzEiO6lsA0=;
 b=cWjnTjjw80L9mxEYUnUQ1CzvMaTripgK9+ZiYASLtoo7VohcLaqsGK6dFFnWg/I3Ld03P8
 7e2E445uL91VI0+V6OdWPCwOjs+7sfBLqwUMrY+mDPg5kHmVri90KgnHYvissLne7Hdhq0
 F3/46SYvP0IytOE3lyTo9WUyjoqaMAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760964763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PwyjRZHpE1gkMa7YSAQrmEHjHnacORfSEkzEiO6lsA0=;
 b=5ySyAJHAC/OahAiep0s8R3p0cwSEPFqysmOnEmS+xrIm4SnsSq1rvGaLNir58SKFJzYubm
 O5Bbjyn4wrTXJ3DQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NNhYsqtE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YxYHRxt2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760964759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PwyjRZHpE1gkMa7YSAQrmEHjHnacORfSEkzEiO6lsA0=;
 b=NNhYsqtEsgLipwUshkbfuRovPj99E7Ut5zyOsZx/er1Z7a5eIJImFx1DpDVTevr1Wwn6Ix
 pYs7YBfgEcnMq+5CCnJL5oAmWwVdsrnBbIY5KnYVe/MmryPWdRyLuGRND5uvhCZN28I1Qy
 CBZ5lmLC0COW+4In8NGDAjhPoMghdvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760964759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PwyjRZHpE1gkMa7YSAQrmEHjHnacORfSEkzEiO6lsA0=;
 b=YxYHRxt28bGBSNO2P46iC2sp1mJsQsdfQnNEBFPd/ZqlaR7RuvcZThL+7Gg00SUxc3uIQt
 0A6KlGNPaV4od2CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D74B13AAD;
 Mon, 20 Oct 2025 12:52:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id l0K4EZcw9mhBRgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 12:52:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, ville.syrjala@linux.intel.com, dan.carpenter@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/sysfb: Use new CRTC state in begin_fb_access
Date: Mon, 20 Oct 2025 14:52:02 +0200
Message-ID: <20251020125227.41308-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 785FF1F385
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
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

Retrieve the CRTC's new state with drm_atomic_get_new_crtc_state()
in drm_sysfb_plane_helper_begin_fb_access(). The blit function might
be incorrect otherwise.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: cb71de092553 ("drm/sysfb: Lookup blit function during atomic check")
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/aPJrs7_u8KcalNsC@intel.com/
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index 8517c490e815..6214b7709b37 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -258,7 +258,7 @@ int drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
 
 	ret = -EINVAL;
 
-	crtc_state = drm_atomic_get_crtc_state(plane_state->state, plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state, plane_state->crtc);
 	if (drm_WARN_ON_ONCE(dev, !crtc_state))
 		goto err_drm_gem_end_shadow_fb_access;
 	sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
-- 
2.51.0

