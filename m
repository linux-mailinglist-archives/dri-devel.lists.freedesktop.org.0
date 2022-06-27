Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDC55BA70
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7A2112228;
	Mon, 27 Jun 2022 14:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB86110F0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jqNVkhlKQgqXtLeAWprMxZosE+nkqym2SEmCMhLQNlc=; b=UKrJgi8mpssJ8vUSIqsRaFlfde
 NzafDBO/mC4aXw4QPBIneZ9kKb6AEmJoy0BSC0s0b7rv/H7Dd7LqU0WicsZ1oNrL9FepdSJBJJZL9
 No54CShhzc5PlHZLn929qk+02aBERQiEvwLSkxtE08wrv/ujH5J5+CaE0BNdAEuxLJ+4Y9BE/tUhM
 RZz6+IJLoH084FpFlzJicHkBjosb29+qpmnoL1qyLaOSCnj88DEtEmneqKhWfztwf1lvQW4saAQTn
 mopHYgvC4FQxooW4ChNkaVvOKXmUM+68Yl4XgxIOwlG/3ucGwTVoa3TH7wYGaGr1AorNvWbULm17P
 0k6oZvhg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o5pbO-003N2J-0V; Mon, 27 Jun 2022 17:20:32 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7/v3 15/22] gpu: host1x: Program virtualization tables
Date: Mon, 27 Jun 2022 17:20:01 +0300
Message-Id: <20220627142008.2072474-16-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627142008.2072474-1-cyndis@kapsi.fi>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
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
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Program virtualization tables specifying which VMs have access to which
Host1x hardware resources. Programming these has become mandatory in
Tegra234.

For now, since the driver does not operate as a Host1x hypervisor, we
basically allow access to everything to everyone.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 21 ++++++++++++++++++---
 drivers/gpu/host1x/dev.h |  8 ++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 8c6ce8014c09..5a57165ab0f6 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -217,7 +217,7 @@ static const struct of_device_id host1x_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, host1x_of_match);
 
-static void host1x_setup_sid_table(struct host1x *host)
+static void host1x_setup_virtualization_tables(struct host1x *host)
 {
 	const struct host1x_info *info = host->info;
 	unsigned int i;
@@ -231,6 +231,21 @@ static void host1x_setup_sid_table(struct host1x *host)
 		host1x_hypervisor_writel(host, entry->offset, entry->base);
 		host1x_hypervisor_writel(host, entry->limit, entry->base + 4);
 	}
+
+	for (i = 0; i < info->streamid_vm_table.count; i++) {
+		/* Allow access to all stream IDs to all VMs. */
+		host1x_hypervisor_writel(host, 0xff, info->streamid_vm_table.base + 4 * i);
+	}
+
+	for (i = 0; i < info->classid_vm_table.count; i++) {
+		/* Allow access to all classes to all VMs. */
+		host1x_hypervisor_writel(host, 0xff, info->classid_vm_table.base + 4 * i);
+	}
+
+	for (i = 0; i < info->mmio_vm_table.count; i++) {
+		/* Use VM1 (that's us) as originator VMID for engine MMIO accesses. */
+		host1x_hypervisor_writel(host, 0x1, info->mmio_vm_table.base + 4 * i);
+	}
 }
 
 static bool host1x_wants_iommu(struct host1x *host1x)
@@ -602,7 +617,7 @@ static int __maybe_unused host1x_runtime_suspend(struct device *dev)
 	return 0;
 
 resume_host1x:
-	host1x_setup_sid_table(host);
+	host1x_setup_virtualization_tables(host);
 	host1x_syncpt_restore(host);
 	host1x_intr_start(host);
 
@@ -632,7 +647,7 @@ static int __maybe_unused host1x_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	host1x_setup_sid_table(host);
+	host1x_setup_virtualization_tables(host);
 	host1x_syncpt_restore(host);
 	host1x_intr_start(host);
 
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 85edcc6e0fc7..920e5548cfbc 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -90,6 +90,11 @@ struct host1x_sid_entry {
 	unsigned int limit;
 };
 
+struct host1x_table_desc {
+	unsigned int base;
+	unsigned int count;
+};
+
 struct host1x_info {
 	unsigned int nb_channels; /* host1x: number of channels supported */
 	unsigned int nb_pts; /* host1x: number of syncpoints supported */
@@ -103,6 +108,9 @@ struct host1x_info {
 	bool has_common; /* has common registers separate from hypervisor */
 	unsigned int num_sid_entries;
 	const struct host1x_sid_entry *sid_table;
+	struct host1x_table_desc streamid_vm_table;
+	struct host1x_table_desc classid_vm_table;
+	struct host1x_table_desc mmio_vm_table;
 	/*
 	 * On T20-T148, the boot chain may setup DC to increment syncpoints
 	 * 26/27 on VBLANK. As such we cannot use these syncpoints until
-- 
2.36.1

