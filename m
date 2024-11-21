Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1FA9D55AB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C175210E417;
	Thu, 21 Nov 2024 22:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="0PNMkJS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9749410EA05
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:33:07 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 4E5922E096A7;
 Thu, 21 Nov 2024 19:23:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732209795;
 bh=4jRR2+wST/8adxHo9mGYLxXc0Y5dG1aBSyRjSI/GHAs=; h=From:To:Subject;
 b=0PNMkJS11Glj7sDgMZW+CBArPd72mWvMrsy7n+i8C3PxLZGZV7lWCceW0JRd+yP6Q
 rlmL1+O4O9W3GbMON/UGn+vosK4prapaKVWmyVoqlZ5KKEasL6OPmR/kUOcGaBk624
 9kuqJnJdzwFA6ZyTjQjSIJZOZ1Bjt9pbLRR7s/mE=
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
Subject: [RFC 11/13] acpi/x86: s2idle: add quirk table for modern standby
 delays
Date: Thu, 21 Nov 2024 18:22:36 +0100
Message-ID: <20241121172239.119590-12-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173220979320.9660.4079469559487333899@linux1587.grserver.gr>
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

Unfortunately, some modern standby systems, including the ROG Ally, rely
on a delay between modern standby transitions. Add a quirk table for
introducing delays between modern standby transitions, and quirk the
ROG Ally on "Display Off", which needs a bit of time to turn off its
controllers prior to suspending.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/acpi/x86/s2idle.c | 56 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index d389c57d2963..504e6575d7ad 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -18,6 +18,7 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/delay.h>
 #include <linux/suspend.h>
 
 #include "../sleep.h"
@@ -91,11 +92,50 @@ struct lpi_device_constraint_amd {
 	int min_dstate;
 };
 
+struct s2idle_delay_quirks {
+	int delay_display_off;
+	int delay_sleep_entry;
+	int delay_sleep_exit;
+	int delay_display_on;
+};
+
+/*
+ * The ROG Ally series disconnects its controllers on Display Off and performs
+ * a fancy shutdown sequence, which requires around half a second to complete.
+ * If the power is cut earlier by entering it into D3, the original Ally unit
+ * might not disconnect its XInput MCU, causing excess battery drain, and the
+ * Ally X will make the controller restart post-suspend. In addition, the EC
+ * of the device rarely (1/20 attempts) may get stuck asserting PROCHOT after
+ * suspend (for various reasons), so split the delay between Display Off and
+ * Sleep Entry.
+ */
+static const struct s2idle_delay_quirks rog_ally_quirks = {
+	.delay_display_off = 350,
+	.delay_sleep_entry = 150,
+};
+
+static const struct dmi_system_id s2idle_delay_quirks[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
+		},
+		.driver_data = (void *)&rog_ally_quirks
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC72L"),
+		},
+		.driver_data = (void *)&rog_ally_quirks
+	},
+	{}
+};
+
 static LIST_HEAD(lps0_s2idle_devops_head);
 
 static struct lpi_constraints *lpi_constraints_table;
 static int lpi_constraints_table_size;
 static int rev_id;
+struct s2idle_delay_quirks *delay_quirks;
 
 #define for_each_lpi_constraint(entry)						\
 	for (int i = 0;								\
@@ -566,6 +606,9 @@ static int acpi_s2idle_display_off(void)
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_DISPLAY_OFF,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
 
+	if (delay_quirks && delay_quirks->delay_display_off)
+		msleep(delay_quirks->delay_display_off);
+
 	acpi_scan_lock_release();
 
 	return 0;
@@ -587,6 +630,9 @@ static int acpi_s2idle_sleep_entry(void)
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_ENTRY,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
 
+	if (delay_quirks && delay_quirks->delay_sleep_entry)
+		msleep(delay_quirks->delay_sleep_entry);
+
 	acpi_scan_lock_release();
 
 	return 0;
@@ -627,6 +673,9 @@ static int acpi_s2idle_sleep_exit(void)
 	acpi_scan_lock_acquire();
 
 	/* Modern Standby Sleep Exit */
+	if (delay_quirks && delay_quirks->delay_sleep_exit)
+		msleep(delay_quirks->delay_sleep_exit);
+
 	if (lps0_dsm_func_mask_microsoft > 0)
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_EXIT,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
@@ -648,6 +697,9 @@ static int acpi_s2idle_display_on(void)
 	acpi_scan_lock_acquire();
 
 	/* Display on */
+	if (delay_quirks && delay_quirks->delay_display_on)
+		msleep(delay_quirks->delay_display_on);
+
 	if (lps0_dsm_func_mask_microsoft > 0)
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_DISPLAY_ON,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
@@ -760,6 +812,10 @@ int acpi_register_lps0_dev(struct acpi_s2idle_dev_ops *arg)
 
 	sleep_flags = lock_system_sleep();
 	list_add(&arg->list_node, &lps0_s2idle_devops_head);
+	const struct dmi_system_id *s2idle_sysid = dmi_first_match(
+		s2idle_delay_quirks
+	);
+	delay_quirks = s2idle_sysid ? s2idle_sysid->driver_data : NULL;
 	unlock_system_sleep(sleep_flags);
 
 	return 0;
-- 
2.47.0

