Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FB82F35E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEDF10E5D2;
	Tue, 16 Jan 2024 17:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D88F10E511;
 Tue, 16 Jan 2024 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705426954; x=1736962954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8K/h1/j4SNbUYxEYWeTpA8KkHoZAgBmuZ8QW30qjzF4=;
 b=ARslKC73vY+mOjXaif4rO9ijR0SE52jY22m1kB/+iY0rDF70O8XqPMWl
 rW1lFS7pEjV1WqQCHkVPKF+iAOw01EGe66iVGFRCM2wP9hue/mYT/jcW4
 9+Pd9o/Q3H2Jh2OG3u3Eqzdzyo7Sb5+xU9jpvaFjuvqbvfNef3PNRayTC
 O1DlePDXL3tRatQhLHOs6ax9sckkbbYnBmaaxy/S1KiUvofKbVZD4Zxxy
 Au7jnSX0EARr5FYQAUkLIUYYb/IOlSOZ+bXPwyK+YkGxyYBDYoSphckQA
 ILsUuvimS+0rxb62i5N8qJ01oHHNyppXRjVqaqNMBhSdZz6+/rGtU5Ee3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13288229"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="13288229"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927555535"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="927555535"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/xe: Fix cast on trace variable
Date: Tue, 16 Jan 2024 09:40:49 -0800
Message-Id: <20240116174050.2435923-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116174050.2435923-1-lucas.demarchi@intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 ogabbay@kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cast the pointer to unsigned long and let it be implicitly extended to
u64. This fixes the build on 32bits arch.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..e4e7262191ad 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -31,7 +31,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->fence = (u64)fence;
+			   __entry->fence = (unsigned long)fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
-- 
2.40.1

