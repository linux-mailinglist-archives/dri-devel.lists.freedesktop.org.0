Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED636E7B5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997E96EDC1;
	Thu, 29 Apr 2021 09:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB7E6EDC6;
 Thu, 29 Apr 2021 09:13:04 +0000 (UTC)
IronPort-SDR: McAqpJm08l6ynbO8BQJBPC3tkcUtALb5in3XMO72iHz+On13OdieXUm76K3zPyI1Zc49X+sQ6e
 +d7bAbNAB5ag==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197011300"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="197011300"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:04 -0700
IronPort-SDR: 0KcNisBkZuRp8Krk6VEh6HMHb3wApNVj0RPW6xdcoFEzhOckCg3biSosmmpv4Dv6sX0cMXPkjE
 2Oy+JRZ82VIA==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="537298800"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:02 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915/debugfs: Expose read mask in i915_wa_registers
Date: Thu, 29 Apr 2021 10:12:50 +0100
Message-Id: <20210429091254.855248-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
References: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
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

In order to stop conflating the validation via readback with the
workaround mask I need to expose the read mask separately so
gem_workarounds IGT can continue operating correctly.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 8dd374691102..b9c81376a413 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -757,9 +757,9 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
 			   engine->name, count);
 
 		for (wa = wal->list; count--; wa++)
-			seq_printf(m, "0x%X: 0x%08X, mask: 0x%08X\n",
+			seq_printf(m, "0x%X: 0x%08X, mask: 0x%08X, read: 0x%08X\n",
 				   i915_mmio_reg_offset(wa->reg),
-				   wa->set, wa->clr);
+				   wa->set, wa->clr, wa->read);
 
 		seq_printf(m, "\n");
 	}
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
