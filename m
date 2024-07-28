Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E22F93E548
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 15:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE3410E179;
	Sun, 28 Jul 2024 13:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="dAV1RNjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B503610E179
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722171962; x=1722776762; i=wahrenst@gmx.net;
 bh=M7r0zgzsdRZMdo8RqGtVt52OP9WEg6pN/Bx4IF1TmGM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dAV1RNjt6YGmbStVF14ePCj3d4y6nbdTmSJeuW1Dsceuzro7SMgd/8YWqV3R4dEW
 FpNKi3/pgVxbuPgyErH8Ts7UxyGdceJs4g2lrQZ6Iw9D2gkPaClChovna907KYOgm
 suMsrbrf5II0gt+gahIlhdTwynx7eED1XDQgA2dfIH6mvGGNcjqMLutMUft0AL65F
 kahYj09H4Is5vs15TbbGyO9sl0bZkENDFNyRTPUpuE63ioawMnYPRbyNRZBbPf9Jh
 VwrnQpirN865AsBpcqKauzjvrBpfM2tFhGLaHfoP2NqcqkWVBCHi2JorjTo5s0Txi
 bt8KOeIaE5sNfpGkPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwfac-1sMbJY29z0-016ZFJ; Sun, 28
 Jul 2024 15:06:02 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM domain
 off
Date: Sun, 28 Jul 2024 15:00:27 +0200
Message-Id: <20240728130029.78279-6-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728130029.78279-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/o5ph+IO8NWUQ7I1tOJI+ylH+u9cckK4F1uFGzHRwxaErB7jYQj
 v0WmAZKTvicrUjhuvD9D1YTiywi3lWh/MKt9Jj2ukj4oxsqbwKAdhLfUq2zV8TPAgDYQJL0
 GPEfbjMbu/Jr8oTZoribnDUU8l8mxBgd9RnwhCrzNB7rjKXQfx6LUvzfmdqLSf96eSHUyJO
 wNFk8F2pMPA1z506FLssw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VK/dZuUOFOU=;b4VS0LYzeaxQNdiY2u2VWiYUUWd
 gBDGD/w2EkraBIjMH8a3XhR0JNgHPLQdo7uULm/dp/8eESM77DDng0jQCjYMPuU2m7V1OLKI9
 nuTo8jBK4DSRabSQTxHRcL/omo2IbUeJXfDTjQceKUi43ju1gpKNu/J78au5U+Me57HyhAbuV
 QrfSeHUlYSqJGla1egATfFImbGfzcIGyY19pnzAEHzmxAzFJsv7oo65+L0h9VINEJVHmiNUqz
 ICA/gRHh53H5oSt02aDAbB/0O+ex8Wn27tt4MjeDPEz/pMweF1Sxc2toLB4Bt4oud3XLZetzx
 0tJrCA9i8GgsjSaGT3bzM8EDf8YIh2QNiATkduJXOXqsAZBhylu20Oef3Ma0Qit9MNzs1ckhU
 BSnFo+mjVX48BFl3sMRUQ7l9D8KB2eb1CbZJ0sB1Q/NuOcJj+bffk7lARmbTl/OfXU/01qfu1
 suXE4hHASx9t4+m7pkk9cgX3B1wGfslPC1HWhz9PKt1LOnzv+2Iw2h1TmnheoKvGNXtVj2V6/
 JY8IQ5KbdEhmcTP11pw84iHsY02eZarSywd7umdkDspP0txFYvhXdVccev2Ok8OWMIuOvtMpc
 PT6nSRAuqLpIU61RnMwTigoLv20LyiglmxRId8/4YM8NGY8F5jufCqCF/tKxh6gjo5diiuu0W
 IcEDc+DLbcruS9RXlJL+JObGbKLdGgUXpeOQpHUvgEdZO6FLY6FNd9tSQqn9ImAj+n68h2xf4
 TDMaqu5V9KVE92c57pYyGaLIRyWq3Cp6fxvl+bJaMf8gWv5swEhb0VMb2E+Dbo62srXscBuOJ
 JXuPSsICEil71sfENv3apFXQ==
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

DO NOT MERGE

According to the dt-bindings there are some platforms, which have a
dedicated USB power domain for DWC2 IP core supply. If the power domain
is switched off during system suspend then all USB register will lose
their settings.

So use the power on/off notifier in order to save & restore the USB
registers during system suspend.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--

