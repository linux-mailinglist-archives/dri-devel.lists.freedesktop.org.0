Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE89D55C0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0101010EA7C;
	Thu, 21 Nov 2024 22:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="xd5Zm672";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A225610EA08
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:33:07 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id AAAE32E096A8;
 Thu, 21 Nov 2024 19:23:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732209814;
 bh=0f+2vUNiJNBCr2npgGT+5C+NFvaobl1gc8LB0xDB8Io=; h=From:To:Subject;
 b=xd5Zm672kx6WPxxwdIdOopLw247otKLGUSlYgc39zBytVDs1dqLf6PnKD44ji7rMJ
 tZaXea3xm/nZvvo8YlbExpNPAXZjOkbWK/d0lNEFSt/EziDuGBpZSPnow+Wp/lyly7
 jJ/McVF4SCNYb8GmqCpBeVoLdvOM0gI5PtrsK5kU=
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
Subject: [RFC 13/13] PM: standby: Add sysfs attribute for modern standby
 transitions
Date: Thu, 21 Nov 2024 18:22:38 +0100
Message-ID: <20241121172239.119590-14-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173220981281.10560.4859672454396129529@linux1587.grserver.gr>
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

Add a sysfs attribute to allow informing the kernel about the current
standby state, those being: "active", "screen_off", "sleep", and
"resume" (to prepare turning the display on). The final modern
standby state DRIPS is omitted, as that is entered during the kernel
suspend process and userspace will never see it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 Documentation/ABI/testing/sysfs-power | 34 ++++++++++++
 kernel/power/main.c                   | 75 +++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
index a3942b1036e2..eff13980cc7c 100644
--- a/Documentation/ABI/testing/sysfs-power
+++ b/Documentation/ABI/testing/sysfs-power
@@ -39,6 +39,40 @@ Description:
 		See Documentation/admin-guide/pm/sleep-states.rst for more
 		information.
 
+What:		/sys/power/standby
+Date:		November 2024
+Contact:	Antheas Kapenekakis <lkml@antheas.dev>
+Description:
+		The /sys/power/standby file controls the standby state of the
+		system. Modern S0ix capable systems can enter a set of low power
+		states while the kernel is still active. Transitioning into those
+		states may 1) deactivate tertiary hardware, and 2) change the
+		presentation of the device (e.g., pulse the suspend light, turn
+		off the keyboard backlight).
+
+		Available states are "active" (fully active), "screen-off" (fully
+		active but all displays of the system are off; virtual and real),
+		"sleep" (major userspace components have been frozen; light
+		background tasks may still run; this state may affect the power
+		envelope of the device). The final state is DRIPS or LSP0, where
+		the kernel suspends, and is entered by writing "mem" to
+		/sys/power/state. There is a secondary sleep state called "resume"
+		that can only be entered from "sleep" and is used in certain
+		devices to boost the Power Limit (PLx) while remaining in sleep
+		to hasten preparing for transitioning to "active".
+
+		Writing one of the above strings to this file causes the system
+		to transition into the corresponding state, by firing the
+		corresponding firmware notifications during the transition.
+
+		DRIPS or LSP0 (i.e., mem "s2idle") can only be entered from the
+		"sleep" state. If the kernel is asked to transition to DRIPS from
+		a different state, it will transition to "sleep" and then suspend.
+		On wakeup, the kernel will transition back to the previous state.
+
+		See Documentation/admin-guide/pm/standby-states.rst for more
+		information.
+
 What:		/sys/power/disk
 Date:		September 2006
 Contact:	Rafael J. Wysocki <rjw@rjwysocki.net>
diff --git a/kernel/power/main.c b/kernel/power/main.c
index 6254814d4817..4377fdaf4a8d 100644
--- a/kernel/power/main.c
+++ b/kernel/power/main.c
@@ -748,6 +748,80 @@ static ssize_t state_store(struct kobject *kobj, struct kobj_attribute *attr,
 
 power_attr(state);
 
+#ifdef CONFIG_SUSPEND
+/*
+ * standby - control system s2idle standby state.
+ *
+ * show() returns available standby states, which may be "active", "screen_off",
+ * "sleep" and "resume" (still in sleep but preparing to turn on display).
+ * See Documentation/admin-guide/pm/standby-states.rst for a description of
+ * what they mean.
+ *
+ * store() accepts one of those strings, translates it into the proper
+ * enumerated value, and initiates a transition to that standby state.
+ *
+ * When the system suspends, it will first enter the state "sleep", suspend,
+ * and then restore the last state before entering "sleep". I.e., if userspace
+ * is not S0ix-aware, the transitions expected by Modern Standby devices will
+ * always be performed.
+ */
+static ssize_t standby_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	char *s = buf;
+	standby_state_t i;
+	standby_state_t curr = pm_standby_state();
+
+	if (curr < 0)
+		return -EBUSY;
+
+	for (i = PM_STANDBY_MIN; i < PM_STANDBY_MAX; i++)
+		if (standby_states[i])
+			s += sprintf(s, curr == i ? "[%s] " : "%s ", standby_states[i]);
+
+	if (s != buf)
+		/* convert the last space to a newline */
+		*(s - 1) = '\n';
+	return (s - buf);
+}
+
+static standby_state_t decode_standby_state(const char *buf, size_t n)
+{
+	standby_state_t state;
+	char *p;
+	int len;
+
+	p = memchr(buf, '\n', n);
+	len = p ? p - buf : n;
+
+	for (state = PM_STANDBY_MIN; state < PM_STANDBY_MAX; state++) {
+		const char *label = standby_states[state];
+
+		if (label && len == strlen(label) && !strncmp(buf, label, len))
+			return state;
+	}
+
+	return PM_STANDBY_MAX;
+}
+
+static ssize_t standby_store(struct kobject *kobj, struct kobj_attribute *attr,
+			   const char *buf, size_t n)
+{
+	int error;
+	standby_state_t state;
+
+	state = decode_standby_state(buf, n);
+
+	if (state >= PM_STANDBY_MAX)
+		return -EINVAL;
+
+	error = pm_standby_transition(state);
+	return error ? error : n;
+}
+
+power_attr(standby);
+#endif
+
 #ifdef CONFIG_PM_SLEEP
 /*
  * The 'wakeup_count' attribute, along with the functions defined in
@@ -974,6 +1048,7 @@ static struct attribute * g[] = {
 #ifdef CONFIG_SUSPEND
 	&mem_sleep_attr.attr,
 	&sync_on_suspend_attr.attr,
+	&standby_attr.attr,
 #endif
 #ifdef CONFIG_PM_AUTOSLEEP
 	&autosleep_attr.attr,
-- 
2.47.0

