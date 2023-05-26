Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850B7130BF
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 01:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FD810E1F9;
	Fri, 26 May 2023 23:55:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627F010E0EE;
 Fri, 26 May 2023 23:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685145296; x=1716681296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hr7PS79Li4SrGOWG0A1XfxeUL4PuIY9vXuQcnoazd3E=;
 b=CKVBnO6IemBI6SAMARsCN/SYErWenKHlG7GApAS6v/qTQiwO/X4lP7DK
 YqLf0WJ8NL8SQlg1jCHgteAA1dEhNo1YTtlGby4d2O6hE95cZGfE1l/iB
 VjoRn6nb1uyYSb12lYdBs6tZ+SuW4FG5FY5SKvM+O4t8jXixY1kP0m49S
 oPHlK57xBmmDvrV3ypYAEYm/aNTe+xYqKk2X1aXL9vjfOqiy1YLUnWbMm
 vZKoW8cJSrjB55F8Jn2oyYUcZ2wZbRAYB+MBEultuic/jyJsOi17B2frR
 nevqs1KjGMGFFZ2k/Erf5Nrrs0GPZhLSyNaIuzrxaqVZoEweg5UPiACer A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356716170"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="356716170"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 16:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="829667553"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="829667553"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2023 16:54:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/3] drm/i915/guc: Update log for unsolicited CTB response
Date: Fri, 26 May 2023 16:55:37 -0700
Message-Id: <20230526235538.2230780-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
References: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Instead of printing message fence twice, include HXG header of the
unexpected message and its len.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index af52ed4ffc7fb..3a71bb582089e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -994,9 +994,8 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 		break;
 	}
 	if (!found) {
-		CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
-		CT_ERROR(ct, "Could not find fence=%u, last_fence=%u\n", fence,
-			 ct->requests.last_fence);
+		CT_ERROR(ct, "Unsolicited response message: len %u, data %#x (fence %u, last %u)\n",
+			 len, hxg[0], fence, ct->requests.last_fence);
 		list_for_each_entry(req, &ct->requests.pending, link)
 			CT_ERROR(ct, "request %u awaits response\n",
 				 req->fence);
-- 
2.39.1

