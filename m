Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977D4BA26B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF7F10EB75;
	Thu, 17 Feb 2022 14:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9142510EB8A;
 Thu, 17 Feb 2022 14:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645106712; x=1676642712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mmcVCbEg/LT9UwII2j+BYuiQo6K4SH6OPf0Nj6nyyHk=;
 b=iCQnksXymfbJUZ7jW4zQzHayV0Ygi5d7F0IeHcVmMHFpVzviYs6sK09m
 tBYMPyV961rvEvXBN+jWIVNg/+42OhufmXGZgDFA9s4mMP0DLeASRECXs
 fh02kd0E/QeYbbLgOhGuc6ggQdoNhKNBaIRL369z1Jdymlq17c3K2iDTI
 W3i0ic4b9JI7tagmwNNeGhRn8DyuTInPdTqLZYALJEa93KmC7Id3tZoNH
 vLayiKooRtWhRsysRWQGiR+OjqmzsObCQhcmTtcrh8Z+Gf61bnI6eJOXY
 fV707aqhjGPeTFq2vtfKFGv0XSmz2Cneq6F82ZCL9Fuj53NUJ0QdvrvXk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230840856"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230840856"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:05:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="530241277"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:05:09 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH 5/9] lib/ref_tracker: improve allocation flags
Date: Thu, 17 Feb 2022 15:04:37 +0100
Message-Id: <20220217140441.1218045-6-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217140441.1218045-1-andrzej.hajda@intel.com>
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Library can be called in non-sleeping context, so it should not use
__GFP_NOFAIL. Instead it should calmly handle allocation fails, for
this __GFP_NOWARN has been added as well.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/ref_tracker.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 7b00bca300043..c8441ffbb058a 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -59,7 +59,7 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
 	if (list_empty(&dir->list))
 		return;
 
-	sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT);
+	sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT | __GFP_NOWARN);
 
 	list_for_each_entry(tracker, &dir->list, head)
 		++total;
@@ -154,11 +154,11 @@ int ref_tracker_alloc(struct ref_tracker_dir *dir,
 	unsigned long entries[REF_TRACKER_STACK_ENTRIES];
 	struct ref_tracker *tracker;
 	unsigned int nr_entries;
-	gfp_t gfp_mask = gfp;
+	gfp_t gfp_mask;
 	unsigned long flags;
 
-	if (gfp & __GFP_DIRECT_RECLAIM)
-		gfp_mask |= __GFP_NOFAIL;
+	gfp |= __GFP_NOWARN;
+	gfp_mask = (gfp & __GFP_DIRECT_RECLAIM) ? (gfp | __GFP_NOFAIL) : gfp;
 	*trackerp = tracker = kzalloc(sizeof(*tracker), gfp_mask);
 	if (unlikely(!tracker)) {
 		pr_err_once("memory allocation failure, unreliable refcount tracker.\n");
@@ -191,7 +191,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 	}
 	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
 	nr_entries = filter_irq_stacks(entries, nr_entries);
-	stack_handle = stack_depot_save(entries, nr_entries, GFP_ATOMIC);
+	stack_handle = stack_depot_save(entries, nr_entries,
+					GFP_NOWAIT | __GFP_NOWARN);
 
 	spin_lock_irqsave(&dir->lock, flags);
 	if (tracker->dead) {
-- 
2.25.1

