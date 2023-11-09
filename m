Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE27E7232
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 20:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FBF10E8F6;
	Thu,  9 Nov 2023 19:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4390810E8F5;
 Thu,  9 Nov 2023 19:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699557746; x=1731093746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gMq2G7QSqB2DdHSPl2LLgATi9RHBVk93YEEpZDfk7+c=;
 b=BDsrEe99rV2EMwAEqFWN6kTQM6o7Pl6n46J5BItDMA1Jd8/aEco6ktaz
 VRZ2sj1wcY/yRLYQqUCj37GhgjX/SNWlPuZcPbRu/r0XliX6CLNgsbG9V
 wd3kBHOCmDnDvJ9Pu1WHfd1t3KJb88XmVH5wB/QYiT/PpKtYzce8NuDoN
 AeHRXZFrTDLxUewdDFmBR+RXcjAIieK22V0xVEAnTQno8FK4u5jUR0Rop
 Tvw2VPG6U+VNdZSD1cIDZ6PQ+AaD8r+I/TV0vO0CYyZEzzy8CY7yBkii5
 ZDDzpm4bQq0mJtR64v7nBeQSV4KEJqv5mQHdyoI1OI2CsQ/48QCVNA9lW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3095126"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3095126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:22:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907233220"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="907233220"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 11:22:18 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Read a shadowed mmio register for ggtt flush
Date: Thu,  9 Nov 2023 11:21:48 -0800
Message-Id: <20231109192148.475156-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We read RENDER_HEAD as a part of the flush. If GT is in
deeper sleep states, this could lead to read errors since we are
not using a forcewake. Safer to read a shadowed register instead.

Cc: John Harrison <john.c.harrison@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index ed32bf5b1546..ea814ea5f700 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -451,7 +451,7 @@ void intel_gt_flush_ggtt_writes(struct intel_gt *gt)
 
 		spin_lock_irqsave(&uncore->lock, flags);
 		intel_uncore_posting_read_fw(uncore,
-					     RING_HEAD(RENDER_RING_BASE));
+					     RING_TAIL(RENDER_RING_BASE));
 		spin_unlock_irqrestore(&uncore->lock, flags);
 	}
 }
-- 
2.38.1

