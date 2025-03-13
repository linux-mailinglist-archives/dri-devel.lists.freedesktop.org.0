Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A6BA5FAB5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFCB10E23E;
	Thu, 13 Mar 2025 16:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="o5i2Bx8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B6F10E23E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1741881837; x=1742141037;
 bh=22zAQyvnoEOXs6L3ERiAc9u5WNizLjpTOmo46XmcJiY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=o5i2Bx8lA7arvA20I7jVUHWSilwKv050lggyYw0HxiyUcIWVLXnxE4VfS5A5Fsfdb
 H5CPVTErXtHm0lC0b8GQUJf+iptFmC5W3VpeZSzTDOYjQlwYcCQ/qQLUBzytTz1o4R
 QszkhD262fUdq+gmHVbTz7kCay1RU3WWFMvlmzqZJoqwzwvAnvzWQur5qPccO2Y5e8
 zrUvzXQLqMjau9HeJhZAZBfaQkqMBl8QNKHg3NyYvg0j1XqSm3VO6Hkb6gR5+ltNLR
 U5RM/+MeXHyVOguQ02DzTxUbx9zBMRew9cj1Qysb0wdCD6vDpXWG6l5HZKeg0sZvDm
 EtAbHD5LW+3ng==
Date: Thu, 13 Mar 2025 16:03:51 +0000
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Rahul Rameshbabu <sergeantsagara@protonmail.com>, Julius Zint <julius@zint.sh>
Subject: [PATCH RFC 2/3] rust: hid: USB Monitor Control Class driver
Message-ID: <20250313160220.6410-5-sergeantsagara@protonmail.com>
In-Reply-To: <20250313160220.6410-2-sergeantsagara@protonmail.com>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: b1713685ae05b35e392bda64f74117df38fd9c74
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

This code will eventually contain the logic needed to drive the backlight
of displays that implement the USB Monitor Control Class specification.
Examples include the Apple Studio Display and Apple Pro Display XDR
monitors. USB Monitor Control Class encompasses more than just backlight
control, so the driver could be further extended as monitors support more
functionality in the specification.

This code is a skeleton currently, where the focus right now is on the core
Rust API. The driver skeleton was written before approaching the Rust API
and C binding work. This was done to provide a guide for what the Rust API
should look like and avoid any rough C binding work from being exposed to
Rust HID device drivers.

To go forward with this driver for the purpose of external monitor
backlight control, a new DRM backlight API that is scoped per connector
will be required. I am currently in the process of developing this new API.
I document the details in my related blog posts. The issue with the current
backlight API is it was designed on the assumption that only internal
panels have controllable backlights. Using this assumption combined with
another that there can only ever be a single internal panel, having more
than one device register with the backlight interface would confuse
userspace applications.

Julius Zint originally tried to implement such a driver a bit more than a
year ago with a C driver but was blocked by the limitations of the
backlight API. I asked him for permission to continue the work in Rust
while accrediting him for the HID report parsing logic for the backlight
support in the USB Monitor Control Class specification.

Cc: Julius Zint <julius@zint.sh>
Link: https://lore.kernel.org/lkml/20230820094118.20521-1-julius@zint.sh/
Link: https://binary-eater.github.io/posts/linux_usb_monitor_control/
Link: https://www.usb.org/sites/default/files/usbmon11.pdf
Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---
 drivers/hid/Kconfig                |  8 +++++++
 drivers/hid/Makefile               |  1 +
 drivers/hid/hid_monitor_control.rs | 37 ++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 drivers/hid/hid_monitor_control.rs

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e085964c7ffc..92be13acb956 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -722,6 +722,14 @@ config RUST_HID_ABSTRACTIONS
 =09Adds support needed for HID drivers written in Rust. It provides a
 =09wrapper around the C hid core.
=20
+config HID_MONITOR_CONTROL
+=09tristate "USB Monitor Control Class support"
+=09depends on USB_HID
+=09depends on RUST_HID_ABSTRACTIONS
+=09help
+=09Say Y here if you want to enable control over a monitor that uses USB
+=09Monitor Control Class.
+
 config HID_REDRAGON
 =09tristate "Redragon keyboards"
 =09default !EXPERT
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 482b096eea28..bf8b096bcf23 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_HID_MCP2221)=09+=3D hid-mcp2221.o
 obj-$(CONFIG_HID_MAYFLASH)=09+=3D hid-mf.o
 obj-$(CONFIG_HID_MEGAWORLD_FF)=09+=3D hid-megaworld.o
 obj-$(CONFIG_HID_MICROSOFT)=09+=3D hid-microsoft.o
+obj-$(CONFIG_HID_MONITOR_CONTROL)=09+=3D hid_monitor_control.o
 obj-$(CONFIG_HID_MONTEREY)=09+=3D hid-monterey.o
 obj-$(CONFIG_HID_MULTITOUCH)=09+=3D hid-multitouch.o
 obj-$(CONFIG_HID_NINTENDO)=09+=3D hid-nintendo.o
diff --git a/drivers/hid/hid_monitor_control.rs b/drivers/hid/hid_monitor_c=
ontrol.rs
new file mode 100644
index 000000000000..18afd69a56d5
--- /dev/null
+++ b/drivers/hid/hid_monitor_control.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
+
+use kernel::prelude::*;
+use kernel::hid::{
+    self,
+    Driver,
+};
+
+struct HidMonitorControl;
+
+#[vtable]
+impl Driver for HidMonitorControl {
+    fn probe(dev: &mut hid::Device, id: &hid::DeviceId) -> Result<()> {
+        /* TODO implement */
+        Ok(())
+    }
+
+    fn remove(dev: &mut hid::Device) {
+        /* TODO implement */
+    }
+}
+
+kernel::module_hid_driver! {
+    driver: HidMonitorControl,
+    id_table: [
+        kernel::usb_device! {
+            vendor: /* TODO fill in */,
+            product: /* TODO fill in */,
+        },
+    ],
+    name: "monitor_control",
+    author: "Rahul Rameshbabu <sergeantsagara@protonmail.com>",
+    description: "Driver for the USB Monitor Control Class",
+    license: "GPL",
+}
--=20
2.47.2


