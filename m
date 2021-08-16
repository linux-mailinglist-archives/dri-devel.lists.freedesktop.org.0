Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61D03ED80A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCE089E7B;
	Mon, 16 Aug 2021 13:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21A089E36;
 Mon, 16 Aug 2021 13:56:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="279607058"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="279607058"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="441091158"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 02/22] drm/i915/guc: Fix outstanding G2H accounting
Date: Mon, 16 Aug 2021 06:51:19 -0700
Message-Id: <20210816135139.10060-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816135139.10060-1-matthew.brost@intel.com>
References: <20210816135139.10060-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A small race that could result in incorrect accounting of the number
of outstanding G2H. Basically prior to this patch we did not increment
the number of outstanding G2H if we encoutered a GT reset while sending
a H2G. This was incorrect as the context state had already been updated
to anticipate a G2H response thus the counter should be incremented.

Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 69faa39da178..b5d3972ae164 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -360,11 +360,13 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 {
 	int err;
 
-	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
-
-	if (!err && g2h_len_dw)
+	if (g2h_len_dw)
 		atomic_inc(&guc->outstanding_submission_g2h);
 
+	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
+	if (err == -EBUSY && g2h_len_dw)
+		atomic_dec(&guc->outstanding_submission_g2h);
+
 	return err;
 }
 
-- 
2.32.0

