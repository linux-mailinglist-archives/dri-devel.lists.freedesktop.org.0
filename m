Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B1C9EE62
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 12:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37D10E78D;
	Wed,  3 Dec 2025 11:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="WdrQQunR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7534E10E787
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 11:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764762636;
 bh=p/JhfQ/5mVmqehnjvRE1UyHQbPCzKtTccLmDH7YWYKE=;
 h=From:To:Subject:Date:Message-Id;
 b=WdrQQunRC6miA7a8WBfxuuiqDbwiaYGKwU8kAbvzi9et+VvuTC93krsEi3QVJVkFi
 ozbSXg6n6D847fbeUURk6pAR4dwfMZoDNsxy3T3I7DPBNvXWz9mBekDaQXIJtU6+5l
 S+bViNuJxdogGUeB6jtbI6Bz537aEQ93RuF9zH8A=
X-QQ-mid: zesmtpsz9t1764762634t4ecda2a1
X-QQ-Originating-IP: hmKrqfeMcwbdBdJxRwrYyzP1oSeWYkJShvR6sCH86u4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 03 Dec 2025 19:50:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 653531030055881594
From: Chaoyi Chen <kernel@airkyi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH] drm/mipi-dsi: Only remove child devices that match the dsi
 device type
Date: Wed,  3 Dec 2025 19:50:28 +0800
Message-Id: <20251203115028.133-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MD5XEDocxEOL+DzPtHJQllrrrm3kZdcABL+nj5QkMWc1JpWqK1+lSszu
 gQUg9Y0tALGkQG9SiD/QGEnEFvG6dg3mQNWdsiBqiqFL2mEa2bW/ibZT2j68gauNBX1n6j3
 Vsd+s/hwymidiv56pz2X0Zl8PNzgI2eRrSc6WJiYzMauVRysW+xRe3HFcl5MJ24PdaINyUa
 XLa3+qRObBRCbZdt2MjA2HOhHeaumsaGmbqWqs6CWsAmnlFAvrnX0zgZdtvrO4PIY5jU9Jc
 C7gdGwUwaGmjyw7YBm2DSLvb5DLqeqw75AAqv4t80IbimZBNvb9xcFfS/acJgdt9+hiCpHU
 +i2EzsngN3iZLohNyncL1TShel6dLW72wKdATy9ZkU6xI6m0mvaKd1gabmyV+7sbhlx5xC0
 TfKdf9pMp51JfioVRUHAD/6718n+k/E8ftapqgNSJALZwleYgoIL4DcukQkDRtOvEi39PMx
 KOHUmX/Di+ILrL9VYyeXx94EosMxnEGKo3GWmHLu7g7Z7G4nj4NfvJkzemtOt9xeNlp9hR9
 wdjnVaxqWWs9XOdQmonHEYbu39qd2nSvJkWqhYMQSArnQy7g6ipDQFUpubMGQGidi9jNgbl
 XE2oR65rONeGL7oMnDCpX3iOT5VjUfJ6qZc3lanSROS5XDDcGrQaaKI/WgozoJH72zuGpTx
 88QBPxbjKfzkDp30vTulaXBdlsbjtVzObCNfYME+lkYGMBAhvTySqQKNlLelRsWEUph3tpd
 gplnB8XMqT3YslLHfutWMAvguW3vun10Clt3U1WUv5iPqCoNge9zTNsneQ7tAhHCry8hhb/
 yo4q44v9W8ZtsFw8DY/PVcBUbgKCmS/uawCDmQsLSz42OS61ikD1AGvguPEpAAZnsTVqGQ1
 HkKo1C9T9hBNtPZHX9zuoDftBajXWxT0oMmdcz1IBMOSi+YlNQT0vUgAqxeUHYK5LK2164b
 e33XQTXpNRlwi1q/P7Tm0lPD8kaMfhbOr3YSGKfrs6rn/eg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This patch checks whether the device is a valid mipi_dsi_device before
accessing it in mipi_dsi_remove_device_fn().

The mipi_dsi_host_unregister() assumes that all child devices of the
host device are mipi_dsi_devices and uses mipi_dsi_remove_device_fn()
to perform subsequent operations specific to mipi_dsi_device.

In rockchip platform, for dw-mipi-dsi-rockchip.c, it creates a dphy
device, and it use the dsi host device as its parent device.

And when we call dw_mipi_dsi_remove() in
dw_mipi_dsi_rockchip_remove(), mipi_dsi_host_unregister() will get
such a dphy child device and treat it as an mipi_dsi_device, which
will lead to a further panic.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a712e177b350..5b9cc799eb87 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -349,7 +349,12 @@ EXPORT_SYMBOL(mipi_dsi_host_register);
 
 static int mipi_dsi_remove_device_fn(struct device *dev, void *priv)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
+	struct mipi_dsi_device *dsi;
+
+	if (!dev_is_mipi_dsi(dev))
+		return 0;
+
+	dsi = to_mipi_dsi_device(dev);
 
 	if (dsi->attached)
 		mipi_dsi_detach(dsi);
-- 
2.51.1

