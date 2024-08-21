Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6395A6DC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 23:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F98210E6ED;
	Wed, 21 Aug 2024 21:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="NshBRw3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811A910E6E8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 21:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1724276472; x=1724881272; i=wahrenst@gmx.net;
 bh=9GWd0CDe/k2CUFdixtyjcH7jeuIirHODxoQWdavAcRk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NshBRw3TDEyl3VKqKrXuPhfv/CrBnboNCdcUVvAFb8EXqXUscz/3McrYlVDs4SET
 7MtUrX1i+Q9FxbTW4SEB7YI95TCLiOcdaOIlFHOwbsfF/swq69jGd8b9AfLj8xI4p
 /NzN/KOQO8g4xtTCU/YHPchAMHGW+jN/L9kcgBI5u8pwSBbJ3YFaJZnXovPRcr2YG
 HH6LjzNIAAq5eNs3tZ9kVtA+1KFZ8BnJxhwt5N3nAz2qQk8bCSnfArGwZc6AXi57B
 MqZuQMp6f/JZdrCyAFKbpGZGQiVfWjE2I1WR2piKXMVSAtt9hhZIKfyCrHvxsUsSD
 CrVHiDs30j20tSdjkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1sF0Iw1o7q-00ixXE; Wed, 21
 Aug 2024 23:41:12 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Russell King <linux@armlinux.org.uk>,
 Doug Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 RFC 8/9] usb: dwc2: Implement recovery after PM domain off
Date: Wed, 21 Aug 2024 23:40:51 +0200
Message-Id: <20240821214052.6800-9-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821214052.6800-1-wahrenst@gmx.net>
References: <20240821214052.6800-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6GhQJP0mhRKQTTBEbTOBSW1NEgbWA/13VOs3a68rCTmoqSj4WBe
 rn5I6PYYiZk4a/yOwbon7thCpQ3BnZo+EVl62AjhyLdlh78JMKryErHj1aqdOeQvAkl3YAf
 PB0ilN5Rlu1RMLx63tw2utDkuhqtjFmAC4fBlPTNFe8xnIZjbqZocR0OaBWUnm6fHFjYKAV
 yxXhFWTcS1HvPGBG7ViXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w/kI+/BAp9k=;m4OZVQZJvj3E/pqkWti+4ZncyUq
 8wcSVEa6OtFdaJaTpDRZcg1U92SO+nnfSnA7baxfR7YR0HrCUPem3fC/fhG859nto0YTrDMqN
 xRgdt6yYn92HcCHLUoA7HPp/SoQPi2S1wAygTDEeUyl/IhNmfOaYSWgWTNDKaCVe7ss9jQ6NG
 TUo4AFz4RK0BUZRTnB38L72VSocPV2CAtXHsOsoZr/9BmMZdtFqLb83CIs0WWuv8v2NRR7NPv
 1mJfI1R6rlM3Vd9wUexpeVUNS4IqXk7yxDkPRRMzGaNvpEUsIBlDPxAKLlBKjnlSEXpeVPNdX
 s/LMdyvcV5CQ2EszrHQgWMYjOPv5BZl7xFuXXnGfg0jfZM7H+4RJtoMx+ysB2SO/jyGESFOk0
 Tr71QiNAIQg+fGqvZWerd7Me7ygRrYF0aXedc/cwuiIpadCsg++63bjoOJOGMDY7aj4CAJB65
 Xe43nZZd8xfQ0ZIyEW9N1RH+JblsMqRh/RNLqw8T9apWdzGE9ABMsTnILsPByPgN6LJ4J4b8v
 Fr1NnGuaLd2X89L0mEQWuGSuQgv01jVU/CXjksPxkw+hg6n2kkA9W/ArN0sCOiAVfvBPTeVHp
 ABWlC6VcbLj5ZJmqXmrjMSFZ/V7+kXoXwuaErbWFao/P3uCro3CP4naVa+Myq6YdMZ8J+bwHm
 F49mxNz2I0ranYqOuu/r2Cp7D9pHtjn6KZwHNVwnBltSd0N9+dzu5l+YZqEHRGsH9zubWCf9M
 8xxcaSa2yiHeksjb7VinxovWymu63mQcXkWakUbvji11BIQWXOn4Z61jsgU93OzB5dtfQvoNz
 qnR+tUwHZtsroFihMJ55pblQ==
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

