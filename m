Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C004BB88F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780810EA9E;
	Fri, 18 Feb 2022 11:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAF210ED26
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=THoXXJN+SQquS6dV0915VwIF0K02p4wr1CPeoAsX7cY=; b=SIFbmz6sKrcIndbmtAnHhyjyqu
 diiU90/GSHzOR+zHViejX95U9LMuNd+JoT+t66I918u05wHvNDTxViiNBUppTdjKHsL7n3ZG4cAP6
 wCEpQqEAjbUkGCzxSNb4nDEyGX88yERuB+YgkwESBISb7SH/dyYq5Rb2NXqL8TtlsxEJlmE6IlpBZ
 Bl+aIapGbqKAZ4afuuQxj4vPcz0r8vQlpPElx0LXUuxVMxA2mnBLI3DGrOMGx5CGI4+WSucF0UDa5
 7wuBY6Kt0Q9Bo3ZyvGyMQdX522ecTldfiWoylZ5GMKgCZQSzgC5j6O30uR5qIXn0ool02trxKQUMS
 z5vj6I2w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1nL1fq-0006eP-CY; Fri, 18 Feb 2022 13:43:42 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Subject: [PATCH v3 7/9] drm/tegra: falcon: Set DMACTX field on DMA transactions
Date: Fri, 18 Feb 2022 13:39:50 +0200
Message-Id: <20220218113952.3077606-8-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220218113952.3077606-1-mperttunen@nvidia.com>
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DMACTX field determines which context, as specified in the
TRANSCFG register, is used. While during boot it doesn't matter
which is used, later on it matters and this value is reused by
the firmware.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/falcon.c | 8 ++++++++
 drivers/gpu/drm/tegra/falcon.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
index 223ab2ceb7e6..8bdb72f08f58 100644
--- a/drivers/gpu/drm/tegra/falcon.c
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -48,6 +48,14 @@ static int falcon_copy_chunk(struct falcon *falcon,
 	if (target == FALCON_MEMORY_IMEM)
 		cmd |= FALCON_DMATRFCMD_IMEM;
 
+	/*
+	 * Use second DMA context (i.e. the one for firmware). Strictly
+	 * speaking, at this point both DMA contexts point to the firmware
+	 * stream ID, but this register's value will be reused by the firmware
+	 * for later DMA transactions, so we need to use the correct value.
+	 */
+	cmd |= FALCON_DMATRFCMD_DMACTX(1);
+
 	falcon_writel(falcon, offset, FALCON_DMATRFMOFFS);
 	falcon_writel(falcon, base, FALCON_DMATRFFBOFFS);
 	falcon_writel(falcon, cmd, FALCON_DMATRFCMD);
diff --git a/drivers/gpu/drm/tegra/falcon.h b/drivers/gpu/drm/tegra/falcon.h
index c56ee32d92ee..1955cf11a8a6 100644
--- a/drivers/gpu/drm/tegra/falcon.h
+++ b/drivers/gpu/drm/tegra/falcon.h
@@ -50,6 +50,7 @@
 #define FALCON_DMATRFCMD_IDLE			(1 << 1)
 #define FALCON_DMATRFCMD_IMEM			(1 << 4)
 #define FALCON_DMATRFCMD_SIZE_256B		(6 << 8)
+#define FALCON_DMATRFCMD_DMACTX(v)		(((v) & 0x7) << 12)
 
 #define FALCON_DMATRFFBOFFS			0x0000111c
 
-- 
2.35.0

