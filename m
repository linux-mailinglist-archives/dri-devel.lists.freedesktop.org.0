Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727365BDF7B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBC710E403;
	Tue, 20 Sep 2022 08:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8F910E425
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WGDOR4/G4lvi7odQrLsocAov6jzKFOoeOGWdV2SLtpo=; b=x4m9f3/Jwh/Ot1Cqt4onSuhmqM
 pp3XTDymKjjyEXwc66DV+ucftntOosGh8dY7pK9p6IUevUxXdO+wgIl9XeABBP03Ucr5XXuSCUViZ
 cEz/SFwxctVi/E6fgdcZHj+43r7sspLL5aiIyCSAHOX8W6vwLPdlPPoWbSf+yAph1/P0yfjnaAU/i
 0kVeghdKvKe5LP9HiVOjMXMQq6pwAl3MWAPO7PcSVxmgVXtfUvy4uKNIGGz332O+WUj+1MRqnbfFz
 03ixvJZRRsdf7eY0sPHE3GC5OA4Qg9u1c1dl1CNv8yepEb+Yh0Jz8A4F8pex8WsfykFOTHmCpiEmT
 RUnZ6MEQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oaYMo-0017q3-4p; Tue, 20 Sep 2022 11:12:30 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout bounds
Date: Tue, 20 Sep 2022 11:11:56 +0300
Message-Id: <20220920081203.3237744-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220920081203.3237744-1-cyndis@kapsi.fi>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
has been loaded by a bootloader. When booting NVDEC, we need to tell it
the address of this firmware, which we can determine by checking the
starting address of the carveout. As such, add an MC API to query the
bounds of carveouts, and add related information on Tegra234.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
- Add check for 64-bit phys_addr_t. In practice phys_addr_t
  is always 64 bits where this runs, but it avoids warnings in
  compile test.
---
 drivers/memory/tegra/mc.c       | 25 +++++++++++++++++++++++++
 drivers/memory/tegra/tegra234.c |  5 +++++
 include/soc/tegra/mc.h          | 11 +++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 2f7a58a9df1a..592907546ee6 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -107,6 +107,31 @@ int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(tegra_mc_probe_device);
 
+int tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
+                               phys_addr_t *base, u64 *size)
+{
+	u32 offset;
+
+	if (id < 1 || id >= mc->soc->num_carveouts)
+		return -EINVAL;
+
+	if (id < 6)
+		offset = 0xc0c + 0x50 * (id - 1);
+	else
+		offset = 0x2004 + 0x50 * (id - 6);
+
+	*base = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, offset + 0x0);
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+	*base |= (phys_addr_t)mc_ch_readl(mc, MC_BROADCAST_CHANNEL, offset + 0x4) << 32;
+#endif
+
+	if (size)
+		*size = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, offset + 0x8) << 17;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_mc_get_carveout_info);
+
 static int tegra_mc_block_dma_common(struct tegra_mc *mc,
 				     const struct tegra_mc_reset *rst)
 {
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index a9e8fd99730f..74d291d66366 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -187,4 +187,9 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	.ops = &tegra186_mc_ops,
 	.ch_intmask = 0x0000ff00,
 	.global_intstatus_channel_shift = 8,
+	/*
+	 * Additionally, there are lite carveouts but those are not currently
+	 * supported.
+	 */
+	.num_carveouts = 32,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 47ce6d434427..51a2263e1bc5 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -193,6 +193,8 @@ struct tegra_mc_soc {
 	unsigned int num_address_bits;
 	unsigned int atom_size;
 
+	unsigned int num_carveouts;
+
 	u16 client_id_mask;
 	u8 num_channels;
 
@@ -244,6 +246,8 @@ unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
 #ifdef CONFIG_TEGRA_MC
 struct tegra_mc *devm_tegra_memory_controller_get(struct device *dev);
 int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev);
+int tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
+                               phys_addr_t *base, u64 *size);
 #else
 static inline struct tegra_mc *
 devm_tegra_memory_controller_get(struct device *dev)
@@ -256,6 +260,13 @@ tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 {
 	return -ENODEV;
 }
+
+static inline int
+tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
+                           phys_addr_t *base, u64 *size)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.37.0

