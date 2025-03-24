Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A92A6E2F0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 20:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C8F10E4BA;
	Mon, 24 Mar 2025 19:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Ib2LYxom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22A010E4BF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 19:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742842792; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LdQyiG14iMf8tG8E5g0aJ9iPontRoQUdqPjXdQk6PcJImNLImgTREbJN3zr6qPDnIfOOpWetcmJcO0yGFuGsCIQ0Fee7RGBe5XD0wBl4fB0vw0X+Q5aHziGsIyi4wXXyTZoeTiu7VIvhmeVmP+7jqEkh1fWb/hn8nB5r9t/4uCk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742842792;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aO/4xY09PUonufBRaz4QQ1vjq0fnTCmys4qB17KqOG8=; 
 b=HZVgaixhJx7AL8Pi060ZhnQtjtrZfhpjIFb3DC6aMZ/nNmurcX1mloHCH1Ysqpe6D1QepHI5Na54jq0+d71TVpGa85NQ4z5B2Fgc5GLHTwB/W985TtLRMImT2VaqcX3M9AtA5nmx2o3BOhHsQ5bQQANLUHtGp+RC9Him76GvCxQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742842792; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aO/4xY09PUonufBRaz4QQ1vjq0fnTCmys4qB17KqOG8=;
 b=Ib2LYxom7+zda6B2hRmH5vx7t5DUKwAm6e+Bwv/A9C36iqrfK7NGP8/iOUI/AMR8
 fgTYX8Hzo7DbY2rNgKyh74J8yMo9O2PQvjpMJHUG+mQBw0mo3PZ9KxUMLGW8n/K6Qcv
 WyKMltqX/qJSq8gGoDrIm13+1DQq8OEC3e9oiieY=
Received: by mx.zohomail.com with SMTPS id 174284278996750.1260541382444;
 Mon, 24 Mar 2025 11:59:49 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v5 5/6] drm/panfrost: Force AARCH64_4K page table format on
 MediaTek MT8188
Date: Mon, 24 Mar 2025 15:58:00 -0300
Message-ID: <20250324185801.168664-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
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

MediaTek MT8188 SoC has an ARM Mali-G57 MC3 GPU (Valhall-JM), which
constantly faults with the current panfrost support.

For instance, running `glmark2-es2-drm` benchmark test:
```
[   79.617461] panfrost 13000000.gpu: js fault, js=1, status=JOB_BUS_FAULT, head=0xaadc380, tail=0xaadc380
[   80.119811] panfrost 13000000.gpu: gpu sched timeout, js=0, config=0x7300, status=0x58, head=0xaaca180, tail=0xaaca180, sched_job=000000002fd03ccc
[   80.129083] panfrost 13000000.gpu: Unhandled Page fault in AS0 at VA 0x0000000000000000
[   80.129083] Reason: TODO
[   80.129083] raw fault status: 0x1C2
[   80.129083] decoded fault status: SLAVE FAULT
[   80.129083] exception type 0xC2: TRANSLATION_FAULT_2
[   80.129083] access type 0x1: EXECUTE
[   80.129083] source id 0x0
```

Note that current panfrost mode (Mali LPAE - LEGACY) only allows to
specify write-cache or implementation-defined as the caching policy,
probably not matching the right configuration. As depicted in the source
code:

drivers/iommu/io-pgtable-arm.c:
```
* MEMATTR: Mali has no actual notion of a non-cacheable type, so the
* best we can do is mimic the out-of-tree driver and hope that the
* "implementation-defined caching policy" is good enough...
```

Now that Panfrost supports AARCH64_4K page table format, let's enable it
on Mediatek MT8188 and configure the cache/shareability policies
properly.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7b7e9f6f6206..21e2f6c8d6be 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -824,6 +824,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };
 
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
-- 
2.49.0

