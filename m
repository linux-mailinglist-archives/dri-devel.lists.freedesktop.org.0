Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159498A439
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AEB10E48F;
	Mon, 30 Sep 2024 13:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yq96N4U8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3X4Ngs7u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CPAsmh8E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6SA08bli";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9C310E49A;
 Mon, 30 Sep 2024 13:09:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D38D621A3D;
 Mon, 30 Sep 2024 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IcVwH03u72j7OhUT6GidvXAIMw1zlYcS6wYT14j8ic=;
 b=yq96N4U8qzrKFXwu4O/aG2gMzcdOTJVz1KkC6idV/uWvwi8BzVwnO8e44H7PluqOUUVlnZ
 8eaBTXKtdOZCE/BSmFn1QUBhY2uOnu5eQe5hiWlCFXkDUZH1VNJGCpmoNl8Y6mmQH+x+ml
 K+WReuIZXzRujH0NjS3m2sJ1WFGxByE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701772;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IcVwH03u72j7OhUT6GidvXAIMw1zlYcS6wYT14j8ic=;
 b=3X4Ngs7uAmcz/woAx7JDXpGOO3f1NxS745NgAEp2KYCftQ32cVNKz03QKTAvGHkvxVn8jT
 OYEF6UU6MbsXt2AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727701771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IcVwH03u72j7OhUT6GidvXAIMw1zlYcS6wYT14j8ic=;
 b=CPAsmh8EHJUsLGOOv2iMQ/9e6CcwdcRLQNKx8SyloXrphy3qraoTgQg0sDmQ4A2KOhi0SD
 RzZNNkKcZxJLa8R+tmjpNwGfHWyMRZoWBPoR5PZdDD9L0uh4rnS4c8bCgIS4l12R9UIdwO
 9WAVIs7GXE62Sr3iA8xZ/KxcLD3JAnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727701771;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IcVwH03u72j7OhUT6GidvXAIMw1zlYcS6wYT14j8ic=;
 b=6SA08bliztH6RnF5a0T8ytSIWxTsMb4fQmLYrutZgUPrBzIpkXPr2Fym61KAuNV7uxH5FS
 CAEId8WdGtmXWvBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E4F713AAA;
 Mon, 30 Sep 2024 13:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4OOWHQuj+mb2dQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Sep 2024 13:09:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 20/28] drm/tegra: Use video aperture helpers
Date: Mon, 30 Sep 2024 15:03:18 +0200
Message-ID: <20240930130921.689876-21-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
References: <20240930130921.689876-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[13];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com,nvidia.com];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
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

DRM's aperture functions have long been implemented as helpers
under drivers/video/ for use with fbdev. Avoid the DRM wrappers by
calling the video functions directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index dd82ab71d4a9..babcb3958f86 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2012-2016 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/bitops.h>
 #include <linux/host1x.h>
 #include <linux/idr.h>
@@ -12,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client_setup.h>
@@ -1258,7 +1258,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	 * will not expose any modesetting features.
 	 */
 	if (drm->mode_config.num_crtc > 0) {
-		err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
+		err = aperture_remove_all_conflicting_devices(tegra_drm_driver.name);
 		if (err < 0)
 			goto hub;
 	} else {
-- 
2.46.0

