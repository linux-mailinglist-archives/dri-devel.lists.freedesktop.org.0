Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513269D55BB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1835C10EA78;
	Thu, 21 Nov 2024 22:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="hakRoM8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9B810EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 17:28:08 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id ADE042E090EE;
 Thu, 21 Nov 2024 19:22:44 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732209766;
 bh=aUbHP0EtNdItt/sKM4zDXlLhxrs7moMUJLm1B6QcYMk=; h=From:To:Subject;
 b=hakRoM8D3hXlR1/1leIIPe2M2+V9M/uID4SexJPvMFiOE43FW1BK0UUS1/cCThZD6
 Wira/HO+4lCJprsaPd1cmGwwk1vPlMe9CxLGO4j9qVi3iBl5AlGSIN26mOGdxncJF8
 f//9NAIoXLfxZW9MFxQBRuM/T5ybU/G0IsXV1fEQ=
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
Subject: [RFC 01/13] Documentation: PM: Add documentation for S0ix Standby
 States
Date: Thu, 21 Nov 2024 18:22:26 +0100
Message-ID: <20241121172239.119590-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
References: <20241121172239.119590-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173220976565.3777.6114218929171614883@linux1587.grserver.gr>
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

Add documentation about the S0ix Standby States that will be exposed
to userspace as part of this series.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 .../admin-guide/pm/standby-states.rst         | 133 ++++++++++++++++++
 Documentation/admin-guide/pm/system-wide.rst  |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 Documentation/admin-guide/pm/standby-states.rst

