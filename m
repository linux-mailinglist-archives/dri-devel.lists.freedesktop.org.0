Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824B8763CD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39B111389C;
	Fri,  8 Mar 2024 11:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GG7iNoFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AE911388D;
 Fri,  8 Mar 2024 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899037; x=1741435037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8uVRDOzaaFZdZ+mhJs2cTvzBRyLjiIu6MVzg+k8KHA=;
 b=GG7iNoFt50cRtr4VgTliWiq+xGLYhXP8cNPgyB82gk7NxpLO+A1GvpuE
 GmZqwxlP7FqRaoJKKj/CYDlZM6qntU9HFiAPeiYOdCJV7uVM4Vf7Yz5SP
 d9G7ArX6ERi5gi+TpikZ/KQrJbevzfJ1y+nDOTi/OZWss1E9ucyHz6+iK
 A2yDTWEIEeWzsZdp3xW1fTcTuPrwUHN4/VUuDah0rndUtEX1PNhfXYyNf
 zFNnzP8/Qn//O0GEsDtG7Q9asltGyGoCDFB/CRAEiZb23gG2U0mAjpEra
 UtxaRBnm1/f7J26Tx9EJmwJnq6THMN+vF7Qz6Y6NpRu5wbpraxuKynjds g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4794566"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4794566"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10378597"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v2 10/16] drm/ttm: make ttm_caching.h self-contained
Date: Fri,  8 Mar 2024 13:55:48 +0200
Message-Id: <fb87ab4b4490c53e9ece66d53c4f178ead244cb5.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

