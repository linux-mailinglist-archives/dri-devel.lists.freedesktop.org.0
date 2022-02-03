Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A34A80EA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F7A10E9E7;
	Thu,  3 Feb 2022 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916BB10E9E4;
 Thu,  3 Feb 2022 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879084; x=1675415084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ykh21sL9DEpB2JXwyOHqrQBPR5ZH4IGXSmiSTOLPwtc=;
 b=FxWye4GL+jKiDqsrGplNDio9qSvtKi/fDzaMH6mvwT7P+52SJ2qHG3Lv
 6fsy6n5K9qtELLgcDMPSvzUVTbPKDeC7BtsTl2bH0KL4v1qZZaarqg+pE
 Txd5lvP8Z3fkVCM64EFcPjukDiYEqwiC0F4/TFFcVgVapNy4q7Wq6S9RG
 XhoAgUbjiZnkzDLGAC8Pl2+FlS0sQcrkMGnAU6viALf8lHP0vv5mjUhsF
 yWduDN31PWhw7qqrVn87xoO9e/KAZh33knuob/4xkiIk2A3pSqUr8Modl
 XkqVEp98vAwpJ5ugztCS94pNM9JIVbI1o5Qq0nwV8elo5CdphnvT6JdxU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="231670016"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="231670016"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="631276791"
Received: from cbrady-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.6.65])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] HACK: drm/i915/dp: give more time for CDS
Date: Thu,  3 Feb 2022 11:03:57 +0200
Message-Id: <d29b06b641263e92bc3ec0641f3c7c4cd4557aa0.1643878928.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643878928.git.jani.nikula@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to avoid the timeout during debugging.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 0686da36c428..c4807f7f5430 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1288,6 +1288,9 @@ intel_dp_128b132b_lane_cds(struct intel_dp *intel_dp,
 	/* Time budget for the LANEx_CDS_DONE Sequence */
 	deadline = jiffies + msecs_to_jiffies((lttpr_count + 1) * 20);
 
+	/* FIXME: Give some slack for CDS. */
+	deadline += msecs_to_jiffies(500);
+
 	for (;;) {
 		usleep_range(2000, 3000);
 
-- 
2.30.2

