Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F03830EF1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266D310E899;
	Wed, 17 Jan 2024 22:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F0310E88C;
 Wed, 17 Jan 2024 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528906; x=1737064906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Dq1kI5bDtk1FZgTD5fpOED/D+/k0o0UZYIn9HvhAPM=;
 b=G6TjYHxYrQwzQ1lKIRX4RW6cI8cXFwSUaO0/TwTCwcAh7OSeAzNGoHrV
 EBf2finWHHZdNCbpB23X+4/b7aT4LjkQ0tj1GA09hmVsw1U4L8wk+7ems
 Kq4yjLU/LNWdGYrZxdkREEE0jcwOBxk7PVKmQd2EE0fDZzs2Pxe8Y/z3D
 kWX6SfN2sLuhh0zmz/JRDFZPoBGlwCf7BY6GP8y1G0Ew8/73UjDxk/JrT
 8Qo6JJbOoxkmJ27/rUP9cEaQn0xcL8EbZUPBBhANzEplE02hc6RhaGXxU
 tRJQlShxSQpr9g7Vj7Cl9JZGMGnpxTvJRrQYnXoaqU36eBAYChsZWkjV/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657617"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657617"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089228"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089228"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 04/23] drm/xe/svm: Trace svm creation
Date: Wed, 17 Jan 2024 17:12:04 -0500
Message-Id: <20240117221223.18540-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

xe_vm tracepoint is extended to also print svm.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..63867c0fa848 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -467,15 +467,17 @@ DECLARE_EVENT_CLASS(xe_vm,
 		    TP_STRUCT__entry(
 			     __field(u64, vm)
 			     __field(u32, asid)
+			     __field(u64, svm)
 			     ),
 
 		    TP_fast_assign(
 			   __entry->vm = (unsigned long)vm;
 			   __entry->asid = vm->usm.asid;
+			   __entry->svm = (unsigned long)vm->svm;
 			   ),
 
-		    TP_printk("vm=0x%016llx, asid=0x%05x",  __entry->vm,
-			      __entry->asid)
+		    TP_printk("vm=0x%016llx, asid=0x%05x, svm=0x%016llx",  __entry->vm,
+			      __entry->asid, __entry->svm)
 );
 
 DEFINE_EVENT(xe_vm, xe_vm_kill,
-- 
2.26.3

