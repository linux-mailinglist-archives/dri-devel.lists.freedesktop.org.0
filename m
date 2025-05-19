Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB897ABC84F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 22:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE20810E28B;
	Mon, 19 May 2025 20:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IHp2zGCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6887D10E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 20:19:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A13AF439EE;
 Mon, 19 May 2025 20:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747685983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d+ZhZFdcyO7MijMi13gLvQU8JeWL+SnKqaTCtITt0UM=;
 b=IHp2zGCbtinQAZCN/tsAolCu3i5Dn5vBz3mgLCp17U3Dn7K42JlEPgAwY9TaW8VhwUvLtL
 KMF/soMGNjN0C54a0MWN6wPkwTgQbj+7lsCFtRHPT28CjW+4QSLnejw7LSEBxfvc4NonQw
 jq3qTZxVgO1PRAGPMAd9kvvR5JQU2BHrm/NwDDYdGOxyTQl+GHqIfpwdDYpvmjb56tSLw5
 S2jpK1ywSQ3GfCe2o5uyzUod2EwOc5utHiGj3F0w7OwDcXe8WHKOwlATrl028mAB7lbdtk
 8f19TTZfiQHCoJOhLcRnNWWubpj25XDBQtEU3NqagVi61drfvhIBEUrRNqoxJw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 19 May 2025 22:19:11 +0200
Subject: [PATCH v6] backlight: led-backlight: add devlink to supplier LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAD6SK2gC/6WOTQ6CMBCFr0K6dgyStkZX3sOwKJ0BJlRK2tpoC
 He3cAWX33t5P6uIFJiiuFerCJQ5sp8L6FMl7GjmgYCxsGjqRtXqcgNHCJ2xk+NhTGAQASk7nid
 IHuJ7WRxTAOtMjLvDlkAjWUm1lFIZUYqXQD1/jtFnW3jkmHz4Hh+y2tW/5rKCC1w16h6loa7pH
 533qWTO1r9Eu23bD2WrLvz2AAAA
X-Change-ID: 20250519-led-backlight-add-devlink-to-supplier-class-device-6dec4e04445a
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>, 
 Jean-Jacques Hiblot <jjhiblot@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Saravana Kannan <saravanak@google.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvueelteffuedthfevvdejffdutdetjedthfffvdehvdelveetkeejjefgjefgheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegurghnihgvlhdrthhhohhmphhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhfsgguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepj
 hhinhhgohhohhgrnhdusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
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

led-backlight is a consumer of one or multiple LED class devices, but
devlink is currently unable to create correct supplier-producer links when
the supplier is a class device. It creates instead a link where the
supplier is the parent of the expected device.

One consequence is that removal order is not correctly enforced.

Issues happen for example with the following sections in a device tree
overlay:

    // An LED driver chip
    pca9632@62 {
        compatible = "nxp,pca9632";
        reg = <0x62>;

	// ...

        addon_led_pwm: led-pwm@3 {
            reg = <3>;
            label = "addon:led:pwm";
        };
    };

    backlight-addon {
        compatible = "led-backlight";
        leds = <&addon_led_pwm>;
        brightness-levels = <255>;
        default-brightness-level = <255>;
    };

In this example, the devlink should be created between the backlight-addon
(consumer) and the pca9632@62 (supplier). Instead it is created between the
backlight-addon (consumer) and the parent of the pca9632@62, which is
typically the I2C bus adapter.

On removal of the above overlay, the LED driver can be removed before the
backlight device, resulting in:

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
    ...
    Call trace:
     led_put+0xe0/0x140
     devm_led_release+0x6c/0x98

Another way to reproduce the bug without any device tree overlays is
unbinding the LED class device (pca9632@62) before unbinding the consumer
(backlight-addon):

  echo 11-0062 >/sys/bus/i2c/drivers/leds-pca963x/unbind
  echo ...backlight-dock >/sys/bus/platform/drivers/led-backlight/unbind

Fix by adding a devlink between the consuming led-backlight device and the
supplying LED device, as other drivers and subsystems do as well.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v6:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v5: https://lore.kernel.org/r/20250519-led-backlight-add-devlink-to-supplier-class-device-v5-1-76d6fd4aeb2f@bootlin.com
---

Changes in v6:
- fix incorrect array index
- further improve commit message
- Link to v5: https://lore.kernel.org/r/20250519-led-backlight-add-devlink-to-supplier-class-device-v5-1-76d6fd4aeb2f@bootlin.com

Changes in v5:
- separated this patch as a standalone patch
- improved commit message, adding feedback from Alexander
- no code changes

This patch first appeared in the v4 of a longer series, even though the
issue is orthogonal:
https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com/
---
 drivers/video/backlight/led_bl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index d2db157b2c290adc3a159023e9e2394fc877388c..0ed585eb27903df43651c5365f479f7865cc8a95 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -209,6 +209,19 @@ static int led_bl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->bl_dev);
 	}
 
+	for (i = 0; i < priv->nb_leds; i++) {
+		struct device_link *link;
+
+		link = device_link_add(&pdev->dev, priv->leds[i]->dev->parent,
+				       DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!link) {
+			dev_err(&pdev->dev, "Failed to add devlink (consumer %s, supplier %s)\n",
+				dev_name(&pdev->dev), dev_name(priv->leds[i]->dev->parent));
+			backlight_device_unregister(priv->bl_dev);
+			return -EINVAL;
+		}
+	}
+
 	for (i = 0; i < priv->nb_leds; i++) {
 		mutex_lock(&priv->leds[i]->led_access);
 		led_sysfs_disable(priv->leds[i]);

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250519-led-backlight-add-devlink-to-supplier-class-device-6dec4e04445a

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

