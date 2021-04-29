Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162CF36E71D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 10:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56456EDBB;
	Thu, 29 Apr 2021 08:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4806EDB9;
 Thu, 29 Apr 2021 08:35:45 +0000 (UTC)
IronPort-SDR: msk+asfvWB1NchX1FskPLSu+OdaEhCbjt9XtwG+KwEdNDpjYABWZI3tJa0+tY4eBhVnwchZ3yt
 iS4VoTiwSwqg==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="176435777"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="176435777"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:35:44 -0700
IronPort-SDR: IXAwlBSv1l2V3cztIjYl7O4QsR/ymjf6B9zEjLLCsNi5PZZt8kPl9HxhloEP+5/Oz4c5EzUWhs
 PZJsTYa0dLwA==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="423971304"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:35:43 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/selftests: Fix active retire callback alignment
Date: Thu, 29 Apr 2021 09:35:30 +0100
Message-Id: <20210429083530.849546-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210429083530.849546-1-tvrtko.ursulin@linux.intel.com>
References: <20210429083530.849546-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

__i915_active_call annotation is required on the retire callback to ensure
correct function alignment.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c | 2 +-
 drivers/gpu/drm/i915/selftests/i915_active.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index b2c369317bf1..fcde223e26ff 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -63,7 +63,7 @@ static void pulse_put(struct pulse *p)
 	kref_put(&p->kref, pulse_free);
 }
 
-static void pulse_retire(struct i915_active *active)
+__i915_active_call static void pulse_retire(struct i915_active *active)
 {
 	pulse_put(container_of(active, struct pulse, active));
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 4002c984c2e0..1aa52b5cc488 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -51,7 +51,7 @@ static int __live_active(struct i915_active *base)
 	return 0;
 }
 
-static void __live_retire(struct i915_active *base)
+__i915_active_call static void __live_retire(struct i915_active *base)
 {
 	struct live_active *active = container_of(base, typeof(*active), base);
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
