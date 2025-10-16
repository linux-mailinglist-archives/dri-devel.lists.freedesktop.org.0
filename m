Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2D4BE5726
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAF010EA87;
	Thu, 16 Oct 2025 20:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5akdv3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBC610E34E;
 Thu, 16 Oct 2025 20:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760647712; x=1792183712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VojKqQetECs3wH82m1BrWDNqMv2fIYDpi0NhK2H5qhA=;
 b=H5akdv3d0HCVe9tvhiwRQTpdxlYw9tJlnUpy7ffqLy1EbTlK5w8afotG
 abzFDJZNpzbHGUcE/hBhOq+dQTs9rTIKfsn9XJ2CagEH0mdofyJYnCIhR
 asSxVnpYg+qm3GoZrvcZkqrkWeAkVRgEWQx/pxHhPWJy6rP8fCNOeyDGa
 FADQYqabn4azCWN4Rn4yVenCIBg0coCjmTIyJiIa18xc78ETFhponlcVP
 pMrGH5pRp7viZwV75Eh/52PoAzudI5p/ABwmG9s9E49gIPh2dEGJLitJ2
 RS5R2xQ29id7uhl9SXiVLyL4x/CNXktTHakor20gEPgAZlJIwiM9Ks5v1 Q==;
X-CSE-ConnectionGUID: qB7DGaBKQ3qRoBZ0YxFTrw==
X-CSE-MsgGUID: MsXAp82hQvats1eG76lb+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65472206"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65472206"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:31 -0700
X-CSE-ConnectionGUID: 4nxExvxUR4SXN1g1FBPMkw==
X-CSE-MsgGUID: oGR3SeaiQhOgR9WrGzJM4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186572844"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3 7/7] drm/xe: Only toggle scheduling in TDR if GuC is running
Date: Thu, 16 Oct 2025 13:48:26 -0700
Message-Id: <20251016204826.284077-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016204826.284077-1-matthew.brost@intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the firmware is not running during TDR (e.g., when the driver is
unloading), there's no need to toggle scheduling in the GuC. In such
cases, skip this step.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index bb1f2929441c..ea0cfd866981 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1146,7 +1146,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		if (exec_queue_reset(q))
 			err = -EIO;
 
-		if (!exec_queue_destroyed(q)) {
+		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
 			/*
 			 * Wait for any pending G2H to flush out before
 			 * modifying state
-- 
2.34.1

