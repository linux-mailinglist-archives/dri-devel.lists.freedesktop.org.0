Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0C8179C0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8A210E37E;
	Mon, 18 Dec 2023 18:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5011710E37D;
 Mon, 18 Dec 2023 18:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702924224; x=1734460224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tn96S0eZ3dcb7iDVE5QpZLLWb2DTkhiEreY4SwFirIc=;
 b=k6l3Wz4F0IzULgopH9WEoXcG3w7q5NuZrcsJXciy2P5jy12dt6yWJ6fL
 OxqoOG+2sExJJbohAK4EOAJAHYsczQ9gU6xN0VnEcFTE2FaC4nIrnGzeb
 UOhRQOlhTDyFJ2yYJCGJ9AMWqkju223AFv4mqBWrhC4Q2LF4uFxSl9MiC
 FdXB2/FR30n/bb12yj0uMrg4EDAIwjHNb87K1HChZb0g9CYB9yyFqUfTI
 6dYIPEKkTzgyoqDcFBAYTIWXR7fGOGkVQ61LlmzjIDp/SUsAwnKtV6A3f
 8zYUl6TvnLMeVAEgMqdqDjnpIpUFMs2Kkz+D/AsoaZpvzL4f0XNl3WM9V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="392714111"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="392714111"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 09:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779176569"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779176569"
Received: from etrunovx-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.35.24])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 09:50:18 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm: Add eDP 1.5 early transport definition
Date: Mon, 18 Dec 2023 19:49:58 +0200
Message-Id: <20231218175004.52875-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218175004.52875-1-jouni.hogander@intel.com>
References: <20231218175004.52875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DP_PSR_ENABLE_SU_REGION_ET to enable panel early transport.

Cc: dri-devel@lists.freedesktop.org

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 3731828825bd..281afff6ee4e 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -718,6 +718,7 @@
 # define DP_PSR_SU_REGION_SCANLINE_CAPTURE	BIT(4) /* eDP 1.4a */
 # define DP_PSR_IRQ_HPD_WITH_CRC_ERRORS		BIT(5) /* eDP 1.4a */
 # define DP_PSR_ENABLE_PSR2			BIT(6) /* eDP 1.4a */
+# define DP_PSR_ENABLE_SU_REGION_ET             BIT(7) /* eDP 1.5 */
 
 #define DP_ADAPTER_CTRL			    0x1a0
 # define DP_ADAPTER_CTRL_FORCE_LOAD_SENSE   (1 << 0)
-- 
2.34.1

