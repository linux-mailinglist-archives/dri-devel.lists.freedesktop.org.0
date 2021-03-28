Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2408C34BFD7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C0F6E0A2;
	Sun, 28 Mar 2021 23:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429D56E10A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:42:25 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id x14so10884309qki.10
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itHFjcc0HHEjD8/QZKzRDfHBiqClATPJH3jmZ+mXHJM=;
 b=ac9dj5yz+kBU4bumk7JSHyDbyFWc1Xio4+cyGoxIJbl1s0LSPZKH0VCu4P+5eNuDQO
 J74cEydJQ25uusun2CVrtYdFoFevNHv9zQLBFJevcAJCFf3Eicw+ZiSi+p4yBuKnwZTB
 ubG14+fdD9TJxkqOUdRpY16/aWEJ2x9PJidqK5LaU+cZPZyMk0wlBKNTDx2t/KrN52am
 qz41pfF9WwJnYO9BJ7ft37ANQWEV/B/dgO05bIKkKmzcv9xhFZBEOXHZGtpdkmMa1V5L
 YYsiK3i2ujk9QkCsJ8Ggf1mhRmB0O2Vj1Lo0X8ZIcqybIKaPxSBQ88AjM18tAAcih3i3
 Et2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itHFjcc0HHEjD8/QZKzRDfHBiqClATPJH3jmZ+mXHJM=;
 b=QAiAtyHhpFy7tvO6l+4/UCzVTwDhmNW8yeeW7R0Ki71Ql2BwZVh+YRfKahDRCZMkgX
 IQ/b2ed5qyzw7VFKDdW8cQhJFNqFjncOP2g7HwXlSX3Ym0dX7uc6BIMEtnLszimLZ8pK
 JLUuayey321ccfdtst9/ukTTuKivrMJrQ5iJ77NswUOig0haANx39eHgQGCUfVMD1m65
 vb8rQh1Ibz/9GexM5X1NhUD+e8iDv2DB9L47oZeL40TUzgWEeiEtCeq+i/9FONVl7Lgh
 i7/J5FU8B3CKciuuGkmNtqxXLxtNvJZOGPtzGz7VfGTQx7h/2uIWAVab9rFlZGBEFZ+q
 DfGw==
X-Gm-Message-State: AOAM531O7muziJvqIa6+KrmoPHyyE2V69f2bX/CBydPTClcx5vhhJYw6
 WEKTCfj/m9cdIscBf6pqPg4=
X-Google-Smtp-Source: ABdhPJwLsk109xh3k2+bEHIFVVVmGTt8cVxrc1Ya6c7QuIjX0xtLX/fraJUxT4QTcUiJ7QZBMRK6Ng==
X-Received: by 2002:a05:620a:14ac:: with SMTP id
 x12mr22843641qkj.409.1616974944529; 
 Sun, 28 Mar 2021 16:42:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
 by smtp.gmail.com with ESMTPSA id o21sm9900848qtp.72.2021.03.28.16.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:42:24 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1 2/2] drm/tegra: Add back arm_iommu_detach_device()
Date: Mon, 29 Mar 2021 02:41:42 +0300
Message-Id: <20210328234142.12920-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210328234142.12920-1-digetx@gmail.com>
References: <20210328234142.12920-1-digetx@gmail.com>
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
DRM driver. Add back the workaround using arm_iommu_detach_device()
as a temporary solution.

Cc: stable@vger.kernel.org
Fixes: fa6661b7aa0b ("drm/tegra: Optionally attach clients to the IOMMU")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 90709c38c993..a949cb678e08 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -20,6 +20,10 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
 #include "drm.h"
 #include "gem.h"
 
@@ -909,6 +913,17 @@ int host1x_client_iommu_attach(struct host1x_client *client)
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
