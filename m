Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9A8FD3B1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 19:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF32410E6D5;
	Wed,  5 Jun 2024 17:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCnKuTVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044BF10E64E;
 Wed,  5 Jun 2024 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717607496; x=1749143496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E9j6q8PCJEm9kMj4BuzX9ZCmgnl1BJhdUlLOTaeEitk=;
 b=PCnKuTVKJgzKTa0viKES9ycKo+BjmPrXLcP5XkffJIjk5YUd2sjrsyHd
 Mm8LIbBlqYv+GBRDJLF/0qabtW68eILBvakaWZuVKe4v9R8cSFiI52zoX
 twvtNZz7kt4/Wxyz6cgM9nkqeXzrGu2QLsUFhYf210seH0nnN8v7yuegx
 Nz5G9H8jkLHDXp0GVsRgInjpace89TO2wuh1kVHWhT8j5+cesGkQnjNU6
 Sd9slIbMrZs8r1XMSRokh6icm4wOyilGYqdVygiFx1/RmsVAHbDrPtlwJ
 A24zvUwaOuCLyMWHXBLc0I4VtnTR1wJl5/NLwWtO01seK/3nhHYe4enN/ A==;
X-CSE-ConnectionGUID: z+cilNyxSkyOKOJVCNLVtA==
X-CSE-MsgGUID: PGV+NUYfSTadtxvFwxBT/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14452447"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14452447"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:11:36 -0700
X-CSE-ConnectionGUID: 2Ms2QbDhTq6OsAZ3Cu83pQ==
X-CSE-MsgGUID: VQeMbZufTMeUZafLSm7s1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="60848407"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2024 10:11:35 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v13 5/9] drm/dp: Add refresh rate divider to struct
 representing AS SDP
Date: Wed,  5 Jun 2024 22:31:07 +0530
Message-Id: <20240605170111.494784-6-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add target_rr_divider to structure representing AS SDP.
It is valid only in FAVT mode, sink device ignores the bit in AVT
mode.

--v2:
- Update commit header and send patch to dri-devel.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm/display/drm_dp_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8defcc399f42..ea03e1dd26ba 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -122,6 +122,7 @@ struct drm_dp_as_sdp {
 	int target_rr;
 	int duration_incr_ms;
 	int duration_decr_ms;
+	bool target_rr_divider;
 	enum operation_mode mode;
 };
 
-- 
2.25.1

