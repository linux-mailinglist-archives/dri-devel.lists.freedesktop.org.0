Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2963C9A49C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3430910E564;
	Tue,  2 Dec 2025 06:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VU1L1Bu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026BC10E563;
 Tue,  2 Dec 2025 06:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656879; x=1796192879;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Hn0DzjEDjdWBSR//FCEmS8oHhVJOx5SBBSmlLinaPDk=;
 b=VU1L1Bu8IcRsSEWw8kvdkXqeGw7ymkI1S0vHtAiTFzcD23HhtgDzXDQs
 RQ96cMDu+NwsiqjkZ+1hmCi5Qdo6II8xoas3qp3gdA/WdyGBl7v9DCzyK
 VCVM62Gf/vx7STft9nT+FQP7jLW8UpoodEb6x6IIkOSA1mh72bqkl3q9y
 6PCR2FMpjJtjJXH5+7qE+41pZ1sasqL77Qn4Ms5IHaTIWwRBZ5r4Wm+zO
 zZy/vdF5yMptkEeHF6dtuFogkg0f3hbNMXhLgvI/4oFEJf3gD87osCev1
 /ePUs16F8BxvM6eLQAeKga36YSY4iwGqje+9ZY4HGLQoHkay932P2MRS0 g==;
X-CSE-ConnectionGUID: wOD9HrUJRly7GeteW0qP4Q==
X-CSE-MsgGUID: o7OUFkZfS9OW4cSvKSq5qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499961"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499961"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:27:59 -0800
X-CSE-ConnectionGUID: 25nIiG3PQgGh792pCPd5lw==
X-CSE-MsgGUID: GdwIxXFtQLaYKpIJprWGqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961437"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:27:53 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:07 +0530
Subject: [PATCH [RESEND] v9 13/20] drm/i915/colorop: Add crtc color
 pipeline for i915
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-dpst-v9-13-f2abb2ca2465@intel.com>
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

Add crtc color pipeline for i915 with initializing the histogram
transfer function.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_limits.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index 55fd574ba313176b5da637e3623ad106dd27880c..20bb2bd81489b4fed7e550e0b4e0ade6dcf35859 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -146,4 +146,10 @@ enum intel_color_block {
 	INTEL_CB_MAX
 };
 
+enum intel_crtc_color_block {
+	INTEL_CRTC_HISTOGRAM,
+
+	INTEL_CRTC_CB_MAX
+};
+
 #endif /* __INTEL_DISPLAY_LIMITS_H__ */

-- 
2.25.1

