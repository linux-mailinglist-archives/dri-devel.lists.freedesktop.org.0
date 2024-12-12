Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6019EF496
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9436710EE59;
	Thu, 12 Dec 2024 17:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NQpgmOXv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uOp6Ce6y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NQpgmOXv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uOp6Ce6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 25353 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2024 17:09:22 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9610E63E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C43E02117F;
 Thu, 12 Dec 2024 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4w0pEB/vKQvA5pLs8am71YYwxayuIRNDkfnLlR69vNk=;
 b=NQpgmOXvmxv2dCNMj6PEGaqLxyEt4QaLq1VoNfINg4S75SD9/8GwjXUSQRZDmH9BCidKxA
 DBqHr5KtC75abZOqEfMRGmncLIAQYsG8bXqbmbRBjV0CajytWdaxJSJxtle9wvBM+v8bPl
 XMT/thUq0J1zFyjqPQsyaCztE+NI26g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4w0pEB/vKQvA5pLs8am71YYwxayuIRNDkfnLlR69vNk=;
 b=uOp6Ce6ywe1p48YD3Z/2sOn1DtWcUNlMk3OwDuslAuGvCJ3mKpxyEu/JOYqrpIPC3fnULC
 /3uD0kso8GEMEOCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NQpgmOXv;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uOp6Ce6y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4w0pEB/vKQvA5pLs8am71YYwxayuIRNDkfnLlR69vNk=;
 b=NQpgmOXvmxv2dCNMj6PEGaqLxyEt4QaLq1VoNfINg4S75SD9/8GwjXUSQRZDmH9BCidKxA
 DBqHr5KtC75abZOqEfMRGmncLIAQYsG8bXqbmbRBjV0CajytWdaxJSJxtle9wvBM+v8bPl
 XMT/thUq0J1zFyjqPQsyaCztE+NI26g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4w0pEB/vKQvA5pLs8am71YYwxayuIRNDkfnLlR69vNk=;
 b=uOp6Ce6ywe1p48YD3Z/2sOn1DtWcUNlMk3OwDuslAuGvCJ3mKpxyEu/JOYqrpIPC3fnULC
 /3uD0kso8GEMEOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CAA313A3D;
 Thu, 12 Dec 2024 17:09:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wDRuFcAYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/12] drm/{i915,
 xe}: Suspend/resume fbdev emulation via client interfaces
Date: Thu, 12 Dec 2024 18:08:42 +0100
Message-ID: <20241212170913.185939-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C43E02117F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Implement drm_client_dev_suspend() and drm_client_dev_resume() for
i915's fbdev emulation and call the helper via DRM client interfaces.
This is required to convert i915 and xe to DRM's generic fbdev client.
No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 16 ++++++++++++++++
 drivers/gpu/drm/i915/i915_driver.c         |  9 +++++----
 drivers/gpu/drm/xe/display/xe_display.c    |  9 +++++----
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 00852ff5b247..a51d1dfd1b58 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -642,11 +642,27 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 	return ret;
 }
 
+static int intel_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
+{
+	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_SUSPENDED, true);
+
+	return 0;
+}
+
+static int intel_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
+{
+	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_RUNNING, false);
+
+	return 0;
+}
+
 static const struct drm_client_funcs intel_fbdev_client_funcs = {
 	.owner		= THIS_MODULE,
 	.unregister	= intel_fbdev_client_unregister,
 	.restore	= intel_fbdev_client_restore,
 	.hotplug	= intel_fbdev_client_hotplug,
+	.suspend	= intel_fbdev_client_suspend,
+	.resume		= intel_fbdev_client_resume,
 };
 
 void intel_fbdev_setup(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index eb3fcc9e77a5..e385e4947a91 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -41,6 +41,8 @@
 #include <linux/vt.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
@@ -55,7 +57,6 @@
 #include "display/intel_dp.h"
 #include "display/intel_dpt.h"
 #include "display/intel_encoder.h"
-#include "display/intel_fbdev.h"
 #include "display/intel_hotplug.h"
 #include "display/intel_overlay.h"
 #include "display/intel_pch_refclk.h"
@@ -958,7 +959,7 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
 	intel_runtime_pm_disable(&i915->runtime_pm);
 	intel_power_domains_disable(display);
 
-	intel_fbdev_set_suspend(&i915->drm, FBINFO_STATE_SUSPENDED, true);
+	drm_client_dev_suspend(&i915->drm, false);
 	if (HAS_DISPLAY(i915)) {
 		drm_kms_helper_poll_disable(&i915->drm);
 		intel_display_driver_disable_user_access(display);
@@ -1041,7 +1042,7 @@ static int i915_drm_suspend(struct drm_device *dev)
 	/* We do a lot of poking in a lot of registers, make sure they work
 	 * properly. */
 	intel_power_domains_disable(display);
-	intel_fbdev_set_suspend(dev, FBINFO_STATE_SUSPENDED, true);
+	drm_client_dev_suspend(dev, false);
 	if (HAS_DISPLAY(dev_priv)) {
 		drm_kms_helper_poll_disable(dev);
 		intel_display_driver_disable_user_access(display);
@@ -1227,7 +1228,7 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	intel_opregion_resume(display);
 
-	intel_fbdev_set_suspend(dev, FBINFO_STATE_RUNNING, false);
+	drm_client_dev_resume(dev, false);
 
 	intel_power_domains_enable(display);
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 317fa66adf18..bc73c9999c57 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -8,6 +8,8 @@
 
 #include <linux/fb.h>
 
+#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
@@ -25,7 +27,6 @@
 #include "intel_dmc_wl.h"
 #include "intel_dp.h"
 #include "intel_encoder.h"
-#include "intel_fbdev.h"
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
@@ -336,7 +337,7 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	 */
 	intel_power_domains_disable(display);
 	if (!runtime)
-		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+		drm_client_dev_suspend(&xe->drm, false);
 
 	if (!runtime && has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
@@ -374,7 +375,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 		return;
 
 	intel_power_domains_disable(display);
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+	drm_client_dev_suspend(&xe->drm, false);
 	if (has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
 		intel_display_driver_disable_user_access(display);
@@ -494,7 +495,7 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
 	intel_opregion_resume(display);
 
 	if (!runtime)
-		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
+		drm_client_dev_resume(&xe->drm, false);
 
 	intel_power_domains_enable(display);
 }
-- 
2.47.1

