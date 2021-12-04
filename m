Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0591E4693BA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5B17A281;
	Mon,  6 Dec 2021 10:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F966E1FB
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 15:00:54 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id f18so13898587lfv.6
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 07:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j1+HihJ8jD8fjMbY3c8Sx1lu+g+OCnLBmM4aOdDd/yA=;
 b=UORZSXzuqBDNLLFfoBJCa5zBI+/6Bjh6zZSZOf11/pc9QfysS29fhQ6cp+CoFBr/3S
 lf3ddcj5uZsaffI0EvvBnwRDdGOsTYUt0/Rrk6K/cA1KKInyB5EEVmabm21kU1p7Bw13
 5emWyQleFSy6I5/Yd1agTP5LLxTP3Cs+Z+hRLTwhNqYejK+oCHJqSfv5HEiTZU8JGQQB
 7ndicHN/Jqvchs2Eyk99pQPY+RNMF+PIhjItmJw7iT0F6JOvAwqJYg8yKn9MrGxfkUv7
 zE6aZdW+GuwtxAvxfguoM2LPfs0f/LIVz/ZsJmyHxmXZ9dCJFPbeXhbw1ejIGxiv+jgV
 YqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j1+HihJ8jD8fjMbY3c8Sx1lu+g+OCnLBmM4aOdDd/yA=;
 b=ltEPIURiO+mLp9QRZkALUOav7ly3yQ2YQft/cAbXc/+mNJpSsNlhem3HIWatTY6yqA
 yJg4OcUjAftGsUkIGeqX4X/6CzmiItifstEqGRcvwSfC6DyB8oY9Hu14Erod9UAFPIyk
 gVtqgwXmOO64f0tqwyGq2JuMPsVva/9xHAHSZusry4uL4dF7P7+UfrDcJfRBGvSkJH3a
 pmFJQjfCIGjCclS1A274o7+mR31ZPtirm5kMynz8bYhTYGpRttGWXslS2vGgnS9rFPXz
 Eha3s17tEM6jj4qv3ps80tKpEgl9DoBfhge00odTJSpfue85vly2W/9e1znB/9aSE2CX
 qGwQ==
X-Gm-Message-State: AOAM530az6XiXOUuAl/0vcN4MQ9bRn+XTK077vlqVtgFq+cQATO7+Cb3
 PL7sQJGyuiImriVZBysH7TlpehVMOHw=
X-Google-Smtp-Source: ABdhPJzYnCQFzSxAmbyvbrIlbOsB1Owx9n3Q48SUcV8viRlu8FiGUgqba9DpAOhtEKHqDirlPS4yhw==
X-Received: by 2002:a05:6512:12c4:: with SMTP id
 p4mr24097534lfg.307.1638630052646; 
 Sat, 04 Dec 2021 07:00:52 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id t4sm859185lfe.220.2021.12.04.07.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 07:00:52 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1 2/2] drm/tegra: Add back arm_iommu_detach_device()
Date: Sat,  4 Dec 2021 17:58:49 +0300
Message-Id: <20211204145849.4034-3-digetx@gmail.com>
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

DMA buffers of 2D/3D engines aren't mapped properly when
CONFIG_ARM_DMA_USE_IOMMU=y. The memory management code of Tegra DRM driver
has a longstanding overhaul overdue and it's not obvious where the problem
is in this case. Hence let's add back the old workaround which we already
had sometime before. It explicitly detaches DRM devices from the offending
implicit IOMMU domain. This fixes a completely broken 2d/3d drivers in
case of ARM32 multiplatform kernel config.

Cc: stable@vger.kernel.org
Fixes: fa6661b7aa0b ("drm/tegra: Optionally attach clients to the IOMMU")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index dc04ce329be3..e9de91a4e7e8 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -22,6 +22,10 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
 #include "dc.h"
 #include "drm.h"
 #include "gem.h"
@@ -945,6 +949,17 @@ int host1x_client_iommu_attach(struct host1x_client *client)
 	struct iommu_group *group = NULL;
 	int err;
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+	if (client->dev->archdata.mapping) {
+		struct dma_iommu_mapping *mapping =
+				to_dma_iommu_mapping(client->dev);
+		arm_iommu_detach_device(client->dev);
+		arm_iommu_release_mapping(mapping);
+
+		domain = iommu_get_domain_for_dev(client->dev);
+	}
+#endif
+
 	/*
 	 * If the host1x client is already attached to an IOMMU domain that is
 	 * not the shared IOMMU domain, don't try to attach it to a different
-- 
2.33.1

