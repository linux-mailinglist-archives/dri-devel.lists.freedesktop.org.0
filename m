Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223D1846ECB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 12:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7BB10EBAF;
	Fri,  2 Feb 2024 11:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="jSwxgw1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 519 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 09:03:52 UTC
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F8789FA5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:03:52 +0000 (UTC)
Received: from dragon.fritz.box (unknown [58.7.187.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 6EE233FE92; 
 Fri,  2 Feb 2024 08:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1706864133;
 bh=9y1paqiSjtE07Weh2QloWiCQOyB0q+cBO1seRMkGQ5U=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=jSwxgw1oinexsw8k0fTHX+F+36OtyHCsA6707oBJrYH9KWdzlxTFxDutKv68xnW/7
 UfEwG4imbeeLaBu6PF50zny0Ko3uNsUGcnXCuDGo1+za4PyofPz1YTmmAisLYRxKFB
 RQNEtNMBu9f4mZqqtdFvj/420c0CRGIdO2lNVRM1c+Tt7A+UEYdnw3BlWbxh7qyskM
 H8Sux6yJcmNlyAU3TI/EhMQzFPNECg7SVkuhX6S8KzUlkgRfEo4V1XBNWXyBzCx/xw
 rqlCB9HpUFzKqVIZgLcwTjE9Y9ZM4j1yCGlS2NHDhJXaruP5ECg+/CzSaLLAqKgwA2
 J40BhzF+wbxFA==
From: Daniel van Vugt <daniel.van.vugt@canonical.com>
To: 
Cc: Daniel van Vugt <daniel.van.vugt@canonical.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fbcon: Defer console takeover for splash screens to first
 switch
Date: Fri,  2 Feb 2024 16:53:55 +0800
Message-ID: <20240202085408.23251-2-daniel.van.vugt@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202085408.23251-1-daniel.van.vugt@canonical.com>
References: <20240202085408.23251-1-daniel.van.vugt@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Feb 2024 11:20:17 +0000
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

Until now, deferred console takeover only meant defer until there is
output. But that risks stepping on the toes of userspace splash screens,
as console messages may appear before the splash screen. So check for the
"splash" parameter (as used by Plymouth) and if present then extend the
deferral until the first switch.

Closes: https://bugs.launchpad.net/bugs/1970069
Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
---
 drivers/video/fbdev/core/fbcon.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 63af6ab034..5b9f7635f7 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -76,6 +76,7 @@
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
 #include <asm/irq.h>
+#include <asm/cmdline.h>
 
 #include "fbcon.h"
 #include "fb_internal.h"
@@ -146,6 +147,7 @@ static inline void fbcon_map_override(void)
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 static bool deferred_takeover = true;
+static int initial_console = -1;
 #else
 #define deferred_takeover false
 #endif
@@ -3341,7 +3343,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
 	console_unlock();
 }
 
-static struct notifier_block fbcon_output_nb;
+static struct notifier_block fbcon_output_nb, fbcon_switch_nb;
 static DECLARE_WORK(fbcon_deferred_takeover_work, fbcon_register_existing_fbs);
 
 static int fbcon_output_notifier(struct notifier_block *nb,
@@ -3358,6 +3360,21 @@ static int fbcon_output_notifier(struct notifier_block *nb,
 
 	return NOTIFY_OK;
 }
+
+static int fbcon_switch_notifier(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct vc_data *vc = data;
+
+	WARN_CONSOLE_UNLOCKED();
+
+	if (vc->vc_num != initial_console) {
+		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
+		dummycon_register_output_notifier(&fbcon_output_nb);
+	}
+
+	return NOTIFY_OK;
+}
 #endif
 
 static void fbcon_start(void)
@@ -3370,7 +3387,14 @@ static void fbcon_start(void)
 
 	if (deferred_takeover) {
 		fbcon_output_nb.notifier_call = fbcon_output_notifier;
-		dummycon_register_output_notifier(&fbcon_output_nb);
+		fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
+		initial_console = fg_console;
+
+		if (cmdline_find_option_bool(boot_command_line, "splash"))
+			dummycon_register_switch_notifier(&fbcon_switch_nb);
+		else
+			dummycon_register_output_notifier(&fbcon_output_nb);
+
 		return;
 	}
 #endif
@@ -3417,8 +3441,10 @@ void __exit fb_console_exit(void)
 {
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 	console_lock();
-	if (deferred_takeover)
+	if (deferred_takeover) {
 		dummycon_unregister_output_notifier(&fbcon_output_nb);
+		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
+	}
 	console_unlock();
 
 	cancel_work_sync(&fbcon_deferred_takeover_work);
-- 
2.43.0

