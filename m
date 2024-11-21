Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD09D55AD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF0010E420;
	Thu, 21 Nov 2024 22:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="lvi8NWAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B19710EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:33:09 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 0F1152E0952F;
 Thu, 21 Nov 2024 19:23:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732209791;
 bh=md6zaJta8omWGAdQeUBLLs46yHXPjdxLdPWorE9Bt7o=; h=From:To:Subject;
 b=lvi8NWArex8mogvPYZwjq7HnYAXitC8yxOhHcfQRD2ifF79HVpyy8g+xDQqkRIMll
 RtRM3KxAFksXLnCiQLP7P3bv5SS5hfHhNWFRifO/57XNG7JrBlDKSDUWiU/J+HtQH9
 ghJZvehM74sRU2wE5lMiENmFtnuCQ/nZGkrm79Jg=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd)
 smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC 10/13] acpi/x86: s2idle: add Turn On Display and call as part of
 callback
Date: Thu, 21 Nov 2024 18:22:35 +0100
Message-ID: <20241121172239.119590-11-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173220979049.9411.6636007944859871917@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 21 Nov 2024 22:47:36 +0000
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

The Turn On Display callback was introduced in Windows 22H2, to allow
devices to resume faster from sleep. Essentially, if the device lowers
its power limit (PLx) while it is in the Sleep state, this might lengthen
the suspend sequence in an undesirable manner. Implement this callback,
which corresponds to Modern Standby Firmware notification (_DSM) 9.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/acpi/x86/s2idle.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index bdc2cc8d4994..d389c57d2963 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -45,6 +45,7 @@ static const struct acpi_device_id lps0_device_ids[] = {
 #define ACPI_LPS0_EXIT		6
 #define ACPI_LPS0_SLEEP_ENTRY      7
 #define ACPI_LPS0_SLEEP_EXIT       8
+#define ACPI_LPS0_TURN_ON_DISPLAY  9
 
 /* AMD */
 #define ACPI_LPS0_DSM_UUID_AMD      "e3f32452-febc-43ce-9039-932122d37721"
@@ -375,6 +376,8 @@ static const char *acpi_sleep_dsm_state_to_str(unsigned int state)
 			return "sleep entry";
 		case ACPI_LPS0_SLEEP_EXIT:
 			return "sleep exit";
+		case ACPI_LPS0_TURN_ON_DISPLAY:
+			return "turn on display";
 		}
 	} else {
 		switch (state) {
@@ -589,6 +592,29 @@ static int acpi_s2idle_sleep_entry(void)
 	return 0;
 }
 
+static int acpi_s2idle_turn_on_display(void)
+{
+	if (!lps0_device_handle || sleep_no_lps0 ||
+	    lps0_dsm_func_mask_microsoft <= 0)
+		return 0;
+
+	/* This call is only valid while we are in a sleep state */
+	if (WARN_ON(!lsp0_dsm_in_sleep))
+		return -EINVAL;
+
+	acpi_scan_lock_acquire();
+
+	/* Modern Standby Turn On Display */
+	if (lps0_dsm_func_mask_microsoft > 0)
+		acpi_sleep_run_lps0_dsm(ACPI_LPS0_TURN_ON_DISPLAY,
+					lps0_dsm_func_mask_microsoft,
+					lps0_dsm_guid_microsoft);
+
+	acpi_scan_lock_release();
+
+	return 0;
+}
+
 static int acpi_s2idle_sleep_exit(void)
 {
 	if (!lps0_device_handle || sleep_no_lps0 || lps0_dsm_func_mask_microsoft <= 0)
@@ -714,6 +740,7 @@ static const struct platform_s2idle_ops acpi_s2idle_ops_lps0 = {
 	.restore_early = acpi_s2idle_restore_early,
 	.restore = acpi_s2idle_restore,
 	.end = acpi_s2idle_end,
+	.turn_on_display = acpi_s2idle_turn_on_display,
 	.sleep_exit = acpi_s2idle_sleep_exit,
 	.display_on = acpi_s2idle_display_on,
 };
-- 
2.47.0

