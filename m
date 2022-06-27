Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4F55BA69
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FA810FD87;
	Mon, 27 Jun 2022 14:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CB810E368
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uAYlVlaSKiCol2osSU9jEMs5Zkro7eHEKz4SvQwuMgY=; b=NwS6g3CvNuaXTIXEi6wkgNcV7f
 RXIkSTW3bczIukTSnXcBt9rYhEJXAAs64KLZ6M3uUbpTUgl+iaWGMS7rnGrE+YNaqAMae0BzWKnCb
 d5aoTSayvmqX3IS/xkpFyLdikY2jBxZD9JMAMMCQpLN+z2XwZB9bxL4WE60QMcfHlEQhRRthv2Ks9
 YU+j8u6FweF0H5CS9JAFN1+py+va/zUqrH85bBUieD5C/Dc08KzzVG1yXxHEsziXWebfvXPzhqThT
 lmIrKtaaxkynUru1Awzv1BTS5HqqCyhctdhy0PsPTQ3N2MS9hQadN2vV9bj4fS5iwjdGjuh7F2JHM
 zIB6InzQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o5pbL-003N2J-Lj; Mon, 27 Jun 2022 17:20:30 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7/v3 05/22] drm/tegra: falcon: Set DMACTX field on DMA
 transactions
Date: Mon, 27 Jun 2022 17:19:51 +0300
Message-Id: <20220627142008.2072474-6-cyndis@kapsi.fi>
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
index 3762d87759d9..c0d85463eb1a 100644
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
2.36.1