diff --git a/Documentation/admin-guide/pm/standby-states.rst b/Documentation/admin-guide/pm/standby-states.rst
new file mode 100644
index 000000000000..96727574312d
--- /dev/null
+++ b/Documentation/admin-guide/pm/standby-states.rst
@@ -0,0 +1,133 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+=====================
+S0ix Standby States
+=====================
+
+:Copyright: |copy| 2024 Antheas Kapenekakis
+
+:Author: Antheas Kapenekakis <lkml@antheas.dev>
+
+With the advent of modern mobile devices, users have become accustomed to instant
+wake-up times and always-on connectivity. To meet these expectations, modern
+standby was created, which is a standard that allows the platform to seamlessly
+transition between an S3-like low-power idle state and a set of low power active
+states, where connectivity is maintained, and the system is responsive to user
+input. Current x86 hardware supports 5 different standby states, which are:
+"Deepest run-time idle platform state" or "DRIPS" (S3-like), "Sleep", "Resume",
+"Screen Off", and "Active".
+
+The system begins in the "Active" state. Either due to user inactivity or
+user action (e.g., pressing the power button), it transitions to the "Screen Off"
+state. Afterwards, it is free to transition between the "Sleep", "DRIPS", and
+"Screen Off" states until user action is received. Once that happens, the system
+begins to transition to the "Active" state. From "DRIPS" or "Sleep", it
+transitions to "Resume", where the Power Limit (PLx) is restored to its normal
+level, to speed up finishing "Sleep". Then, it transitions to "Screen Off".
+If on "Screen Off" or after the transition, the display is prepared to turn on
+and the system transitions to "Active" alongside turning it on.
+
+To maintain battery life, in the Windows implementation, the system is allocated
+a maximum percentage of battery and time it can use while staying in idle states.
+By default, this is 5% of battery or up to 2 days, where the system designer/OEM
+is able to tweak these values. If the system exceeds either the battery
+percentage or time limit, it enters Hibernation (S4), through a concept
+called "Adaptive Hibernate".
+
+
+S0ix Standby States
+==================================
+The following idle states are supported::
+
+                 ↓→  <Hibernate (S4)>
+    <DRIPS> ↔ <Sleep> ↔ <Screen Off> ↔ <Active>
+        →       →  <Resume>  ↑
+
+.. _s2idle_drips:
+
+DRIPS
+-----
+
+The "Deepest run-time idle platform state" or "DRIPS" is the lowest power idle
+state that the system can enter. It is similar to the S3 state, with the
+difference that the system may wake up faster than S3 and due to a larger number
+of interrupts (e.g., fingerprint sensor, touchpad, touchscreen). This state
+is entered when the system is told to suspend to idle, through conventional
+means (see :doc:`sleep states <sleep-states>`). The system can only transition
+to "DRIPS" while it is in the "Sleep" state. If it is not, the kernel will
+automatically transition to the "Sleep" state before beginning the suspend
+sequence and restore the previous state afterwards. After the kernel has
+suspended, the notifications LSP0 Entry and Exit are used.
+
+.. _s2idle_sleep:
+
+Sleep
+-----
+
+The "Sleep" state is a low power idle state where the kernel is fully active.
+However, userspace has been partially frozen, particularly desktop applications,
+and only essential "value adding" activities are allowed to run. This is not
+enforced by the kernel and is the responsibility of userspace (e.g., systemd).
+Hardware wise, the Sleep Entry and Exit firmware notifications are fired, which
+may lower the Power Limit (PLx), pulse the suspend light, turn off the keyboard
+lighting or disable a handheld device's gamepad. This state is associated with
+the firmware notifications "Sleep Entry" and "Sleep Exit".
+
+.. _s2idle_resume:
+
+Resume
+------
+
+The "Resume" state is a faux "Sleep" state that is used to fire the Turn On
+Display firmware notification when the system is in the "Sleep" state but
+intends to turn on the display. It solves the problem of system designers
+limiting the Power Limit (PLx) while the system is in the "Sleep" state causing
+the system to wake up slower than desired. This firmware notification is used
+to restore the normal Power Limit of the system, while having it stay in the
+"Sleep" state.  As such, the system can only transition to the "Resume" state
+while in the "Sleep" state and cannot re-transition to the "Sleep" state
+afterwards.
+
+.. _s2idle_screen_off:
+
+Screen Off
+----------
+
+The "Screen Off" state is the state the system enters when all its displays
+(virtual or real) turn off. It is used to signify the user is not actively
+using the system. The associated firmware notifications of "Display On" and
+"Display Off" are used by manufacturers to turn off certain hardware
+components that are associated with the display being on, e.g., a handheld
+device's controller and RGB. Windows implements a 5-second grace period
+before firing this callback when the screen turns off due to inactivity.
+
+.. _s2idle_active:
+
+Active
+------
+
+Finally, the "Active" state is the default state of the system and the one it
+has when it is turned on. It is the state where the system is fully operational,
+the displays of the device are on, and the user is actively interacting with
+the system.
+
+Basic ``sysfs`` Interface for S0ix Standby transitions
+=============================================================
+
+The file :file:`/sys/power/standby` can be used to transition the system between
+the different standby states. The file accepts the following values: ``active``,
+``screen_off``, ``sleep``, and ``resume``. File writes will block until the
+transition completes. It will return ``-EINVAL`` when asking for an unsupported
+state or, e.g., requesting ``resume`` when not in the ``sleep`` state. If there
+is an error during the transition, the transition will pause on the last
+error-free state and return an error. The file can be read to retrieve the
+current state (and potential ones) using the following format:
+``[active] screen_off sleep resume``. The state "DRIPS" is omitted, as it is
+entered through the conventional suspend to idle path and userspace will never
+be able to see its value due to being suspended.
+
+Before entering the "Screen Off" state or suspending, it is recommended that
+userspace marks all CRTCs as inactive (DPMS). Otherwise, there will be a split
+second where the display of the device is on, but the presentation of the system
+is inactive (e.g., the power button pulses), which is undesirable.
\ No newline at end of file
diff --git a/Documentation/admin-guide/pm/system-wide.rst b/Documentation/admin-guide/pm/system-wide.rst
index 1a1924d71006..411775fae4ac 100644
--- a/Documentation/admin-guide/pm/system-wide.rst
+++ b/Documentation/admin-guide/pm/system-wide.rst
@@ -8,4 +8,5 @@ System-Wide Power Management
    :maxdepth: 2
 
    sleep-states
+   standby-states
    suspend-flows
-- 
2.47.0

