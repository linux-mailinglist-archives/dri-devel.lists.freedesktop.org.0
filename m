Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574DCA600B
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 04:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7397E10E245;
	Fri,  5 Dec 2025 03:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="MHEW5oZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 630 seconds by postgrey-1.36 at gabe;
 Fri, 05 Dec 2025 03:25:11 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A3910E245
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 03:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HJ
 +a7VyQ+SlJV2GrWFWNFWYRILhDpZouGhOhZPumriI=; b=MHEW5oZmhhbGtxHl3p
 3V7A11JTKgB4MVbZmkfHDw5vXcngpGRFpzCDEAxXRKRot3XNllLnqk00TcACvKOI
 W00EfLPHtjYUlmKrHH8vDHEqOQFfPJpIKZjtZ7ufDPeW8rhh+wQju3pQcqEoR4Co
 lMTQfJcs44jXdzRGfYibfSoag=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wCXrRT8TTJp6PtjEw--.54747S4; 
 Fri, 05 Dec 2025 11:14:06 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, andrzej.hajda@intel.com,
 kyungmin.park@samsung.com, treding@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>, stable@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND] drm: mipi-dsi: Fix an API misuse in
 mipi_dsi_device_register_full()
Date: Fri,  5 Dec 2025 11:14:03 +0800
Message-Id: <20251205031403.129227-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXrRT8TTJp6PtjEw--.54747S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWDKFyrJrWfJw13GrW3Wrg_yoWfKFb_CF
 10qwn7Zr4kC3s7tF13Aa1fZrWay3Z0vr4ruF1UtFn5A3yaqrWDX3s8urWFq34UWF47AF98
 Z3Wjqr1fAa13GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRApnDUUUUU==
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxh5552kyTf4yyAAA3U
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a712e177b350..e47950009126 100644
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

