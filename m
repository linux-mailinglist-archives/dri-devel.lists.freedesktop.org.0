Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018CB5B1947
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE2410E9FC;
	Thu,  8 Sep 2022 09:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B74A10E9F6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E37BA33800;
 Thu,  8 Sep 2022 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662630678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1ErYPXVLqmO4wSgRe8Qfl5K8BfkVWk802TWryoKr48=;
 b=twBOX8/r2pbp5pguSVOco7NM1nJ+2gir6mG4qY5MnfTMVonw7Gyx5JrF1Vsjk+QRcqmElY
 Yn5sqxUCZm3TdoRLgMc7yp7v6/KQpKPvyEMEc7+PaX6hhujHcDP/3wpibKKHP8HpbEZyHi
 Cl8vaA286Cd2f0r2kqCvDTH4sEGWg+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662630678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1ErYPXVLqmO4wSgRe8Qfl5K8BfkVWk802TWryoKr48=;
 b=/C2tCWJlfKNJfd1E4rwU7BVI6WUfXZTo1Mas3ppP30Ir50bAvXEQ8kzrq8ZSoZVOIwpROf
 rPIlxPaodDXqQoAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA25813A72;
 Thu,  8 Sep 2022 09:51:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gHTjLBa7GWNrUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 08 Sep 2022 09:51:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 01/12] drm/udl: Restore display mode on resume
Date: Thu,  8 Sep 2022 11:51:04 +0200
Message-Id: <20220908095115.23396-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220908095115.23396-1-tiwai@suse.de>
References: <20220908095115.23396-1-tiwai@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restore the display mode whne resuming from suspend. Currently, the
display remains dark.

On resume, the CRTC's mode does not change, but the 'active' flag
changes to 'true'. Taking this into account when considering a mode
switch restores the display mode.

The bug is reproducable by using Gnome with udl and observing the
adapter's suspend/resume behavior.

Actually, the whole check added in udl_simple_display_pipe_enable()
about the crtc_state->mode_changed was bogus.  We should drop the
whole check and always apply the mode change in this function.

[ tiwai -- Drop the mode_changed check entirely instead, per Daniel's
  suggestion ]

Fixes: 997d33c35618 ("drm/udl: Inline DPMS code into CRTC enable and disable functions")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 169110d8fc2e..34ce5b43c5db 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -382,9 +382,6 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	udl_handle_damage(fb, &shadow_plane_state->data[0], 0, 0, fb->width, fb->height);
 
-	if (!crtc_state->mode_changed)
-		return;
-
 	/* enable display */
 	udl_crtc_write_mode_to_hw(crtc);
 }
-- 
2.35.3

