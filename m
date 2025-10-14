Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F8BDA8A9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC1410E655;
	Tue, 14 Oct 2025 16:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E2sAXLoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3519110E650
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760457660;
 bh=SH3ubszV9t3xT3AKN16sYqXa9F/SlbYXKCXLU/2GQbY=;
 h=From:Date:Subject:To:Cc:From;
 b=E2sAXLoZbNIl6fzji+xHJSCE0dQXz54GHG/gRHFDnBkJIdZVV8IbpLp3TYIfU2iy2
 qyYYsh2pZDUrc6dvdk+NPJ08KrflvHfABOuXWY3pMNZkl6xv6v31CTY6ySUmo0u02K
 DNsDnfot3f+I7ev5W5Muj7KKta6GE5utlgbo0AzUOZvaF04MwN/NNB1QBm7f7ineYg
 NNESokqMRE6f+r0rXB7K0PepC119t25enETxLqA0neG4nlSvMB2TJmlK2xZiGrkPap
 xZ2V1Ea3U2Z+XHgV9sTk++DjdrNnxqM2D9+juIWuplyii5CiYw0Q/j0po3vIHsrHnT
 QqMupbPWezaFw==
Received: from jupiter.universe (dyndsl-091-248-212-042.ewe-ip-backbone.de
 [91.248.212.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A31BB17E0456;
 Tue, 14 Oct 2025 18:01:00 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
 id 5980F480044; Tue, 14 Oct 2025 18:01:00 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Oct 2025 18:00:57 +0200
Subject: [PATCH] drm/bridge: dw-hdmi-qp: Fix spurious IRQ on resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-rockchip-hdmi-suspend-fix-v1-1-983fcbf44839@collabora.com>
X-B4-Tracking: v=1; b=H4sIALhz7mgC/x2MUQqFIBAArxL73UKWgq+rRB+lWy7xTFyKILp70
 ucMzNwglJkE+uqGTCcL77GAqitwYYorIfvC0DatUY3SmHe3ucAJg/8zyiGJoseFL6Tf7LU11mr
 TQelTpqK/9zA+zwvCuh4tawAAAA==
X-Change-ID: 20251014-rockchip-hdmi-suspend-fix-e9bd48588453
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4328;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=SH3ubszV9t3xT3AKN16sYqXa9F/SlbYXKCXLU/2GQbY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGjuc7xrHv7VsBmKzjHwXZWZqIGufGeBe0Vjr
 Tw99cuY8eW0KokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJo7nO8AAoJENju1/PI
 O/qan+0P/0IXHkUnlGGCLnmv7grUsUJmKxll2pwfKghKUPGoPcYaIYPOqA2RRNxRfLOq+qHe8Hw
 3JMpw4XyTQjSJxcMJtAUSWUO4j5nAtD+Xbl0AbDGLO66slgvMjWAuy2UB7mkP3U9p4a+AQYiUpR
 Z/K0fOhpBnwUE/JweHTiJkPBa5zO6bwDeDwPE9hzdXBq2m+3eYR1ZkzZlNY88Anet1JcJ/FdlBg
 gEzEDQmgOzpOdsD+ZxH2Emn1wslMU+R5vcJ6gtB+ygwbMOTE+gwrYT52uW6/3+hp/iIHgkJLOvb
 ivLj1MdRNPDt0DS1m4/ocByIQrBtszISThMGM9cX2M8tVRaCye6y1fYF8wVQEStBlo+zf1rc02s
 dky44tyaC/F3seTt27jBOiXjH1hRYS2LmduDL1N20CiF1Hsef65iGES8PGCLkAvq2aT8jZMj4zO
 kAa34NC58uDriAXQUL4rtifnwiExzJWgQoiyPiu7erUDCkvEFHT0DITjgaFSvaDQaSoRs09wtF6
 ryPJcCYjTYVKNbFC9Gwh8pq5YD/aEyjAD4/uaONqkyKV4nuCbNkA6yx6E38I52fCkCuwU+xOrHd
 4m8qn4KgE+PuO0dFKRagy/Th7ZA/+BPGLZNn2sEsNEJnhT9IHejcJZyNZvhtO8JB1/8sDTNsdcC
 iyV2ZPGOX8wXfX02Qp98nnQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

After resume from suspend to RAM, the following splash is generated if
the HDMI driver is probed (independent of a connected cable):

[ 1194.484052] irq 80: nobody cared (try booting with the "irqpoll" option)
[ 1194.484074] CPU: 0 UID: 0 PID: 627 Comm: rtcwake Not tainted 6.17.0-rc7-g96f1a11414b3 #1 PREEMPT
[ 1194.484082] Hardware name: Rockchip RK3576 EVB V10 Board (DT)
[ 1194.484085] Call trace:
[ 1194.484087]  ... (stripped)
[ 1194.484283] handlers:
[ 1194.484285] [<00000000bc363dcb>] dw_hdmi_qp_main_hardirq [dw_hdmi_qp]
[ 1194.484302] Disabling IRQ #80

Apparently the HDMI IP is losing part of its state while the system
is suspended and generates spurious interrupts during resume. The
bug has not yet been noticed, as system suspend does not yet work
properly on upstream kernel with either the Rockchip RK3588 or RK3576
platform.

Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  9 +++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 12 +++++++++++-
 include/drm/bridge/dw_hdmi_qp.h                |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c5..c85eb340e5a3 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -143,6 +143,7 @@ struct dw_hdmi_qp {
 	} phy;
 
 	struct regmap *regm;
+	int main_irq;
 
 	unsigned long tmds_char_rate;
 };
@@ -1068,6 +1069,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 
 	dw_hdmi_qp_init_hw(hdmi);
 
+	hdmi->main_irq = plat_data->main_irq;
 	ret = devm_request_threaded_irq(dev, plat_data->main_irq,
 					dw_hdmi_qp_main_hardirq, NULL,
 					IRQF_SHARED, dev_name(dev), hdmi);
@@ -1106,9 +1108,16 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_qp_bind);
 
