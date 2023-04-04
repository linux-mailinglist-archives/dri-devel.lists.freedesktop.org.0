Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879896D5584
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996C10E1BF;
	Tue,  4 Apr 2023 00:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ADF10E086;
 Tue,  4 Apr 2023 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680567744; x=1712103744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rI+mt1YKYp3orUuX569X3FxbQOR31uaY8xNpPR6u4lY=;
 b=mDTCZx++h/HokRhhuHiGVtluwwEMEkgnGYUZYPV0VlRLS5itHYymY8d0
 qGYwp8GU27ESvbrnqKG+nQmNoGpbHQX8CEXytwm5fm1uC1plmrdXlo8Hs
 c2jRF0AQJIQIvVc+zgiVwM2OYp5qirNKMZuMUCT1LXHeh9MsQpnQRIE8w
 hMn5zprn5T1KUwz3sjfhd8RDD0V4WsH2W+byZy35oJpJKUqx2wYWCOm/m
 iGxBRNy69G/0zsewkyhlzQf3Tmp16RSr87DrICgrUG4zHep9uSWI83mw5
 zM7LtaautEaP+UZbaNXATbp7wTm9k5RFSyXljPlaY7dyLoT6J0l1kC099 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404810544"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="404810544"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716460318"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="716460318"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 10/10] drm/syncobj: Warn on long running dma-fences
Date: Mon,  3 Apr 2023 17:22:11 -0700
Message-Id: <20230404002211.3611376-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, Matthew Brost <matthew.brsot@intel.com>,
 boris.brezillon@collabora.com, Matthew Brost <matthew.brost@intel.com>,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Long running dma-fences are not allowed to be exported, a drm_syncobj is
designed to be exported to the user, so add a warn if drm_syncobj
install long running dna-fences as this is not allowed.

Signed-off-by: Matthew Brost <matthew.brsot@intel.com>
---
 drivers/gpu/drm/drm_syncobj.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..7c304cd7d037 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -291,6 +291,7 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 	struct syncobj_wait_entry *cur, *tmp;
 	struct dma_fence *prev;
 
+	WARN_ON_ONCE(dma_fence_is_lr(fence));
 	dma_fence_get(fence);
 
 	spin_lock(&syncobj->lock);
@@ -325,8 +326,10 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
 	struct dma_fence *old_fence;
 	struct syncobj_wait_entry *cur, *tmp;
 
-	if (fence)
+	if (fence) {
+		WARN_ON_ONCE(dma_fence_is_lr(fence));
 		dma_fence_get(fence);
+	}
 
 	spin_lock(&syncobj->lock);
 
-- 
2.34.1

