Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E12B2F0E9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 10:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A2F10E8AA;
	Thu, 21 Aug 2025 08:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QwFg6fuV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8duM82QC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QwFg6fuV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8duM82QC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E17910E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 08:22:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B4E1B1F38C;
 Thu, 21 Aug 2025 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755764532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfRQ1YDtmgRVCMBhPF9y1+DPJvJKm8NOBTKOgwEKeOI=;
 b=QwFg6fuVO8kPC3CYpqcQMO2WnQzn0UNsKdu6B8kida4DQTDf5ilhc9P/oEanolVli+EjXH
 K2qdPnPu37aHiZvC1dPRSQf7Po/5l+b5ytj76OleQf/+O71LyMnwNmrKf15mwFsj3pVTRD
 yu9WsOJMP1YR8H+bCw+nsu5K4VjKXXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755764532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfRQ1YDtmgRVCMBhPF9y1+DPJvJKm8NOBTKOgwEKeOI=;
 b=8duM82QCakQuiQUEkCtZxN78y8O1YDpsjhOPnIkd0B9OWViO1Q0VH9BWFwN3D+zmy/5dln
 lKsnf6WxI16j+1Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755764532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfRQ1YDtmgRVCMBhPF9y1+DPJvJKm8NOBTKOgwEKeOI=;
 b=QwFg6fuVO8kPC3CYpqcQMO2WnQzn0UNsKdu6B8kida4DQTDf5ilhc9P/oEanolVli+EjXH
 K2qdPnPu37aHiZvC1dPRSQf7Po/5l+b5ytj76OleQf/+O71LyMnwNmrKf15mwFsj3pVTRD
 yu9WsOJMP1YR8H+bCw+nsu5K4VjKXXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755764532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfRQ1YDtmgRVCMBhPF9y1+DPJvJKm8NOBTKOgwEKeOI=;
 b=8duM82QCakQuiQUEkCtZxN78y8O1YDpsjhOPnIkd0B9OWViO1Q0VH9BWFwN3D+zmy/5dln
 lKsnf6WxI16j+1Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B0FC139A8;
 Thu, 21 Aug 2025 08:22:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qIcXCTTXpmhzEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 01/25] drm/dumb-buffers: Sanitize output on errors
Date: Thu, 21 Aug 2025 10:17:08 +0200
Message-ID: <20250821081918.79786-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[21]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

The ioctls MODE_CREATE_DUMB and MODE_MAP_DUMB return results into a
memory buffer supplied by user space. On errors, it is possible that
intermediate values are being returned. The exact semantics depends
on the DRM driver's implementation of these ioctls. Although this is
most-likely not a security problem in practice, avoid any uncertainty
by clearing the memory to 0 on errors.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 40 ++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 70032bba1c97..9916aaf5b3f2 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -99,7 +99,30 @@ int drm_mode_create_dumb(struct drm_device *dev,
 int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 			       void *data, struct drm_file *file_priv)
 {
-	return drm_mode_create_dumb(dev, data, file_priv);
+	struct drm_mode_create_dumb *args = data;
+	int err;
+
+	err = drm_mode_create_dumb(dev, args, file_priv);
+	if (err) {
+		args->handle = 0;
+		args->pitch = 0;
+		args->size = 0;
+	}
+	return err;
+}
+
+static int drm_mode_mmap_dumb(struct drm_device *dev, struct drm_mode_map_dumb *args,
+			      struct drm_file *file_priv)
+{
+	if (!dev->driver->dumb_create)
+		return -ENOSYS;
+
+	if (dev->driver->dumb_map_offset)
+		return dev->driver->dumb_map_offset(file_priv, dev, args->handle,
+						    &args->offset);
+	else
+		return drm_gem_dumb_map_offset(file_priv, dev, args->handle,
+					       &args->offset);
 }
 
 /**
@@ -120,17 +143,12 @@ int drm_mode_mmap_dumb_ioctl(struct drm_device *dev,
 			     void *data, struct drm_file *file_priv)
 {
 	struct drm_mode_map_dumb *args = data;
+	int err;
 
-	if (!dev->driver->dumb_create)
-		return -ENOSYS;
-
-	if (dev->driver->dumb_map_offset)
-		return dev->driver->dumb_map_offset(file_priv, dev,
-						    args->handle,
-						    &args->offset);
-	else
-		return drm_gem_dumb_map_offset(file_priv, dev, args->handle,
-					       &args->offset);
+	err = drm_mode_mmap_dumb(dev, args, file_priv);
+	if (err)
+		args->offset = 0;
+	return err;
 }
 
 int drm_mode_destroy_dumb(struct drm_device *dev, u32 handle,
-- 
2.50.1

