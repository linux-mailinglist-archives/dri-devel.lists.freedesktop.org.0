Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0EBC961F1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0635F10E2FD;
	Mon,  1 Dec 2025 08:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYYTcXKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBB610E307;
 Mon,  1 Dec 2025 08:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577751; x=1796113751;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uAIbnnRUE5BSQvWsZLaCMKn+dtKIKsFWjmVutIpmEJ4=;
 b=OYYTcXKVv1MYRjrq7GPeXv0inz/NjDyMsZx+Ubqo1QOJC+lw3v2l0XOr
 wgVdxr4GXYK9XcD3KHfSzCyeDIvGeWUiPB2Jm4fKEwovwTHfkQ5pZINB7
 5AX1qKDrWbEwKu1/wOo4I4ERPmaPKMzl6OwT+OI9SpD0xk1A4bB9leKJq
 GjDrrSIybj89lyHoc3SMvvKWUdJq6jX0SIdthaZMbnVi15KCpA1ABOf34
 5JqwgeF+wbULLa9o3YjOk2h6vo/VvhFm0UW1ZotHlwhFFmumWB6gMkipp
 Q3wsVyO+NP3Sq98iSShruPUKBNpA+pWepGHa5SCCD1R0dcrAz8vwB4BSY Q==;
X-CSE-ConnectionGUID: Nofc5wgGSdK6uGYVFJsnBQ==
X-CSE-MsgGUID: PkXzxJaeRAuw70iRFIGbPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578363"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:29:11 -0800
X-CSE-ConnectionGUID: mAiZss6LRdCtxiF6RP28QQ==
X-CSE-MsgGUID: 5+FUQzw7RWCRBKl4MNVAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198352722"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:29:05 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:58:48 +0530
Subject: [PATCH v9 06/20] drm: Add new element Image EnhancemenT for
 colorop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-6-e462d55dba65@intel.com>
References: <20251201-dpst-v9-0-e462d55dba65@intel.com>
In-Reply-To: <20251201-dpst-v9-0-e462d55dba65@intel.com>
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
 "Imported from f20250128-dpst-v8-0-871b94d777f8"@intel.com, 
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

