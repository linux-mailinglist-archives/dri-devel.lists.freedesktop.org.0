Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C48C3E46F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 03:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E471010E17B;
	Fri,  7 Nov 2025 02:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE3E10E17B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 02:46:33 +0000 (UTC)
X-UUID: f376a834bb8311f0a38c85956e01ac42-20251107
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:59d87bc8-a230-4055-88ca-d90d54663399, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:25
X-CID-META: VersionHash:a9d874c, CLOUDID:2418c3808d3b5942ec5250576dd24885,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|15|50,EDM:5,IP:
 nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
 ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f376a834bb8311f0a38c85956e01ac42-20251107
X-User: liqiang01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <liqiang01@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 1342834673; Fri, 07 Nov 2025 10:46:24 +0800
From: Li Qiang <liqiang01@kylinos.cn>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Li Qiang <liqiang01@kylinos.cn>
Subject: [PATCH] drm/rocket: Add scheds pointer to file_priv and fix memory
 leaks
Date: Fri,  7 Nov 2025 10:46:20 +0800
Message-Id: <20251107024620.912403-1-liqiang01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rocket driver allocates an array of struct drm_gpu_scheduler pointers
for each file via kmalloc_array() in rocket_job_open(). However, the
allocated memory was not stored in rocket_file_priv and therefore never
freed on file close, leading to a memory leak.

This patch introduces a new `scheds` field in struct rocket_file_priv to
store the allocated pointer array, and frees it properly in
rocket_job_close() after the scheduler entity is destroyed.

This ensures correct lifetime tracking of scheduler arrays and resolves
the leak detected by code review and potential KASAN reports.

Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
---
 drivers/accel/rocket/rocket_drv.h |  1 +
 drivers/accel/rocket/rocket_job.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index 2c673bb99ccc..759a08596dad 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -24,6 +24,7 @@ struct rocket_file_priv {
 	struct mutex mm_lock;
 
 	struct drm_sched_entity sched_entity;
+	struct drm_gpu_scheduler **scheds;
 };
 
 struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv);
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index acd606160dc9..820d96f010f2 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -502,6 +502,9 @@ int rocket_job_open(struct rocket_file_priv *rocket_priv)
 	unsigned int core;
 	int ret;
 
+	if (unlikely(!scheds))
+		return -ENOMEM;
+
 	for (core = 0; core < rdev->num_cores; core++)
 		scheds[core] = &rdev->cores[core].sched;
 
@@ -509,8 +512,12 @@ int rocket_job_open(struct rocket_file_priv *rocket_priv)
 				    DRM_SCHED_PRIORITY_NORMAL,
 				    scheds,
 				    rdev->num_cores, NULL);
-	if (WARN_ON(ret))
+	if (WARN_ON(ret)) {
+		kfree(scheds);
 		return ret;
+	}
+
+	rocket_priv->scheds = scheds;
 
 	return 0;
 }
@@ -520,6 +527,7 @@ void rocket_job_close(struct rocket_file_priv *rocket_priv)
 	struct drm_sched_entity *entity = &rocket_priv->sched_entity;
 
 	kfree(entity->sched_list);
+	kfree(rocket_priv->scheds);
 	drm_sched_entity_destroy(entity);
 }
 
-- 
2.25.1

