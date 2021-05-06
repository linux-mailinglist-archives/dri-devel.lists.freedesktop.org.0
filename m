Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CEE375ACB
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8710F6ED72;
	Thu,  6 May 2021 18:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930376ECF6;
 Thu,  6 May 2021 18:57:12 +0000 (UTC)
IronPort-SDR: SpUuPMPrvifkvpg5gO9V5SV/l86/Rr6w2Wu6RpXMlCXevcqIFlAQFp144X8oreuVeRn4aS/+w+
 SfCYh/YhgS9g==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195434"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195434"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
IronPort-SDR: Zh6oe3CIriMYNY0nNkB4qRWUc4WsVKM4Mh3IA0EBMXqpQonB6L7uROZnBWBkrU+SG6zTASIakS
 go/rgDeCTp5w==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583404"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 15/97] drm/i915/guc: Relax CTB response timeout
Date: Thu,  6 May 2021 12:13:29 -0700
Message-Id: <20210506191451.77768-16-matthew.brost@intel.com>
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

In upcoming patch we will allow more CTB requests to be sent in
parallel to the GuC for procesing, so we shouldn't assume any more
that GuC will always reply without 10ms.

Use bigger value from CONFIG_DRM_I915_HEARTBEAT_INTERVAL instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index c87a0a8bef26..a4b2e7fe318b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -436,17 +436,23 @@ static int ct_write(struct intel_guc_ct *ct,
  */
 static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 {
+	long timeout;
 	int err;
 
 	/*
 	 * Fast commands should complete in less than 10us, so sample quickly
 	 * up to that length of time, then switch to a slower sleep-wait loop.
 	 * No GuC command should ever take longer than 10ms.
+	 *
+	 * However, there might be other CT requests in flight before this one,
+	 * so use @CONFIG_DRM_I915_HEARTBEAT_INTERVAL as backup timeout value.
 	 */
+	timeout = max(10, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
+
 #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
 	err = wait_for_us(done, 10);
 	if (err)
-		err = wait_for(done, 10);
+		err = wait_for(done, timeout);
 #undef done
 
 	if (unlikely(err))
-- 
2.28.0

