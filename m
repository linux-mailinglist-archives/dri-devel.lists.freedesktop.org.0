Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPtpJ7VolWk/QgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:22:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61751153A1E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B289410E56E;
	Wed, 18 Feb 2026 07:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aybvzdrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06ECF10E56F;
 Wed, 18 Feb 2026 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771399348; x=1802935348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S2fo0Xdvl8AoJRIa6sGYzPFDBwSqzeEMvC1EzeI1hkE=;
 b=aybvzdrJ6kPIJLoi9dCKjiHkhW9CLDAW6DOiBmY2ABVozk4qh/TYPQaa
 sZR8V4cJMKmhpZw7oHP4mecP9FukpU4a7oz830tbTKoV0eaw9io0IbxdV
 jDUu8ibk4xr1a50NM1BmZtYkMJM8cRsLkpUNDCsuOUThBglDKJUQgnm1r
 ukTB42cw2RSKB1VOybEMwSLdnwMCm+wWsT2jFmzHNz6NNMcuKuwmN0QwN
 tnjYTcP3iFsR29ZzxrqudS94ftFV8ph0dZEZ8L2QPqw5qWBPAvMVMDZnD
 ENlcNyKx4f61N+kUOoixsEXth+1GtodGiuGtCb8BsqrkFETRasw2vqLzB Q==;
X-CSE-ConnectionGUID: Ub+FmRRvS++N5AEdEt7AWA==
X-CSE-MsgGUID: B1w+nvEkR4+P7SrA7pUpag==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72519041"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72519041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 23:22:27 -0800
X-CSE-ConnectionGUID: qwrYAf25Qk6NQkA7+Umg3A==
X-CSE-MsgGUID: S7KM8cbHTMqGGA1X3RMQ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="213208226"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa006.jf.intel.com with ESMTP; 17 Feb 2026 23:22:23 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: contact@emersion.fr, alex.hung@amd.com, harry.wentland@amd.com,
 daniels@collabora.com, mwen@igalia.com, sebastian.wick@redhat.com,
 uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 louis.chauvet@bootlin.com, stable@vger.kernel.org,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH 1/2] drm/colorop: Preserve bypass value in duplicate_state()
Date: Wed, 18 Feb 2026 12:27:12 +0530
Message-Id: <20260218065713.326417-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
References: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 61751153A1E
X-Rspamd-Action: no action

__drm_atomic_helper_colorop_duplicate_state() unconditionally
sets state->bypass = true after copying the existing state.

This override causes the new atomic state to no longer reflect
the currently committed hardware state. Since the bypass property
directly controls whether the colorop is active in hardware,
resetting it to true can inadvertently disable an active colorop
during a subsequent commit, particularly for internal driver commits
where userspace does not touch the property.

Drop the unconditional assignment and preserve the duplicated
bypass value.

Fixes: 8c5ea1745f4c ("drm/colorop: Add BYPASS property")
Cc: <stable@vger.kernel.org> #v6.19+
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index aa19de769eb2..5037efcc3497 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -466,8 +466,6 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 
 	if (state->data)
 		drm_property_blob_get(state->data);
-
-	state->bypass = true;
 }
 
 struct drm_colorop_state *
-- 
2.25.1

