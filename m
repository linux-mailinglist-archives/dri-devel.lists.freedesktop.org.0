Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F98C9A42F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5C510E52E;
	Tue,  2 Dec 2025 06:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chK4ZtGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5FD10E537;
 Tue,  2 Dec 2025 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656817; x=1796192817;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jqPnYJpW/e7ANtqrJT5ttzf9bhF4nZlQ9P36mm/K0s4=;
 b=chK4ZtGnUwKcph8XqFG8L9MkVEyjdJSdq2zaUC578dactZaENun5tkRv
 BXU29ygJQ39ND7lhRgoSN7qGOnaO2JwFk2AYqLiPjbrxUUu2dRZEO5uPm
 Ppa9HeEnH2rUjK5eGJV098CbYn3Kn5tKr8BbbUGzX9BsDAbQIkuUSySsK
 XE/JpcXd2LDY/ZbHfrqaqt0qljoc2NZCajEvyIN0aCOJfHwqJ+EmWeEMC
 4rRGwSLStDXpdtVO22sEmvkDtYKh9kXK6VgdmkoMerJLENc/qNOHfv5xw
 zfT8ZN/UTvyuLfiK+hpc9HcaIuS9uGS9Hvf6UzdrnqzIHDQopOHgaaVAg w==;
X-CSE-ConnectionGUID: PvyMZSiLSNKZWrzGDw3DbQ==
X-CSE-MsgGUID: n588d9JkRsWTsZ1BOuz4ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499821"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499821"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:26:56 -0800
X-CSE-ConnectionGUID: S71tAUeZQEaQXT3bWIk0HQ==
X-CSE-MsgGUID: E542Z443Ssm78Ynmb1xlgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961100"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:26:50 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:56:57 +0530
Subject: [PATCH [RESEND] v9 03/20] drm: Add new element histogram for colorop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-dpst-v9-3-f2abb2ca2465@intel.com>
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

For crtc color pipeline add an element histogram. This is used to
generate the histogram.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index aa24fef15da708f3e6804d07ffae5b0312dfdce0..d92be66813cf667d8361d837110740a521dca6eb 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -964,6 +964,15 @@ enum drm_colorop_type {
 	 *         color = lut3d[index]
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_HISTOGRAM:
+	 *
+	 * enum string "Histogram"
+	 *
+	 * Hardware generates the histogram which is an array of bins.
+	 */
+	DRM_COLOROP_HISTOGRAM,
 };
 
 /**

-- 
2.25.1

