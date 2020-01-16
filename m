Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D0813E11C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E936EDE7;
	Thu, 16 Jan 2020 16:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972156EDE7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 16:47:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F21D214AF;
 Thu, 16 Jan 2020 16:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193266;
 bh=01ET8Gg7lfZIhp7HRE9ih7YqKpGc66ZmobZq3MFHQ+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jMQRVr3amkEVSQtT6CM7WfuvAuvmZkdhY/2PYTraeu65qPB7Zm5zgAiXZXyv+RVku
 9UNvv4ktMFKmFTMdB+1LAAHqnugBcKEZ2FvviuiVk/MB98cQddj1Gf/ssfX8klVVBv
 eXJSmUV9cIAONI4eDTKhkaLJQYm9My0ote2ejVnw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 060/205] drm/tegra: Fix ordering of cleanup code
Date: Thu, 16 Jan 2020 11:40:35 -0500
Message-Id: <20200116164300.6705-60-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit 051172e8c1ceef8749f19faacc1d3bef65d20d8d ]

Commit Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after
initialization") changed the initialization order of the IOMMU related
bits but didn't update the cleanup path accordingly. This asymmetry can
cause failures during error recovery.

Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after initialization")
Signed-off-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/drm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6fb7d74ff553..bc7cc32140f8 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -201,19 +201,19 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (tegra->hub)
 		tegra_display_hub_cleanup(tegra->hub);
 device:
-	host1x_device_exit(device);
-fbdev:
-	drm_kms_helper_poll_fini(drm);
-	tegra_drm_fb_free(drm);
-config:
-	drm_mode_config_cleanup(drm);
-
 	if (tegra->domain) {
 		mutex_destroy(&tegra->mm_lock);
 		drm_mm_takedown(&tegra->mm);
 		put_iova_domain(&tegra->carveout.domain);
 		iova_cache_put();
 	}
+
+	host1x_device_exit(device);
+fbdev:
+	drm_kms_helper_poll_fini(drm);
+	tegra_drm_fb_free(drm);
+config:
+	drm_mode_config_cleanup(drm);
 domain:
 	if (tegra->domain)
 		iommu_domain_free(tegra->domain);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