+void dw_hdmi_qp_suspend(struct device *dev, struct dw_hdmi_qp *hdmi)
+{
+	disable_irq(hdmi->main_irq);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_qp_suspend);
+
 void dw_hdmi_qp_resume(struct device *dev, struct dw_hdmi_qp *hdmi)
 {
 	dw_hdmi_qp_init_hw(hdmi);
+	enable_irq(hdmi->main_irq);
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_qp_resume);
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index ed6e8f036f4b..9ac45e7bc987 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -597,6 +597,15 @@ static void dw_hdmi_qp_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_hdmi_qp_rockchip_ops);
 }
 
+static int __maybe_unused dw_hdmi_qp_rockchip_suspend(struct device *dev)
+{
+	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_qp_suspend(dev, hdmi->hdmi);
+
+	return 0;
+}
+
 static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
@@ -612,7 +621,8 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dw_hdmi_qp_rockchip_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, dw_hdmi_qp_rockchip_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_qp_rockchip_suspend,
+				dw_hdmi_qp_rockchip_resume)
 };
 
 struct platform_driver dw_hdmi_qp_rockchip_pltfm_driver = {
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index e9be6d507ad9..8955450663e5 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -28,5 +28,6 @@ struct dw_hdmi_qp_plat_data {
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 				   struct drm_encoder *encoder,
 				   const struct dw_hdmi_qp_plat_data *plat_data);
+void dw_hdmi_qp_suspend(struct device *dev, struct dw_hdmi_qp *hdmi);
 void dw_hdmi_qp_resume(struct device *dev, struct dw_hdmi_qp *hdmi);
 #endif /* __DW_HDMI_QP__ */

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-rockchip-hdmi-suspend-fix-e9bd48588453

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

