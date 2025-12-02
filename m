Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3DC9A483
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2555210E557;
	Tue,  2 Dec 2025 06:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY41TGF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5571C10E555;
 Tue,  2 Dec 2025 06:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656861; x=1796192861;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XwWD0h+cclRK2eEIk9nMupSRbNuaV5c5iDMpNnxquaE=;
 b=YY41TGF80cg3cBnlieFa0h8dk6uDJxoJ1LLXODJDqtmaeZjRfeLQgh5n
 kLg/tfKAzERzIUwJWs6xKS6j868q/FFP1uK+W/5U+cr4I/G7S6Ii/0mXb
 IVvoeQJArfEXUSC+dQwiNAfsdM90k/BeIW7LrORkkdIztE8gu/RNcnZRi
 pFj/4JZcfmT6BrAfCN1rhZ0Cd8oCoQTFeiKMzmRndBKUOSUgJtBhF1aHq
 NXs904n0JXHAn1oJzHyyxiRCbbl/lrniPgXze4aaiwVB8iE3bmbwvMX0t
 aDOagdFc0hNZ4Qqe7kkxpWXHMy37xD/dwDK65nYnqQ8YNx2ri6FkfBvcu g==;
X-CSE-ConnectionGUID: 8/553n4VTLKT3RUCmNSCow==
X-CSE-MsgGUID: CeBDgi+ZTOGX82uDg7ZG5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499917"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:27:40 -0800
X-CSE-ConnectionGUID: sohIVMfnQZKCqhr5BDImpg==
X-CSE-MsgGUID: l6baAJ2DRaqJEH1FQ3ClMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961328"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:27:34 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:04 +0530
Subject: [PATCH [RESEND] v9 10/20] drm/xe: Add histogram support to Xe builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-dpst-v9-10-f2abb2ca2465@intel.com>
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
 Arun R Murthy <arun.r.murthy@intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
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

Histogram added as part of i915/display driver. Adding the same for xe
as well.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c9b60e19cecc68ec90e980ede4b92c690133efbe..38008a644a0919868d6ff99fdda024df0eca944e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -284,6 +284,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_hdcp.o \
 	i915-display/intel_hdcp_gsc_message.o \
 	i915-display/intel_hdmi.o \
+	i915-display/intel_histogram.o \
 	i915-display/intel_hotplug.o \
 	i915-display/intel_hotplug_irq.o \
 	i915-display/intel_hti.o \

-- 
2.25.1

