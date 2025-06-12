Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E202AD7015
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB08610E825;
	Thu, 12 Jun 2025 12:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="F+gtrAAp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h4YWIib5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JuPB7AlT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mq9i0nS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78F910E825
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:20:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8749219BB;
 Thu, 12 Jun 2025 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jk9d+rb+u5ZYGNR65I78kAq4hIP1Za2fs/tyhdkQuG8=;
 b=F+gtrAApYbMv9TPQRwOZP+ALXOau7d8cCcKFhLt2HmizbAPfbugiysObxaGhj3VMkrd87F
 h41qvWEgylIrCp3xPx8/grZ+QMhcV9eU2FPMOHQEbSMfcnlqbJlbql67erawIyIeEEZulY
 gTiVTfAsBWIukaAmj0AaXtQ99tjGPAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jk9d+rb+u5ZYGNR65I78kAq4hIP1Za2fs/tyhdkQuG8=;
 b=h4YWIib5/mQdzOi7P8aqTBaYKHx69q9OV3xJ85eoFn65KrU+D6nFI/FilncvLQnsVCIJ0X
 D5DnKwgbEYA2G4Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jk9d+rb+u5ZYGNR65I78kAq4hIP1Za2fs/tyhdkQuG8=;
 b=JuPB7AlTRYPSkt8GS2qCH79Dp0gSHSM41x4UxsOZ1Fu0cUC9NnaVCRz6hbefEA9S3sd+5o
 65vqzYNTpcODtO8hguMjllEMnaT4pHlOdMQMWmNZvvd7cHay3ptwoP9Fzf1aSsvmKUx46A
 O8KytDjyKw4tAjA43zE7YfTZeu3Q8uk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jk9d+rb+u5ZYGNR65I78kAq4hIP1Za2fs/tyhdkQuG8=;
 b=mq9i0nS8GoI3tcMmoHN1GPaoiXAWmARUIvS/gvyHlRMCdcrQU76g48na7HMzDilX+ejgMZ
 7XDWyg5pyRj4PRBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97CFB132D8;
 Thu, 12 Jun 2025 12:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CN15IwTGSmhBdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 12:20:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona.vetter@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/9] drm/display: Include <linux/export.h>
Date: Thu, 12 Jun 2025 14:09:59 +0200
Message-ID: <20250612121633.229222-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612121633.229222-1-tzimmermann@suse.de>
References: <20250612121633.229222-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_SHORT(-0.20)[-0.987]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,intel.com:email,ideasonboard.com:email,imap1.dmz-prg2.suse.org:helo];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap1.dmz-prg2.suse.org:helo,
 suse.de:email, suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30
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

Fix the compile-time warnings

  drivers/gpu/drm/display/drm_bridge_connector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_dp_aux_bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_dp_cec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_dp_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_dp_mst_topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_dp_tunnel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_dsc_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_hdmi_audio_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_hdmi_cec_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_hdmi_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_hdmi_state_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/display/drm_scdc_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/display/drm_bridge_connector.c         | 1 +
 drivers/gpu/drm/display/drm_dp_aux_bus.c               | 1 +
 drivers/gpu/drm/display/drm_dp_cec.c                   | 1 +
 drivers/gpu/drm/display/drm_dp_helper.c                | 1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c          | 1 +
 drivers/gpu/drm/display/drm_dp_tunnel.c                | 1 +
 drivers/gpu/drm/display/drm_dsc_helper.c               | 1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c        | 1 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c          | 1 +
 drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c | 1 +
 drivers/gpu/drm/display/drm_hdmi_helper.c              | 1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c        | 2 ++
 drivers/gpu/drm/display/drm_scdc_helper.c              | 1 +
 13 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 58846e26f1e1..6cdb432dbc30 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2019 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index ec7eac6b595f..7b9afcf48836 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -12,6 +12,7 @@
  * to perform transactions on that bus.
  */
 
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index ed31471bd0e2..3b50d817c839 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -5,6 +5,7 @@
  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f2a6559a2710..896bba2adb3b 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -24,6 +24,7 @@
 #include <linux/delay.h>
 #include <linux/dynamic_debug.h>
 #include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a89f38fd3218..64e5c176d5cc 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -23,6 +23,7 @@
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 076edf161048..8a4ef5438f35 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/export.h>
 #include <linux/ref_tracker.h>
 #include <linux/types.h>
 
diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 6900f4dac520..05996c526a8a 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -6,6 +6,7 @@
  * Manasi Navare <manasi.d.navare@intel.com>
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index f165166afb2d..7d78b02c1446 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2024 Linaro Ltd
  */
 
+#include <linux/export.h>
 #include <linux/mutex.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index a25f60509043..b4273c3522fa 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 #include <drm/display/drm_hdmi_cec_helper.h>
 
+#include <linux/export.h>
 #include <linux/mutex.h>
 
 #include <media/cec.h>
diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
index 28f8e008cc59..31b8e4a93e24 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 #include <drm/display/drm_hdmi_cec_helper.h>
 
+#include <linux/export.h>
 #include <linux/mutex.h>
 
 #include <media/cec.h>
diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 855cb02b827d..6063c155bdea 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/export.h>
 #include <linux/module.h>
 
 #include <drm/display/drm_hdmi_helper.h>
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 2c641add7434..a561f124be99 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/export.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index 6d2f244e5830..df878aad4a36 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
-- 
2.49.0

