Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCYaCquNnGmdJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:26:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E217AC65
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2482910E40C;
	Mon, 23 Feb 2026 17:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="my4Z9WGe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECAB10E085;
 Mon, 23 Feb 2026 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771867559; x=1803403559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mt6a1bGaBkfwcx86mxJBvKi5TNIFAjm/uHANPLwQk10=;
 b=my4Z9WGe7Rpq264qKeiX7A59FNBMpxqgNS8Nrb+VOUJSbvcnEg6WDlv1
 JVeb8UKtwVxeBxC2o0QvtNRkKiGvOMsWhUmUaXyRuxrocdDkY2aotlU1p
 pupKq6Bn3BUAYWvRAB98VAqAB9XIlbLozPZFK3snTcDYFHtnqfWjxSYVg
 8iSCims7z2vWenFRTfRYhcAZbp88ZnXCnJJ/h7JDm9ZwzMEFV3P1Ppnhm
 HbHtuuRFyC3ZZGpljalrTD1y53DbYq4l+fpQQsBl6xTFylDSUtRH9x3O3
 IUWytYL+YqY8RQ1K0kpMI1xpLjI9df7zl2wBaj/lmWNMZVES5l5/7dKVT Q==;
X-CSE-ConnectionGUID: 16NKTkACQLKkNPP/Sqn/Tg==
X-CSE-MsgGUID: SKarxq0kS2W84xil0M1/JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83189896"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83189896"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:25:59 -0800
X-CSE-ConnectionGUID: mCHH8IAYRJi1qS/Rq5z7xg==
X-CSE-MsgGUID: SaYoXXaIRsGK144dR5FRvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220624129"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:25:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/i915/selftests: Fix build after dma-fence locking rework
Date: Mon, 23 Feb 2026 09:25:53 -0800
Message-Id: <20260223172553.1663749-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: E91E217AC65
X-Rspamd-Action: no action

The i915_active selftest no longer builds after the dma-fence locking
rework because it directly accessed the fence’s spinlock. The helper
dma_fence_spinlock() must now be used to obtain the spinlock. Update the
selftest to use dma_fence_spinlock() accordingly.

Fixes: 1f32f310a13c ("dma-buf: inline spinlock for fence protection v5")
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_active.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 52345073b409..9fea2fabeac4 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -323,9 +323,9 @@ static void active_flush(struct i915_active *ref,
 	if (!fence)
 		return;
 
-	spin_lock_irq(fence->lock);
+	spin_lock_irq(dma_fence_spinlock(fence));
 	__list_del_entry(&active->cb.node);
-	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
+	spin_unlock_irq(dma_fence_spinlock(fence)); /* serialise with fence->cb_list */
 	atomic_dec(&ref->count);
 
 	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
-- 
2.34.1

