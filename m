Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C9873F5E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FFA113459;
	Wed,  6 Mar 2024 18:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMWZKmPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299F0113447;
 Wed,  6 Mar 2024 18:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749996; x=1741285996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MdmUGdVE3YJNcGT0ctaikYT3SjPsst6Aps8f9S3rDPg=;
 b=LMWZKmPE4pOMJCkZsk/Bschp40VT5PVXkLvjDlkQQwbVunaCk0csEEmJ
 b2PlZaxsZ/6dteOWKnFm0tRIuu59psTAENBD67Fw5Na/FxgAcIy+kXm9E
 7Wo4uaDYtT2+qTuLtwD9WSfUPkobGT+LPrU3BZXwh/UQlE4RO3A8dQFMO
 eNGIkcxcNnetW1uwsHs0yB7iKQzlRdLI9zeRtAko5MoC4K5H0MPijJIrG
 EWagf+XaEg2UyQn65b8CPyVU0s3dS87llbw0+xuFrLxB/y+/cDXnU+zLw
 UCNzJScp8DX1FFG9U1QWFfhN2Tx1xoanZeQQJGx4Ao1wU1AxAeFHkVOPe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102827"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102827"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9989567"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 19/22] drm/ttm: make ttm_caching.h self-contained
Date: Wed,  6 Mar 2024 20:31:24 +0200
Message-Id: <c35ce1a59d0796da32b32e4c8f59464de35f200a.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Include <linux/pgtable.h> for pgprot_t.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/ttm/ttm_caching.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.h
index 235a743d90e1..a18f43e93aba 100644
--- a/include/drm/ttm/ttm_caching.h
+++ b/include/drm/ttm/ttm_caching.h
@@ -25,6 +25,8 @@
 #ifndef _TTM_CACHING_H_
 #define _TTM_CACHING_H_
 
+#include <linux/pgtable.h>
+
 #define TTM_NUM_CACHING_TYPES	3
 
 /**
-- 
2.39.2

