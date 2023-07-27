Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570DD764ADB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF9C10E531;
	Thu, 27 Jul 2023 08:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4292C10E531
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:12:18 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so204673b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445538; x=1691050338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhs5C6wYTK112tB0Y3rKeCsMBEmGx3fQoCnqZ3HCCLA=;
 b=P3BNYmrnn+aNeQX6tJNAWjBR47qoFVwe6V1hXSSWwFyS61HuOjfx1CldC/bVPLDS4b
 tBSPVcIpokpC1gG54dPeypV2gv1H1PsrEki/AFkEglXm+WyAmzSAHFAjlypTbwzHUkTv
 XwwWUlwnKhA8sSKQw+cOvBa/dT3CBu+sYvYNSpbwNT6pp20knmU+insJC0lJR8d7KNA/
 XFw3RfaoZY9/IU0U207vkdiCmyduxENHuADRmTAqpUtqVvF1N7pwLKXyEsFC4IstCLHw
 nMtpKLIm0n/1aYuhmB1FsTVe4JczwGUa2wEUGkSK8KQu0Fafs8lJ3mpNN+7ETdaWOSMf
 16qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445538; x=1691050338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhs5C6wYTK112tB0Y3rKeCsMBEmGx3fQoCnqZ3HCCLA=;
 b=kUIs/NT/lOq3WmHvUJ/ByGqH2wqvfVG5e+N2GhGIfPpON2zr8A5+TCVeiRI1GwAusH
 pq8/sMGKSteAUgO+6YQUK9Cw3b0z0y57bpEU26OP+mpR88S8MILVat9fqOak+HxZEd9e
 JYVZ9iZiQfp0AgkNlnfK9WtcDDlRWFZVbr0TMDDE9SjxZhCVDYuQ/JD7K8P2tby+948g
 zZRKUV3N6dWYosQBs0rutKGIG8soEWg19QF+j5SGVipcR9BXQsQJOHt056RUeHzpROua
 E83f3G/roxcd8W38CHI9AHv0wNasJEs+kzqszmX2DmDnPJCCdwzRQZycl97+qwh9i/kY
 6VGg==
X-Gm-Message-State: ABy/qLZz877s8bbTI+EutsFy+4w6lXcJySRlGzdf7r5bmJZ5LLwwa9tg
 P3IrJHj4FoIbUfGY4R/g++lPvA==
X-Google-Smtp-Source: APBJJlELYJ+VP3jkb44itFX28rq7UhufR3zr/NDN3xCao+bv4nVfpqzapahZiZsalg40ZmAEO1GP5Q==
X-Received: by 2002:a05:6a00:13a3:b0:676:2a5c:7bc5 with SMTP id
 t35-20020a056a0013a300b006762a5c7bc5mr5236670pfg.1.1690445537850; 
 Thu, 27 Jul 2023 01:12:17 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:12:17 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 32/49] virtio_balloon: dynamically allocate the
 virtio-balloon shrinker
Date: Thu, 27 Jul 2023 16:04:45 +0800
Message-Id: <20230727080502.77895-33-zhengqi.arch@bytedance.com>
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
dynamically allocate the virtio-balloon shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct virtio_balloon.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/virtio/virtio_balloon.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 5b15936a5214..82e6087073a9 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -111,7 +111,7 @@ struct virtio_balloon {
 	struct virtio_balloon_stat stats[VIRTIO_BALLOON_S_NR];
 
 	/* Shrinker to return free pages - VIRTIO_BALLOON_F_FREE_PAGE_HINT */
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	/* OOM notifier to deflate on OOM - VIRTIO_BALLOON_F_DEFLATE_ON_OOM */
 	struct notifier_block oom_nb;
@@ -816,8 +816,7 @@ static unsigned long shrink_free_pages(struct virtio_balloon *vb,
 static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
 						  struct shrink_control *sc)
 {
-	struct virtio_balloon *vb = container_of(shrinker,
-					struct virtio_balloon, shrinker);
+	struct virtio_balloon *vb = shrinker->private_data;
 
 	return shrink_free_pages(vb, sc->nr_to_scan);
 }
@@ -825,8 +824,7 @@ static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
 static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
 						   struct shrink_control *sc)
 {
-	struct virtio_balloon *vb = container_of(shrinker,
-					struct virtio_balloon, shrinker);
+	struct virtio_balloon *vb = shrinker->private_data;
 
 	return vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 }
@@ -847,16 +845,23 @@ static int virtio_balloon_oom_notify(struct notifier_block *nb,
 
 static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
 {
-	unregister_shrinker(&vb->shrinker);
+	shrinker_free(vb->shrinker);
 }
 
 static int virtio_balloon_register_shrinker(struct virtio_balloon *vb)
 {
-	vb->shrinker.scan_objects = virtio_balloon_shrinker_scan;
-	vb->shrinker.count_objects = virtio_balloon_shrinker_count;
-	vb->shrinker.seeks = DEFAULT_SEEKS;
+	vb->shrinker = shrinker_alloc(0, "virtio-balloon");
+	if (!vb->shrinker)
+		return -ENOMEM;
 
-	return register_shrinker(&vb->shrinker, "virtio-balloon");
+	vb->shrinker->scan_objects = virtio_balloon_shrinker_scan;
+	vb->shrinker->count_objects = virtio_balloon_shrinker_count;
+	vb->shrinker->seeks = DEFAULT_SEEKS;
+	vb->shrinker->private_data = vb;
+
+	shrinker_register(vb->shrinker);
+
+	return 0;
 }
 
 static int virtballoon_probe(struct virtio_device *vdev)
-- 
2.30.2

