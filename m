Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E5470FB4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390A310E6A3;
	Sat, 11 Dec 2021 01:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D37110E68E;
 Sat, 11 Dec 2021 01:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639184517; x=1670720517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FtiXJ0Qk5Y1SPRSOjGYgA87eBHFvQ0x5AzsSLVJE8Fs=;
 b=gsZvxrYIbqOxFUd6br9QROe6uu5q0/5wpfltepWUPt33wK252hkQGFK9
 egS9msyW/3h1srAW6oPhJvqLO8yXevFXRjLGsDPyn8dTYd0iV+MqLC1Za
 Gsfk9AdR1iXLENAzFOogBSPXCbgMvZgKnQYu2NA7KcYoMunc+60FFId0b
 Hkx/E78FuxJe50dpHR6HDzSx0RKo+W6jVXD/fJgv+EaKXVhebIqp1xzB8
 oQcD6LPopyNeaLb7tSpRezKKqRT2kSCWfCXuxK9iPRzToLMUStZduykUg
 VOuSBmd9xRWO4BkXLbU7v63mMl1+jYOlI0+OXqsMaULMTZkqRkNBEVkFF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238298251"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="238298251"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517002972"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/i915/guc: Kick G2H tasklet if no credits
Date: Fri, 10 Dec 2021 16:56:11 -0800
Message-Id: <20211211005612.8575-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211005612.8575-1-matthew.brost@intel.com>
References: <20211211005612.8575-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's be paranoid and kick the G2H tasklet, which dequeues messages, if
G2H credit are exhausted.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index ee5525c6f79b..334c5ab1c7b1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -591,12 +591,19 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
 
 static int has_room_nb(struct intel_guc_ct *ct, u32 h2g_dw, u32 g2h_dw)
 {
+	bool h2g = h2g_has_room(ct, h2g_dw);
+	bool g2h = g2h_has_room(ct, g2h_dw);
+
 	lockdep_assert_held(&ct->ctbs.send.lock);
 
-	if (unlikely(!h2g_has_room(ct, h2g_dw) || !g2h_has_room(ct, g2h_dw))) {
+	if (unlikely(!h2g || !g2h)) {
 		if (ct->stall_time == KTIME_MAX)
 			ct->stall_time = ktime_get();
 
+		/* Be paranoid and kick G2H tasklet to free credits */
+		if (!g2h)
+			tasklet_hi_schedule(&ct->receive_tasklet);
+
 		if (unlikely(ct_deadlocked(ct)))
 			return -EPIPE;
 		else
-- 
2.33.1

