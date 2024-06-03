Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED6D8D7B24
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 07:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753FF10E2A4;
	Mon,  3 Jun 2024 05:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYXOw3hH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9EA10E291;
 Mon,  3 Jun 2024 05:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717394372; x=1748930372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E9j6q8PCJEm9kMj4BuzX9ZCmgnl1BJhdUlLOTaeEitk=;
 b=BYXOw3hHuegn/EsFa3MB0puyUHie7L/eG7kvhry9GYRysCV248y2zqDQ
 BdwyS1iSx3kQ0wjlZ5CsUrsAD93JuE/D7EqmykTKsP1VeTVqutvG0D87b
 /ugkUWhki+FNTD8uTRo75KK5LgcCJAoTwdKDROd46ByiqB08Oc3GuzFsJ
 Ye0T++l56lFlUyhrKUHHF8zHHG8DFk5FmZX0arruDmzVt8PSz5oJcdec5
 myoBK8LTiMNYUh74lpHZYrJgeiQh/ZiTUiaFZcuzmC55f0mTUwWVkJrpN
 bfGbVTq1LQklav6PaHuyDwtgSUJNzfoZ6W8UqdZdGxsX+2qj1g22+KqFV w==;
X-CSE-ConnectionGUID: 76rreH0tRgyHAbeGEHxTxg==
X-CSE-MsgGUID: TxIYRi18RqW3m+DJ1qJSpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24527522"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24527522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 22:59:32 -0700
X-CSE-ConnectionGUID: 8tjx8cioQN2RvFKPkIQnTg==
X-CSE-MsgGUID: v3jqxv0HS3eqmIXHSevZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="67616492"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 02 Jun 2024 22:59:31 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 4/8] drm/dp: Add refresh rate divider to struct
 representing AS SDP
Date: Mon,  3 Jun 2024 11:19:00 +0530
Message-Id: <20240603054904.222589-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
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

