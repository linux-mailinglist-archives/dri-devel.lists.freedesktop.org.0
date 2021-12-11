Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C0470FA7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACC710E68B;
	Sat, 11 Dec 2021 01:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0351A10E68B;
 Sat, 11 Dec 2021 01:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639184515; x=1670720515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RR4OQyl93P6Xjlr+tous2lVRL+UUgd6EMt1s2adyaVM=;
 b=YxxMVs5IoFGNYGK/wsUmPGHTaVqYyDDpE8k2x6tMwgZOW9Hw311NU0SY
 eTlfEvvxIO/Jx1txgw99zW+CMSHIBoHZwUcmKPj0brSNmogsMEDlXGDO5
 kjzscI6a4bNxExRAZ1Q6FR+J5Ml+O3nJZ6PP3LZYXYQ0swVNsbZdLfb+9
 rEdkP5u9dHwp449g4MLvIPBpCN6Of4X0qADbt90i83bwEH0LCwo8U4iNl
 KEUbRfk9Ex175vs8o1c0/TLDUxuvRQL3GuXt93awOutgHGaaKX7k/R1eu
 RAw2CDguV8cdbL/UbpoHSk/cOqBE2a1bDKrPOXvdsrxhLmXLcVJd4HbKv g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238298242"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="238298242"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517002947"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/7] drm/i915/guc: Use correct context lock when callig
 clr_context_registered
Date: Fri, 10 Dec 2021 16:56:06 -0800
Message-Id: <20211211005612.8575-2-matthew.brost@intel.com>
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

s/ce/cn/ when grabbing guc_state.lock before calling
clr_context_registered.

Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 1f9d4fde421f..9b7b4f4e0d91 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1937,9 +1937,9 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
 		list_del_init(&cn->guc_id.link);
 		ce->guc_id = cn->guc_id;
 
-		spin_lock(&ce->guc_state.lock);
+		spin_lock(&cn->guc_state.lock);
 		clr_context_registered(cn);
-		spin_unlock(&ce->guc_state.lock);
+		spin_unlock(&cn->guc_state.lock);
 
 		set_context_guc_id_invalid(cn);
 
-- 
2.33.1

