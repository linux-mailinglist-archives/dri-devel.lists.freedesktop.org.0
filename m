Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D962084B21F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 11:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9119210ED85;
	Tue,  6 Feb 2024 10:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="pvwpZAYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AED10FE43
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 10:12:05 +0000 (UTC)
Received: from dragon.fritz.box (unknown [58.7.187.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2A8513FB19; 
 Tue,  6 Feb 2024 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1707214322;
 bh=qrYMi74bcCPFGEWKyxCuYJeZThHsF8LjYHDib4wabmI=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=pvwpZAYpL7itxwj6MgJbESyF7AQhBzP2KZHOCwoBIe8dEJADO0NNkYpP3PlsljhHk
 lst+w14GIg0+Dpz/36nj53p1oLYtd5VC/LYz5MWuUeEgu8ba4JLGLoHZKEq+bl7p6a
 QCogBCbjjK/5a6yhWtNGU0/vOxXCbBpiKq6JuUJGGqG6qDFgtAOs0iBbaiBoh3UsdU
 PdgekP0s1iugCZzUWitEINb2L0cYNlGXCpUOF3UM7rBK3kUb7kNzBQcbqpRFISmn5G
 2Pwn9N23cv7rUx3l4ZfnPZPMbVvCpSx2P7ji6o6WiWLaZzMD/qSh2AQ7ArtAuzTzTv
 c9yAptHsCJ1rQ==
From: Daniel van Vugt <daniel.van.vugt@canonical.com>
To: 
Cc: Daniel van Vugt <daniel.van.vugt@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dummycon: Add dummycon_(un)register_switch_notifier
Date: Tue,  6 Feb 2024 18:10:50 +0800
Message-ID: <20240206101100.25536-1-daniel.van.vugt@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
References: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

To detect switch attempts before a real console exists. This will be
used for the same purpose as dummycon_(un)register_output_notifier,
for fbcon to detect a more polite time to take over.

Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
---
 drivers/video/console/dummycon.c | 35 +++++++++++++++++++++++++++-----
 include/linux/console.h          |  2 ++
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index 14af5d9e13..55e9b600ce 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -83,6 +83,32 @@ static int dummycon_blank(struct vc_data *vc, int blank, int mode_switch)
 	/* Redraw, so that we get putc(s) for output done while blanked */
 	return 1;
 }
+
+/* This is protected by the console_lock */
+static RAW_NOTIFIER_HEAD(dummycon_switch_nh);
+
+void dummycon_register_switch_notifier(struct notifier_block *nb)
+{
+	WARN_CONSOLE_UNLOCKED();
+
+	raw_notifier_chain_register(&dummycon_switch_nh, nb);
+}
+
+void dummycon_unregister_switch_notifier(struct notifier_block *nb)
+{
+	WARN_CONSOLE_UNLOCKED();
+
+	raw_notifier_chain_unregister(&dummycon_switch_nh, nb);
+}
+
+static int dummycon_switch(struct vc_data *vc)
+{
+	WARN_CONSOLE_UNLOCKED();
+
+	raw_notifier_call_chain(&dummycon_switch_nh, 0, vc);
+
+	return 0;
+}
 #else
 static void dummycon_putc(struct vc_data *vc, int c, int ypos, int xpos) { }
 static void dummycon_putcs(struct vc_data *vc, const unsigned short *s,
@@ -91,6 +117,10 @@ static int dummycon_blank(struct vc_data *vc, int blank, int mode_switch)
 {
 	return 0;
 }
+static int dummycon_switch(struct vc_data *vc)
+{
+	return 0;
+}
 #endif
 
 static const char *dummycon_startup(void)
@@ -120,11 +150,6 @@ static bool dummycon_scroll(struct vc_data *vc, unsigned int top,
 	return false;
 }
 
-static int dummycon_switch(struct vc_data *vc)
-{
-	return 0;
-}
-
 /*
  *  The console `switch' structure for the dummy console
  *
diff --git a/include/linux/console.h b/include/linux/console.h
index 779d388af8..8fd70ae623 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -531,5 +531,7 @@ extern void console_init(void);
 /* For deferred console takeover */
 void dummycon_register_output_notifier(struct notifier_block *nb);
 void dummycon_unregister_output_notifier(struct notifier_block *nb);
+void dummycon_register_switch_notifier(struct notifier_block *nb);
+void dummycon_unregister_switch_notifier(struct notifier_block *nb);
 
 #endif /* _LINUX_CONSOLE_H */
-- 
2.43.0

