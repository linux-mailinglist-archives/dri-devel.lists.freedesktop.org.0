Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A519514129
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 06:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E079F10FA44;
	Fri, 29 Apr 2022 04:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC40610FA44;
 Fri, 29 Apr 2022 04:04:14 +0000 (UTC)
X-UUID: d2eb80d31af748789493127fc21f493c-20220429
X-UUID: d2eb80d31af748789493127fc21f493c-20220429
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 2146502266; Fri, 29 Apr 2022 12:02:33 +0800
X-ns-mid: postfix-626B63B4-5096043818
Received: from localhost.localdomain (unknown [172.20.108.41])
 by cs2c.com.cn (NSMail) with ESMTPA id 40EBE3844000;
 Fri, 29 Apr 2022 04:04:04 +0000 (UTC)
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915: remove unnecessary spin_lock_irq
Date: Fri, 29 Apr 2022 12:03:55 +0800
Message-Id: <20220429040355.2644322-1-lizhenneng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zhenneng Li <lizhenneng@kylinos.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code will not be called by interrupt handler,
so change it to spin_lock.

Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
---
 drivers/gpu/drm/i915/i915_scheduler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 762127dd56c5..6615102a1568 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -288,9 +288,9 @@ static void __i915_schedule(struct i915_sched_node *node,
 
 void i915_schedule(struct i915_request *rq, const struct i915_sched_attr *attr)
 {
-	spin_lock_irq(&schedule_lock);
+	spin_lock(&schedule_lock);
 	__i915_schedule(&rq->sched, attr);
-	spin_unlock_irq(&schedule_lock);
+	spin_unlock(&schedule_lock);
 }
 
 void i915_sched_node_init(struct i915_sched_node *node)
-- 
2.25.1

