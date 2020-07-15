Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038BD2205B5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F166E456;
	Wed, 15 Jul 2020 07:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B0C6E247;
 Wed, 15 Jul 2020 03:21:33 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E8EE9E172D7C581CD3E7;
 Wed, 15 Jul 2020 11:21:26 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Jul 2020
 11:21:17 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <chris@chris-wilson.co.uk>
Subject: [PATCH -next] drm/i915: Remove unused inline function
 drain_delayed_work()
Date: Wed, 15 Jul 2020 11:21:04 +0800
Message-ID: <20200715032104.32052-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: intel-gfx@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is not used since commit 058179e72e09 ("drm/i915/gt: Replace
hangcheck by heartbeats")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i915/i915_utils.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index b1c5955a52e1..54773371e6bd 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -266,19 +266,6 @@ static inline int list_is_last_rcu(const struct list_head *list,
 	return READ_ONCE(list->next) == head;
 }
 
-/*
- * Wait until the work is finally complete, even if it tries to postpone
- * by requeueing itself. Note, that if the worker never cancels itself,
- * we will spin forever.
- */
-static inline void drain_delayed_work(struct delayed_work *dw)
-{
-	do {
-		while (flush_delayed_work(dw))
-			;
-	} while (delayed_work_pending(dw));
-}
-
 static inline unsigned long msecs_to_jiffies_timeout(const unsigned int m)
 {
 	unsigned long j = msecs_to_jiffies(m);
-- 
2.17.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
