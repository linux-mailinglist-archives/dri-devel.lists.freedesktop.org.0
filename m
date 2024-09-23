Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC9597E703
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 09:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0F10E101;
	Mon, 23 Sep 2024 07:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LpOjjFDY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lRyHd3He";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LpOjjFDY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lRyHd3He";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51A110E101
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 07:58:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4BB5821FAB;
 Mon, 23 Sep 2024 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727078325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ehkl5B53rZ3ZVGts+xAn2PUe4wsc4pfPZ47RkYySQuY=;
 b=LpOjjFDYKkZaxfOwiRqKUYQhn0Mwq89DTnpZz4TRWrVy4lu41hCM0A4Mln+IhSboakoTHE
 xLNmWbgTThRwl4FuP1VRc57C85HV37hDvreiJi17W9hAH06FCiX87uW+du18sgXrZwlc/a
 4ArfclGKCbGNqokR2j2Egt0vlbM2up8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727078325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ehkl5B53rZ3ZVGts+xAn2PUe4wsc4pfPZ47RkYySQuY=;
 b=lRyHd3HeRlCtZ2fG77VubH5mOeIbMOU2e6mx755IOQPViaDAyJy/VeunBVZDE9VAyl87Hh
 oL7JFad3pEP1DACA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727078325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ehkl5B53rZ3ZVGts+xAn2PUe4wsc4pfPZ47RkYySQuY=;
 b=LpOjjFDYKkZaxfOwiRqKUYQhn0Mwq89DTnpZz4TRWrVy4lu41hCM0A4Mln+IhSboakoTHE
 xLNmWbgTThRwl4FuP1VRc57C85HV37hDvreiJi17W9hAH06FCiX87uW+du18sgXrZwlc/a
 4ArfclGKCbGNqokR2j2Egt0vlbM2up8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727078325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ehkl5B53rZ3ZVGts+xAn2PUe4wsc4pfPZ47RkYySQuY=;
 b=lRyHd3HeRlCtZ2fG77VubH5mOeIbMOU2e6mx755IOQPViaDAyJy/VeunBVZDE9VAyl87Hh
 oL7JFad3pEP1DACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E35C21347F;
 Mon, 23 Sep 2024 07:58:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rRo5NrQf8WYzZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Sep 2024 07:58:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ville.syrjala@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Lukasz Spintzyk <lukasz.spintzyk@displaylink.com>,
 Deepak Rawat <drawat@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS
Date: Mon, 23 Sep 2024 09:58:14 +0200
Message-ID: <20240923075841.16231-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO
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

FB_DAMAGE_CLIPS is a plane property for damage handling. Its UAPI
should only use UAPI types. Hence replace struct drm_rect with
struct drm_mode_rect in drm_atomic_plane_set_property(). Both types
are identical in practice, so there's no change in behavior.

Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/Zu1Ke1TuThbtz15E@intel.com/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d3b21767821e ("drm: Add a new plane property to send damage during plane update")
Cc: Lukasz Spintzyk <lukasz.spintzyk@displaylink.com>
Cc: Deepak Rawat <drawat@vmware.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.0+
---
 drivers/gpu/drm/drm_atomic_uapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7936c2023955..370dc676e3aa 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -543,7 +543,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 					&state->fb_damage_clips,
 					val,
 					-1,
-					sizeof(struct drm_rect),
+					sizeof(struct drm_mode_rect),
 					&replaced);
 		return ret;
 	} else if (property == plane->scaling_filter_property) {
-- 
2.46.0

