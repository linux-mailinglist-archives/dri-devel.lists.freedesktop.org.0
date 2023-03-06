Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA576AC802
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00BC10E3EF;
	Mon,  6 Mar 2023 16:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DA710E3EC;
 Mon,  6 Mar 2023 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678120356; x=1709656356;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=0eAGjVOQ2rbaK9zJyF59qMjxM1fjU52p32WNDpV9uis=;
 b=lrLrVFHk+AxKoCSOlvF9V7Rx9uIrtFqTkTgDYS2UYU0QEHlgwdtJMHKz
 jCAnzvfCfCUgFvmC+9A+cMN9O1Q/50lL4oFVY+GZIpUCdp1gJYSBAlmRE
 lT63vGjAZChsDrEgIFXMNv4W/+EEQ16DHF46hwPbJzyn4zqzz5AboPjU4
 ehGn1ihmLgGDx8dM4HVOnFDT+0jDFP5wQIufKbVESvas4skpic9vTOQQE
 CwBoKUX+OJwNAo9Nj+qNbHoZlQbBRR1fYip5sb1mCT0EtuT5IFAqZUtK8
 Z6ajWREmtR9YCYAOVl5NrxD99K3wH010D+1dGrsQTPM9BWqg3eLuPcS+g Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315998657"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="315998657"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 08:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745132872"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="745132872"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 08:32:32 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 06 Mar 2023 17:32:00 +0100
Subject: [PATCH v4 04/10] lib/ref_tracker: remove warnings in case of
 allocation failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-track_gt-v4-4-464e8ab4c9ab@intel.com>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
In-Reply-To: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.1
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
Cc: netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Library can handle allocation failures. To avoid allocation warnings
__GFP_NOWARN has been added everywhere. Moreover GFP_ATOMIC has been
replaced with GFP_NOWAIT in case of stack allocation on tracker free
call.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/ref_tracker.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 2ef4596b6b36f5..cae4498fcfd701 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -189,7 +189,7 @@ int ref_tracker_alloc(struct ref_tracker_dir *dir,
 	unsigned long entries[REF_TRACKER_STACK_ENTRIES];
 	struct ref_tracker *tracker;
 	unsigned int nr_entries;
-	gfp_t gfp_mask = gfp;
+	gfp_t gfp_mask = gfp | __GFP_NOWARN;
 	unsigned long flags;
 
 	WARN_ON_ONCE(dir->dead);
@@ -237,7 +237,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 		return -EEXIST;
 	}
 	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
-	stack_handle = stack_depot_save(entries, nr_entries, GFP_ATOMIC);
+	stack_handle = stack_depot_save(entries, nr_entries,
+					GFP_NOWAIT | __GFP_NOWARN);
 
 	spin_lock_irqsave(&dir->lock, flags);
 	if (tracker->dead) {

-- 
2.34.1
