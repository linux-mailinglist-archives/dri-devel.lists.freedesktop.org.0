Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3599D55B0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D6510E41A;
	Thu, 21 Nov 2024 22:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="ROQ8fEeb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282BD10E145
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:28:12 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 173172E09589;
 Thu, 21 Nov 2024 19:22:49 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732209771;
 bh=0YVrjraYiMF7JFRMsGzYGi+DLsnhBUH9lwvrGzQx40s=; h=From:To:Subject;
 b=ROQ8fEeb/FgQIikIPcPmun/aLlgmlG34bO+t6bLBdiOpL6ZctiSfIAi2FS8iOqXM/
 yKOtdEBqwRB5pvdIb54XUmubFTnXqG18OM/Ln8ct/FIrZcLanIMujuoDsUeVPDv+ZW
 +d/+BSb87c/h9WXka00b/m8MR1ESpBOLQ5Fjkzuc=
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
Subject: [RFC 02/13] acpi/x86: s2idle: add support for Display Off and Display
 On callbacks
Date: Thu, 21 Nov 2024 18:22:27 +0100
Message-ID: <20241121172239.119590-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173220977021.4257.7217008257458970692@linux1587.grserver.gr>
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

The Display Off and Display On firmware notifications are meant to signify
the system entering a state where the user is not actively interacting
with it (i.e., in Windows this state is called "Screen Off" and the
system enters it once it turns the screen off e.g., due to inactivity).

Currently, these functions are called within the suspend sequence, which
causes issues when these notifications interact with e.g., a USB device
and makes them unable to be called as part of the screen turning off.

This patch adds a set of callbacks to allow calling the Display On/Off
notifications outside of the suspend/resume path.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 include/linux/suspend.h |  2 ++
 kernel/power/suspend.c  | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index da6ebca3ff77..57c083754e8b 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -132,6 +132,7 @@ struct platform_suspend_ops {
 };
 
 struct platform_s2idle_ops {
+	int (*display_off)(void);
 	int (*begin)(void);
 	int (*prepare)(void);
 	int (*prepare_late)(void);
@@ -140,6 +141,7 @@ struct platform_s2idle_ops {
 	void (*restore_early)(void);
 	void (*restore)(void);
 	void (*end)(void);
+	int (*display_on)(void);
 };
 
 #ifdef CONFIG_SUSPEND
diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
index 09f8397bae15..cded6b9b439b 100644
--- a/kernel/power/suspend.c
+++ b/kernel/power/suspend.c
@@ -254,6 +254,16 @@ static bool sleep_state_supported(suspend_state_t state)
 	       (valid_state(state) && !cxl_mem_active());
 }
 
+static int platform_standby_display_off(void)
+{
+	return s2idle_ops && s2idle_ops->display_off ? s2idle_ops->display_off() : 0;
+}
+
+static int platform_standby_display_on(void)
+{
+	return s2idle_ops && s2idle_ops->display_on ? s2idle_ops->display_on() : 0;
+}
+
 static int platform_suspend_prepare(suspend_state_t state)
 {
 	return state != PM_SUSPEND_TO_IDLE && suspend_ops->prepare ?
-- 
2.47.0