Any feedback is appreciated.

 drivers/usb/dwc2/core.c     | 16 ++++++++++++
 drivers/usb/dwc2/core.h     | 17 +++++++++++++
 drivers/usb/dwc2/gadget.c   | 49 +++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc2/hcd.c      | 49 +++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc2/platform.c | 32 ++++++++++++++++++++++++
 5 files changed, 163 insertions(+)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 9919ab725d54..a3263cfdedac 100644
=2D-- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -391,6 +391,22 @@ int dwc2_exit_hibernation(struct dwc2_hsotg *hsotg, i=
nt rem_wakeup,
 		return dwc2_gadget_exit_hibernation(hsotg, rem_wakeup, reset);
 }

+int dwc2_enter_poweroff(struct dwc2_hsotg *hsotg)
+{
+	if (dwc2_is_host_mode(hsotg))
+		return dwc2_host_enter_poweroff(hsotg);
+	else
+		return dwc2_gadget_enter_poweroff(hsotg);
+}
+
+int dwc2_exit_poweroff(struct dwc2_hsotg *hsotg)
+{
+	if (dwc2_is_host_mode(hsotg))
+		return dwc2_host_exit_poweroff(hsotg);
+	else
+		return dwc2_gadget_exit_poweroff(hsotg);
+}
+
 /*
  * Do core a soft reset of the core.  Be careful with this because it
  * resets all the internal state machines of the core.
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 2bd74f3033ed..9ab755cc3081 100644
=2D-- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -9,6 +9,7 @@
 #define __DWC2_CORE_H__

 #include <linux/acpi.h>
+#include <linux/notifier.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/gadget.h>
@@ -1080,6 +1081,8 @@ struct dwc2_hsotg {
 	struct regulator *vbus_supply;
 	struct regulator *usb33d;

+	struct notifier_block genpd_nb;
+
 	spinlock_t lock;
 	void *priv;
 	int     irq;
@@ -1316,6 +1319,8 @@ int dwc2_exit_partial_power_down(struct dwc2_hsotg *=
hsotg, int rem_wakeup,
 int dwc2_enter_hibernation(struct dwc2_hsotg *hsotg, int is_host);
 int dwc2_exit_hibernation(struct dwc2_hsotg *hsotg, int rem_wakeup,
 		int reset, int is_host);
+int dwc2_enter_poweroff(struct dwc2_hsotg *hsotg);
+int dwc2_exit_poweroff(struct dwc2_hsotg *hsotg);
 void dwc2_init_fs_ls_pclk_sel(struct dwc2_hsotg *hsotg);
 int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy);

@@ -1435,6 +1440,8 @@ int dwc2_hsotg_tx_fifo_total_depth(struct dwc2_hsotg=
 *hsotg);
 int dwc2_hsotg_tx_fifo_average_depth(struct dwc2_hsotg *hsotg);
 void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg);
 void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *hsotg);
+int dwc2_gadget_enter_poweroff(struct dwc2_hsotg *hsotg);
+int dwc2_gadget_exit_poweroff(struct dwc2_hsotg *hsotg);
 static inline void dwc2_clear_fifo_map(struct dwc2_hsotg *hsotg)
 { hsotg->fifo_map =3D 0; }
 #else
@@ -1482,6 +1489,10 @@ static inline int dwc2_hsotg_tx_fifo_average_depth(=
struct dwc2_hsotg *hsotg)
 { return 0; }
 static inline void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg) {}
 static inline void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *hsotg) =
{}
+static inline int dwc2_gadget_enter_poweroff(struct dwc2_hsotg *hsotg)
+{ return 0; }
+static inline int dwc2_gadget_exit_poweroff(struct dwc2_hsotg *hsotg)
+{ return 0; }
 static inline void dwc2_clear_fifo_map(struct dwc2_hsotg *hsotg) {}
 #endif

@@ -1505,6 +1516,8 @@ int dwc2_host_exit_partial_power_down(struct dwc2_hs=
otg *hsotg,
 void dwc2_host_enter_clock_gating(struct dwc2_hsotg *hsotg);
 void dwc2_host_exit_clock_gating(struct dwc2_hsotg *hsotg, int rem_wakeup=
);
 bool dwc2_host_can_poweroff_phy(struct dwc2_hsotg *dwc2);
+int dwc2_host_enter_poweroff(struct dwc2_hsotg *hsotg);
+int dwc2_host_exit_poweroff(struct dwc2_hsotg *hsotg);
 static inline void dwc2_host_schedule_phy_reset(struct dwc2_hsotg *hsotg)
 { schedule_work(&hsotg->phy_reset_work); }
 #else
@@ -1544,6 +1557,10 @@ static inline void dwc2_host_exit_clock_gating(stru=
ct dwc2_hsotg *hsotg,
 					       int rem_wakeup) {}
 static inline bool dwc2_host_can_poweroff_phy(struct dwc2_hsotg *dwc2)
 { return false; }
+static inline int dwc2_host_enter_poweroff(struct dwc2_hsotg *hsotg)
+{ return 0; }
+static inline int dwc2_host_exit_poweroff(struct dwc2_hsotg *hsotg)
+{ return 0; }
 static inline void dwc2_host_schedule_phy_reset(struct dwc2_hsotg *hsotg)=
 {}

 #endif
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index e7bf9cc635be..38f0112970fe 100644
=2D-- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5710,3 +5710,52 @@ void dwc2_gadget_exit_clock_gating(struct dwc2_hsot=
g *hsotg, int rem_wakeup)
 	hsotg->lx_state =3D DWC2_L0;
 	hsotg->bus_suspended =3D false;
 }
+
+int dwc2_gadget_enter_poweroff(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	dev_dbg(hsotg->dev, "Entering device power off.\n");
+
+	/* Backup all registers */
+	ret =3D dwc2_backup_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_backup_device_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup device registers\n",
+			__func__);
+		return ret;
+	}
+
+	dev_dbg(hsotg->dev, "Entering device power off completed.\n");
+	return 0;
+}
+
+int dwc2_gadget_exit_poweroff(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	dev_dbg(hsotg->dev, "Exiting device power off.\n");
+
+	ret =3D dwc2_restore_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_restore_device_registers(hsotg, 0);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore device registers\n",
+			__func__);
+		return ret;
+	}
+
+	dev_dbg(hsotg->dev, "Exiting device power off completed.\n");
+	return 0;
+}
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index cb54390e7de4..22afdafb474e 100644
=2D-- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5993,3 +5993,52 @@ void dwc2_host_exit_clock_gating(struct dwc2_hsotg =
*hsotg, int rem_wakeup)
 			  jiffies + msecs_to_jiffies(71));
 	}
 }
