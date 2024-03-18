Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719687E2B6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 05:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944B10E2EE;
	Mon, 18 Mar 2024 04:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/ZriTdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE6110E110;
 Mon, 18 Mar 2024 04:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710735172; x=1742271172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q0B4Vrp20I6xvXHyIvu2roSZtbpiXkTd9aergIICdxM=;
 b=f/ZriTdP2fErudaxJEeN0Al6gDUdWyxvAtPuZqexBMsu/BPLgQ9sa4K9
 qzm8CFK8rPGyoaL/yUQDuBJ5QlVsLMCUdTu1e8Q7gwEPp7IqvoVGpmLH6
 24gwAgicqua2re6ovQSPmcoHunVfy4byJGL3PGrJZGPSfYIJ4oWmyD1qf
 x4xhbM/aDlu7WZZc8BGDg5OvzMeMZriO+l3sjMHcwYUxpxLLxbadoMa9W
 HFN0dmSria9CKYp7dqWDxXrjyqgIb62XpuVd6UcfcpBIR3/pFwSOebFW0
 BSbu5g7vfmzQWefazGPY4PaL8ix7F7sa77WDtQxKyIT+SATMnSQnm/X33 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5393851"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5393851"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2024 21:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44383679"
Received: from tgl-lenovo-03.sh.intel.com ([10.239.87.93])
 by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2024 21:12:48 -0700
From: wangxiaoming321 <xiaoming.wang@intel.com>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: wangxiaoming321 <xiaoming.wang@intel.com>
Subject: [PATCH] drm/xe: Failed getting VMA cause display stuck
Date: Mon, 18 Mar 2024 12:12:44 +0800
Message-Id: <20240318041244.1239610-1-xiaoming.wang@intel.com>
X-Mailer: git-send-email 2.25.1
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

The failure of binding VMA is duing to interrupt,
So it needs to retry while return fail.

Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 99aa5ffb0ef1..d33476b631e1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2621,6 +2621,9 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
+	if (err == -ERESTARTSYS)
+		goto retry_userptr;
+
 	if (err == -EAGAIN) {
 		lockdep_assert_held_write(&vm->lock);
 
-- 
2.25.1

