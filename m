Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19138CB0419
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C2010E5F2;
	Tue,  9 Dec 2025 14:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSSonuoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9895710E612;
 Tue,  9 Dec 2025 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290219; x=1796826219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bPAz7wG0HmrKwNvILRtUPosP1u+xPhGr/Z4XWIuD4yk=;
 b=DSSonuoHcgX3Tvec0reg5XOcUOIEQYkX9lV3whv1ZRnEwQiREQB+cLZi
 2oZJj4sgFdNKA018XfiZTj6oOqCAs/P6XrqKgAbN0R2pnFuWDwQ/fJISW
 ct/uEW4rVJr0MdwsRejkvcdqQpYIdSqdiRBlo7SRG8itDCwdIHRKtJ4Jz
 QubMbkalSJWHPyUnp33DjJn2EkJ60pPpp6hiAMxBoG80MY8Iq0K5BsHAj
 VzCQu2ikYHOrSoeUOQlmVtCBVvMOKAfP8lFEdYvhclKzVYC7Xe5GehAuh
 523SFVUJYc2Z5CojJ3SGFhP++IEkXYU6mXuZdLlpGY+aum8b2VmxhlgNF A==;
X-CSE-ConnectionGUID: LHNr7rhBRZ6exZzUfCMVZg==
X-CSE-MsgGUID: 1ajaO9qGQfWo3c0sP7kLBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67140921"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67140921"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:39 -0800
X-CSE-ConnectionGUID: zn52xYLXT4+TmHls7WFeXA==
X-CSE-MsgGUID: OjUqvk1VSruW5ohO/OpxAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="201160744"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH 3/7] drm/vblank: remove superfluous pipe check
Date: Tue,  9 Dec 2025 16:23:11 +0200
Message-ID: <ced963542bfb00c2f1a653e9e5f717fccbd25132.1765290097.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765290097.git.jani.nikula@intel.com>
References: <cover.1765290097.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Now that the pipe is crtc->pipe, there's no need to check it's within
range.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1d12836e3d80..f4d1fe182a4d 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1302,9 +1302,6 @@ void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	int ret;
 	u64 last;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
 	ret = drm_vblank_get(dev, pipe);
 	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
 		     pipe, ret))
-- 
2.47.3

