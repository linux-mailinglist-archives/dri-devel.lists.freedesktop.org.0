Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84510905436
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA6C10E127;
	Wed, 12 Jun 2024 13:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C784F10E3B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:53:08 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-421b9068274so30347725e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718200387; x=1718805187;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1sOWf4s16bdbdC+Bd/5xe8ghxhHHN8/mdSsDewIxn9I=;
 b=hpvufbW+5KLzo3qs22KSuSfCdIv+o07dYuYj8os+lWbaY1+uOHlRNmXu2u8R75HoGM
 K5QISnSxxjfNqMSWUECJUZYTuMfRmyd6PPXidvL6FEmsU12l8vu51itcJCLkn2jSpH5S
 8jdDBNI80YxJvxpiOSFIlW5rfYb1eija0egqf7IPHP72royKFUKxU3M6DTTLLfPeEUo6
 KYkbbnLqX3aZXa/IJB8NbIBnuhenQRc4qvyT3Km/Nr8O0OYofwO7CAbCYLR0EPq1Tdn5
 WXHe2jNjVIFWmhU4HMSq/2ysrvLaO0hQJybYnrOAHBfJjsZE2NPcH6VK+saBtiKvhA9e
 +wcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSoeV9gkUAmkgj3zB/DEAv9MDIljwqkSfDT/WMmX28K8+2kdr91qZ5fZvTb/TygEvy+0BX1aWB4ZLqFGDe/+UUhtaOnT4fyFZtDRdSQlYm
X-Gm-Message-State: AOJu0Yy83eiv40yPNOLk8HHMdp16qohpmnAlLVkQIcdOQs6gjhOw/3HG
 4jnthSnD5orrI2WQGBgyjIDT6qfUgOtaV5rJTC1f3Lxo8+gSHnhc
X-Google-Smtp-Source: AGHT+IFWJyf2ltiawIwb7HZCUIMjcxzq4Ddbb+KqUPIZFB1bs1VWyRFUFZqI4ItOvEpiR5FgBSrKxQ==
X-Received: by 2002:a7b:cc84:0:b0:421:80e3:dc8d with SMTP id
 5b1f17b1804b1-422863ae805mr14188595e9.24.1718200387215; 
 Wed, 12 Jun 2024 06:53:07 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:53:06 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:55 +0200
Subject: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IOMMUs with multiple base addresses can also have multiple power
domains.

The base framework only takes care of a single power domain, as some
devices will need for these power domains to be powered on in a specific
order.

Use a helper function to stablish links in the order in which they are
in the DT.

This is needed by the IOMMU used by the NPU in the RK3588.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/iommu/rockchip-iommu.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index f5629515bd78..673b0ebb6262 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -6,6 +6,8 @@
  *			Daniel Kurtz <djkurtz@chromium.org>
  */
 
+#include "linux/err.h"
+#include "linux/pm_domain.h"
 #include <linux/clk.h>
 #include <linux/compiler.h>
 #include <linux/delay.h>
@@ -115,6 +117,7 @@ struct rk_iommu {
 	struct iommu_device iommu;
 	struct list_head node; /* entry in rk_iommu_domain.iommus */
 	struct iommu_domain *domain; /* domain to which iommu is attached */
+	struct dev_pm_domain_list *pmdomains;
 };
 
 struct rk_iommudata {
@@ -1186,6 +1189,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	struct resource *res;
 	const struct rk_iommu_ops *ops;
 	int num_res = pdev->num_resources;
+	int pm_domain_count;
 	int err, i;
 
 	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
@@ -1271,6 +1275,35 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	if (!dma_dev)
 		dma_dev = &pdev->dev;
 
+	pm_domain_count = of_property_count_strings(iommu->dev->of_node, "power-domain-names");
+	if (pm_domain_count > 0) {
+		const char **pm_domains = kvmalloc_array(pm_domain_count, sizeof(*pm_domains), GFP_KERNEL);
+		struct dev_pm_domain_attach_data pm_domain_data = {
+			.pd_names = pm_domains,
+			.num_pd_names = pm_domain_count,
+			.pd_flags = PD_FLAG_DEV_LINK_ON,
+		};
+		int i;
+
+		if (!pm_domain_data.pd_names) {
+			err = -ENOMEM;
+			goto err_remove_sysfs;
+		}
+
+		for (i = 0; i < pm_domain_count; i++) {
+			err = of_property_read_string_index(iommu->dev->of_node, "power-domain-names", i, &pm_domains[i]);
+			if (err) {
+				kfree(pm_domains);
+				goto err_remove_sysfs;
+			}
+		}
+
+		err = dev_pm_domain_attach_list(iommu->dev, &pm_domain_data, &iommu->pmdomains);
+		kfree(pm_domains);
+		if (err < 0)
+			goto err_remove_sysfs;
+	}
+
 	pm_runtime_enable(dev);
 
 	for (i = 0; i < iommu->num_irq; i++) {
@@ -1292,6 +1325,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	return 0;
 err_pm_disable:
 	pm_runtime_disable(dev);
+	dev_pm_domain_detach_list(iommu->pmdomains);
 err_remove_sysfs:
 	iommu_device_sysfs_remove(&iommu->iommu);
 err_unprepare_clocks:
@@ -1310,6 +1344,8 @@ static void rk_iommu_shutdown(struct platform_device *pdev)
 		devm_free_irq(iommu->dev, irq, iommu);
 	}
 
+	dev_pm_domain_detach_list(iommu->pmdomains);
+
 	pm_runtime_force_suspend(&pdev->dev);
 }
 

-- 
2.45.2

