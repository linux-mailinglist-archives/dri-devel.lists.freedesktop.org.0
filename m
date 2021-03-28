Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F5934BFD6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C3A6E05C;
	Sun, 28 Mar 2021 23:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29DD6E05C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:42:23 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id i9so10914268qka.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aTqt/IVdoBlaweXDgOQKvMZ70/sSbJXfKH4bXe6aqUM=;
 b=gFX5ao+Q598pGd/nrbaYkgTyuyk7q5H00T/LXO/arsc0O/9mvCQEFBVYEOZ2TSBLRR
 ma4M6lU8PSt5aU5Mq0Xb0MMgMWUAIQH1fvvCBTxWsNB09yoa6vY50DZthHeFWAFmU5ua
 0inlPz5d3dOsMAC2tO/wgM8eAMU+Br4M7QaiveO0XrEw5Niow6GJehlJx030x3Z988Xw
 w9+5a2G+KVY71BU6rLIoKuaAWskeYr0RBqjYa+mV6R8Q8qtQfOiQZZJR97+mn2OEy6b2
 dufh1Mkch8gON1dnaxfhOWcdo4+/YW7JB1Bw7Vx1qnKcf95FeOTpMjbVf1EAV2ucijkB
 VU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aTqt/IVdoBlaweXDgOQKvMZ70/sSbJXfKH4bXe6aqUM=;
 b=Y4tTjzO/n1TIft9ZkjK2JCdcEf1LdcAceedFYgQ2jmtibdmB134Ag8zLEByrtUgm5P
 YdYT3hd/2Mz6RjxiK2KtzuMkM3rggCKUPLDD1ooZhZ7vPhmAsb5dbiR30aqJsIprpsW+
 5Xl3IKioEm0nY+G6tNh3f+JiE0qXsVGKEhNi3I0exW83OywJZlWICqIqLNJs15lTOVEF
 HVEG1+uekf0FU7HDhZhlOSxYf5kf7U8sXLc5Z+JA5ZSMr0kO6aT7Ruz4k+Kto18gR7Zh
 a9N5DPrXohqVspTIakcMdO5j98ydkYU3FRvPrDSiISdZSOYxDrUG+g4O3cXZCFnsIg0P
 q4Fg==
X-Gm-Message-State: AOAM530KIL0/FuYnSyyJyFdqRQvWbBM8TLNj1AgBBKBtMw3cw2ZNsiDi
 fPWTJ6ctOUsQs66ElJQHwkM=
X-Google-Smtp-Source: ABdhPJz145Az4LUx7LhDMvD7ZV5b6PUHcvEPr/qXE19/8MCJO3m4SnTCjocT6soNLQfHxskoa0mKEw==
X-Received: by 2002:a37:a603:: with SMTP id p3mr22782756qke.362.1616974942840; 
 Sun, 28 Mar 2021 16:42:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
 by smtp.gmail.com with ESMTPSA id o21sm9900848qtp.72.2021.03.28.16.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:42:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1 1/2] gpu: host1x: Add back arm_iommu_detach_device()
Date: Mon, 29 Mar 2021 02:41:41 +0300
Message-Id: <20210328234142.12920-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
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

The case of CONFIG_ARM_DMA_USE_IOMMU=y was found to be broken for
host1x driver. Add back the workaround using arm_iommu_detach_device()
as a temporary solution.

Cc: stable@vger.kernel.org
Fixes: af1cbfb9bf0f ("gpu: host1x: Support DMA mapping of buffers"
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/dev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d0ebb70e2fdd..a2c09dca4eef 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -18,6 +18,10 @@
 #include <trace/events/host1x.h>
 #undef CREATE_TRACE_POINTS
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
 #include "bus.h"
 #include "channel.h"
 #include "debug.h"
@@ -232,6 +236,17 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
