Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27273B151
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965B410E5EE;
	Fri, 23 Jun 2023 07:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F64C10E501
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:56:28 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b5079b8cb3so12591015ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424188; x=1690016188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTZEGaIAEFBjvotA1NXyBA/23sGgDmW1pgUANJLmL6g=;
 b=RR2ZBd6H05awxDqDqVthUnK8c2aiJ3/40MwwmbAPlBGQiSswQkBwcxNT/M8cNWLnOA
 82Up+za+KnH3T12j6kLa8MWMs1OLNz27XFTdAlPbZ38sAlCSEZeBeei4jIEF3DOGcfFf
 sqLx7qpbJbMhGZOLWmDQDC3qBDYjKQCUQ+pHZmp4+zwVYsBG9SEPO8LfQRHMRrJmIPZH
 mEo73QmcjA4JR+vhCDbl2LS55wzlx82Sg5Hmni0lGgyYmJGvSzc9k9c1k7gD3cDGUkxo
 aNJG0MDIsuR+BfQGSCBSsk1/g4GTm7BXhgoQS8izvkkK6lhK2DzzoNDI+34/82OB/BW3
 znuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424188; x=1690016188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTZEGaIAEFBjvotA1NXyBA/23sGgDmW1pgUANJLmL6g=;
 b=hRgDncN6MgvZdBpx0dni9DX9XIJNRDtYhItG5f+3wsopJLZAMzFFI9BmpVP0U66X8p
 VLWDWn64WnKCb0IflzWf5/M85v20qUrfSDK8FlMtmyK+dPflmZXnXVhQZNJvd0DDbDip
 nlmLVDDin5n3VHDDGCoeJL7p6xryqjpmWWnldELDUPIZZA9pqPck7+xF5JJiueY8F2nt
 CGeFhQ5+DLz1WkBBF7v8UY2yvmzTI0dxNgPDd7R6Z5zsf2un94p/4w+t89r6H0QnQjIG
 sJJLE7NC7IyK4qUFkbFnzKYUZTt5zsyiNxZMzVIX+MP0QkGLeVRhSll/Qhk3PwI7cEMy
 eruw==
X-Gm-Message-State: AC+VfDzIL3LI7DIMO51LnzxzYenzegL5NMCoLfe3OXXLNJvrBoCyJTdk
 YgR6phByDwvmlQpDf0nddZMAXw==
X-Google-Smtp-Source: ACHHUZ6OWalxJOPaEyVlek6DUPm2brDmU3Y4XuKo9voozhXt0KV98CJSzaGxqKjpiLWREy1Rn2GjcA==
X-Received: by 2002:a17:902:dac6:b0:1ac:656f:a68d with SMTP id
 q6-20020a170902dac600b001ac656fa68dmr21469547plx.4.1687424187780; 
 Thu, 22 Jun 2023 01:56:27 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:56:27 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 18/29] xfs: dynamically allocate the xfs-inodegc shrinker
Date: Thu, 22 Jun 2023 16:53:24 +0800
Message-Id: <20230622085335.77010-19-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Jun 2023 07:26:31 +0000
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink,
we need to dynamically allocate the xfs-inodegc shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct xfs_mount.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/xfs/xfs_icache.c | 27 ++++++++++++++++-----------
 fs/xfs/xfs_mount.c  |  4 ++--
 fs/xfs/xfs_mount.h  |  2 +-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/xfs_icache.c b/fs/xfs/xfs_icache.c
index 453890942d9f..1ef0c9fa57de 100644
--- a/fs/xfs/xfs_icache.c
+++ b/fs/xfs/xfs_icache.c
@@ -2225,8 +2225,7 @@ xfs_inodegc_shrinker_count(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_mount	*mp = container_of(shrink, struct xfs_mount,
-						   m_inodegc_shrinker);
+	struct xfs_mount	*mp = shrink->private_data;
 	struct xfs_inodegc	*gc;
 	int			cpu;
 
@@ -2247,8 +2246,7 @@ xfs_inodegc_shrinker_scan(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_mount	*mp = container_of(shrink, struct xfs_mount,
-						   m_inodegc_shrinker);
+	struct xfs_mount	*mp = shrink->private_data;
 	struct xfs_inodegc	*gc;
 	int			cpu;
 	bool			no_items = true;
@@ -2284,13 +2282,20 @@ int
 xfs_inodegc_register_shrinker(
 	struct xfs_mount	*mp)
 {
-	struct shrinker		*shrink = &mp->m_inodegc_shrinker;
+	int ret;
 
-	shrink->count_objects = xfs_inodegc_shrinker_count;
-	shrink->scan_objects = xfs_inodegc_shrinker_scan;
-	shrink->seeks = 0;
-	shrink->flags = SHRINKER_NONSLAB;
-	shrink->batch = XFS_INODEGC_SHRINKER_BATCH;
+	mp->m_inodegc_shrinker =
+		shrinker_alloc_and_init(xfs_inodegc_shrinker_count,
+					xfs_inodegc_shrinker_scan,
+					XFS_INODEGC_SHRINKER_BATCH,
+					0, SHRINKER_NONSLAB, mp);
+	if (!mp->m_inodegc_shrinker)
+		return -ENOMEM;
+
+	ret = register_shrinker(mp->m_inodegc_shrinker, "xfs-inodegc:%s",
+				mp->m_super->s_id);
+	if (ret)
+		shrinker_free(mp->m_inodegc_shrinker);
 
-	return register_shrinker(shrink, "xfs-inodegc:%s", mp->m_super->s_id);
+	return ret;
 }
diff --git a/fs/xfs/xfs_mount.c b/fs/xfs/xfs_mount.c
index fb87ffb48f7f..67286859ad34 100644
--- a/fs/xfs/xfs_mount.c
+++ b/fs/xfs/xfs_mount.c
@@ -1018,7 +1018,7 @@ xfs_mountfs(
  out_log_dealloc:
 	xfs_log_mount_cancel(mp);
  out_inodegc_shrinker:
-	unregister_shrinker(&mp->m_inodegc_shrinker);
+	unregister_and_free_shrinker(mp->m_inodegc_shrinker);
  out_fail_wait:
 	if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp)
 		xfs_buftarg_drain(mp->m_logdev_targp);
@@ -1100,7 +1100,7 @@ xfs_unmountfs(
 #if defined(DEBUG)
 	xfs_errortag_clearall(mp);
 #endif
-	unregister_shrinker(&mp->m_inodegc_shrinker);
+	unregister_and_free_shrinker(mp->m_inodegc_shrinker);
 	xfs_free_perag(mp);
 
 	xfs_errortag_del(mp);
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index e2866e7fa60c..562c294ca08e 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -217,7 +217,7 @@ typedef struct xfs_mount {
 	atomic_t		m_agirotor;	/* last ag dir inode alloced */
 
 	/* Memory shrinker to throttle and reprioritize inodegc */
-	struct shrinker		m_inodegc_shrinker;
+	struct shrinker		*m_inodegc_shrinker;
 	/*
 	 * Workqueue item so that we can coalesce multiple inode flush attempts
 	 * into a single flush.
-- 
2.30.2

