Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84596B7F6D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 18:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCCA10E5D2;
	Mon, 13 Mar 2023 17:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F17B10E5E0;
 Mon, 13 Mar 2023 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678728294; x=1710264294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/GnihSDIpsDjCoyoxBnL+YJx4ACoHDwigG2Aer3CR7w=;
 b=Qv+S9/eDpiqkwwE/LL/3ezG66mpgWsQ3uTlSPGciOX/yGVbIYW5OqHEF
 eMNZa59mmlaacd2l34jWXsMl5o4UxPrsdwMUeGscAP18p7JuBSUAZD6ZN
 NKxdg062KeDHeIcWo5sfKvNnrnwgbivu+osrpEvtd1KPT7aazS4qP02lC
 q5JqbpvdLLFY2+DphI/LHbrjyRKynp+jdDVqjjrD56qxOt4VyjxnvTO/Q
 2K4R/f4SYKZJxlaB1dlVFZ2lEJBDK3is2qr9j8ZYuEZstqPPMQlILs7A/
 ASC6SXihIhNVjiorxvSWsNj4L+MOt1vprvTpRrDKSI0SZLiueo/aiS/si A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321062340"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="321062340"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924586811"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924586811"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.intranet) ([10.213.1.93])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:24:50 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/active: Simplify llist search-and-delete
Date: Mon, 13 Mar 2023 18:24:15 +0100
Message-Id: <20230313172415.125932-4-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230313172415.125932-1-janusz.krzysztofik@linux.intel.com>
References: <20230313172415.125932-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inside ____active_del_barrier(), while searching for a node to be deleted,
we now rebuild barrier_tasks llist content in reverse order.
Theoretically neutral, that method was observed to provide an undocumented
workaround for unexpected loops of llist nodes appearing now and again due
to races, silently breaking those llist node loops, then protecting
llist_for_each_safe() from spinning indefinitely.

Having all races hopefully fixed, make that function behavior more
predictable, more easy to follow -- switch to an alternative, equally
simple but less invasive algorithm that only updates a link between list
nodes that precede and follow the deleted node.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_active.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 8eb10af7928f4..10f52eb4a4592 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -391,13 +391,14 @@ static bool ____active_del_barrier(struct i915_active *ref,
 	llist_for_each_safe(pos, next, llist_del_all(&engine->barrier_tasks)) {
 		if (node == barrier_from_ll(pos)) {
 			node = NULL;
+			if (tail)
+				tail->next = next;
 			continue;
 		}
 
-		pos->next = head;
-		head = pos;
-		if (!tail)
-			tail = pos;
+		if (!head)
+			head = pos;
+		tail = pos;
 	}
 	if (head)
 		llist_add_batch(head, tail, &engine->barrier_tasks);
-- 
2.25.1

