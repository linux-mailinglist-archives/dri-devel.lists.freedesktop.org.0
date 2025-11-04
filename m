Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23288C308A4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE2510E5A8;
	Tue,  4 Nov 2025 10:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EJ7nBtVi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kM4CIYrZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EJ7nBtVi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kM4CIYrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9010E5A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:36:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13F14211A3;
 Tue,  4 Nov 2025 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762252579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SuvfR0P16tVd1KEeNXhjoXCdOutgEIb84DWA/Ku3INo=;
 b=EJ7nBtVicwyEiZVyyGNqYD+3xAtT1GLpwpaMBZX5TP2kocy6K3j9xJUoQpZ4bALjFntq6Q
 4TfVvoMOountMHGkQddV0LQAf4oJuMxsldolB1+ck4cQvM+vjyBCeYntsIjsDxvHDJHIdy
 IP0qlH4RLE9KrRMS5Gsm3J5cJC96Ies=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762252579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SuvfR0P16tVd1KEeNXhjoXCdOutgEIb84DWA/Ku3INo=;
 b=kM4CIYrZVuOvf7+D/Ew0aJq1+0Vm0xuqkUbSYIVEcd+0sNimLruj2nCEGshV6g1v0+/qXp
 +b36esL2qz3o0UBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762252579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SuvfR0P16tVd1KEeNXhjoXCdOutgEIb84DWA/Ku3INo=;
 b=EJ7nBtVicwyEiZVyyGNqYD+3xAtT1GLpwpaMBZX5TP2kocy6K3j9xJUoQpZ4bALjFntq6Q
 4TfVvoMOountMHGkQddV0LQAf4oJuMxsldolB1+ck4cQvM+vjyBCeYntsIjsDxvHDJHIdy
 IP0qlH4RLE9KrRMS5Gsm3J5cJC96Ies=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762252579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SuvfR0P16tVd1KEeNXhjoXCdOutgEIb84DWA/Ku3INo=;
 b=kM4CIYrZVuOvf7+D/Ew0aJq1+0Vm0xuqkUbSYIVEcd+0sNimLruj2nCEGshV6g1v0+/qXp
 +b36esL2qz3o0UBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BED1A136D1;
 Tue,  4 Nov 2025 10:36:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DDpSLSLXCWkZXgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Nov 2025 10:36:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 ian.forbes@broadcom.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/vmwgfx: Set surface-framebuffer GEM objects
Date: Tue,  4 Nov 2025 11:36:04 +0100
Message-ID: <20251104103611.167821-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[broadcom.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Set struct drm_framebuffer.obj[0] to the allocated GEM buffer object
for surface framebuffers. Avoids a NULL-pointer deref in the client's
vmap helpers.

[   22.640191] Console: switching to colour frame buffer device 160x50
[   22.641788] Oops: general protection fault, probably for
  non-canonical address 0xdffffc000000001f: 0000 [#1] SMP KASAN NOPTI
[   22.641795] KASAN: null-ptr-deref in range
[0x00000000000000f8-0x00000000000000ff]
[...]
[   22.641809] Hardware name: VMware, Inc. VMware20,1/440BX Desktop
  Reference Platform, BIOS VMW201.00V.24928539.B64.2508260915 08/26/2025
[   22.641812] Workqueue: events drm_fb_helper_damage_work
[   22.641824] RIP: 0010:drm_gem_lock+0x25/0x50
[   22.641831] Code: 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 b8
  00 00 00 00 00 fc ff df 53 48 89 fb 48 81 c7 f8 00 00 00 48 89 fa 48
  c1 ea 03 <80> 3c 02 00 75 0f 48 8b bb f8 00 00 00 31 f6 5b e9 16 2e 15
  01 e8
[...]
[   22.641889] Call Trace:
[   22.641891]  <TASK>
[   22.641894]  drm_client_buffer_vmap_local+0x78/0x140
[   22.641903]  drm_fbdev_ttm_helper_fb_dirty+0x20c/0x510 [drm_ttm_helper]
[   22.641913]  ? __pfx_drm_fbdev_ttm_helper_fb_dirty+0x10/0x10 [drm_ttm_helper]
[   22.641918]  ? __raw_spin_lock_irqsave+0x8c/0xf0
[   22.641924]  ? __pfx___raw_spin_lock_irqsave+0x10/0x10
[   22.641928]  ? __pfx_mutex_lock+0x10/0x10
[   22.641936]  drm_fb_helper_fb_dirty+0x29a/0x5e0
[   22.641942]  ? __pfx_drm_fb_helper_fb_dirty+0x10/0x10
[...]

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: ea39f2e66e61 ("drm/client: Deprecate struct drm_client_buffer.gem")
Reported-by: Ian Forbes <ian.forbes@broadcom.com>
Closes: https://lore.kernel.org/dri-devel/CAO6MGtjg8PiRiSLomJQRBduTBSC0WkqX67tEZwA9qwOgRzchpw@mail.gmail.com/
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 54ea1b513950..d32ce1cb579e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -553,6 +553,9 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 	memcpy(&vfbs->uo, uo, sizeof(vfbs->uo));
 	vmw_user_object_ref(&vfbs->uo);
 
+	if (vfbs->uo.buffer)
+		vfbs->base.base.obj[0] = &vfbs->uo.buffer->tbo.base;
+
 	*out = &vfbs->base;
 
 	ret = drm_framebuffer_init(dev, &vfbs->base.base,
-- 
2.51.1

