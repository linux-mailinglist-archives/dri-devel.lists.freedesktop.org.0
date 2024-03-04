Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BECB86FCBD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DC710F854;
	Mon,  4 Mar 2024 09:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gkuDDwLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046CC10F81D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709543296;
 bh=mdkjyKSCATVVY9J+XIO2JOeVw2i5dFVKvoUzHKs3xHc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gkuDDwLWlOaxLlrFN6sAGpFaLFhs4jew/dLXR2SsV0AP0RMTSINz/JOBqvE8GZiXb
 A1oJgBd7MtVH0BnAtl8mTC2M9HUqNBXPEqTg6xLj98zv4m9XIszuwvb0kd1gyqTo49
 D8o/ORLVtuKbCLvLsmQ/1E8S4spyW21uOB3RIKM4NaFYsSu1hYcPx/kZ0Z5dBxCJkT
 5OWil9Z5zitJqv7eo0M8cjhBa94vX2wOYizUxDa9H3mPNm+pCpQROSTZ99LF+AHQrt
 dCxgyowaYvWa7UXxDa+IP1PVovXr6N5xlCBkarS3eVOsKEpZkgn7uSWlUW5KymHNZJ
 YxX9a1Z7TuGhQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5D61E3782091;
 Mon,  4 Mar 2024 09:08:16 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 2/3] drm/panthor: Explicitly include page.h for the {virt,
 __phys)_to_pfn() defs
Date: Mon,  4 Mar 2024 10:08:11 +0100
Message-ID: <20240304090812.3941084-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304090812.3941084-1-boris.brezillon@collabora.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
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

Something on arm[64] must be including <asm/page.h>, but things fail
to compile on sparc64. Make sure this header is included explicitly
so this driver can be compile-tested on all supported architectures.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403031142.Vl4pW7X6-lkp@intel.com/
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index bfe8da4a6e4c..68e467ee458a 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -3,6 +3,8 @@
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 /* Copyright 2023 Collabora ltd. */
 
+#include <asm/page.h>
+
 #include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
-- 
2.43.0

