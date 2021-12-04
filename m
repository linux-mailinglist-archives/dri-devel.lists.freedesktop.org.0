Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2A9469380
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DC573D4A;
	Mon,  6 Dec 2021 10:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A6B6E1FB
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 15:00:53 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m27so13787108lfj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 07:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eUZ5ExutM6B5yJccyr9Cu97p+0ks170euyuhrd2NTzw=;
 b=W8svX2uENQDjdTut7hVcpUhIPObjWmnFbmyrx4LzcWTxb25YftZgI7u0jIN2uBPu38
 tosP2XvA+yTyIv2it80vK4RdKOMLr4p+HA6mm9FcWis3pszvVJckC01KMJcgLeKZVURM
 V/7Z0hBVDZXrs3J5hIyqBX5rrjUXU71+/O5dnwIwKNbiLB2goKlU8doTZD1knynDmA5c
 xxfWpwB3qClqldJ0qFbVN1GPTbSznNaN6v2Q9NZaKWb7nY9dr7BHUgm5fRPTe6fQMcGI
 TDqo62I+igWF+lz90xW6fHrUdb6xCmNsspx4j1V3MHaAvekJmN60LWpL23vV7L7+DdaB
 +0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUZ5ExutM6B5yJccyr9Cu97p+0ks170euyuhrd2NTzw=;
 b=fEZRonqKhZqktd6/S1JtDQLv9q4D4/+SFDxq1SppNmdYvGo8rDChcJvXWqj2hpiDGH
 9V5ydTXB6V+UZELci2ZJPkMvsxGM78plwa0FHk/0wx/9L2umNK7X5dUxMgOHlwDn3bIS
 amd4n9jW4xYdEVNNU2dKbmL4TuJOaGBB6Q4Sju4g8HlO9CpUw8VRkdHnLk/dql1dg4Pq
 gMkw66CrvwuKd/zABKXy7qbB/Lm3mH6HA+DL/+Y1u7xkkerpe9DKDtlAqc0Qx+sAPWdH
 2RuawYrtLBnZxw68UWbGtMYhMpotYP1enpeP0LMj6H/lWOm1jVu6mHbRilwpwnp3psGy
 qm/w==
X-Gm-Message-State: AOAM531c38/af7w/MNvv1vuPcXx5l/bjApW1e03a/iFJc+Rsxl1euicK
 u5n5i/KcXBy6gjbhgFWdEKI=
X-Google-Smtp-Source: ABdhPJw+5g+hFIov4C8gRKVImMKTc8boF47mGlpH2lw9c+y6s5HYv4Zqfp71dCqP+PeNzWne8g9EkA==
X-Received: by 2002:a19:6752:: with SMTP id e18mr23775803lfj.195.1638630052027; 
 Sat, 04 Dec 2021 07:00:52 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id t4sm859185lfe.220.2021.12.04.07.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 07:00:51 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1 1/2] gpu: host1x: Add back arm_iommu_detach_device()
Date: Sat,  4 Dec 2021 17:58:48 +0300
Message-Id: <20211204145849.4034-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204145849.4034-1-digetx@gmail.com>
References: <20211204145849.4034-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Host1x DMA buffer isn't mapped properly when CONFIG_ARM_DMA_USE_IOMMU=y.
The memory management code of Host1x driver has a longstanding overhaul
overdue and it's not obvious where the problem is in this case. Hence
let's add back the old workaround which we already had sometime before.
It explicitly detaches Host1x device from the offending implicit IOMMU
domain. This fixes a completely broken Host1x DMA in case of ARM32
multiplatform kernel config.

Cc: stable@vger.kernel.org
Fixes: af1cbfb9bf0f ("gpu: host1x: Support DMA mapping of buffers"
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/dev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index c42ab78327e7..f5b4dcded088 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -22,6 +22,10 @@
 #include <trace/events/host1x.h>
 #undef CREATE_TRACE_POINTS
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
 #include "bus.h"
 #include "channel.h"
 #include "debug.h"
@@ -263,6 +267,17 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
 	int err;
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+	if (host->dev->archdata.mapping) {
+		struct dma_iommu_mapping *mapping =
+				to_dma_iommu_mapping(host->dev);
+		arm_iommu_detach_device(host->dev);
+		arm_iommu_release_mapping(mapping);
+
+		domain = iommu_get_domain_for_dev(host->dev);
+	}
+#endif
+
 	/*
 	 * We may not always want to enable IOMMU support (for example if the
 	 * host1x firewall is already enabled and we don't support addressing
-- 
2.33.1

