Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898FB28B91
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 09:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E799E10E2E8;
	Sat, 16 Aug 2025 07:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="MLtMwvYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7D010E2E8;
 Sat, 16 Aug 2025 07:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755330562; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YF099E5zO967bfyuMBSXww0TlAsPeeVUp0FDTkm7ijV2KgWJqGA+Ey/9EoYHL7HPPUasiP517CDtSRy1AZfS453P8bRCkWVd7BHExUEjjTOCYqLhDPHLipHnBM79DwHs2wnoCIxiQjRvkyOltQkat0SrSkgduRrfCpnWpobgyuM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755330562;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AKJEL0/mUZ/C7FGFS07m14Rz7LamiiUDHM253Sk2BSE=; 
 b=UMMTl3bQajSs/p1bd/6QET/MeUaKE32TkIUzGhXw9EdKv5eIhQQ4LoVRfBxxDGAX6I5RAP9iWJVcBNeoLk0tnLX2Csnm1ZutuKKnJ7mCkz82Tca3KHWjUZwhGTDNG74sMi18pa9sUjCwAzvwaQkb24H8ku2KgcwJ7+HgRjwK9Ww=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330561; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=AKJEL0/mUZ/C7FGFS07m14Rz7LamiiUDHM253Sk2BSE=;
 b=MLtMwvYkp435pUtnIwCuxI96Wy0IhxZWcrBhkN/6+YY9rYhTYBYyB//fjetjD1G1
 HRAq3MzYR+1CLiT/1CQMP/HPCSi/FDk7ICszj+qMy96dntc+zfr68OAwiBEsTXnAdca
 InjK15saqPyBKk26BawfUumJZVh3nUXLB4snCv11u4Y+xj6xp1H3zJ8I98AMKGeXr7s
 zMZWhPKKX9Dl7upFbBTMYwF4N47z4T6KJTVLb2xtnseSW26/trxHFcc9dTeBKyIbbS7
 8SHj+L4LMaz6JAMVI8xps8zaHmCz1P02Yipxd0HevQYk5mMUBVI5nzFB6hp24Lfv18m
 VwqSVH7yYw==
Received: by mx.zohomail.com with SMTPS id 1755330559475160.36739447746152;
 Sat, 16 Aug 2025 00:49:19 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 4/7] drm/etnaviv: protect whole iommuv2 ctx alloc func under
 global mutex
Date: Sat, 16 Aug 2025 15:47:54 +0800
Message-ID: <20250816074757.2559055-5-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
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

As we are forced to use a global shared context on some
PTA-equipped-but-broken GPUs, the fine-grained mutex locking in the
current implemtnation of etnaviv_iommuv2_context_alloc() won't be
meaningful any more.

Make the whole function to be protected by the global lock, in order to
prevent reentrance when allocating global shared context.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
index d664ae29ae209..5654a604c70cf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
@@ -272,20 +272,18 @@ etnaviv_iommuv2_context_alloc(struct etnaviv_iommu_global *global)
 	struct etnaviv_iommuv2_context *v2_context;
 	struct etnaviv_iommu_context *context;
 
+	mutex_lock(&global->lock);
+
 	v2_context = vzalloc(sizeof(*v2_context));
 	if (!v2_context)
-		return NULL;
+		goto out_mutex_unlock;
 
-	mutex_lock(&global->lock);
 	v2_context->id = find_first_zero_bit(global->v2.pta_alloc,
 					     ETNAVIV_PTA_ENTRIES);
-	if (v2_context->id < ETNAVIV_PTA_ENTRIES) {
+	if (v2_context->id < ETNAVIV_PTA_ENTRIES)
 		set_bit(v2_context->id, global->v2.pta_alloc);
-	} else {
-		mutex_unlock(&global->lock);
+	else
 		goto out_free;
-	}
-	mutex_unlock(&global->lock);
 
 	v2_context->mtlb_cpu = dma_alloc_wc(global->dev, SZ_4K,
 					    &v2_context->mtlb_dma, GFP_KERNEL);
@@ -304,11 +302,14 @@ etnaviv_iommuv2_context_alloc(struct etnaviv_iommu_global *global)
 	INIT_LIST_HEAD(&context->mappings);
 	drm_mm_init(&context->mm, SZ_4K, (u64)SZ_1G * 4 - SZ_4K);
 
+	mutex_unlock(&global->lock);
 	return context;
 
 out_free_id:
 	clear_bit(v2_context->id, global->v2.pta_alloc);
 out_free:
 	vfree(v2_context);
+out_mutex_unlock:
+	mutex_unlock(&global->lock);
 	return NULL;
 }
-- 
2.50.1

