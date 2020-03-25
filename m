Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB91931BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 21:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98299890EF;
	Wed, 25 Mar 2020 20:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463106E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 20:16:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 31so4953563wrs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aW1zxIHiei+l8kDSE2lVXf/aMBDE/GtIkGFrQXvKkrY=;
 b=XXUz449uJivXz+1lH6pKa9IvT3vUx61/skXaEyQxpkslFR268FwckKE0ryQDUx701N
 hFN9ocSGCuE6bKpdgya8YmthXDASOYWZzKV0R5jms1rqgazVMF6jARv+kE4Jaj9Ek4tl
 4eTpmnHinx0xIrgGWCQbfltjb+zAE5XOGX8UCX1526r3yQQpu+OQlKZ70Tvq3pdw0zfT
 URkTU8sfdTa9DCxUSsUukPcK9vKOk6XHkFleL6FisODDvXphdzzLa1TCv9UTGLrUsHSd
 XDrukLto5efrUE03q5jP6ZN4xbnLDbhY6IkB7PAW1qwSPG/Eg0p0ivpJ58+QwwmBH6zF
 ByDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aW1zxIHiei+l8kDSE2lVXf/aMBDE/GtIkGFrQXvKkrY=;
 b=LloBz9J3CBfe7Pvzu8GXqSawEP/k5LjG/hIp0HZ26rnWuMXTibQMDoREUrwwYk/jeJ
 BJ3Atml8VYqRTwaqV8nTh/aQEcqpmW82aByB9zoOnb7CH8Q/diad3O+ZoSUuNM2UcvFU
 4h48YpSdiS2ygSmaQYMQyEJdlXTE64GHZkSIxMxhx0YEjLuU0t6H8a2smTw10Ts5+Pai
 KJoQ5sSO4s7qx7Z0WynDekLjVEjI6UB7xcLoKlZSF5VeF/mwyfR/X2+7+3Ts9V5jBZFN
 xeNoEI/TbtmI8P0RmbHLXXQ6gAR13xff0BfYdTHjESlbwk6PdpGpkZa7hH7z1NUu400u
 BT0w==
X-Gm-Message-State: ANhLgQ0TcF/t5NBPG5bbFvzNYT3dDyYf7Q+TOagJ0YU+bk4/q1c2QseJ
 s0ENAvAQmcCDBzKYKshSGuLz8uYE
X-Google-Smtp-Source: ADFU+vtTfrVHW69I+ZhOz8qw8xUje/j42rKoNxAP2wTt+E5WQ5s6QhBcgeHzC4Bw5Q5NdWxjLUtZ/g==
X-Received: by 2002:adf:800e:: with SMTP id 14mr5104354wrk.369.1585167368929; 
 Wed, 25 Mar 2020 13:16:08 -0700 (PDT)
Received: from localhost
 (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de.
 [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
 by smtp.gmail.com with ESMTPSA id e9sm151985wrw.30.2020.03.25.13.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 13:16:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] gpu: host1x: Use SMMU on Tegra124 and Tegra210
Date: Wed, 25 Mar 2020 21:16:04 +0100
Message-Id: <20200325201604.833898-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200325201604.833898-1-thierry.reding@gmail.com>
References: <20200325201604.833898-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Tegra124 and Tegra210 support addressing more than 32 bits of physical
memory. However, since their host1x does not support the wide GATHER
opcode, they should use the SMMU if at all possible to ensure that all
the system memory can be used for command buffers, irrespective of
whether or not the host1x firewall is enabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 40a4b9f8b861..d24344e91922 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -192,17 +192,55 @@ static void host1x_setup_sid_table(struct host1x *host)
 	}
 }
 
+static bool host1x_wants_iommu(struct host1x *host1x)
+{
+	/*
+	 * If we support addressing a maximum of 32 bits of physical memory
+	 * and if the host1x firewall is enabled, there's no need to enable
+	 * IOMMU support. This can happen for example on Tegra20, Tegra30
+	 * and Tegra114.
+	 *
+	 * Tegra124 and later can address up to 34 bits of physical memory and
+	 * many platforms come equipped with more than 2 GiB of system memory,
+	 * which requires crossing the 4 GiB boundary. But there's a catch: on
+	 * SoCs before Tegra186 (i.e. Tegra124 and Tegra210), the host1x can
+	 * only address up to 32 bits of memory in GATHER opcodes, which means
+	 * that command buffers need to either be in the first 2 GiB of system
+	 * memory (which could quickly lead to memory exhaustion), or command
+	 * buffers need to be treated differently from other buffers (which is
+	 * not possible with the current ABI).
+	 *
+	 * A third option is to use the IOMMU in these cases to make sure all
+	 * buffers will be mapped into a 32-bit IOVA space that host1x can
+	 * address. This allows all of the system memory to be used and works
+	 * within the limitations of the host1x on these SoCs.
+	 *
+	 * In summary, default to enable IOMMU on Tegra124 and later. For any
+	 * of the earlier SoCs, only use the IOMMU for additional safety when
+	 * the host1x firewall is disabled.
+	 */
+	if (host1x->info->dma_mask <= DMA_BIT_MASK(32)) {
+		if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+			return false;
+	}
+
+	return true;
+}
+
 static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
 	int err;
 
 	/*
-	 * If the host1x firewall is enabled, there's no need to enable IOMMU
-	 * support. Similarly, if host1x is already attached to an IOMMU (via
-	 * the DMA API), don't try to attach again.
+	 * We may not always want to enable IOMMU support (for example if the
+	 * host1x firewall is already enabled and we don't support addressing
+	 * more than 32 bits of physical memory), so check for that first.
+	 *
+	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
+	 * API), don't try to attach again.
 	 */
-	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) || domain)
+	if (!host1x_wants_iommu(host) || domain)
 		return domain;
 
 	host->group = iommu_group_get(host->dev);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
