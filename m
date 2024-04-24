Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3913F8B0187
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA1610FD82;
	Wed, 24 Apr 2024 06:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="J2jGXbEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3281 seconds by postgrey-1.36 at gabe;
 Wed, 24 Apr 2024 06:08:34 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7239F10FD88
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vf7epXwrRjHiVE5VVJf/A4Pg3tZi+rY+cb7pC4ekWOg=; b=J2jGXbEiTgSFrE+3AEk4mnYzf/
 TRaxTsXa6mgV1kz81iSRK4Y5Kfgx4IWVkoFnmgFrnfwicfPcvfLJcuJ9cZ+zxCNxj2e7Zm6QFuzxQ
 ToFfx5rOU3hXqX3ywInuYgkbJ+ZK0ZIKz1E37ShXVUyYBypY5ychTq+YnKA8+QE0SJcBvnTcVKJSe
 43N7dq09489TRoFozC8dIUO7nO3vQs0b8qzF6t/ytu8HA4ZVqDddTO9yfO6nChNqB8j4ohLL3maqD
 EXxWBwvl5qYiGlHgDMzqo2kICvKEjwtcuLL+YZwTSx2HuEvgj6e9Dt50f4plZfpVa9C/EulaXyhR3
 hCBaSokw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1rzUx3-00BBnQ-2M;
 Wed, 24 Apr 2024 08:13:49 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] drm/tegra: gem: Open code drm_prime_gem_destroy
Date: Wed, 24 Apr 2024 08:13:34 +0300
Message-ID: <20240424051335.2872574-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

From: Mikko Perttunen <mperttunen@nvidia.com>

Since we aren't using drm_gem_prime_import(_dev), for clarity don't
use the corresponding destroy function either.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index b4eb030ea961..189861c6c630 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -520,9 +520,12 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 		tegra_bo_iommu_unmap(tegra, bo);
 
 	if (gem->import_attach) {
+		struct dma_buf *dmabuf = gem->import_attach->dmabuf;
+
 		dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
 						  DMA_TO_DEVICE);
-		drm_prime_gem_destroy(gem, NULL);
+		dma_buf_detach(dmabuf, gem->import_attach);
+		dma_buf_put(dmabuf);
 	} else {
 		tegra_bo_free(gem->dev, bo);
 	}
-- 
2.42.0

