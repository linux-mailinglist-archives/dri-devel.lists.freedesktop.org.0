Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDFsMGQbgWm0EAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:47:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D867D1C3F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5183210E2F4;
	Mon,  2 Feb 2026 21:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGpzqaxW";
	dkim-atps=neutral
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDBD10E2F4
 for <dri-devel@freedesktop.org>; Mon,  2 Feb 2026 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068831; x=1801604831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qk337jejURUT1ogOdhq3pDOVGVqlI1C5mUEGzG0+uYY=;
 b=DGpzqaxWctyoXr3doU1OAqMW6yq9e58NySkbUR7Tq8mGxmZ7CpGwSgId
 IWRIdXeIEqWITygKAZJQg7sY9c8aggLhbUUMXFnphVYzyaqzehFoSheGh
 3904/FKp9+XmJs9ZoG6nNyrnSvy4e0nrQaGJE4Hhce+03b7PvBg2dc7Mb
 TjSulQMPYrYY6i7ppjysTIhxArK6z7TXguPBAWeYm0Fkim1iOZQ3XXw1+
 bPWaOP3jqgaohXTEOeFSqOPP/X8sVzfuxf/hcFXnn6Mzpl2M9V1ia8Jo6
 uVihrtVJTaCg/qTCsjo7TGVSLHno6qBXnVZQsWv1ElsqYYeA3dXe1SCpy A==;
X-CSE-ConnectionGUID: +L0SDkhBSh2nBioKA+jm6Q==
X-CSE-MsgGUID: 8zIAwZ35T5+vcYOXLkAgiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71317415"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="71317415"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:47:10 -0800
X-CSE-ConnectionGUID: kjWVyFD9SD6tQ4Yc4Q5RGw==
X-CSE-MsgGUID: ykXpUEXBT66ub57cmeF0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209862487"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4086LNL.fm.intel.com) ([10.105.8.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:47:10 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] drm/colorop: Check if getting curve_1d_type default succeeds
Date: Mon,  2 Feb 2026 21:47:10 +0000
Message-ID: <20260202214709.8037-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 3D867D1C3F
X-Rspamd-Action: no action

Static analysis issue:

In all other uses of the function drm_object_property_get_default_value,
the return value of the function is checked before the output is saved to
the relevant object parameter.  Though likely unnecessary given the
execution path involved, keep the behavior consistent across uses and only
set colorop_state->curve_1d_type in __drm_colorop_state_reset if
drm_object_property_get_default_value succeeds.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 44eb823585d2..49fdb748f48e 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -483,10 +483,10 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 	colorop_state->bypass = true;
 
 	if (colorop->curve_1d_type_property) {
-		drm_object_property_get_default_value(&colorop->base,
-						      colorop->curve_1d_type_property,
-						      &val);
-		colorop_state->curve_1d_type = val;
+		if (!drm_object_property_get_default_value(&colorop->base,
+							   colorop->curve_1d_type_property,
+							   &val))
+			colorop_state->curve_1d_type = val;
 	}
 }
 
-- 
2.43.0

