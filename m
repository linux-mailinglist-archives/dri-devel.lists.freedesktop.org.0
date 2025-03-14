Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAB7A607D5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 04:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69E510E2A4;
	Fri, 14 Mar 2025 03:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="oIaTe26/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D10910E28C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 03:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=gGwv+
 eeprf4G5YLrHNJS3Mp9GgddJgkGcfVW3j5tZlA=; b=oIaTe26/ZMGzQva6ST9DH
 XS1W+KqDbOFbYrM7gsAz/Wkd5HZKgvckiFlnBOXNUKNP5rAg+xAZ1KbxYoYEl35Q
 LZLN5tdsAQooMcTgL0iROer/MEZSeDSti4LtCwPpymqNZN6/n5EPfVpdIvHZtsoX
 8QJ3l5SMLM5fIf/k6ql/24=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wC3bE_SpNNn4bIfSw--.42501S2; 
 Fri, 14 Mar 2025 11:39:02 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/5] drm/dp: Pull drm_dp_link_power_up/down from Tegra to
 common drm_dp_helper
Date: Fri, 14 Mar 2025 11:38:40 +0800
Message-ID: <20250314033856.538352-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3bE_SpNNn4bIfSw--.42501S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKFW3KF15JF4xGr18WF15urg_yoW3GF15pF
 ZxWry8tr4vvw4UXr47tF129rW3ua17CFWkKrWxG3s3A3Wjyr98Xa45tr1UGFy3JryDCay7
 tFnxCFW7GFWIkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5NVkUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gUQXmfTn9eT4wAAsV
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

From: Andy Yan <andy.yan@rock-chips.com>

The helper functions drm_dp_link_power_up/down were moved to Tegra
DRM at 2019[0].

Now since more and more users are duplicating the same code in their
own drivers, it's time to make them as DRM DP common helpers again.

[0]https://patchwork.freedesktop.org/patch/336850/?series=68031&rev=3
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/display/drm_dp_helper.c | 69 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dp.c              | 67 ------------------------
 drivers/gpu/drm/tegra/dp.h              |  2 -
 drivers/gpu/drm/tegra/sor.c             |  4 +-
 include/drm/display/drm_dp_helper.h     |  2 +
 5 files changed, 73 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dbce1c3f4969..e5dec67e5fca 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -838,6 +838,75 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_phy_link_status);
 
+/**
+ * drm_dp_link_power_up() - power up a DisplayPort link
+ * @aux: DisplayPort AUX channel
+ * @revision: DPCD revision supported on the link
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_power_up(struct drm_dp_aux *aux, unsigned char revision)
+{
+	u8 value;
+	int err;
+
+	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
+	if (revision < DP_DPCD_REV_11)
+		return 0;
+
+	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
+	if (err < 0)
+		return err;
+
+	value &= ~DP_SET_POWER_MASK;
+	value |= DP_SET_POWER_D0;
+
+	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+	if (err < 0)
+		return err;
+
+	/*
+	 * According to the DP 1.1 specification, a "Sink Device must exit the
+	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
+	 * Control Field" (register 0x600).
+	 */
+	usleep_range(1000, 2000);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_link_power_up);
+
+/**
+ * drm_dp_link_power_down() - power down a DisplayPort link
+ * @aux: DisplayPort AUX channel
+ * @revision: DPCD revision supported on the link
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_power_down(struct drm_dp_aux *aux, unsigned char revision)
+{
+	u8 value;
+	int err;
+
+	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
+	if (revision < DP_DPCD_REV_11)
+		return 0;
+
+	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
+	if (err < 0)
+		return err;
+
+	value &= ~DP_SET_POWER_MASK;
+	value |= DP_SET_POWER_D3;
+
+	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_link_power_down);
+
 static int read_payload_update_status(struct drm_dp_aux *aux)
 {
 	int ret;
diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 08fbd8f151a1..990e744b0923 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -255,73 +255,6 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	return 0;
 }
 
-/**
- * drm_dp_link_power_up() - power up a DisplayPort link
- * @aux: DisplayPort AUX channel
- * @link: pointer to a structure containing the link configuration
- *
- * Returns 0 on success or a negative error code on failure.
- */
-int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < 0x11)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D0;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	/*
-	 * According to the DP 1.1 specification, a "Sink Device must exit the
-	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
-	 * Control Field" (register 0x600).
-	 */
-	usleep_range(1000, 2000);
-
-	return 0;
-}
-
-/**
- * drm_dp_link_power_down() - power down a DisplayPort link
- * @aux: DisplayPort AUX channel
- * @link: pointer to a structure containing the link configuration
- *
- * Returns 0 on success or a negative error code on failure.
- */
-int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < 0x11)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D3;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
 /**
  * drm_dp_link_configure() - configure a DisplayPort link
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index cb12ed0c54e7..695060cafac0 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -164,8 +164,6 @@ int drm_dp_link_remove_rate(struct drm_dp_link *link, unsigned long rate);
 void drm_dp_link_update_rates(struct drm_dp_link *link);
 
 int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
-int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
-int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_choose(struct drm_dp_link *link,
 		       const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index f98f70eda906..21f3dfdcc5c9 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2666,7 +2666,7 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
 	 * the AUX transactions would just be timing out.
 	 */
 	if (output->connector.status != connector_status_disconnected) {
-		err = drm_dp_link_power_down(sor->aux, &sor->link);
+		err = drm_dp_link_power_down(sor->aux, sor->link.revision);
 		if (err < 0)
 			dev_err(sor->dev, "failed to power down link: %d\n",
 				err);
@@ -2882,7 +2882,7 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
 	else
 		dev_dbg(sor->dev, "link training succeeded\n");
 
-	err = drm_dp_link_power_up(sor->aux, &sor->link);
+	err = drm_dp_link_power_up(sor->aux, sor->link.revision);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power up DP link: %d\n", err);
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5ae4241959f2..f9dabce484a7 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -566,6 +566,8 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 				     enum drm_dp_phy dp_phy,
 				     u8 link_status[DP_LINK_STATUS_SIZE]);
+int drm_dp_link_power_up(struct drm_dp_aux *aux, unsigned char revision);
+int drm_dp_link_power_down(struct drm_dp_aux *aux, unsigned char revision);
 
 int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
 			      int vcpid, u8 start_time_slot, u8 time_slot_count);
-- 
2.34.1

