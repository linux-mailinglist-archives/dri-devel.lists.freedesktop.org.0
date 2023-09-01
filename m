Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8778FCC9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 13:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01DD10E7AA;
	Fri,  1 Sep 2023 11:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14CC10E7B0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wkAQCeB8ivWJVGIWqgukmSlEUJIdHHVhiV1w4Hs/i3s=; b=lUWjhbzxex5UKwd4UDmSOaYSDW
 +cvdNBav2pHwqTIlKdYXJ7XCTznd59kpyXCvGjXJj6TAtcXkqcTsSbP1HF28NuEJCuSrO2YQ9d+RB
 lZvGAmy/VGgVrrtVBAH2FAriuh1dY8Jgx37FTfkdsYomX+SXfd19GFsSDVMGmruYoIGGvovObqjKc
 +nGIY/d1U/6rWSTa/3kFAVEpR6QxR6LYcnHdmeVCR/xYNIAn2s30Od/rlnMckbeECWPum+oAyVUr2
 wR7O7QC2OmGl1m3hBEHmOoWKgN7p1yRdtZnTdlGutRluiM2EloEfs7fhAo6Gw6qeRsuaWq0owaca2
 Z4nsAGCA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1qc2oG-008yBF-0n;
 Fri, 01 Sep 2023 14:59:32 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] drm/tegra: Zero-initialize iosys_map
Date: Fri,  1 Sep 2023 14:59:10 +0300
Message-ID: <20230901115910.701518-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901115910.701518-1-cyndis@kapsi.fi>
References: <20230901115910.701518-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, Ashish Mhetre <amhetre@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

UBSAN reports an invalid load for bool, as the iosys_map is read
later without being initialized. Zero-initialize it to avoid this.

Reported-by: Ashish Mhetre <amhetre@nvidia.com>
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index a4023163493d..346f70edfb15 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -177,7 +177,7 @@ static void tegra_bo_unpin(struct host1x_bo_mapping *map)
 static void *tegra_bo_mmap(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
-	struct iosys_map map;
+	struct iosys_map map = {0};
 	int ret;
 
 	if (obj->vaddr) {
-- 
2.41.0

