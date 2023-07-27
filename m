Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED329764B10
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7E010E53A;
	Thu, 27 Jul 2023 08:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC63510E53B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:13:57 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so204941b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445637; x=1691050437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wkWZ9/xaCXa97bQ5JXnZc5xW9B3SNGrJMT1hKcCw6ws=;
 b=EDfCdETq+fWum4Z4rVmLJcfO1jsg67VgnqiA/czndVSbNlSpbiLUxCCQQbrycQZD4N
 jQ6ZzEztmrAV1/GQh0DPbs4MerEzMqTN5oUJT+1JgEVVCAFedy/wmgVhs7WN/b/b654/
 J3bWoofyGEQUeJzT2evHimB9xJj54scgZA3ezNM1eyl//hvUHn6qW8m2jc5RxZ9Q53pq
 qjYZmev8IqT72hXdHUOA71yDJ6nyeNuVcIJzjtWGkynPPHPpyqKgHAKZWC3Im8l22hhd
 2mNa6yYVElvUfcaQGhKZMnwewb3KL70R9vxxm9ctoitBRKZ5V08UPUQRdkaKB4nkVDWK
 NCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445637; x=1691050437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wkWZ9/xaCXa97bQ5JXnZc5xW9B3SNGrJMT1hKcCw6ws=;
 b=bHeyZUqsxSso0ilOm7zXyGMrw+IKUggQq3HDFJQ6ifR4HYL6JMvHrhXHYnyrTRrw0I
 E80I5VQChmwMsJv2WQvgpfy/uVTaFFEVuL4t8IHq/te02MJGs3FS64evtsqOBjC3n8XT
 Kbd1jXoFjglcFY/mpHDEfz19mLMEtPV/Xl4xOgZlQFLgvtMc6rfVbAFatk1B2Ux2L1Z9
 V18ipnJZwik8VgzfbbTW78orncb2oW/l0G9OYBgGCED7MaehUdxKw5Nh+fLpN9IXx1tj
 aSenyp5Tx6x3fPW52hoR3VUnbut8pwW//8kKMtTfV36JiYUEiWKsPZ31yYBoaJ+vJ7Hd
 yoVg==
X-Gm-Message-State: ABy/qLZ4gozV5JenhlniOZR8s4+v1kvblZEtzFwsnYXpVCHd6nxb8oEK
 +kSBJTNfTFezPKq/G27aJsTw3w==
X-Google-Smtp-Source: APBJJlHv3kehM44VAWCca2syD2CKM7i434EcumRqZh5gO/U3rxv+9ZnIssQP5Ien17rj+O8gWl3H0Q==
X-Received: by 2002:a05:6a00:1586:b0:67f:8ef5:2643 with SMTP id
 u6-20020a056a00158600b0067f8ef52643mr5213351pfk.2.1690445637383; 
 Thu, 27 Jul 2023 01:13:57 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:13:57 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 40/49] xfs: dynamically allocate the xfs-qm shrinker
Date: Thu, 27 Jul 2023 16:04:53 +0800
Message-Id: <20230727080502.77895-41-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the xfs-qm shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct xfs_quotainfo.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/xfs/xfs_qm.c | 26 +++++++++++++-------------
 fs/xfs/xfs_qm.h |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
index 6abcc34fafd8..032f0a208bd2 100644
--- a/fs/xfs/xfs_qm.c
+++ b/fs/xfs/xfs_qm.c
@@ -504,8 +504,7 @@ xfs_qm_shrink_scan(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_quotainfo	*qi = container_of(shrink,
-					struct xfs_quotainfo, qi_shrinker);
+	struct xfs_quotainfo	*qi = shrink->private_data;
 	struct xfs_qm_isolate	isol;
 	unsigned long		freed;
 	int			error;
@@ -539,8 +538,7 @@ xfs_qm_shrink_count(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_quotainfo	*qi = container_of(shrink,
-					struct xfs_quotainfo, qi_shrinker);
+	struct xfs_quotainfo	*qi = shrink->private_data;
 
 	return list_lru_shrink_count(&qi->qi_lru, sc);
 }
@@ -680,16 +678,18 @@ xfs_qm_init_quotainfo(
 	if (XFS_IS_PQUOTA_ON(mp))
 		xfs_qm_set_defquota(mp, XFS_DQTYPE_PROJ, qinf);
 
-	qinf->qi_shrinker.count_objects = xfs_qm_shrink_count;
-	qinf->qi_shrinker.scan_objects = xfs_qm_shrink_scan;
-	qinf->qi_shrinker.seeks = DEFAULT_SEEKS;
-	qinf->qi_shrinker.flags = SHRINKER_NUMA_AWARE;
-
-	error = register_shrinker(&qinf->qi_shrinker, "xfs-qm:%s",
-				  mp->m_super->s_id);
-	if (error)
+	qinf->qi_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "xfs-qm:%s",
+					   mp->m_super->s_id);
+	if (!qinf->qi_shrinker)
 		goto out_free_inos;
 
+	qinf->qi_shrinker->count_objects = xfs_qm_shrink_count;
+	qinf->qi_shrinker->scan_objects = xfs_qm_shrink_scan;
+	qinf->qi_shrinker->seeks = DEFAULT_SEEKS;
+	qinf->qi_shrinker->private_data = qinf;
+
+	shrinker_register(qinf->qi_shrinker);
+
 	return 0;
 
 out_free_inos:
@@ -718,7 +718,7 @@ xfs_qm_destroy_quotainfo(
 	qi = mp->m_quotainfo;
 	ASSERT(qi != NULL);
 
-	unregister_shrinker(&qi->qi_shrinker);
+	shrinker_free(qi->qi_shrinker);
 	list_lru_destroy(&qi->qi_lru);
 	xfs_qm_destroy_quotainos(qi);
 	mutex_destroy(&qi->qi_tree_lock);
diff --git a/fs/xfs/xfs_qm.h b/fs/xfs/xfs_qm.h
index 9683f0457d19..d5c9fc4ba591 100644
--- a/fs/xfs/xfs_qm.h
+++ b/fs/xfs/xfs_qm.h
@@ -63,7 +63,7 @@ struct xfs_quotainfo {
 	struct xfs_def_quota	qi_usr_default;
 	struct xfs_def_quota	qi_grp_default;
 	struct xfs_def_quota	qi_prj_default;
-	struct shrinker		qi_shrinker;
+	struct shrinker		*qi_shrinker;
 
 	/* Minimum and maximum quota expiration timestamp values. */
 	time64_t		qi_expiry_min;
-- 
2.30.2

