Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030294BEDAF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBD610E50A;
	Mon, 21 Feb 2022 23:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7D610E489;
 Mon, 21 Feb 2022 23:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645485467; x=1677021467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mCvpydHF1iIboEBA+Uw1DVwXJZydjDJfqmrcbQB+Qt0=;
 b=lTyCsGjf2n6WIT2zvreJYX1VNOUc7vhktSEGLfxPuNey+y8dP31QUDP3
 WRZsg6dM+E1eeoKliuJHEuEKNXbt2wIJU1MXDy2CF/mbMggHBVX5jLYLM
 0BhESim1a6+u76B0XVVoCPVOJCDSTC1Emd4qQxXiftJSvGlJ6BvfwlcTn
 0uyUgwKsD8yF7E8W4z3Ja9d4vAxGYPY+cZHtIaotAceAdpyixNzY+g2T3
 ZBM4pnEhihaBNjyAYuc4IDKAB6moOV/WZPqxwzrzETVyoefdtIp5Oanfr
 ynP02eZlZOzMabX7d1m0Im5dJDazcEJ093ZS73t7aOcJusEGDYb9O8Ke/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="238995993"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="238995993"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="638694463"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:43 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH v2 03/11] ref_tracker: remove filter_irq_stacks() call
Date: Tue, 22 Feb 2022 00:16:51 +0100
Message-Id: <20220221231705.1481059-10-andrzej.hajda@intel.com>
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

