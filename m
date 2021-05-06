Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0BD375B33
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3DC6ED9C;
	Thu,  6 May 2021 18:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42B56ED99;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: Rzp0UcgMxkN9eEakyxXv59dob7wbLdE6QLhLSSEvWPxRKl9WGdtalQkLFJCdTgDi7mQvmMTLyj
 xgYSDCz8nsOw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195468"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195468"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: 18eS8UEWKZ5JI3krLvfiuDNxevBUOlGYKayhX6491OZMCT/+GghwtO36d1ZuG5AhkyAIWo98JY
 5r73JEUvZVSQ==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583669"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 94/97] drm/i915/guc: Don't call switch_to_kernel_context
 with GuC submission
Date: Thu,  6 May 2021 12:14:48 -0700
Message-Id: <20210506191451.77768-95-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling switch_to_kernel_context isn't needed if the engine PM reference
is taken while all contexts are pinned. By not calling
switch_to_kernel_context we save on issuing a request to the engine.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index ba6a9931c4e8..f8fab316e33d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -162,6 +162,10 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
 	unsigned long flags;
 	bool result = true;
 
+	/* No need to switch_to_kernel_context if GuC submission */
+	if (intel_engine_uses_guc(engine))
+		return true;
+
 	/* GPU is pointing to the void, as good as in the kernel context. */
 	if (intel_gt_is_wedged(engine->gt))
 		return true;
-- 
2.28.0

