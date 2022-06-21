Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC63553559
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 17:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBC910E94C;
	Tue, 21 Jun 2022 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5705610E560
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUWhy8rPFuwEh8PDKMugA0pP7hmxBbSzVXLcTuhwxhc=; b=odCs6Tn1vgmi+IOJewB37rq/DN
 L763XaFgoFCElHuu0N1hRSghStmYGddeyLSLamuTNVm1hJD2zL0M7HZdfwo47yuPssI4VninX0XDJ
 xkJJSxhvKdmL0w1SHt/YCmP454myS/sPG7djATUSXiimMZ+807XbLSrFMm71KFPBP/V/+jDXMkTtZ
 gNtgbg7KHvmayDosPyfGUhKqlkkhmV2h2C3N3WRclEj/mfxTe0TuUyF47T6SerSo4W7Dl4jJ5oI2b
 st3RT70lPLR0ZL65l5nbByYOxMosCecdsqoboMnppaI+mBYcW45hMjbYy4F9cMcltoj3OKbzC9e7P
 axwQpWzQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o3fWU-00Ea3F-Mr; Tue, 21 Jun 2022 18:10:34 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH v6 10/10] drm/tegra: Implement stream ID related callbacks on
 engines
Date: Tue, 21 Jun 2022 18:10:22 +0300
Message-Id: <20220621151022.1416300-11-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621151022.1416300-1-cyndis@kapsi.fi>
References: <20220621151022.1416300-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Implement the get_streamid_offset and can_use_memory_ctx callbacks
required for supporting context isolation. Since old firmware on VIC
cannot support context isolation without hacks that we don't want to
implement, check the firmware binary to see if context isolation
should be enabled.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Split into two callbacks
* Add NVDEC support
v4:
* Add locking in vic_load_firmware
* Return -EOPNOTSUPP if context isolation is not available
* Update for changed get_streamid_offset declaration
* Add comment noting that vic_load_firmware is safe to call
  without the hardware being powered on

Implement context isolation related callbacks in VIC, NVDEC
---
 drivers/gpu/drm/tegra/drm.h   |  8 +++++
 drivers/gpu/drm/tegra/nvdec.c |  9 +++++
 drivers/gpu/drm/tegra/vic.c   | 67 ++++++++++++++++++++++++++++++-----
 3 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 2acc8f2948ad..845e60f144c7 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -100,6 +100,14 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		     struct drm_tegra_submit *args, struct drm_device *drm,
 		     struct drm_file *file);
 
+static inline int
+tegra_drm_get_streamid_offset_thi(struct tegra_drm_client *client, u32 *offset)
+{
+	*offset = 0x30;
+
+	return 0;
+}
+
 struct tegra_drm_client {
 	struct host1x_client base;
 	struct list_head list;
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 386f9b2e78c4..a84f61709679 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -306,10 +306,19 @@ static void nvdec_close_channel(struct tegra_drm_context *context)
 	host1x_channel_put(context->channel);
 }
 
+static int nvdec_can_use_memory_ctx(struct tegra_drm_client *client, bool *supported)
+{
+	*supported = true;
+
+	return 0;
+}
+
 static const struct tegra_drm_client_ops nvdec_ops = {
 	.open_channel = nvdec_open_channel,
 	.close_channel = nvdec_close_channel,
 	.submit = tegra_drm_submit,
+	.get_streamid_offset = tegra_drm_get_streamid_offset_thi,
+	.can_use_memory_ctx = nvdec_can_use_memory_ctx,
 };
 
 #define NVIDIA_TEGRA_210_NVDEC_FIRMWARE "nvidia/tegra210/nvdec.bin"
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index f56f5921a8c2..c5526bda88d6 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -38,6 +38,8 @@ struct vic {
 	struct clk *clk;
 	struct reset_control *rst;
 
+	bool can_use_context;
+
 	/* Platform configuration */
 	const struct vic_config *config;
 };
@@ -229,28 +231,38 @@ static int vic_load_firmware(struct vic *vic)
 {
 	struct host1x_client *client = &vic->client.base;
 	struct tegra_drm *tegra = vic->client.drm;
+	static DEFINE_MUTEX(lock);
+	u32 fce_bin_data_offset;
 	dma_addr_t iova;
 	size_t size;
 	void *virt;
 	int err;
 
-	if (vic->falcon.firmware.virt)
-		return 0;
+	mutex_lock(&lock);
+
+	if (vic->falcon.firmware.virt) {
+		err = 0;
+		goto unlock;
+	}
 
 	err = falcon_read_firmware(&vic->falcon, vic->config->firmware);
 	if (err < 0)
-		return err;
+		goto unlock;
 
 	size = vic->falcon.firmware.size;
 
 	if (!client->group) {
 		virt = dma_alloc_coherent(vic->dev, size, &iova, GFP_KERNEL);
-		if (!virt)
-			return -ENOMEM;
+		if (!virt) {
+			err = -ENOMEM;
+			goto unlock;
+		}
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
-		if (IS_ERR(virt))
-			return PTR_ERR(virt);
+		if (IS_ERR(virt)) {
+			err = PTR_ERR(virt);
+			goto unlock;
+		}
 	}
 
 	vic->falcon.firmware.virt = virt;
@@ -277,7 +289,28 @@ static int vic_load_firmware(struct vic *vic)
 		vic->falcon.firmware.phys = phys;
 	}
 
-	return 0;
+	/*
+	 * Check if firmware is new enough to not require mapping firmware
+	 * to data buffer domains.
+	 */
+	fce_bin_data_offset = *(u32 *)(virt + VIC_UCODE_FCE_DATA_OFFSET);
+
+	if (!vic->config->supports_sid) {
+		vic->can_use_context = false;
+	} else if (fce_bin_data_offset != 0x0 && fce_bin_data_offset != 0xa5a5a5a5) {
+		/*
+		 * Firmware will access FCE through STREAMID0, so context
+		 * isolation cannot be used.
+		 */
+		vic->can_use_context = false;
+		dev_warn_once(vic->dev, "context isolation disabled due to old firmware\n");
+	} else {
+		vic->can_use_context = true;
+	}
+
+unlock:
+	mutex_unlock(&lock);
+	return err;
 
 cleanup:
 	if (!client->group)
@@ -285,6 +318,7 @@ static int vic_load_firmware(struct vic *vic)
 	else
 		tegra_drm_free(tegra, size, virt, iova);
 
+	mutex_unlock(&lock);
 	return err;
 }
 
@@ -358,10 +392,27 @@ static void vic_close_channel(struct tegra_drm_context *context)
 	host1x_channel_put(context->channel);
 }
 
+static int vic_can_use_memory_ctx(struct tegra_drm_client *client, bool *supported)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	/* This doesn't access HW so it's safe to call without powering up. */
+	err = vic_load_firmware(vic);
+	if (err < 0)
+		return err;
+
+	*supported = vic->can_use_context;
+
+	return 0;
+}
+
 static const struct tegra_drm_client_ops vic_ops = {
 	.open_channel = vic_open_channel,
 	.close_channel = vic_close_channel,
 	.submit = tegra_drm_submit,
+	.get_streamid_offset = tegra_drm_get_streamid_offset_thi,
+	.can_use_memory_ctx = vic_can_use_memory_ctx,
 };
 
 #define NVIDIA_TEGRA_124_VIC_FIRMWARE "nvidia/tegra124/vic03_ucode.bin"
-- 
2.36.1

