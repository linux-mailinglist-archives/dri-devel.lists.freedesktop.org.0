Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB126135A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 17:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659416E867;
	Tue,  8 Sep 2020 15:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0F86E863
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:19:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m6so19583061wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3z8ewx/ZRDSN9alYRV1GNbpM8nlpU8ozO9MS5G5Yh6E=;
 b=wDOiidQ2OMXWHXErJkSC//k9rNMkPjKCsh0kCoDcDQ7I4wBdVBmw/53WjBfmc0S/zF
 z4+bOBwfdB8CG/d120sIqdXklHCLwSYlSIsddndpa6bQPyUsudOnAWIy7HJ3r5dQJqUr
 sfCrz+fpUMMCk6ymbFmsi65sR17m7gOVYc6J7EIfwrROdKShHKqA7kPwc6qfFCoIKQcm
 zbhPZJjteaQq6e7RKBO1qIBR4l/Ff78YdM9SDoXiRPNCsBwiPgv+2i/YhAq2NBbSoTzy
 b8v3s9TzVTGmhE6Tp1CEtFAu4+Znw3cdD45XPKL/uP80PpXi+CI7AJIL1C4MNSs9Crik
 p2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3z8ewx/ZRDSN9alYRV1GNbpM8nlpU8ozO9MS5G5Yh6E=;
 b=dFbtYSrhyBhTbow2nFgEXRzKPaZw5deZSe2PE7wO1ZzjP7SpcZkEbguqLn/Aqd0ICg
 Yw4pvkpFFsPxw48FyQmpb3KRnXQJ9NFq5vX4ObtRzjEgnh3oW+TPT8OKGSBX9gM90jqX
 9tQ2ZCHuOv65yD9LrH8Egrc15pX1pkFN48ikYpm/1s7sAPN+zMykFB/8wbjVejDhITZr
 ZhWa73DI/EdSnoE8/IJijXZlFOir4qRTZhbeQD8C7gOgdiD/Jh81DscH5GMfVqc6rY7A
 QPGjgzPNC7TT+qEk6y7d6w/QzRInFV3ofDRo0Yf6n2mZb4hEELyz9MeUnAjcGZSTg156
 HMJA==
X-Gm-Message-State: AOAM532vjodb2fXfQKGmfRSlKBaTdKV9VnkSMNUD8QFTSHnYjvgCo0Il
 Sm87efoqJ2KzW0M0emNU7EoPKg==
X-Google-Smtp-Source: ABdhPJw9PhMfql/HCXy219kI4xjVlQ2JDvbSsD9uFg37fWGjczy3ofVC8EMawYpaXn0CvZsQro+EIQ==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr128489wrn.47.1599578339377;
 Tue, 08 Sep 2020 08:18:59 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:18:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 1/5] iommu/io-pgtable-arm: Add BROKEN_NS quirk to disable
 shareability on ARM LPAE
Date: Tue,  8 Sep 2020 17:18:49 +0200
Message-Id: <20200908151853.4837-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908151853.4837-1-narmstrong@baylibre.com>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The coherency integration of the IOMMU in the Mali-G52 found in the Amlogic G12B SoCs
is broken and leads to constant and random faults from the IOMMU.

Disabling shareability completely fixes the issue.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/iommu/io-pgtable-arm.c | 7 ++++---
 include/linux/io-pgtable.h     | 4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index dc7bcf858b6d..d2d48dc86556 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -440,7 +440,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
 	}
 
-	if (prot & IOMMU_CACHE)
+	if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_BROKEN_SH)
+		pte |= ARM_LPAE_PTE_SH_NS;
+	else if (prot & IOMMU_CACHE)
 		pte |= ARM_LPAE_PTE_SH_IS;
 	else
 		pte |= ARM_LPAE_PTE_SH_OS;
@@ -1005,8 +1007,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 {
 	struct arm_lpae_io_pgtable *data;
 
-	/* No quirks for Mali (hopefully) */
-	if (cfg->quirks)
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_BROKEN_SH))
 		return NULL;
 
 	if (cfg->ias > 48 || cfg->oas > 40)
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 23285ba645db..efb9c8f20909 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -86,6 +86,9 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
 	 *	for use in the upper half of a split address space.
+	 *
+	 * IO_PGTABLE_QUIRK_ARM_BROKEN_SH: (ARM LPAE format) Disables shareability
+	 *	when coherency integration is broken.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
@@ -93,6 +96,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
 	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
 	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
+	#define IO_PGTABLE_QUIRK_ARM_BROKEN_SH	BIT(6)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
