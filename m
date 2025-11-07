Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC83C3FA2F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6958610EA8A;
	Fri,  7 Nov 2025 11:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpVNJ+qC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA97510EA80;
 Fri,  7 Nov 2025 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762513530; x=1794049530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SpjW6+QJtZFYJdoi5wxCVALIfv+P9DVUZXkmIvcfuP0=;
 b=mpVNJ+qCf+IO80qIAGbTHRs+6yztkzNDLdmNxgDqBaFMRxKJ+bfSKlpZ
 ZLUOS8NFtudoAVvELo1/PxhlDSEPEfPxuQ9E5YQ5IMCFxTIS5BtqahM3t
 q899zc56VP+ahxDNU2ZoErv7nFGtwdugPF3BfhiElmWdpuv5kMAhf796j
 fgt/qsaWIR4fIu3/b2xwSiJQvKhapPpc2+9zueHeAoMiCYXxDejU2FoDX
 /K5hgU7rFHRcrjgWXoCqrT6sdULEvEvF2XM1VNzjS9OHXb15hdLiKKVFS
 GXwED26yrtkJ6v2+53ARLogmp+Xh0H/oMBzDkrgC2DbD+uu6ResIKSaDd A==;
X-CSE-ConnectionGUID: Z/CxDvACTKyDVcQd0cmv4g==
X-CSE-MsgGUID: 3IHTJzJSRj2bt0Vdl9NEbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68522895"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="68522895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:29 -0800
X-CSE-ConnectionGUID: yDaa0XW0T6GMciZLKlX47Q==
X-CSE-MsgGUID: DNPqvI2SQ1izs7/9LnIQJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="218756186"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 4/6] drm/tidss: use drm_crtc_vblank_crtc()
Date: Fri,  7 Nov 2025 13:04:58 +0200
Message-ID: <ffd5ebe03391b3c01e616c0c844a4b8ddecede36.1762513240.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762513240.git.jani.nikula@intel.com>
References: <cover.1762513240.git.jani.nikula@intel.com>
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

We have drm_crtc_vblank_crtc() to get the struct drm_vblank_crtc pointer
for a crtc. Use it instead of poking at dev->vblank[] directly.

Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 411b1a25e29c..8f81eb560b9e 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -248,8 +248,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 	dispc_vp_enable(tidss->dispc, tcrtc->hw_videoport);
 
 	if (crtc->state->event) {
-		unsigned int pipe = drm_crtc_index(crtc);
-		struct drm_vblank_crtc *vblank = &ddev->vblank[pipe];
+		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 		vblank->time = ktime_get();
 
-- 
2.47.3

