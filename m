Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC7A40A4F
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 17:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA0010E170;
	Sat, 22 Feb 2025 16:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="0ArJwH5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Sat, 22 Feb 2025 16:50:09 UTC
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ADB10E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 16:50:09 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 1D0342E08EC3;
 Sat, 22 Feb 2025 18:43:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1740242620;
 bh=z3zPpL3Ulc1+itLVafzibaVNCa9hzClSE4LTuvk9Wc0=; h=From:To:Subject;
 b=0ArJwH5bA5fWzW4qIg+rEuOge/8tQjZdBkNp0dSxD2kz0dU/pQi4S03HNN4P/Iraz
 VL77G6AHN6zdfOODtNVxM4U16ioxmpmi8ayunoBG2HTHnTyvU8L2Q3Ao7Tb1OaV+EL
 Shx5CVUHLU+CyeZemehetjC8jg21nx6JsdtFEkvs=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd)
 smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 4/5] HID: Add quirk to ignore the touchscreen battery on
 OneXPlayer X1
Date: Sat, 22 Feb 2025 17:43:20 +0100
Message-ID: <20250222164321.181340-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222164321.181340-1-lkml@antheas.dev>
References: <20250222164321.181340-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174024262025.17437.4067662601537192451@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
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

The X1 devices come with a pen-capable touchscreen, in which the HID
descriptor reports there is always a battery at 100% charge. Quirk it
to not report the battery status.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e400624908e..8e2fc152b089 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1001,6 +1001,7 @@
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
 #define USB_DEVICE_ID_NOVATEK_MOUSE	0x1602
+#define I2C_DEVICE_ID_ONEXPLAYER_X1    0xF001
 
 #define USB_VENDOR_ID_NTI               0x0757
 #define USB_DEVICE_ID_USB_SUN           0x0a00
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91eb..08e87577feef 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -390,6 +390,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C-HID devices.
 	 */
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_NOVATEK, I2C_DEVICE_ID_ONEXPLAYER_X1),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.48.1

