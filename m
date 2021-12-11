Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24D470FB3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2750610E6A0;
	Sat, 11 Dec 2021 01:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FF410E694;
 Sat, 11 Dec 2021 01:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639184517; x=1670720517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pkZ5oGZpmE9L2bL1T8OuRvYDxUcqbETN4jiXCAWHzeA=;
 b=L+CHz85xcThZcrvtBTWJaySSipMFZoLgn/BGM0KvrCVxK+v3ZtiwMQM/
 WY5Sqm6nRTFQQav+XhP8jhRfrGMpA/jCuyOTfbfY8HrOkH2pEIcUHIW9W
 K/5wQDcYneE+Prg+XtI3LTRjYHB/hQ5A59wLZGhh60VZSNU6oErfRLCLg
 O0ZSdc/tGLKy7g5N3I0/4vswXp7hnm41o0DBg1D+nEejdzUCaOFruxqr8
 maB7gbWHMHHc/69hwb0YnKaEurpZ/mx4P9QHja18dx5pqPD3C9oIb4/in
 W4kcxDQyNC6P4RmDpaeQGe3aWlIBJj/RrqEsw+3HAoFh+3US442+uPsuF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238298249"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="238298249"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517002967"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/i915/guc: Add extra debug on CT deadlock
Date: Fri, 10 Dec 2021 16:56:10 -0800
Message-Id: <20211211005612.8575-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211005612.8575-1-matthew.brost@intel.com>
References: <20211211005612.8575-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index a0cc34be7b56..ee5525c6f79b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -523,6 +523,15 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
 		CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
 			 ktime_ms_delta(ktime_get(), ct->stall_time),
 			 send->status, recv->status);
+		CT_ERROR(ct, "H2G Space: %u\n",
+			 atomic_read(&ct->ctbs.send.space) * 4);
+		CT_ERROR(ct, "Head: %u\n", ct->ctbs.send.desc->head);
+		CT_ERROR(ct, "Tail: %u\n", ct->ctbs.send.desc->tail);
+		CT_ERROR(ct, "G2H Space: %u\n",
+			 atomic_read(&ct->ctbs.recv.space) * 4);
+		CT_ERROR(ct, "Head: %u\n", ct->ctbs.recv.desc->head);
+		CT_ERROR(ct, "Tail: %u\n", ct->ctbs.recv.desc->tail);
+
 		ct->ctbs.send.broken = true;
 	}
 
-- 
2.33.1

