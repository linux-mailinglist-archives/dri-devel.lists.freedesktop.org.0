Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D17466E44
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 01:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF9B6FCFA;
	Fri,  3 Dec 2021 00:06:41 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0606FC9E;
 Fri,  3 Dec 2021 00:06:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="224114174"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="224114174"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 16:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="513445220"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 02 Dec 2021 16:06:24 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 4/4] drm/i915/guc: Don't go bang in GuC log if no GuC
Date: Thu,  2 Dec 2021 16:06:23 -0800
Message-Id: <20211203000623.3086309-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203000623.3086309-1-John.C.Harrison@Intel.com>
References: <20211203000623.3086309-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

If the GuC has failed to load for any reason and then the user pokes
the debugfs GuC log interface, a BUG and/or null pointer deref can
occur. Don't let that happen.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
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

