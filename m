Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4317C470FAA
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B9010E68D;
	Sat, 11 Dec 2021 01:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A32710E68E;
 Sat, 11 Dec 2021 01:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639184516; x=1670720516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+t+IYa+onmrRcxvOJjKYFtf3l6LDynZbl3ClATBruNA=;
 b=QsugoUZ455YdmHSInKxjQdjgxtow4KoyQ4/GD/TQNLlNNTj+cJtGNjeh
 hHu3ctl8LGnp49lo7WoqbC6ibT1utSK+lg0r3aQaAjW5Q9O/KU4TJcu+M
 UonvSivPbinJL4q6sYdCqf6w3lDvO7YUgSPYdH7K+Vqg8/coPCVk+DrWq
 O0FTDgDEN67n0lan00wroT6xKDP2txZtM2wBr+l58peExbZymdZBmezkc
 DGjX6MLE1Sowl2sJcTpNu0sB8gUeUOqVaGdkRHOZc2agGuxjTQQldn1et
 qeUXYDpbwefRHVinUykTr3X0yD69L+jwOKTpxWiKoQ7huKDTn229G1E2p w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238298246"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="238298246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517002955"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/i915/guc: Remove racey GEM_BUG_ON
Date: Fri, 10 Dec 2021 16:56:08 -0800
Message-Id: <20211211005612.8575-4-matthew.brost@intel.com>
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

A full GT reset can race with the last context put resulting in the
context ref count being zero but the destroyed bit not yet being set.
Remove GEM_BUG_ON in scrub_guc_desc_for_outstanding_g2h that asserts the
destroyed bit must be set in ref count is zero.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0fb2eeff0262..36c2965db49b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1040,8 +1040,6 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 
 		spin_unlock(&ce->guc_state.lock);
 
-		GEM_BUG_ON(!do_put && !destroyed);
-
 		if (pending_enable || destroyed || deregister) {
 			decr_outstanding_submission_g2h(guc);
 			if (deregister)
-- 
2.33.1

