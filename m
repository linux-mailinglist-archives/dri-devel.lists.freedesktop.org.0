Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C53B764A6B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9610E521;
	Thu, 27 Jul 2023 08:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC3310E521
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:09:29 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-682b1768a0bso174990b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445369; x=1691050169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=et7oKjMo2RpAm9eGe6PO8KzXkO6yMET8jj6KuxhxE1o=;
 b=ZArGb8yz+8ycxhYpd3TfnObsbskAktwxKp/LK6E+gx1lOsm2QqxHLjO1qFt766mx4G
 4UOFzMb5rOBT3wq7QpcOo/50dqnABPqLouzBdNx69dJP3kndLHofbdJgcQSOE87tIEP3
 gOFIB0th/ApJ4utKzdT3r6irRm20AGsjylo629bfexLkXBuL+hMcZdtnwSmPAtxRA7F8
 l3r/R789CkvCTacsaPitu2Mn9fHBZCoAT7Xd7Py97lY3Lp4c0X3H7O8uSS1JwsanI4Cy
 Pf3LZprk/pnZjQej6Xzx3T3CJ+QGRGxZd7LUmSV8XGImv+0X4BPv+EIagOcfGqekhivR
 Bv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445369; x=1691050169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=et7oKjMo2RpAm9eGe6PO8KzXkO6yMET8jj6KuxhxE1o=;
 b=eJ7tmsU3c0QRz8AAJwedjFcA8gVNYdxJ8yl0H7wF0LgTd2OwcZrl2xP+louThVDrQ+
 EeQxyXYa38+Ef5FUSwIG9r7VvmGyGDXsGbZewGozAANRvTsXhgKgCtUsilp9b8USoHgJ
 Vi5/4XdR1qZffTf9fHjcd6iCE1/rqDM/BFRBDf5S1tF1V+/ArSEWqA+Wu271Z8e+mt9b
 TTrZxQvOrx97wLu2tfv5Ym9oWlUqG3rly3gEcBMFP2dfR39RRorXF+hNw+lHwjgFY4hT
 2OuNpfnzmPA8K5wVvkz/1U4gyyB9gbEwlLasQvTcv9dc5oAW7P5uUtnySvWovugna24f
 fWqw==
X-Gm-Message-State: ABy/qLbPqj3G0aurYnSE7Pd+m5HTUTdtD0ynf7GIgREd3FVfhRKISWgY
 ahWzIBc8PtAFKdRrky0LeDuSnw==
X-Google-Smtp-Source: APBJJlGUbAM65UTyBU06poLXl/mtaX6EX5YDf65AxeW9rsxnsdAR4xxA054nRzBMt6Eu4ihj5O0Oaw==
X-Received: by 2002:a05:6a20:7da5:b0:137:3941:17b3 with SMTP id
 v37-20020a056a207da500b00137394117b3mr5573135pzj.6.1690445369382; 
 Thu, 27 Jul 2023 01:09:29 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:09:28 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 18/49] ubifs: dynamically allocate the ubifs-slab shrinker
Date: Thu, 27 Jul 2023 16:04:31 +0800
Message-Id: <20230727080502.77895-19-zhengqi.arch@bytedance.com>
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

Use new APIs to dynamically allocate the ubifs-slab shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/ubifs/super.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b08fb28d16b5..c690782388a8 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -54,11 +54,7 @@ module_param_cb(default_version, &ubifs_default_version_ops, &ubifs_default_vers
 static struct kmem_cache *ubifs_inode_slab;
 
 /* UBIFS TNC shrinker description */
-static struct shrinker ubifs_shrinker_info = {
-	.scan_objects = ubifs_shrink_scan,
-	.count_objects = ubifs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *ubifs_shrinker_info;
 
 /**
  * validate_inode - validate inode.
@@ -2373,7 +2369,7 @@ static void inode_slab_ctor(void *obj)
 
 static int __init ubifs_init(void)
 {
-	int err;
+	int err = -ENOMEM;
 
 	BUILD_BUG_ON(sizeof(struct ubifs_ch) != 24);
 
@@ -2439,10 +2435,16 @@ static int __init ubifs_init(void)
 	if (!ubifs_inode_slab)
 		return -ENOMEM;
 
-	err = register_shrinker(&ubifs_shrinker_info, "ubifs-slab");
-	if (err)
+	ubifs_shrinker_info = shrinker_alloc(0, "ubifs-slab");
+	if (!ubifs_shrinker_info)
 		goto out_slab;
 
+	ubifs_shrinker_info->count_objects = ubifs_shrink_count;
+	ubifs_shrinker_info->scan_objects = ubifs_shrink_scan;
+	ubifs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(ubifs_shrinker_info);
+
 	err = ubifs_compressors_init();
 	if (err)
 		goto out_shrinker;
@@ -2467,7 +2469,7 @@ static int __init ubifs_init(void)
 	dbg_debugfs_exit();
 	ubifs_compressors_exit();
 out_shrinker:
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_free(ubifs_shrinker_info);
 out_slab:
 	kmem_cache_destroy(ubifs_inode_slab);
 	return err;
@@ -2483,7 +2485,7 @@ static void __exit ubifs_exit(void)
 	dbg_debugfs_exit();
 	ubifs_sysfs_exit();
 	ubifs_compressors_exit();
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_free(ubifs_shrinker_info);
 
 	/*
 	 * Make sure all delayed rcu free inodes are flushed before we
-- 
2.30.2

