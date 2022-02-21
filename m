Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8474BEDA7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3110E3EA;
	Mon, 21 Feb 2022 23:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C5310E3EA;
 Mon, 21 Feb 2022 23:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645485461; x=1677021461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mCvpydHF1iIboEBA+Uw1DVwXJZydjDJfqmrcbQB+Qt0=;
 b=N1U1BgoygZTPBRZWdVDXoBTFW6VgSSYMIRxermN2rX/MVjvK8DaNwNUK
 rcJhOPVGXTx9d+5d4+wjxSArLG2nlxo9QG6OZ4GubgCse4wLZUH5pg3S+
 66D/buX2Fcx+GjRoKXqHiD05tks2In1vrrGl256X2sN2ApitMn/wl+2we
 pJRIsi2g5PCg+qfQFDdY1UTkjSx1M91dx2VOaEvhj3MSUjvepW6OEaZy7
 ol7Oo6tJrWVZXJIZjgoPltmPF4w9OiJHDUMIRaoB5wGMNJ3qRqbd2Gy/A
 w/k5DJT8RVlqAMVMF/WtDS0M8EInvFe44qQYgo2w5an0dgQNHbyGKqrGq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="238995981"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="238995981"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="638694432"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:37 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH v2 03/11] [DO NOT MERGE] ref_tracker: remove
 filter_irq_stacks() call
Date: Tue, 22 Feb 2022 00:16:49 +0100
Message-Id: <20220221231705.1481059-8-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221231705.1481059-1-andrzej.hajda@intel.com>
References: <20220221231705.1481059-1-andrzej.hajda@intel.com>
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
Cc: Marco Elver <elver@google.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Eric Dumazet <edumazet@google.com>,
 Alexander Potapenko <glider@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eric Dumazet <edumazet@google.com>

After commit e94006608949 ("lib/stackdepot: always do filter_irq_stacks()
in stack_depot_save()") it became unnecessary to filter the stack
before calling stack_depot_save().

Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/ref_tracker.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 9c0c2e09df666..dc7b14aa3431e 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -89,7 +89,6 @@ int ref_tracker_alloc(struct ref_tracker_dir *dir,
 		return -ENOMEM;
 	}
 	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
-	nr_entries = filter_irq_stacks(entries, nr_entries);
 	tracker->alloc_stack_handle = stack_depot_save(entries, nr_entries, gfp);
 
 	spin_lock_irqsave(&dir->lock, flags);
@@ -120,7 +119,6 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 		return -EEXIST;
 	}
 	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
-	nr_entries = filter_irq_stacks(entries, nr_entries);
 	stack_handle = stack_depot_save(entries, nr_entries, GFP_ATOMIC);
 
 	spin_lock_irqsave(&dir->lock, flags);
-- 
2.25.1

