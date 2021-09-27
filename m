Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8641919D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 11:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D8E89FE8;
	Mon, 27 Sep 2021 09:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E05F89FE8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 09:37:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01D8460F70;
 Mon, 27 Sep 2021 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632735429;
 bh=Zc+cRcPoCslqC2hryc2DSKxFbJzV6gD9X3WZFDKlLi4=;
 h=From:To:Cc:Subject:Date:From;
 b=SH876qjZtMQ46iEO1vY1tzTwXYROEpuqYTuZ53cWe80jEfWemAPB1uNXJJwF0IS1G
 GQQyAAjlHnJh3pVJ3UOPtJZet3G2Bh2v8LSbJYXS/xEAL+JbNThSzR8nX6iVqX9ZI8
 klsLSUZeK9JA7DBGSu1y4FtuVcIe4xZ4napE/xvBmBKJdcU4GDEszlA1G7UbMNjHCC
 R/Seb8lROXKu7wmSAUW9XfIDCSIa1fkRsEluwHpyqnWHWmW1KnhgF4WRB0zGlzjo0E
 Eg7W4Lu/bdwESjC9aM4g4kIXqLCN/omnofoJD6u5ZrXbgPIO+fpriuh5mxfnbmBo0T
 bkmHXS6szV/+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: host1x: select CONFIG_DMA_SHARED_BUFFER
Date: Mon, 27 Sep 2021 11:36:59 +0200
Message-Id: <20210927093705.458573-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Linking fails when dma-buf is disabled:

ld.lld: error: undefined symbol: dma_fence_release
>>> referenced by fence.c
>>>               gpu/host1x/fence.o:(host1x_syncpt_fence_enable_signaling) in archive drivers/built-in.a
>>> referenced by fence.c
>>>               gpu/host1x/fence.o:(host1x_fence_signal) in archive drivers/built-in.a
>>> referenced by fence.c
>>>               gpu/host1x/fence.o:(do_fence_timeout) in archive drivers/built-in.a

Fixes: 687db2207b1b ("gpu: host1x: Add DMA fence implementation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/host1x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 6dab94adf25e..6815b4db17c1 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -2,6 +2,7 @@
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
 	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	select DMA_SHARED_BUFFER
 	select IOMMU_IOVA
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
-- 
2.29.2

