Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8059F4F7260
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 04:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A810E6BF;
	Thu,  7 Apr 2022 02:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39710E6B5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 02:57:03 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 4964E28A5AB;
 Thu,  7 Apr 2022 03:57:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649300222; bh=ab3eTJUaYGfc8Eoce+oTc8nInro20BzElLFNR62PoXw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SCcskNOQnHxUFbQYVBkcM1+S/RmyT73YXWmG5qU9j4j6h9lPIiKmtNqtz9Bo3f2WA
 ot+6+8rkF/izq1YVGdN87rpbchHkpOmqqttWz0zejPiqVQjDkn8xoOHTniuJacQiat
 9xTHFS7I8a+jZuFm1/EvviqCrpm8gTUttj7XfPhz7nI+gL0A8pApw2hDyDjgw4VMux
 +HDB3D5IjIgzh46J975LNn92KSy0GOICdH9H3KK4uuKMj1CaWEdhnQxO3AKBxB2HCe
 AZQeRtZ1OO9FcUFQxcmZlvscwVWnqACaWhXStPu44A+TXVHiO8zZNPKRs4xVscKa5s
 45sphnoYIv39g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/vmwgfx: Add debugfs entries for various ttm resource
 managers
Date: Wed,  6 Apr 2022 22:56:48 -0400
Message-Id: <20220407025652.146426-3-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407025652.146426-1-zack@kde.org>
References: <20220407025652.146426-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Use the newly added TTM's ability to automatically create debugfs entries
for specified placements. This creates entries in /sys/kernel/debug/ttm/
that can be read to get information about various TTM resource
managers which are used by vmwgfx.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index decd54b8333d..59d0d1cd564b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1630,6 +1630,13 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct vmw_private *vmw;
 	int ret;
+	const char * const ttm_placement_names[] = {
+		[TTM_PL_SYSTEM] = "system_ttm",
+		[TTM_PL_VRAM] = "vram_ttm",
+		[VMW_PL_GMR] = "gmr_ttm",
+		[VMW_PL_MOB] = "mob_ttm",
+		[VMW_PL_SYSTEM] = "system_mob_ttm"
+	};
 
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (ret)
@@ -1657,6 +1664,9 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto out_unload;
 
 	vmw_debugfs_gem_init(vmw);
+	ttm_resource_manager_debugfs_init(&vmw->bdev,
+					  ttm_placement_names,
+					  ARRAY_SIZE(ttm_placement_names));
 
 	return 0;
 out_unload:
-- 
2.32.0

