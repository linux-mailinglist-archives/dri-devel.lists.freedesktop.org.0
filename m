Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC5C96224
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACE910E316;
	Mon,  1 Dec 2025 08:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeqhY/wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C2910E316;
 Mon,  1 Dec 2025 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577776; x=1796113776;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XwWD0h+cclRK2eEIk9nMupSRbNuaV5c5iDMpNnxquaE=;
 b=QeqhY/wa7+o0JGwijbxBBJcZkk2lZC2R5c+IF/VvjP+0apXpTUDHHB5v
 WdWnKWq2ashwAi2Wp+63jPbhofAhBK0yuLd+bDQDQ189hvII72LgTd7mC
 beBtt14cL8Gag3Xqc0rWuktC+fyWN1lj1OxqMpT2R8AmMwDQ66RYyVIIx
 vrat6C+MPv4ZvYwEktoOVyWmcNScvGCedOq4Ue1KLsoeTwgNizZG4BQh2
 KcrRX9yKauQSLsC/qgnO4qhxMbsnEkO5N386WCWcP4W62K5+1UcKXs+1M
 aJ0xH331IgPg4POJRkq6oQ9T4ZrPm7Zn0EKYUzDmw2K+A2ui0g2U6Yjqz Q==;
X-CSE-ConnectionGUID: 8wJ80ZpwTTS9fgF/4GFzsA==
X-CSE-MsgGUID: CREcejdPTPi2fuFZACUTGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578424"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:29:36 -0800
X-CSE-ConnectionGUID: hmuEXd8wQeOuRuwBKMXqew==
X-CSE-MsgGUID: IkJhRlyTSiyPC7ZyVcr0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198352884"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:29:30 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:58:52 +0530
Subject: [PATCH v9 10/20] drm/xe: Add histogram support to Xe builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-10-e462d55dba65@intel.com>
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

