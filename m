Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B262B51F8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988986EA60;
	Mon, 16 Nov 2020 20:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C386EA5C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:08:15 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 045D7221F9;
 Mon, 16 Nov 2020 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605557295;
 bh=A+D/OB7qcJ+Uw0X+akOLPoeJ2m1P11y6+CjEDPewkNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dxmi7JY/bBNjzDqSo0BsyPWK7MBrfdtFnZNogjXRaNxdsqkqEv21PQy2LP8lxoadM
 YNQgx/Y+ocgjHv5rseVNh3SmWvwKQ5/RxSNXQeLSW4Z5i8r8PXJXQCj+dGoWN27x/G
 jnR9qQCH0gFRI3cCa70/D4cDsq74Y38EzQy/VH/o=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1keknN-00B7cF-4M; Mon, 16 Nov 2020 20:08:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/4] drm/meson: dw-hdmi: Register a callback to disable the
 regulator
Date: Mon, 16 Nov 2020 20:07:43 +0000
Message-Id: <20201116200744.495826-4-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116200744.495826-1-maz@kernel.org>
References: <20201116200744.495826-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removing the meson-dw-hdmi module results in the following splat:

i[   43.340509] WARNING: CPU: 0 PID: 572 at drivers/regulator/core.c:2125 _regulator_put.part.0+0x16c/0x174
[...]
[   43.454870] CPU: 0 PID: 572 Comm: modprobe Tainted: G        W   E     5.10.0-rc4-00049-gd274813a4de3-dirty #2147
[   43.465042] Hardware name:  , BIOS 2021.01-rc2-00012-gde865f7ee1 11/16/2020
[   43.471945] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[   43.477896] pc : _regulator_put.part.0+0x16c/0x174
[   43.482638] lr : regulator_put+0x44/0x60
[...]
[   43.568715] Call trace:
[   43.571132]  _regulator_put.part.0+0x16c/0x174
[   43.575529]  regulator_put+0x44/0x60
[   43.579067]  devm_regulator_release+0x20/0x2c
[   43.583380]  release_nodes+0x1c8/0x2b4
[   43.587087]  devres_release_all+0x44/0x6c
[   43.591056]  __device_release_driver+0x1a0/0x23c
[   43.595626]  driver_detach+0xcc/0x160
[   43.599249]  bus_remove_driver+0x68/0xe0
[   43.603130]  driver_unregister+0x3c/0x6c
[   43.607011]  platform_driver_unregister+0x20/0x2c
[   43.611678]  meson_dw_hdmi_platform_driver_exit+0x18/0x4a8 [meson_dw_hdmi]
[   43.618485]  __arm64_sys_delete_module+0x1bc/0x294

as the HDMI regulator is still enabled on release.

In order to address this, register a callback that will deal with
the disabling when the driver is unbound, solving the problem.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 29a8ff41595d..68826cf9993f 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -941,6 +941,11 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 
 }
 
+static void meson_disable_regulator(void *data)
+{
+	regulator_disable(data);
+}
+
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -989,6 +994,10 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
 		if (ret)
 			return ret;
+		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
+					       meson_dw_hdmi->hdmi_supply);
+		if (ret)
+			return ret;
 	}
 
 	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
