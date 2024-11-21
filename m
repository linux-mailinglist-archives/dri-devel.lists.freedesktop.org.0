Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B89D55B7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D890010EA76;
	Thu, 21 Nov 2024 22:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="SaEUrQ6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1B210EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:33:07 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 9893F2E09694;
 Thu, 21 Nov 2024 19:23:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732209783;
 bh=++PgO6Kf7fkqqQwS6ej9C+2J5H1QoRjUhk8jT24SeC4=; h=From:To:Subject;
 b=SaEUrQ6ZP4g3tPbHCR0lsNIrNUry5Nwj6a42MeUZPaXjHKivRFFRv88E8q+BaoP17
 Ggb8H8Ze3xvEe6KOnRyp/TC76KYEboar5/UmtvjUWDaf26kgBf+hkU6ZP9xe/8YVYr
 LVKailruCXEP8PmgmtbdkTodaUzLU4zDPioFgYo0=
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
Subject: [RFC 08/13] acpi/x86: s2idle: rename MS Exit/Entry to Sleep Exit/Entry
Date: Thu, 21 Nov 2024 18:22:33 +0100
Message-ID: <20241121172239.119590-9-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173220978286.6491.2438004784289973570@linux1587.grserver.gr>
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

Microsoft refers to the _DSMs 7,8 as "Sleep Entry" and "Sleep Exit".
Currently, the code uses "MS Entry/Exit" to name the variables, which is
confusing as it could either mean "Modern Standby" or "Microsoft" and is
not representative of the state. Rename as part of converting it into
a transition.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/acpi/x86/s2idle.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index 8b39e3b12ec0..49dcbdea903a 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -43,8 +43,8 @@ static const struct acpi_device_id lps0_device_ids[] = {
 #define ACPI_LPS0_DISPLAY_ON	4
 #define ACPI_LPS0_ENTRY		5
 #define ACPI_LPS0_EXIT		6
-#define ACPI_LPS0_MS_ENTRY      7
-#define ACPI_LPS0_MS_EXIT       8
+#define ACPI_LPS0_SLEEP_ENTRY      7
+#define ACPI_LPS0_SLEEP_EXIT       8
 
 /* AMD */
 #define ACPI_LPS0_DSM_UUID_AMD      "e3f32452-febc-43ce-9039-932122d37721"
@@ -370,10 +370,10 @@ static const char *acpi_sleep_dsm_state_to_str(unsigned int state)
 			return "lps0 entry";
 		case ACPI_LPS0_EXIT:
 			return "lps0 exit";
-		case ACPI_LPS0_MS_ENTRY:
-			return "lps0 ms entry";
-		case ACPI_LPS0_MS_EXIT:
-			return "lps0 ms exit";
+		case ACPI_LPS0_SLEEP_ENTRY:
+			return "sleep entry";
+		case ACPI_LPS0_SLEEP_EXIT:
+			return "sleep exit";
 		}
 	} else {
 		switch (state) {
@@ -610,7 +610,7 @@ int acpi_s2idle_prepare_late(void)
 
 	if (lps0_dsm_func_mask_microsoft > 0) {
 		/* Modern Standby entry */
-		acpi_sleep_run_lps0_dsm(ACPI_LPS0_MS_ENTRY,
+		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_ENTRY,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_ENTRY,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
@@ -663,7 +663,7 @@ void acpi_s2idle_restore_early(void)
 		acpi_sleep_run_lps0_dsm(ACPI_LPS0_EXIT,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
 		/* Modern Standby exit */
-		acpi_sleep_run_lps0_dsm(ACPI_LPS0_MS_EXIT,
+		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_EXIT,
 				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
 	}
 }
-- 
2.47.0

