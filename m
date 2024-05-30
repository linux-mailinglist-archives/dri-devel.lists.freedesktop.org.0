Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9CA8D4558
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FCD11B470;
	Thu, 30 May 2024 06:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlDhIDj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BF411B465;
 Thu, 30 May 2024 06:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717049682; x=1748585682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E9j6q8PCJEm9kMj4BuzX9ZCmgnl1BJhdUlLOTaeEitk=;
 b=TlDhIDj4G70W+sOAlc/CuNsXbUX6IReD96MYC9EsEOH9FYN6LG13CO4E
 Hbmt433NMeZNQDJLNcLsXeIN4x5DAl8J4hiJpR7rKlBuuTx2SjYG1nrkV
 b/LRMpwYEsg8fOj0iC6rO1nruY27R4p4awx9I7AnVAK5ZkmA+5os4XRLU
 TnifWRNjWO4AYgJRGtyrf8MfFLVdFmt0Mxo9ybZBUOJQvJqnSqVmJxvn5
 WRYFrFDhT6Hz7tlOb6CkYGX3+Ap0unm7sTxE3k4fDX4WvBc2LO+/oX++V
 rdehYVfqRnbO52q2FlxY+uZuBI3+IVZRZdbT97/+ZQnFcJwXyz+3j87or w==;
X-CSE-ConnectionGUID: jls9SO9NRnqHJwZNa9ds2g==
X-CSE-MsgGUID: yHU6FiYkRimPb8d/dlc1/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24915525"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24915525"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 23:14:42 -0700
X-CSE-ConnectionGUID: XNHtMublQ7uouQAfEFGesg==
X-CSE-MsgGUID: 2Nh899uuRE2/yutk8DDqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="36335683"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 29 May 2024 23:14:40 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v10 5/8] drm/dp: Add refresh rate divider to struct
 representing AS SDP
Date: Thu, 30 May 2024 11:34:05 +0530
Message-Id: <20240530060408.67027-6-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
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

