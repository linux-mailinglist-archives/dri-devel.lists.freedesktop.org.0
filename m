Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C64C9D55BE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1D310EA7A;
	Thu, 21 Nov 2024 22:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="t47zSLsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4E610EA07
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:33:07 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 470F52E096A9;
 Thu, 21 Nov 2024 19:23:04 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732209788;
 bh=qGjHS8GQ4N3CJVQ4zNZrdwaBwtKD2iqsG4bJWaOXvl0=; h=From:To:Subject;
 b=t47zSLsQqqK0XuiT9GSfSTCmhFjdtjU7Ug6E1u4/k50n4tUITpIjWvFQyPsb09OkZ
 kh1zM2Oj7eS9FBw3yBAcgE8lDVbE4zkSDmcTC7QKjcezjEOZVpONEGW1OF9TENzmDB
 CLGRObLzDRAIwiRob2+jMeJYnCtVZ/Y56BphfWhY=
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
Subject: [RFC 09/13] acpi/x86: s2idle: call Sleep Entry/Exit as part of
 callbacks
Date: Thu, 21 Nov 2024 18:22:34 +0100
Message-ID: <20241121172239.119590-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173220978571.7825.3175429476405251822@linux1587.grserver.gr>
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

Move the Sleep Entry/Exit notifications outside the suspend sequence,
with their own ACPI lock, as was done for Display On/Off.

Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/acpi/x86/s2idle.c | 57 ++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index 49dcbdea903a..bdc2cc8d4994 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -61,6 +61,7 @@ static guid_t lps0_dsm_guid_microsoft;
 static int lps0_dsm_func_mask_microsoft;
 static int lps0_dsm_state;
 static bool lsp0_dsm_in_display_off;
+static bool lsp0_dsm_in_sleep;
 
 /* Device constraint entry structure */
 struct lpi_device_info {
@@ -567,6 +568,48 @@ static int acpi_s2idle_display_off(void)
 	return 0;
 }
 
+static int acpi_s2idle_sleep_entry(void)
+{
+	if (!lps0_device_handle || sleep_no_lps0 || lps0_dsm_func_mask_microsoft <= 0)
+		return 0;
+
+	if (WARN_ON(lsp0_dsm_in_sleep))
+		return -EINVAL;
+
+	lsp0_dsm_in_sleep = true;
+	acpi_scan_lock_acquire();
+
+	/* Modern Standby Sleep Entry */
+	if (lps0_dsm_func_mask_microsoft > 0)
+		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_ENTRY,
+				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
+
+	acpi_scan_lock_release();
+
+	return 0;
+}
+
+static int acpi_s2idle_sleep_exit(void)
+{
+	if (!lps0_device_handle || sleep_no_lps0 || lps0_dsm_func_mask_microsoft <= 0)
+		return 0;
+
+	if (WARN_ON(!lsp0_dsm_in_sleep))
+		return -EINVAL;
+
+	lsp0_dsm_in_sleep = false;
+	acpi_scan_lock_acquire();
+
+	/* Modern Standby Sleep Exit */
+	if (lps0_dsm_func_mask_microsoft > 0)
+		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_EXIT,
+				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
+
+	acpi_scan_lock_release();
+
+	return 0;
+}
+
 static int acpi_s2idle_display_on(void)
 {
 	if (!lps0_device_handle || sleep_no_lps0)
@@ -608,13 +651,9 @@ int acpi_s2idle_prepare_late(void)
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_ENTRY_AMD,
 					lps0_dsm_func_mask, lps0_dsm_guid);
 
-	if (lps0_dsm_func_mask_microsoft > 0) {
-		/* Modern Standby entry */
-		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_ENTRY,
-				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
+	if (lps0_dsm_func_mask_microsoft > 0)
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_ENTRY,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
-	}
 
 	if (lps0_dsm_func_mask > 0 && !acpi_s2idle_vendor_amd())
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_ENTRY,
@@ -659,17 +698,14 @@ void acpi_s2idle_restore_early(void)
 					ACPI_LPS0_EXIT,
 					lps0_dsm_func_mask, lps0_dsm_guid);
 
-	if (lps0_dsm_func_mask_microsoft > 0) {
+	if (lps0_dsm_func_mask_microsoft > 0)
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_EXIT,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
-		/* Modern Standby exit */
-		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_EXIT,
-				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
-	}
 }
 
 static const struct platform_s2idle_ops acpi_s2idle_ops_lps0 = {
 	.display_off = acpi_s2idle_display_off,
+	.sleep_entry = acpi_s2idle_sleep_entry,
 	.begin = acpi_s2idle_begin,
 	.prepare = acpi_s2idle_prepare,
 	.prepare_late = acpi_s2idle_prepare_late,
@@ -678,6 +714,7 @@ static const struct platform_s2idle_ops acpi_s2idle_ops_lps0 = {
 	.restore_early = acpi_s2idle_restore_early,
 	.restore = acpi_s2idle_restore,
 	.end = acpi_s2idle_end,
+	.sleep_exit = acpi_s2idle_sleep_exit,
 	.display_on = acpi_s2idle_display_on,
 };
 
-- 
2.47.0

