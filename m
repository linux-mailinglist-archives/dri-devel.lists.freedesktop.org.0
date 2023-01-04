Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D12965D3AD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 14:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB7210E1C8;
	Wed,  4 Jan 2023 13:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FBE10E0B0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 13:03:18 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 83E066602D16;
 Wed,  4 Jan 2023 13:03:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672837396;
 bh=MGr/mbTNOLcl4k7CBV/EBBBzXhRL6qEn06K9l1US9YM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HAqJYeg3v8fMq5xBHAhRSIK5d/+TJIlBSiSk90XriZO3emQSRs8EwTNo2tk0EMGFk
 MnHZk3OAkUXTdyUhSmuskoNwv4iXCnbzxWp6G4nP+0N5dg2jj1H+aYSgxXm5Tv2h61
 9wvn61gbXTdhPMVugDg2H1RXCK/kgPqywptlcLQVakirx3SFM6nyZbSz9SE3ff72kq
 k7yFsiH01CeCxDzGXY3M0C/qsfb/kZLNurbS/KtJgiCt0STR+V7RnbmVVf5oVc9D67
 v7lxAG9I2DCU0/TEQz2Z5eTOR6cfrghCBDdOUldqQlnyv+2214BLjrZhgMjEH1jO/0
 kHKOWpub/XPCA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH RFC 4/4] drm/panfrost: Expose some memory related stats
 through fdinfo
Date: Wed,  4 Jan 2023 14:03:08 +0100
Message-Id: <20230104130308.3467806-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104130308.3467806-1-boris.brezillon@collabora.com>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-memory-all: memory hold by this context. Not that all the memory is
not necessarily resident: heap BO size is counted even though only part
of the memory reserved for those BOs might be allocated.

drm-memory-resident: resident memory size. For normal BOs it's the same
as drm-memory-all, but for heap BOs, only the memory actually allocated
is counted.

drm-memory-purgeable: amount of memory that can be reclaimed by the
system (madvise(DONT_NEED)).

drm-memory-shared: amount of memory shared through dma-buf.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 6ee43559fc14..05d5d480df2a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -519,9 +519,16 @@ static void panfrost_show_fdinfo(struct seq_file *m, struct file *f)
 {
 	struct drm_file *file = f->private_data;
 	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
+	struct panfrost_mmu_stats mmu_stats;
+
+	panfrost_mmu_get_stats(panfrost_priv->mmu, &mmu_stats);
 
 	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
 	seq_printf(m, "drm-client-id:\t%llu\n", panfrost_priv->sched_entity[0].fence_context);
+	seq_printf(m, "drm-memory-all:\t%llu KiB\n", mmu_stats.all >> 10);
+	seq_printf(m, "drm-memory-resident:\t%llu KiB\n", mmu_stats.resident >> 10);
+	seq_printf(m, "drm-memory-purgeable:\t%llu KiB\n", mmu_stats.purgeable >> 10);
+	seq_printf(m, "drm-memory-shared:\t%llu KiB\n", mmu_stats.shared >> 10);
 }
 
 static const struct file_operations panfrost_drm_driver_fops = {
-- 
2.38.1

