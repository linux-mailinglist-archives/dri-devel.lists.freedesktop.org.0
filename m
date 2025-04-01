Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC5A77808
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20B810E53C;
	Tue,  1 Apr 2025 09:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CXnC9q74";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="15WFPvaL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CXnC9q74";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="15WFPvaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7DD10E545
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:44:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 86943211E8;
 Tue,  1 Apr 2025 09:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743500671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/VR2Ocun30kjokqYfxBBh46CVE0KLUtDmXUqeQbiWk=;
 b=CXnC9q74cYoIX+BD9SeHHwPrzSluLUw/mfiz0W4RTKQFXdLpX3V0EkrBLRexuv4OrDZWgn
 5AsSDSiYRqnySfKLzw89igW9KYqhMNSPEO8QxFX104JrXZMVY88Ohv7yGNVNkrdLbefogV
 SJR66Q8QBLxUJzOn0kgmU3p46RbNxto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743500671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/VR2Ocun30kjokqYfxBBh46CVE0KLUtDmXUqeQbiWk=;
 b=15WFPvaLk8GqeodjoehNw/LZ43wbATKxT+rJU/+/rq3AMYQao+jD5G4IKmYFjy4vDbJoTH
 DTHe9Ex/Lof5WLCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743500671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/VR2Ocun30kjokqYfxBBh46CVE0KLUtDmXUqeQbiWk=;
 b=CXnC9q74cYoIX+BD9SeHHwPrzSluLUw/mfiz0W4RTKQFXdLpX3V0EkrBLRexuv4OrDZWgn
 5AsSDSiYRqnySfKLzw89igW9KYqhMNSPEO8QxFX104JrXZMVY88Ohv7yGNVNkrdLbefogV
 SJR66Q8QBLxUJzOn0kgmU3p46RbNxto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743500671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/VR2Ocun30kjokqYfxBBh46CVE0KLUtDmXUqeQbiWk=;
 b=15WFPvaLk8GqeodjoehNw/LZ43wbATKxT+rJU/+/rq3AMYQao+jD5G4IKmYFjy4vDbJoTH
 DTHe9Ex/Lof5WLCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BF5B13A43;
 Tue,  1 Apr 2025 09:44:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8KtcEX+162dSBgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 09:44:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 17/18] drm/sysfb: vesadrm: Add EDID support
Date: Tue,  1 Apr 2025 11:37:20 +0200
Message-ID: <20250401094056.32904-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401094056.32904-1-tzimmermann@suse.de>
References: <20250401094056.32904-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
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

Enable the connector's EDID property if edid_info contains valid
data. Exports the EDID via sysfs for user-space compositors.

EDID information is not always available. Depending on the system
and kernel configuration, it is either provided by the boot loader
or read by the kernel during early boot stages.

There's only one VESA display, so EDID data always belongs to this
output.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/vesadrm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 8a963057ffec9..07f59880ce0f9 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -13,6 +13,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -22,6 +23,7 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
+#include <video/edid.h>
 #include <video/pixel_format.h>
 
 #include "drm_sysfb_helper.h"
@@ -280,6 +282,10 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d bytes\n",
 		&format->format, width, height, stride);
 
+#ifdef CONFIG_X86
+	if (drm_edid_header_is_valid(edid_info.dummy) == 8)
+		sysfb->edid = edid_info.dummy;
+#endif
 	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
 	sysfb->fb_pitch = stride;
@@ -374,6 +380,8 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 	drm_connector_set_panel_orientation_with_quirk(connector,
 						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
 						       width, height);
+	if (sysfb->edid)
+		drm_connector_attach_edid_property(connector);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
-- 
2.49.0

