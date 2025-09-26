Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D6BA33B6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF9A10E36A;
	Fri, 26 Sep 2025 09:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ouf21ACB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071EC10E36A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=o1
 ctLlTcffIW/5PghVStza+SrGegLQjDqtOF1cbRv+8=; b=ouf21ACBACrrYmynBX
 4SBQAGL2HZmh2uSTKeCvp5UwYxPGoEuGUfqTz+5JBMJEDTKhXVnOX3s10Jmy6kCg
 S26w7FUFdgy9KTa/fRLd0KNVvSoTSGXMOjsCMcFZ3iKvows0j8AhH8TT/MH3b1K1
 QtSvEu53ZUAY+dJfIn03wNI58=
Received: from localhost.localdomain (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgCXDBRIWtZon8J4AA--.11019S4;
 Fri, 26 Sep 2025 17:18:02 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, andrzej.hajda@intel.com,
 treding@nvidia.com, kyungmin.park@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: [PATCH] drm: mipi-dsi: Fix an API misuse in
 mipi_dsi_device_register_full()
Date: Fri, 26 Sep 2025 17:17:58 +0800
Message-Id: <20250926091758.10069-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgCXDBRIWtZon8J4AA--.11019S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWDKFyrJrWfJw13GrW3Wrg_yoWfWrg_uF
 10v3s7Xr4kC3srJF13Aa1fZryayFn0vr4rWr1UtF9Yy3yaqrWDX34DuryFqrWUWF43AF98
 Z3WjqF1fAa13KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRApnDUUUUU==
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiMx-UbmjWV-5H7QAAsr
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

mipi_dsi_device_alloc() calls device_initialize() to initialize value
"&dsi->dev". Thus "dsi" should be freed using put_device() in error
handling path.

Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3a9b3278a6e3..21d9aa29ac34 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -233,7 +233,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 	ret = mipi_dsi_device_add(dsi);
 	if (ret) {
 		dev_err(host->dev, "failed to add DSI device %d\n", ret);
-		kfree(dsi);
+		put_device(&dsi->dev);
 		return ERR_PTR(ret);
 	}
 
-- 
2.25.1

