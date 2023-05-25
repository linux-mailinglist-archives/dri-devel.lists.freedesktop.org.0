Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA77106FA
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8968510E839;
	Thu, 25 May 2023 08:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A12710E7EA;
 Thu, 25 May 2023 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685002324; x=1716538324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jjpfOxfgjrG11wWq42iXND+QyAPClktxVyHfvupdRKQ=;
 b=YZ7ftnwd92Ip8j4fOnQg4KORYkmq530kJ4J1A5iQukHmyMUUncY4K7CB
 sibwO7u8h4BNFo2SJlOpTQIf5qcy1eakjTuk+a/cngnbH2MXgmu24AnHI
 oo84TI2wFseutrH5hA8aE6YDHwdfNbylnoJppwzrN1V5160klnHKH/jFd
 ByUWIpNqw/JJY/n/22hScPXmG2VWQQi/1nmvvOsNs4gAPQgaBzRvY1ba8
 lXTxeDxjbHRNBpJ9UL4rczQIyUWC9kE1JgoncNo1w//b/a8F8PMVXA/CW
 W4jlNw5i5I2yG6Hb+fm6jsmbdfTpPndgG4shYSjWTE5hMcOxRJw1kREFd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417288494"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="417288494"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655122966"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="655122966"
Received: from moiraric-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.234.103])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:45 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: Record default rps threshold values
Date: Thu, 25 May 2023 09:11:30 +0100
Message-Id: <20230525081133.215292-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
References: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Record the default values as preparation for exposing the sysfs controls.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_types.h | 3 +++
 drivers/gpu/drm/i915/gt/intel_rps.c      | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f08c2556aa25..1b22d7a50665 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -83,6 +83,9 @@ enum intel_submission_method {
 struct gt_defaults {
 	u32 min_freq;
 	u32 max_freq;
+
+	u8 rps_up_threshold;
+	u8 rps_down_threshold;
 };
 
 enum intel_gt_type {
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 791097eb9bfd..333abc8f7ecb 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2016,7 +2016,9 @@ void intel_rps_init(struct intel_rps *rps)
 
 	/* Set default thresholds in % */
 	rps->power.up_threshold = 95;
+	rps_to_gt(rps)->defaults.rps_up_threshold = rps->power.up_threshold;
 	rps->power.down_threshold = 85;
+	rps_to_gt(rps)->defaults.rps_down_threshold = rps->power.down_threshold;
 
 	/* Finally allow us to boost to max by default */
 	rps->boost_freq = rps->max_freq;
-- 
2.39.2

