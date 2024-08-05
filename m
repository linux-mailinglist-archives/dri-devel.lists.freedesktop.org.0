Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51BC947B86
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 15:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389A510E1F5;
	Mon,  5 Aug 2024 13:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aawBmJ12";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ll0WAc5n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aawBmJ12";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ll0WAc5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96DA10E1F5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 13:06:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9CD5621AB4;
 Mon,  5 Aug 2024 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722863184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mO26J9gXj8d/cyNWzzis6jIw4VVIakyqcowislB7cOI=;
 b=aawBmJ12I+3MXP+wEm3c+2FOi5z+KrSYzAVUyHzqQ579+RhDQP1nfs1FTeqGNYo8l9B4i8
 LFwdn46S442WEPNbJhF10ZrKoI8OdSN4La5+tcIEfdFV4Wmm2TUN/8rifCMX60lQS1g7o6
 nhjCtp72/gF2VpkeuUPpVCJhAS2hcnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722863184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mO26J9gXj8d/cyNWzzis6jIw4VVIakyqcowislB7cOI=;
 b=ll0WAc5nSKMOhpLv65J6wfBdcSXphvqLH++1/O/B5MxXhQvxPfw9C8MEJI4UuJcEyMBMfC
 UFCLMscDOj9V1RAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722863184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mO26J9gXj8d/cyNWzzis6jIw4VVIakyqcowislB7cOI=;
 b=aawBmJ12I+3MXP+wEm3c+2FOi5z+KrSYzAVUyHzqQ579+RhDQP1nfs1FTeqGNYo8l9B4i8
 LFwdn46S442WEPNbJhF10ZrKoI8OdSN4La5+tcIEfdFV4Wmm2TUN/8rifCMX60lQS1g7o6
 nhjCtp72/gF2VpkeuUPpVCJhAS2hcnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722863184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mO26J9gXj8d/cyNWzzis6jIw4VVIakyqcowislB7cOI=;
 b=ll0WAc5nSKMOhpLv65J6wfBdcSXphvqLH++1/O/B5MxXhQvxPfw9C8MEJI4UuJcEyMBMfC
 UFCLMscDOj9V1RAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64E5D13ACF;
 Mon,  5 Aug 2024 13:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CPNqF1DOsGaiMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Aug 2024 13:06:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] drm/mgag200: vga-bmc: Transparently handle BMC
Date: Mon,  5 Aug 2024 15:05:58 +0200
Message-ID: <20240805130622.63458-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240805130622.63458-1-tzimmermann@suse.de>
References: <20240805130622.63458-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

The VGA-BMC connector selects the VGA output if a display has been
attached to the physical connector. Otherwise it selects the BMC
output. In any case, the connector status is set to 'detected', so
that the userspace compositor displays to it.

Depending on the setting, the connector's display modes either come
from the VGA monitor's EDID or from an internal list of BMC-compatible
modes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 50 ++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
index b6b90632b3c6..3a958c3587ac 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
@@ -11,9 +12,54 @@ static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
 	.destroy = drm_encoder_cleanup
 };
 
+static int mgag200_vga_bmc_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct mga_device *mdev = to_mga_device(connector->dev);
+	const struct mgag200_device_info *minfo = mdev->info;
+	int count;
+
+	count = drm_connector_helper_get_modes(connector);
+
+	if (!count) {
+		/*
+		 * There's no EDID data without a connected monitor. Set BMC-
+		 * compatible modes in this case. The XGA default resolution
+		 * should work well for all BMCs.
+		 */
+		count = drm_add_modes_noedid(connector, minfo->max_hdisplay, minfo->max_vdisplay);
+		if (count)
+			drm_set_preferred_mode(connector, 1024, 768);
+	}
+
+	return count;
+}
+
+/*
+ * There's no monitor connected if the DDC did not return an EDID. Still
+ * return 'connected' as there's always a BMC. Incrementing the connector's
+ * epoch counter triggers an update of the related properties.
+ */
+static int mgag200_vga_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
+						       struct drm_modeset_acquire_ctx *ctx,
+						       bool force)
+{
+	enum drm_connector_status old_status, status;
+
+	if (connector->edid_blob_ptr)
+		old_status = connector_status_connected;
+	else
+		old_status = connector_status_disconnected;
+
+	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
+
+	if (status != old_status)
+		++connector->epoch_counter;
+	return connector_status_connected;
+}
+
 static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
-	.get_modes = drm_connector_helper_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc
+	.get_modes = mgag200_vga_bmc_connector_helper_get_modes,
+	.detect_ctx = mgag200_vga_bmc_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs mgag200_vga_connector_funcs = {
-- 
2.46.0

