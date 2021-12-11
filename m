Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2D471504
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 18:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684AF10E5FD;
	Sat, 11 Dec 2021 17:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE09B10E41B;
 Sat, 11 Dec 2021 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639244474; x=1670780474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EAI1zzp+pVh0LIc0SItFf3X1uGyMPd6uOR9y7CfFiI8=;
 b=MamXc0OOUL2QlS6tkl1Wu8ZgMgBIgUpxp7JO5p0XVdwcZiGEQixxq8z4
 6SO63X12Vp27oCb+UrTBp0b9bteGMSOvEm0w6GEhWxwvG+fkSN5OmMx3W
 Eq6Fl1E7IzYd8FStgwXNqW18Nm/nLUJ+Wr2TW43y8WSv1EBRLoAZCqZu4
 bdZ0yCTMz8EdwaFPkxdDpDMi0YBPX2bGCNZI2uX0X5/trn/ivaEJvpCYP
 RWb2Ho9BK1PyXJR9HnCm0pv+Ykv2x/rYwUlYra7ZTyN6N6pPw0+teALTf
 A5JWJzPSmvvD9djzBEkvPvJ/V0sBZwhm1vm9U+WSDT2fwG7qCH9b8G4tp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="238493212"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="238493212"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="602548112"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/i915/guc: Add extra debug on CT deadlock
Date: Sat, 11 Dec 2021 09:35:43 -0800
Message-Id: <20211211173545.23536-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211173545.23536-1-matthew.brost@intel.com>
References: <20211211173545.23536-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print CT state (H2G + G2H head / tail pointers, credits) on CT
deadlock.

v2:
 (John Harrison)
  - Add units to debug messages

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index a0cc34be7b56..741be9abab68 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -523,6 +523,15 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
 		CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
 			 ktime_ms_delta(ktime_get(), ct->stall_time),
 			 send->status, recv->status);
+		CT_ERROR(ct, "H2G Space: %u (Bytes)\n",
+			 atomic_read(&ct->ctbs.send.space) * 4);
+		CT_ERROR(ct, "Head: %u (Dwords)\n", ct->ctbs.send.desc->head);
+		CT_ERROR(ct, "Tail: %u (Dwords)\n", ct->ctbs.send.desc->tail);
+		CT_ERROR(ct, "G2H Space: %u (Bytes)\n",
+			 atomic_read(&ct->ctbs.recv.space) * 4);
+		CT_ERROR(ct, "Head: %u\n (Dwords)", ct->ctbs.recv.desc->head);
+		CT_ERROR(ct, "Tail: %u\n (Dwords)", ct->ctbs.recv.desc->tail);
+
 		ct->ctbs.send.broken = true;
 	}
 
-- 
2.33.1

