Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25E46C4AE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19F26ED99;
	Tue,  7 Dec 2021 20:31:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697326E43A;
 Tue,  7 Dec 2021 20:31:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="237486067"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="237486067"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="657837959"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2021 12:19:33 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 3/3] drm/i915/guc: Don't go bang in GuC log if no GuC
Date: Tue,  7 Dec 2021 12:19:32 -0800
Message-Id: <20211207201932.240050-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207201932.240050-1-John.C.Harrison@Intel.com>
References: <20211207201932.240050-1-John.C.Harrison@Intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

If the GuC has failed to load for any reason and then the user pokes
the debugfs GuC log interface, a BUG and/or null pointer deref can
occur. Don't let that happen.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
index 46026c2c1722..8fd068049376 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
@@ -31,7 +31,7 @@ static int guc_log_level_get(void *data, u64 *val)
 {
 	struct intel_guc_log *log = data;
 
-	if (!intel_guc_is_used(log_to_guc(log)))
+	if (!log->vma)
 		return -ENODEV;
 
 	*val = intel_guc_log_get_level(log);
@@ -43,7 +43,7 @@ static int guc_log_level_set(void *data, u64 val)
 {
 	struct intel_guc_log *log = data;
 
-	if (!intel_guc_is_used(log_to_guc(log)))
+	if (!log->vma)
 		return -ENODEV;
 
 	return intel_guc_log_set_level(log, val);
-- 
2.25.1

