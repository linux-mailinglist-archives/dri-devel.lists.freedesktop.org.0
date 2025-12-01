Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0FC96273
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7149010E32C;
	Mon,  1 Dec 2025 08:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0LDeTAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F51110E341;
 Mon,  1 Dec 2025 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577822; x=1796113822;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YMFEJogHsTvlt3+pZNiaYpGoAQBRirM1RpH5i4NMctI=;
 b=O0LDeTAOA0RlkeA4XZ8XHRqlOsULWZB01PtPhZ1GzySpuvb0aId+ZvhH
 dYcKHBtQpvXwOusorzG3YfzyNo0UJpWCcfdwC4NMyGn6rlCQyo1Ln98fh
 eC+vsqXoXt9ltBqVHCSO4O/nO3sodqh51CnZTComRTRBcex1TQz6bKFgO
 PTQ3A9/AewLSRkRPq4TeFyywy4VEnwNnFcr4D7wB5mTdYEnuaPY3fEKzp
 cmflWzXzhIyn1l5SjqWRrmSLUNhiJj0sOYnVEWA0dnVkpU5Bd0y1/ycb3
 eB2ofah1N69HmIcgfI6cR1C48BpASJ+iX5041IlQqiRc5hrsSrSwkHiBP g==;
X-CSE-ConnectionGUID: 7ZfSsA+gR+KHlrYp4yF/XA==
X-CSE-MsgGUID: orvbLfrERnKhdYynJk+NMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578625"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578625"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:30:22 -0800
X-CSE-ConnectionGUID: qqOG7LTKQMC1a194Wh2DaA==
X-CSE-MsgGUID: sDL/JizkSkq8sdn5CHb5+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198353519"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:30:15 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:58:59 +0530
Subject: [PATCH v9 17/20] drm/i915/crtc: Hook i915 IET LUT with the drm IET
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-17-e462d55dba65@intel.com>
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

Upon drm getting the IET LUT value from the user through the IET_LUT
property, i915 driver will write the LUT table to the hardware
registers.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 191a830009e78a31e1ad3d9ca8e0596e1a1ff71e..fd81452483bff1c6542aa95b6e11874fff21bc29 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7579,6 +7579,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 			intel_histogram_update(crtc,
 					       (struct drm_histogram_config *)
 					       colorop->state->histogram_enable->data);
+
+		if (colorop->state->iet_lut_updated)
+			intel_histogram_set_iet_lut(crtc, colorop->state->data);
 	}
 
 	/* Underruns don't always raise interrupts, so check manually */

-- 
2.25.1

