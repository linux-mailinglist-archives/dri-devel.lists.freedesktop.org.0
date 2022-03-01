Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7214F4C9903
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1177C10E85F;
	Tue,  1 Mar 2022 23:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5E410E7BB;
 Tue,  1 Mar 2022 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176587; x=1677712587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KRamTtQhPU13Ubh/Vuuh3ZqWdZURUtxBTuC0SLUkMJU=;
 b=Oa4sC0mBdZBav8wnAcnAODuzs7JFed0JTz6V0oOrwj6aeIgF2941PshM
 57SJUPMVmZ8JXQ+R9nme+aXfqPwWBm1zsrLF/PWgyg+tWayo4fq7BJueW
 XiEAlINaP7BbIz2ll/Va6mGxc3hDDaqcFfKxwTWKzaKj/753rhb38k4r2
 DS49B4YVy4HeKPQ321vCdiNQn0kb04ZzO9f7Wjc5hEBQAbxSuGmcmV+if
 oZTo26c9uKmbkQBE1wILs17UwqQEVFB3YXDoM3LwQziVePqLljs7xEHTj
 /8TNDWXwQd6wS03qf1lZIJAA3QHLUY3B4sOeWW7hqo7v9Z7kjosJSOHtb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479051"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479051"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253451"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 02/13] drm/i915/xehp: CCS shares the render reset domain
Date: Tue,  1 Mar 2022 15:15:38 -0800
Message-Id: <20220301231549.1817978-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301231549.1817978-1-matthew.d.roper@intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reset domain is shared between render and all compute engines,
so resetting one will affect the others.

Note:  Before performing a reset on an RCS or CCS engine, the GuC will
attempt to preempt-to-idle the other non-hung RCS/CCS engines to avoid
impacting other clients (since some shared modules will be reset).  If
other engines are executing non-preemptable workloads, the impact is
unavoidable and some work may be lost.

Bspec: 52549
Original-author: Michel Thierry
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 3190b7b462a9..3150c0847f65 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -341,6 +341,10 @@ static u32 get_reset_domain(u8 ver, enum intel_engine_id id)
 			[VECS1] = GEN11_GRDOM_VECS2,
 			[VECS2] = GEN11_GRDOM_VECS3,
 			[VECS3] = GEN11_GRDOM_VECS4,
+			[CCS0]  = GEN11_GRDOM_RENDER,
+			[CCS1]  = GEN11_GRDOM_RENDER,
+			[CCS2]  = GEN11_GRDOM_RENDER,
+			[CCS3]  = GEN11_GRDOM_RENDER,
 		};
 		GEM_BUG_ON(id >= ARRAY_SIZE(engine_reset_domains) ||
 			   !engine_reset_domains[id]);
-- 
2.34.1

