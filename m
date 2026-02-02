Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA5GN4B3gGne8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:08:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B41CA8D5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC9610E404;
	Mon,  2 Feb 2026 10:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwyUQLlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BA710E3E5;
 Mon,  2 Feb 2026 10:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770026878; x=1801562878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U/ty4QMF2fDJpFbuAugdjBT2iSAtFi6lXMMgWaONO6Q=;
 b=XwyUQLlwkydogs6VNO6zHXOgpp8YJeGutx6EY8NpJ2qG8d/BJ7g2dw2R
 /4p7innJp6wSAImYJyHvAcZEDumnEztzCV/hUyAJq2sQ7A75Z4sIGEK5V
 fyy5JhE01Y8q0rCvW54JY5NuyxtWqlayy9vTIfXB41/v4fPH/DaKpTsE6
 cXP4fKwHFTcRalI6/oxIHLF1WfseCHw9SYxvUyJnGv3ebeLsbpL4dwqaB
 OJkKK83aAIlf53vG8dBPHulCRPtHm1qWloMOWs5f7XLkbXte++4LeWNrF
 j6PldqWPaWmx5woT2T/qYiseuRDqwwLxFCHE3dedqoEJeWnJBq+jYgnw+ A==;
X-CSE-ConnectionGUID: 4FHsiBxMSbGTG9JFgK8bag==
X-CSE-MsgGUID: FtInP57sQlqXddnM+CW7Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71163415"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71163415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:07:57 -0800
X-CSE-ConnectionGUID: EAZ6Yd1LQemWlAYJ/+iWzQ==
X-CSE-MsgGUID: xWt/8ixdQO6VjoVXCJP0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208984868"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa007.fm.intel.com with ESMTP; 02 Feb 2026 02:07:53 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com,
 maarten.lankhorst@intel.com, chaitanya.kumar.borah@intel.com
Subject: [RESEND 8/9] drm/colorop: Use destroy callback for color pipeline
 teardown
Date: Mon,  2 Feb 2026 15:12:01 +0530
Message-Id: <20260202094202.2871478-9-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202094202.2871478-1-chaitanya.kumar.borah@intel.com>
References: <20260202094202.2871478-1-chaitanya.kumar.borah@intel.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B5B41CA8D5
X-Rspamd-Action: no action

Switch drm_colorop_pipeline_destroy() to use the driver-provided
destroy callback instead of directly calling drm_colorop_cleanup()
and freeing the object.

This allows drivers that embed struct drm_colorop in driver-specific
objects to perform correct teardown.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 2bce29176ab3..aa19de769eb2 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -208,8 +208,7 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev)
 	struct drm_colorop *colorop, *next;
 
 	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
-		drm_colorop_cleanup(colorop);
-		kfree(colorop);
+		colorop->funcs->destroy(colorop);
 	}
 }
 EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
-- 
2.25.1

