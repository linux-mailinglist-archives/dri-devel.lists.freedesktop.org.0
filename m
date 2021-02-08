Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C851B3139BD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 17:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9878D6E950;
	Mon,  8 Feb 2021 16:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411B06E942
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XgkqPdbhc7Eos4SdklmvWnaRE8HPTX8F5eh5wHrPTDU=; b=yWh7QlsC/nUQ5tvr3PpYOoox/6
 2JlnNidIfel5yQwity6QxS9NHZu8cHmiOVXKvUYAXBt2HiIdUim8rViui+uDPinhHhEJw3EThqSYz
 KqxmLXtEpbXeUfUNRU8DbQq/y/JKePZ0eP4VcEknQAOp5OKG35QJFSIVmQlCSBQECHxf/1nmf6Mtt
 mRRXeamVkgTC2ufMCXF0XaE1JUS2fF0rEMYhX6aBWHCMza7JLMQV3XPO5jV8nIZRfJUxcqT17MdDe
 wgvxOk2TwIK59rPGyrmlnq9nulMdWbqkbfaWba0aR2BPRRE5ZBs7OYSlOFw+qHXEI4Bylsj1BK7tz
 4903+Xrw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1l99at-0000Cr-8C; Mon, 08 Feb 2021 18:40:59 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
 robin.murphy@arm.com
Subject: [RFC PATCH 8/8] drm/tegra: vic: Implement get_streamid_offset
Date: Mon,  8 Feb 2021 18:38:48 +0200
Message-Id: <20210208163848.2504291-9-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208163848.2504291-1-mperttunen@nvidia.com>
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the get_streamid_offset required for supporting context
isolation. Since old firmware cannot support context isolation
without hacks that we don't want to implement, check the firmware
binary to see if context isolation should be enabled.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 6c2f03faec24..f8d5f381904d 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -37,6 +37,8 @@ struct vic {
 	struct clk *clk;
 	struct reset_control *rst;
 
+	bool can_use_context;
+
 	/* Platform configuration */
 	const struct vic_config *config;
 };
@@ -218,6 +220,7 @@ static int vic_load_firmware(struct vic *vic)
 {
 	struct host1x_client *client = &vic->client.base;
 	struct tegra_drm *tegra = vic->client.drm;
+	u32 fce_bin_data_offset;
 	dma_addr_t iova;
 	size_t size;
 	void *virt;
@@ -266,6 +269,25 @@ static int vic_load_firmware(struct vic *vic)
 		vic->falcon.firmware.phys = phys;
 	}
 
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
 	return 0;
 
 cleanup:
@@ -357,10 +379,26 @@ static void vic_close_channel(struct tegra_drm_context *context)
 	pm_runtime_put(vic->dev);
 }
 
+static int vic_get_streamid_offset(struct tegra_drm_client *client)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	err = vic_load_firmware(vic);
+	if (err < 0)
+		return err;
+
+	if (vic->can_use_context)
+		return 0x30;
+	else
+		return -ENOTSUPP;
+}
+
 static const struct tegra_drm_client_ops vic_ops = {
 	.open_channel = vic_open_channel,
 	.close_channel = vic_close_channel,
 	.submit = tegra_drm_submit,
+	.get_streamid_offset = vic_get_streamid_offset,
 };
 
 #define NVIDIA_TEGRA_124_VIC_FIRMWARE "nvidia/tegra124/vic03_ucode.bin"
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
