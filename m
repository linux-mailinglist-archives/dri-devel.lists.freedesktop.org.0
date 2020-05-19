Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A929D1D9CC5
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 18:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD9F89FD3;
	Tue, 19 May 2020 16:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E316E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 16:33:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90E2820884;
 Tue, 19 May 2020 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589905993;
 bh=KqBKhr6to6bxExK2bg4wDA0x7D/o81eMVQb7vBHPcOE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MLwx4XLbCMMeNgYFg4LZMUs5N+usEH/X5Qa4Zk8BnvMKDRFfHDVBfZYva3KPQfDKf
 FY6B9ylSZcXEiPLjvYxUvlHwF0OOEMpO9CUJHOWlWBfze0aPtZ9sNcq49fgY8g2dX4
 XEO/DAXqGVEXQTGY+jSpNnrmuxQ9lQypen2aTuVM=
From: Sasha Levin <sashal@kernel.org>
To: alexander.deucher@amd.com, chris@chris-wilson.co.uk,
 ville.syrjala@linux.intel.com, Hawking.Zhang@amd.com,
 tvrtko.ursulin@intel.com
Subject: [RFC PATCH 2/4] gpu: dxgkrnl: hook up dxgkrnl
Date: Tue, 19 May 2020 12:32:32 -0400
Message-Id: <20200519163234.226513-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519163234.226513-1-sashal@kernel.org>
References: <20200519163234.226513-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 sthemmin@microsoft.com, gregkh@linuxfoundation.org, haiyangz@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 spronovo@microsoft.com, wei.liu@kernel.org, linux-fbdev@vger.kernel.org,
 iourit@microsoft.com, kys@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Connect the dxgkrnl module to the drivers/gpu/ makefile and Kconfig.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/Makefile  | 2 +-
 drivers/video/Kconfig | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 835c88318cec..28c22c814494 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -3,6 +3,6 @@
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
 obj-$(CONFIG_TEGRA_HOST1X)	+= host1x/
-obj-y			+= drm/ vga/
+obj-y			+= drm/ vga/ dxgkrnl/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 427a993c7f57..362c08778a54 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -19,6 +19,8 @@ source "drivers/gpu/ipu-v3/Kconfig"
 
 source "drivers/gpu/drm/Kconfig"
 
+source "drivers/gpu/dxgkrnl/Kconfig"
+
 menu "Frame buffer Devices"
 source "drivers/video/fbdev/Kconfig"
 endmenu
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
