Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4B3E8F36
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 13:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3896E12B;
	Wed, 11 Aug 2021 11:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078536E12B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/iSSop4GWowGNsB9IrG4EdmqJF+wZV8rC2gmBJlZQTM=; b=wCe2tmsN0HZMl2FTgBq/C91F9j
 IkvDQDJziVxF3uZuJy4IFYLyuwy9Gj2zl4JgUi41KXlRZdXMPqtk4hf8GRzJMtbseUY2/qIC1UKL7
 DGL+Z7q6mm0Z8vrxBCVMtpirX/+FhKvM6It0lWRWUOPgcnASKC074KLEcMHf3Y4QA71OH8ug+4B4a
 oI2Vx/NKpJxdwsaVrJsaka+kkyDutqZDzh+/cjaNOTYD0FrMxuMXbiE9mx77mbjHeG/7ELFGxibPK
 i/zyI5J9zSK1qHeX//dd74ST+6l8PhVqlO/ktCdAJV79DsW85l7DT+HdtmoDLlPXGeYS4XO06NgNx
 7wRT78gA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mDlxt-0001Er-T2; Wed, 11 Aug 2021 14:00:05 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] drm/tegra: vic: Use autosuspend
Date: Wed, 11 Aug 2021 13:59:54 +0300
Message-Id: <20210811105954.3537773-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
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

When going idle, it's not unlikely that more work will follow.
As such, use autosuspend with a 500ms suspend delay.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c02010ff2b7f..0204cfbe6694 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -482,6 +482,8 @@ static int vic_probe(struct platform_device *pdev)
 		if (err < 0)
 			goto unregister_client;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+	pm_runtime_use_autosuspend(&pdev->dev);
 
 	return 0;
 
-- 
2.32.0

