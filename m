Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C15DA46812
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BB910E988;
	Wed, 26 Feb 2025 17:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zB1wdPga";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g/ESdE8E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zB1wdPga";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g/ESdE8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D7110E985
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:28:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6C6F211CB;
 Wed, 26 Feb 2025 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ib0ekiOmA2DFrJeBkGcK3O1gGE0vHij/CioUAfQ/bws=;
 b=zB1wdPgaOi+nJPqgasNZ2c05T33Nnc6whkgSwe4KYz2Jk2RR40vO7isVlU17x66bfZ5cjT
 qQyaxMAK/5vX89T80tDEyltUupF+OOicJ2sE4+Y1qVNV+DdxIySxkaBwHwkgJ9UGUbsetb
 H4l/Xrj6AdcDBR82HX0WIO9Kj8oZ5j8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ib0ekiOmA2DFrJeBkGcK3O1gGE0vHij/CioUAfQ/bws=;
 b=g/ESdE8Et2Ad/axw/ZDVWbKOtjiqZLr1wQ9Ptbg6z1rDBOHyXhmON3tGLVuTjI/wrKsyv2
 4reO+zWV8Yedf7AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ib0ekiOmA2DFrJeBkGcK3O1gGE0vHij/CioUAfQ/bws=;
 b=zB1wdPgaOi+nJPqgasNZ2c05T33Nnc6whkgSwe4KYz2Jk2RR40vO7isVlU17x66bfZ5cjT
 qQyaxMAK/5vX89T80tDEyltUupF+OOicJ2sE4+Y1qVNV+DdxIySxkaBwHwkgJ9UGUbsetb
 H4l/Xrj6AdcDBR82HX0WIO9Kj8oZ5j8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ib0ekiOmA2DFrJeBkGcK3O1gGE0vHij/CioUAfQ/bws=;
 b=g/ESdE8Et2Ad/axw/ZDVWbKOtjiqZLr1wQ9Ptbg6z1rDBOHyXhmON3tGLVuTjI/wrKsyv2
 4reO+zWV8Yedf7AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A98513A82;
 Wed, 26 Feb 2025 17:28:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eJvNFC9Pv2cWBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 17:28:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/10] drm/mipi-dbi: Test for imported buffers with
 drm_gem_is_imported()
Date: Wed, 26 Feb 2025 18:03:12 +0100
Message-ID: <20250226172457.217725-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226172457.217725-1-tzimmermann@suse.de>
References: <20250226172457.217725-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.19)[-0.946];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,linaro.org,amd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.79
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 34bca7567576..89e05a5bed1d 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -218,7 +218,7 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
-			drm_fb_swab(&dst_map, NULL, src, fb, clip, !gem->import_attach,
+			drm_fb_swab(&dst_map, NULL, src, fb, clip, !drm_gem_is_imported(gem),
 				    fmtcnv_state);
 		else
 			drm_fb_memcpy(&dst_map, NULL, src, fb, clip);
-- 
2.48.1

