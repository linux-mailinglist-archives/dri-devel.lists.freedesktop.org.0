Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D11474906
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF2E10E18F;
	Tue, 14 Dec 2021 17:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966610E1E7;
 Tue, 14 Dec 2021 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639502073; x=1671038073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V7mhzQQhvb0lTvzXO4pMuWvuZcuZfU52N2KDqvUj19Q=;
 b=FxgGXpVQjg9u2ibULBCJ5bX5lxBsma+7n4igqBYF0rDvxBb5XHUqZoAy
 NjeAr5Nq3HbrzKiG6094pi4PaLiOVwFzmRa5vRZgW9g/67dQBI44UdZC0
 NXQXOhPGpbnITstIIQGMPHx50fBSloxYXoVhkISNNlGmvOm5NWt2DdVjZ
 tDWJ8ZL5O1HPqzYp/tqORXkpvq8NWzaiw3EKmOyesWfAIE50wZQC9+Z4U
 0itZhzUIt8B2qDK7xtSjZZEQstSEeO+fONkyhoVAyKjc64fk6Lv1HsuYn
 PsN+F9Yzte0VAxCaXbZ5D4lT8kFIr6j6F3bLWW+rqXNX09DTjcgrxMXLv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302405486"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="302405486"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:10:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="614357559"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:10:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/i915/guc: Kick G2H tasklet if no credits
Date: Tue, 14 Dec 2021 09:04:59 -0800
Message-Id: <20211214170500.28569-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214170500.28569-1-matthew.brost@intel.com>
References: <20211214170500.28569-1-matthew.brost@intel.com>
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
G2H credits are exhausted.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 741be9abab68..aa6dd6415202 100644
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

