Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEA781ADF1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508A010E658;
	Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB0810E638;
 Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Dq1kI5bDtk1FZgTD5fpOED/D+/k0o0UZYIn9HvhAPM=;
 b=Z3whQpVsjlY4IgJKiCiABMSBuPeqXcPq5p7buDITUPJgW9coBt0B1Uq9
 HtUWyu4XF7EhuklWkcmoHP8XACGV8JWzHHrUcrmYap1uIIKhKOkCYvTpN
 a5FdwNB4Y/GQ9p4vYPc8PlHcB9XdpYuOOdj7XTraYz7RR7J1dhQqETmsN
 J58wL9rVdU53cz7nBVbIRXC+97i2/85DTBa8pTW43DDriKtclw1djkvjm
 4MySwZLPi4UYeORbOAZ5Bt4HbzDXXAqHSOZ5n0m/SZF8vAs40djcQUBIN
 /iFIaFwQT0wTFdJRvdHowhFVyYZEJLtloKi9char5Nfi3jvqN9MSBLckw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069763"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069763"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481349"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481349"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 04/22] drm/xe/svm: Trace svm creation
Date: Wed, 20 Dec 2023 23:37:54 -0500
Message-Id: <20231221043812.3783313-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
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

