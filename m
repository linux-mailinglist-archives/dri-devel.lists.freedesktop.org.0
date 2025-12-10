Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A65CB2C34
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7519F10E6CD;
	Wed, 10 Dec 2025 11:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4mnLRPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3956010E6CD;
 Wed, 10 Dec 2025 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765364900; x=1796900900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXDhClxx77FjRlfoI7lh96LeNFyEQPM7TrkQFQa4Q8I=;
 b=j4mnLRPgO+nT6Hpi/5lL2b9tTDWv4BcHM3jZksIbfhx+5mch51VV1cQS
 wY9HSuskoZSC1KKRc94rLMjrNaMib4cWz0z4qCA+oSsuQgEX94dFljlmp
 r6cUbwuxS8SDRuFCuW/oVqnbC44fOc+HbbVrs+U3uWbn6FAIMRxay2nFd
 TVfRUcWzXAHXgg8Ez2xKZ0VtBnzOGiKBa+jgFUo3BJUu+4AZ74+uPYCH8
 W9e8KXK4IxDAudeKI8QRFQuXc+mKojQyTE3zRi/nD/IQptsjYRvoTvVY5
 OSNHU95wXaksUFbRwpaf7MKEWVe8V5YDx5YyhQ3JAKY6Ut6JaNxiMbSsN A==;
X-CSE-ConnectionGUID: pYrEJO8PT8Klo28PzO0ODg==
X-CSE-MsgGUID: sSwrnVVfRLa7H9WFhRQDag==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67221731"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67221731"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:08:20 -0800
X-CSE-ConnectionGUID: hwCss/ZpTAKlF8QhrjNsxg==
X-CSE-MsgGUID: wkqX9HWURV+qXb1FUS9vxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196486915"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:08:17 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v3 01/22] drm/xe/svm: Fix a debug printout
Date: Wed, 10 Dec 2025 12:07:21 +0100
Message-ID: <20251210110742.107575-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid spamming the log with drm_info(). Use drm_dbg() instead.

Fixes: cc795e041034 ("drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: <stable@vger.kernel.org> # v6.17+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 46977ec1e0de..36634c84d148 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -948,7 +948,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
 
 	if (xe_svm_range_in_vram(range)) {
-		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
+		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
 		return false;
 	}
 
-- 
2.51.1

