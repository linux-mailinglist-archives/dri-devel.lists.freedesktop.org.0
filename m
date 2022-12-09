Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07B76485E8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AC410E55E;
	Fri,  9 Dec 2022 15:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C2410E559;
 Fri,  9 Dec 2022 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670600967; x=1702136967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1d8DO0y4KPCKgk9FowYpGZO4PZW2hY3vRExtJAWw+og=;
 b=aKfC4IUfiXqYG3Muegn8D/hqmtTVgOqXtRLb+ExPos64pz8Juhqvuby+
 k/Uh5NuddsquRjAyMMqRiXsp0puronfPfoSPhuDQ+rs85/T66YpxRoKyB
 /Fr8rwQYvy675ZeowBH6gCWCRIYXx0YBN/V5RkmGvokASDNvYtq9bvKhN
 XXdsvXOPblCu06YFzKbBRlJnff28BGPA2sDxmsKH/TxVMzRE9BG6N3TsD
 k2wSPPsgrCWzo23uJE1liLkwG4Oo2iHkDdz5RB2BLZmIB5WoJZEFsemmC
 TlBtNCZoH1dUhQxe1VrKp/EVxeCp9xlwqN2AC9ZTdd8/E4uN396Z3iTt1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="315119823"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="315119823"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="647433368"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="647433368"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:23 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/gvt: kill fetch_and_zero usage
Date: Fri,  9 Dec 2022 16:48:42 +0100
Message-Id: <20221209154843.4162814-4-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209154843.4162814-1-andrzej.hajda@intel.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Better use recently introduced kernel core helper.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 077892a9aa8fdc..061302abb0a189 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1831,7 +1831,7 @@ static int init_service_thread(struct intel_gvt *gvt)
  */
 static void intel_gvt_clean_device(struct drm_i915_private *i915)
 {
-	struct intel_gvt *gvt = fetch_and_zero(&i915->gvt);
+	struct intel_gvt *gvt = exchange(&i915->gvt, NULL);
 
 	if (drm_WARN_ON(&i915->drm, !gvt))
 		return;
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 9cd8fcbf7cad16..6699135f366f3f 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -826,7 +826,7 @@ static int dispatch_workload(struct intel_vgpu_workload *workload)
 		/* We might still need to add request with
 		 * clean ctx to retire it properly..
 		 */
-		rq = fetch_and_zero(&workload->req);
+		rq = exchange(&workload->req, NULL);
 		i915_request_put(rq);
 	}
 
@@ -1103,7 +1103,7 @@ static void complete_current_workload(struct intel_gvt *gvt, int ring_id)
 				intel_vgpu_trigger_virtual_event(vgpu, event);
 		}
 
-		i915_request_put(fetch_and_zero(&workload->req));
+		i915_request_put(exchange(&workload->req, 0));
 	}
 
 	gvt_dbg_sched("ring id %d complete workload %p status %d\n",
-- 
2.34.1

