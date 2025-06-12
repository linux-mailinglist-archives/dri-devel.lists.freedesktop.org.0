Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C6EAD7011
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218810E81D;
	Thu, 12 Jun 2025 12:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cQU3wJ5V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g8Md1G/5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cQU3wJ5V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g8Md1G/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD2210E817
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:20:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 55FD7219B5;
 Thu, 12 Jun 2025 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBLKL+2h+VcpwPlyPvmB9xD/Ast/LSzckdriJ8oYMEE=;
 b=cQU3wJ5V6LayDg59CU76M19wJZk9IyqyH/p8AZ+ere+e5tSZwAHh+8YIwOB5cz3R13m197
 M/wEcj8BqFLXzsIKj447gPMEzR6lwUvieCtH14BHJRyvSc8hv2NOgdDo2GDI62RpjAhCYO
 p4iulvIVru64+czSUMWZiiUrrnJC8GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBLKL+2h+VcpwPlyPvmB9xD/Ast/LSzckdriJ8oYMEE=;
 b=g8Md1G/5yEpYgJa4WvfdxZVm+psE74eqSqt1NXXmnshJrLFubYJQtW3DfBcWOHeitI4pLk
 K56V4RK+QyN/fjAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cQU3wJ5V;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="g8Md1G/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBLKL+2h+VcpwPlyPvmB9xD/Ast/LSzckdriJ8oYMEE=;
 b=cQU3wJ5V6LayDg59CU76M19wJZk9IyqyH/p8AZ+ere+e5tSZwAHh+8YIwOB5cz3R13m197
 M/wEcj8BqFLXzsIKj447gPMEzR6lwUvieCtH14BHJRyvSc8hv2NOgdDo2GDI62RpjAhCYO
 p4iulvIVru64+czSUMWZiiUrrnJC8GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBLKL+2h+VcpwPlyPvmB9xD/Ast/LSzckdriJ8oYMEE=;
 b=g8Md1G/5yEpYgJa4WvfdxZVm+psE74eqSqt1NXXmnshJrLFubYJQtW3DfBcWOHeitI4pLk
 K56V4RK+QyN/fjAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DBCD13A6D;
 Thu, 12 Jun 2025 12:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GAAFBgTGSmhBdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 12:20:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona.vetter@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/9] drm/bridge: Include <linux/export.h>
Date: Thu, 12 Jun 2025 14:09:57 +0200
Message-ID: <20250612121633.229222-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612121633.229222-1-tzimmermann@suse.de>
References: <20250612121633.229222-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 55FD7219B5
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email,linaro.org:email];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
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

Fix compile-time warnings

  drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/aux-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/aux-hpd-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/panel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/samsung-dsim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_bridge_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c | 2 ++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  | 1 +
 drivers/gpu/drm/bridge/aux-bridge.c                 | 1 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c             | 1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      | 2 ++
 drivers/gpu/drm/bridge/panel.c                      | 1 +
 drivers/gpu/drm/bridge/samsung-dsim.c               | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      | 1 +
 drivers/gpu/drm/drm_bridge.c                        | 1 +
 drivers/gpu/drm/drm_bridge_helper.c                 | 2 ++
 13 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c b/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
index b1e482994ffe..e8662168717d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
@@ -5,6 +5,8 @@
  * Based on anx7808 driver obtained from chromeos with copyright:
  * Copyright(c) 2013, Google Inc.
  */
+
+#include <linux/export.h>
 #include <linux/regmap.h>
 
 #include <drm/display/drm_dp_helper.h>
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 505eec6b819b..a1bc3e96dd35 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index 5b219e3b87b1..b63304d3a80f 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -5,6 +5,7 @@
  * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  */
 #include <linux/auxiliary_bus.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/of.h>
 
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 3eb411f874e4..e579f947e15b 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -5,6 +5,7 @@
  * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  */
 #include <linux/auxiliary_bus.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/of.h>
 
diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
index 989bc497b050..0e31d5000e7c 100644
--- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
+++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
@@ -5,6 +5,8 @@
  * bridge driver for legacy DT bindings, utilizing display-timings node
  */
 
+#include <linux/export.h>
+
 #include <drm/drm_bridge.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6cbbfb1381a4..6361a943e213 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/export.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe..f2f666b27d2d 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -14,6 +14,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/irq.h>
 #include <linux/media-bus-format.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 94dddaf49b3c..7ade80f02a94 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -8,6 +8,7 @@
  */
 #include <linux/completion.h>
 #include <linux/hdmi.h>
+#include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 8791408dd1ff..76c6570e2a85 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index c0dc0f2976b9..8fc2e282ff11 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/iopoll.h>
 #include <linux/math64.h>
 #include <linux/media-bus-format.h>
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index fc91aca95d12..5926a3a05d79 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/export.h>
 #include <linux/iopoll.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index bf34cc5ab031..d6ce7b4c019f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -23,6 +23,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/gpu/drm/drm_bridge_helper.c b/drivers/gpu/drm/drm_bridge_helper.c
index af80d2496194..420f29cf3e54 100644
--- a/drivers/gpu/drm/drm_bridge_helper.c
+++ b/drivers/gpu/drm/drm_bridge_helper.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <linux/export.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-- 
2.49.0

