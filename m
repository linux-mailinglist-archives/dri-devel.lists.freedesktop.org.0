Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFBA5A442
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538A10E4DA;
	Mon, 10 Mar 2025 20:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="XRFB2hK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571D510E4DA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 20:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741636816; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Qyxr3aJkeBQAq0L6yjvx4RPkXyFEiMxLPcg6PjjDqbYBfC6EIxrM7c3oXROTecwsy0llDeAGgCVobyi1raYrYovEmi9ugwbRdJtnx1DQgh18kYql9G0SiCZn6Mr4xx3/2zlEKFNvTL+krZU1z7eUnAxjdcGrpP0QGnc4qF4LlkQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741636816;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZFdaB7brRwLIqNemNPKTG25GbzNbXSuAOMUD7Q7r3hc=; 
 b=MIqBBl36ZSvjTnWbQfb7iDBMKvhL2sW8Ae+r/YYNiYuyr6bOmjNKp6xFWjWr14/nlsc0o24rA2atfDLi8B4NXNkmbVLGOd2gSOMXT2CXOG22DG42GqDncj9krV0VVhFBAYx2piA5e29c3UDIrzhP9AUGqbb2vOH1+70fKvnFiFk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741636816; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZFdaB7brRwLIqNemNPKTG25GbzNbXSuAOMUD7Q7r3hc=;
 b=XRFB2hK94KDo+X/2ol9lRhnmk62XqlLS4u/WptOz30sIj5qc6tC7UxaCtuf0AkPI
 6miSmXzgg42EZpN5SyzRZZXLBYVaxRVJe0B/RLcJpyO7ar9tfplJ5JZTCmX11DZDwwW
 QEJ7Y1ZPxnc6rsuyL8lPygnXwV3YwKRN169eQELw=
Received: by mx.zohomail.com with SMTPS id 1741636814321993.7241909367491;
 Mon, 10 Mar 2025 13:00:14 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table format on
 mediatek_mt8188
Date: Mon, 10 Mar 2025 16:59:20 -0300
Message-ID: <20250310195921.157511-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Now that Panfrost supports AARCH64_4K page table format, let's enable it
on Mediatek MT8188.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac76..d7b8bded6d784 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -824,6 +824,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+	.gpu_configs = BIT(GPU_CONFIG_AARCH64_4K),
 };
 
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
-- 
2.47.2