According to the dt-bindings there are some platforms, which have a
dedicated USB power domain for DWC2 IP core supply. If the power domain
is switched off during system suspend then all USB register will lose
their settings.

Use GUSBCFG_TOUTCAL as a canary to detect that the power domain has
been powered off during suspend. Since the GOTGCTL_CURMODE_HOST doesn't
match on all platform with the current mode, additionally backup
GINTSTS. This works reliable to decide which registers should be
restored.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/core.c     |  1 +
 drivers/usb/dwc2/core.h     |  2 ++
 drivers/usb/dwc2/platform.c | 38 +++++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

Hi, would be nice to get some feedback about the approach and
test results on other DWC2 platforms.

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 9919ab725d54..c3d24312db0f 100644
=2D-- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -43,6 +43,7 @@ int dwc2_backup_global_registers(struct dwc2_hsotg *hsot=
g)
 	/* Backup global regs */
 	gr =3D &hsotg->gr_backup;

+	gr->gintsts =3D dwc2_readl(hsotg, GINTSTS);
 	gr->gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
 	gr->gintmsk =3D dwc2_readl(hsotg, GINTMSK);
 	gr->gahbcfg =3D dwc2_readl(hsotg, GAHBCFG);
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 81e8632f29ed..e65a74853bb0 100644
=2D-- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -667,6 +667,7 @@ struct dwc2_hw_params {
 /**
  * struct dwc2_gregs_backup - Holds global registers state before
  * entering partial power down
+ * @gintsts:		Backup of GINTSTS register
  * @gotgctl:		Backup of GOTGCTL register
  * @gintmsk:		Backup of GINTMSK register
  * @gahbcfg:		Backup of GAHBCFG register
@@ -683,6 +684,7 @@ struct dwc2_hw_params {
  * @valid:		True if registers values backuped.
  */
 struct dwc2_gregs_backup {
+	u32 gintsts;
 	u32 gotgctl;
 	u32 gintmsk;
 	u32 gahbcfg;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 7b84416dfc2b..39e9064b6cfe 100644
=2D-- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -683,6 +683,14 @@ static int __maybe_unused dwc2_suspend(struct device =
*dev)
 		regulator_disable(dwc2->usb33d);
 	}

+	if (is_device_mode)
+		ret =3D dwc2_gadget_backup_critical_registers(dwc2);
+	else
+		ret =3D dwc2_host_backup_critical_registers(dwc2);
+
+	if (ret)
+		return ret;
+
 	if (dwc2->ll_hw_enabled &&
 	    (is_device_mode || dwc2_host_can_poweroff_phy(dwc2))) {
 		ret =3D __dwc2_lowlevel_hw_disable(dwc2);
@@ -692,6 +700,24 @@ static int __maybe_unused dwc2_suspend(struct device =
*dev)
 	return ret;
 }

+static int dwc2_restore_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_gregs_backup *gr;
+
+	gr =3D &hsotg->gr_backup;
+
+	if (!gr->valid) {
+		dev_err(hsotg->dev, "%s: no registers to restore\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	if (gr->gintsts & GINTSTS_CURMODE_HOST)
+		return dwc2_host_restore_critical_registers(hsotg);
+
+	return dwc2_gadget_restore_critical_registers(hsotg);
+}
+
 static int __maybe_unused dwc2_resume(struct device *dev)
 {
 	struct dwc2_hsotg *dwc2 =3D dev_get_drvdata(dev);
@@ -704,6 +730,18 @@ static int __maybe_unused dwc2_resume(struct device *=
dev)
 	}
 	dwc2->phy_off_for_suspend =3D false;

+	/*
+	 * During suspend it's possible that the power domain for the
+	 * DWC2 controller is disabled and all register values get lost.
+	 * In case the GUSBCFG register is not initialized, it's clear the
+	 * registers must be restored.
+	 */
+	if (!(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK)) {
+		ret =3D dwc2_restore_critical_registers(dwc2);
+		if (ret)
+			return ret;
+	}
+
 	if (dwc2->params.activate_stm_id_vb_detection) {
 		unsigned long flags;
 		u32 ggpio, gotgctl;
=2D-
2.34.1

