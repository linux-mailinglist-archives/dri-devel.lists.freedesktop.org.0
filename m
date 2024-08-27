Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC429609B7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 14:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB8D10E297;
	Tue, 27 Aug 2024 12:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="D9+KbPSh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTtG7RTY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D9+KbPSh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTtG7RTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032AF10E297;
 Tue, 27 Aug 2024 12:10:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6CF1A21B07;
 Tue, 27 Aug 2024 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724760605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Oyp5gvmS/Q/5Lp6iorEj4fJ4Ukxe4npg8UAbK3fv+js=;
 b=D9+KbPSh01tmoZ7lkma70CelVoBLUSTXY2RTE1FT1uX/S8Zqaew5hmw0FPRP0UiNKHxNFt
 MHzApTqtag1S5Ys4/oDOa9dODgfjV4goSMFe2opZzx49ZP3OSZMx5YlsJKWb7uZGdkq960
 jiY0JEBCqyWKC5caPLbML7Uac4Hh2tE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724760605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Oyp5gvmS/Q/5Lp6iorEj4fJ4Ukxe4npg8UAbK3fv+js=;
 b=hTtG7RTYhzONLObXCWpD+va4MkJcA9dDQywwp3/L/t59SgPxgBWJCEvmoTmAmkdVUi3Jps
 JooFQi8MMt120qDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D9+KbPSh;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hTtG7RTY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724760605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Oyp5gvmS/Q/5Lp6iorEj4fJ4Ukxe4npg8UAbK3fv+js=;
 b=D9+KbPSh01tmoZ7lkma70CelVoBLUSTXY2RTE1FT1uX/S8Zqaew5hmw0FPRP0UiNKHxNFt
 MHzApTqtag1S5Ys4/oDOa9dODgfjV4goSMFe2opZzx49ZP3OSZMx5YlsJKWb7uZGdkq960
 jiY0JEBCqyWKC5caPLbML7Uac4Hh2tE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724760605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Oyp5gvmS/Q/5Lp6iorEj4fJ4Ukxe4npg8UAbK3fv+js=;
 b=hTtG7RTYhzONLObXCWpD+va4MkJcA9dDQywwp3/L/t59SgPxgBWJCEvmoTmAmkdVUi3Jps
 JooFQi8MMt120qDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1251413A44;
 Tue, 27 Aug 2024 12:10:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +unQAh3CzWYlXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Aug 2024 12:10:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lucas.demarchi@intel.com, gustavo.sousa@intel.com,
 jani.nikula@linux.intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm/xe: Support 'nomodeset' kernel command-line option
Date: Tue, 27 Aug 2024 14:09:05 +0200
Message-ID: <20240827121003.97429-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6CF1A21B07
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[12]; ARC_NA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,intel.com:email];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Setting 'nomodeset' on the kernel command line disables all graphics
drivers with modesetting capabilities, leaving only firmware drivers,
such as simpledrm or efifb.

Most DRM drivers automatically support 'nomodeset' via DRM's module
helper macros. In xe, which uses regular module_init(), manually call
drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
the driver if set.

v2:
- use xe's init table (Lucas)
- do NULL test for init/exit functions

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 39 +++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 923460119cec..b25b3cac5be5 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -8,6 +8,8 @@
 #include <linux/init.h>
 #include <linux/module.h>
 
+#include <drm/drm_module.h>
+
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_pci.h"
@@ -64,12 +66,23 @@ module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
 MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
 
+static int xe_check_nomodeset(void)
+{
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	return 0;
+}
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
 };
 
 static const struct init_funcs init_funcs[] = {
+	{
+		.init = xe_check_nomodeset,
+	},
 	{
 		.init = xe_hw_fence_module_init,
 		.exit = xe_hw_fence_module_exit,
@@ -88,15 +101,35 @@ static const struct init_funcs init_funcs[] = {
 	},
 };
 
+static int __init xe_call_init_func(unsigned int i)
+{
+	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
+		return 0;
+	if (!init_funcs[i].init)
+		return 0;
+
+	return init_funcs[i].init();
+}
+
+static void xe_call_exit_func(unsigned int i)
+{
+	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
+		return;
+	if (!init_funcs[i].exit)
+		return;
+
+	init_funcs[i].exit();
+}
+
 static int __init xe_init(void)
 {
 	int err, i;
 
 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
-		err = init_funcs[i].init();
+		err = xe_call_init_func(i);
 		if (err) {
 			while (i--)
-				init_funcs[i].exit();
+				xe_call_exit_func(i);
 			return err;
 		}
 	}
@@ -109,7 +142,7 @@ static void __exit xe_exit(void)
 	int i;
 
 	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
-		init_funcs[i].exit();
+		xe_call_exit_func(i);
 }
 
 module_init(xe_init);
-- 
2.46.0

