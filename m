Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A284C9012
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA11810E6D9;
	Tue,  1 Mar 2022 16:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5E710E677
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 16:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5Mix95hZnPw7DLW+zsx/wARTOVHfJ0lbWWEi2ceaxVE=; b=XguYhe2T6oPS1+3HvX2t1KOvtX
 SH368tVJZutQsy1JmZ4FYNPEqUd+yXavrMPpVRVqbywj0Vnjq5ITdpZicyYcSNCcsVP+Ev1nfP7Nu
 dbmKwNyzSEldiI7Gv2uHv/UwXHVVMGpELJDR03DOjLTqL44cQnkZvrccB//G6/sEIDKfBUfI0W4W1
 fWxnTy6/kIsqOSjdRJRSh1LrJMnTGm8ZHVqUASNhczmY9uSkVzVxDmX+qKnf6FwIGzwfNCe8WIiY1
 M8bSrntAKqoaG03FE2S7CGHJN3o5S2ERDtUwH2eam07KgQm9k7dRYxNZU46WqJSqam+ispmdzXb3b
 Mnwtj+Vw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nP59r-0003Z8-6M; Tue, 01 Mar 2022 18:15:27 +0200
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH v4 7/9] drm/tegra: falcon: Set DMACTX field on DMA transactions
Date: Tue,  1 Mar 2022 18:14:53 +0200
Message-Id: <20220301161455.4037062-8-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220301161455.4037062-1-cyndis@kapsi.fi>
References: <20220301161455.4037062-1-cyndis@kapsi.fi>
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

