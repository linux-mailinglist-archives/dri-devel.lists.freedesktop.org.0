Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DE9D55B5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4582910EA6D;
	Thu, 21 Nov 2024 22:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="IIvpo0H+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C5310E145
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:28:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 456AE2E09581;
 Thu, 21 Nov 2024 19:22:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732209775;
 bh=dcKL22xxxdJltV2kWHGeg4GmpDoyNBRNF19vSTdCqc8=; h=From:To:Subject;
 b=IIvpo0H+IHRPyZGFCTTBL5X+SAP/UGRLP8xpQXvgV7aNZN1E83j83aIEYsIH77j7l
 PBaGTd6rH5z3nNWbg+nEPE3Kcab2et0rc/8IJBEmO3ojS7M3Ix/FJpT+hyiTEWNkRr
 JMMJ4Hoon4Q+Gdk6V09nVnREUxzNJzN2rJAbub8I=
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
Subject: [RFC 04/13] acpi/x86: s2idle: add support for Turn On Display callback
Date: Thu, 21 Nov 2024 18:22:29 +0100
Message-ID: <20241121172239.119590-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173220977544.5013.1531931796239805566@linux1587.grserver.gr>
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
the suspend sequence in an undesirable manner. Therefore, this callback
can be used to restore PLx while still remaining in the sleep state.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 include/linux/suspend.h | 1 +
 kernel/power/suspend.c  | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index 733dffb09b28..01ee64321cda 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -142,6 +142,7 @@ struct platform_s2idle_ops {
 	void (*restore_early)(void);
 	void (*restore)(void);
 	void (*end)(void);
+	int (*turn_on_display)(void);
 	int (*sleep_exit)(void);
 	int (*display_on)(void);
 };
diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
index 3f4bbefa9b82..a42e8514ee7a 100644
--- a/kernel/power/suspend.c
+++ b/kernel/power/suspend.c
@@ -264,6 +264,13 @@ static int platform_standby_sleep_entry(void)
 	return s2idle_ops && s2idle_ops->sleep_entry ? s2idle_ops->sleep_entry() : 0;
 }
 
+static int platform_standby_turn_on_display(void)
+{
+	return s2idle_ops && s2idle_ops->turn_on_display ?
+		       s2idle_ops->turn_on_display() :
+		       0;
+}
+
 static int platform_standby_sleep_exit(void)
 {
 	return s2idle_ops && s2idle_ops->sleep_exit ? s2idle_ops->sleep_exit() : 0;
-- 
2.47.0

