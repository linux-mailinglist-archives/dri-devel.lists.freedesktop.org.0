Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D053D3772
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291FF6ED98;
	Fri, 23 Jul 2021 09:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341866ED98
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:14:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA19C60EBD;
 Fri, 23 Jul 2021 09:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627031668;
 bh=AxCQ8l9x0B9n1yCKMSUvGByV+fN8rjun1sgxHSyPmHQ=;
 h=From:To:Cc:Subject:Date:From;
 b=QFaL4gXRtz+BiDVYCgaJPE9gFpk8Xa0lH3C4YrRju9+YDN4I/7ihiJCpQ5IdA3Pbi
 3E0GQC0Y0nfAHxSoEmR2/FD+Zp1yjMJ9S4ZJCYL5ar9mDCYnSZvExQLWBAkl56aD1w
 NPCpU7+Iv0gAx+jn9BGDhYOEifgK2jHyYVAdQzxdm105GoVk//wAh4ZN0w7ZGiOoUh
 32ECSfda1JD4fFX0/ryTJxZC7NUWLjwJ53VpcrFtnIRA4GnUtr5tMJ5NuglQe197VK
 ofJ2+6LM5h2bbzTFal5f+0EmcCZn2YWPwCKozF6VK8MHwqFcqAwWnWAGZvO+uEns4j
 cM9mWxBh4+n7Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] gpu: host1x: select CONFIG_SYNC_FILE
Date: Fri, 23 Jul 2021 11:14:19 +0200
Message-Id: <20210723091424.1682193-1-arnd@kernel.org>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

With the addition of the DMA fence, the host1x driver now fails to
build without the sync_file helper:

arm-linux-gnueabi-ld: drivers/gpu/host1x/fence.o: in function `host1x_fence_create_fd':
fence.c:(.text+0x624): undefined reference to `sync_file_create'

Fixes: ad0529424def ("gpu: host1x: Add DMA fence implementation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/host1x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 6dab94adf25e..6f7ea1720a39 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -3,6 +3,7 @@ config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
 	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
 	select IOMMU_IOVA
+	select SYNC_FILE
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
 
-- 
2.29.2

