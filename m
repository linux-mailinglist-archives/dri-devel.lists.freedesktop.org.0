Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C79FC9A45C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E8E10E540;
	Tue,  2 Dec 2025 06:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGiNifcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C51F10E539;
 Tue,  2 Dec 2025 06:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656836; x=1796192836;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uAIbnnRUE5BSQvWsZLaCMKn+dtKIKsFWjmVutIpmEJ4=;
 b=BGiNifcZ0MFfOoz+9a0WNbQWU1LlBiSk/r7bzaTCiiKIVEMaN1pxCdv/
 YibbKMzCeDupESY2KLHlPcK1wrd3IWM+o9fvkpBhGBBL17L3LMYOkDg00
 +tsLR2oN0JZjMHAx57itzn6FAAEIYAnYesqLOE6pFEfSzvogAlywtr+/e
 YKlIoFaT8MlUml11RFkP6IwG/aupWSYkWMHVb25JQEADHHf7L+RBMoBbF
 gB+S2O+3vwwErCuC2vBunx110d2svi5wbJGkv6GvfTQ29vas1Yu51mvqx
 g3zD50y2v2XEd1PRuh9QNjTT/zhJpB/UBtg4MBgiZDlZfgCPlWQDQEeoe Q==;
X-CSE-ConnectionGUID: kUFBxRsEQaWlxBi09Zr++A==
X-CSE-MsgGUID: zkDnsXT8TH6GcE3UzPLRyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499863"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499863"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:27:15 -0800
X-CSE-ConnectionGUID: opH10VXzSVuYMnIdCFviGw==
X-CSE-MsgGUID: KTIBZ1/VTIiSbnfaDVpfYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961226"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:27:09 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:00 +0530
Subject: [PATCH [RESEND] v9 06/20] drm: Add new element Image EnhancemenT
 for colorop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-dpst-v9-6-f2abb2ca2465@intel.com>
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
In-Reply-To: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

For crtc color pipeline add an element Image EnhancemenT LUT. The
histogram generated from the hardware, on feeding to a user space
algorithm can generate an image enhanced LUT that can be fed back to the
hardware to get the enahnced image.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 35d19ccd799b2b0f72174de8987c4482209ff325..acd281b295d71517c930adf036eaa006f8ff7182 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -973,6 +973,17 @@ enum drm_colorop_type {
 	 * Hardware generates the histogram which is an array of bins.
 	 */
 	DRM_COLOROP_HISTOGRAM,
+
+	/**
+	 * @DRM_COLOROP_IET:
+	 *
+	 * enum string "Image EnhancemenT"
+	 *
+	 * Image EnhancemenT LUT generated from the histogram is fed back to the
+	 * hardware.
+	 */
+	DRM_COLOROP_IET,
+
 };
 
 /**

-- 
2.25.1