+
+int dwc2_host_enter_poweroff(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	dev_dbg(hsotg->dev, "Entering host power off.\n");
+
+	/* Backup all registers */
+	ret =3D dwc2_backup_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_backup_host_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup host registers\n",
+			__func__);
+		return ret;
+	}
+
+	dev_dbg(hsotg->dev, "Entering host power off completed.\n");
+	return 0;
+}
+
+int dwc2_host_exit_poweroff(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	dev_dbg(hsotg->dev, "Exiting host power off.\n");
+
+	ret =3D dwc2_restore_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_restore_host_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore host registers\n",
+			__func__);
+		return ret;
+	}
+
+	dev_dbg(hsotg->dev, "Exiting host power off completed.\n");
+	return 0;
+}
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 7b84416dfc2b..b97eefc18a6b 100644
=2D-- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_data/s3c-hsotg.h>
+#include <linux/pm_domain.h>
 #include <linux/reset.h>

 #include <linux/usb/of.h>
@@ -307,6 +308,8 @@ static void dwc2_driver_remove(struct platform_device =
*dev)
 	struct dwc2_gregs_backup *gr;
 	int ret =3D 0;

+	dev_pm_genpd_remove_notifier(&dev->dev);
+
 	gr =3D &hsotg->gr_backup;

 	/* Exit Hibernation when driver is removed. */
@@ -421,6 +424,31 @@ int dwc2_check_core_version(struct dwc2_hsotg *hsotg)
 	return 0;
 }

+static int dwc2_power_notifier(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct dwc2_hsotg *hsotg =3D container_of(nb, struct dwc2_hsotg,
+						genpd_nb);
+	int ret;
+
+	switch (action) {
+	case GENPD_NOTIFY_ON:
+		ret =3D dwc2_exit_poweroff(hsotg);
+		if (ret)
+			dev_err(hsotg->dev, "exit poweroff failed\n");
+		break;
+	case GENPD_NOTIFY_PRE_OFF:
+		ret =3D dwc2_enter_poweroff(hsotg);
+		if (ret)
+			dev_err(hsotg->dev, "enter poweroff failed\n");
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
 /**
  * dwc2_driver_probe() - Called when the DWC_otg core is bound to the DWC=
_otg
  * driver
@@ -620,6 +648,10 @@ static int dwc2_driver_probe(struct platform_device *=
dev)
 		}
 	}
 #endif /* CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE */
+
+	hsotg->genpd_nb.notifier_call =3D dwc2_power_notifier;
+	dev_pm_genpd_add_notifier(&dev->dev, &hsotg->genpd_nb);
+
 	return 0;

 #if IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) || \
=2D-
2.34.1

