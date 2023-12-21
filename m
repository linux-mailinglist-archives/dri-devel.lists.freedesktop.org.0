Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B74781C10E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D994610E72C;
	Thu, 21 Dec 2023 22:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128BF10E718;
 Thu, 21 Dec 2023 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703197695; x=1734733695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8K/h1/j4SNbUYxEYWeTpA8KkHoZAgBmuZ8QW30qjzF4=;
 b=KvPByV5lTreEXNsOWmk5W0S1icsdWPg2nNa1hd+YCr3taNcPd7kZLYm/
 ONz0BfAKwEH3klmxL0V2yVMAQpZUZmXAlkLKNejCNm8I9aQcFhWcwv6Ac
 s9IH51HNFFiL2N6odIFIhV8upI56OeHtEqP6eNMiQt7ukb1T05Gdd/UM6
 iPF+g1jysXuWqXXo3sFO0gCFEvaS6uAjKtKNoLOD7HD9PUTq6FXHPbNtM
 xOTElAdxFP5fr/Ty//5qJLvzdq1mieBY7pnB83RR3XmkLybkOkUKYRgpq
 nYaa0U8zgQWdHc1vIPT5Lz8eAjGK7SzZZ+LVXtnlvX27rOuf6Ct34jFqE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2876531"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2876531"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920458222"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920458222"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/xe: Fix cast on trace variable
Date: Thu, 21 Dec 2023 14:28:08 -0800
Message-Id: <20231221222809.4123220-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221222809.4123220-1-lucas.demarchi@intel.com>
References: <20231221222809.4123220-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 daniel.vetter@ffwll.ch, ogabbay@kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cast the pointer to unsigned long and let it be implicitly extended to
u64. This fixes the build on 32bits arch.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..e4e7262191ad 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -31,7 +31,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->fence = (u64)fence;
+			   __entry->fence = (unsigned long)fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
-- 
2.40.1

