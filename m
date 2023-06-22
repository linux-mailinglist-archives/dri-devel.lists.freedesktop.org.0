Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE2673B15A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157510E5FE;
	Fri, 23 Jun 2023 07:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-60.mta0.migadu.com (out-60.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::3c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621C610E502
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:35:20 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687422370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w53NcBmn/IPVgjrXh3hKsvtsk7tDad26SsdH585QToY=;
 b=XwhMjboYkO1IjigA7jJUMcuvrlsYL6AEdKhP6EAdQek7nGl7SCwZP+s1KaXaDd0EbpkijC
 WzHmsAAL7fH0Q68pqE9kbEs/wm6WDN8VuTFUTe+F4YIjoGCH/bDYiJlTs6zAXz5aY/DcIU
 qOKI3csGnCUAw3UqbPNbuNVS2tXOJrg=
From: Qi Zheng <qi.zheng@linux.dev>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 01/29] mm: shrinker: add shrinker::private_data field
Date: Thu, 22 Jun 2023 08:24:26 +0000
Message-Id: <20230622082454.4090236-2-qi.zheng@linux.dev>
In-Reply-To: <20230622082454.4090236-1-qi.zheng@linux.dev>
References: <20230622082454.4090236-1-qi.zheng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: mst@redhat.com, neilb@suse.de, jasowang@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, song@kernel.org, dm-devel@redhat.com, ray.huang@amd.com,
 namit@vmware.com, marijn.suijten@somainline.org, agk@redhat.com,
 senozhatsky@chromium.org, david@redhat.com, clm@fb.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, Qi Zheng <zhengqi.arch@bytedance.com>,
 josef@toxicpanda.com, linux-ext4@vger.kernel.org, kent.overstreet@gmail.com,
 xuanzhuo@linux.alibaba.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, snitzer@kernel.org, quic_abhinavk@quicinc.com,
 colyli@suse.de, linux-raid@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-bcache@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 sean@poorly.run, linux-nfs@vger.kernel.org, tomeu.vizoso@collabora.com,
 kolga@netapp.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, minchan@kernel.org, chuck.lever@oracle.com,
 jack@suse.com, dmitry.baryshkov@linaro.org, adilger.kernel@dilger.ca,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qi Zheng <zhengqi.arch@bytedance.com>

To prepare for the dynamic allocation of shrinker instances
embedded in other structures, add a private_data field to
struct shrinker, so that we can use shrinker::private_data
to record and get the original embedded structure.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 224293b2dd06..43e6fcabbf51 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -70,6 +70,8 @@ struct shrinker {
 	int seeks;	/* seeks to recreate an obj */
 	unsigned flags;
 
+	void *private_data;
+
 	/* These are for internal use */
 	struct list_head list;
 #ifdef CONFIG_MEMCG
-- 
2.30.2

