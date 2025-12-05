Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A628CA75F5
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E4710E276;
	Fri,  5 Dec 2025 11:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUrnPdTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E240310E276;
 Fri,  5 Dec 2025 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934087; x=1796470087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bPAz7wG0HmrKwNvILRtUPosP1u+xPhGr/Z4XWIuD4yk=;
 b=jUrnPdTE4UTwWufM/qrAz0hpq/atRpo5RDwD20vlvW8mrCBe6QjeIrUu
 aE2KmbCKhChb3x3JIflJGNEKTRJgxtqmkKhstBJkiQ22rl5G1OofCD/HD
 XbjlDl1ObuIEShMlhkGQFMiL1hbAmuBDMT5fRcd4Roe2Nf9uaspigWyEv
 3FagYAZUwxabCV9VpWek04CprspAjWQ8SzMmLmdtcLI3ebVsKosISSo3T
 UcqdHLT2LbmJizEE1QyKzWe3Z9hnKN6qoXsxWYA2tOvQEDGVGxd4q5QEx
 q84DUPuY8VT7ZO5qc9g2jp/b3xOL47DyFQNiUVaBaNIj1qEXhUDWpClEe A==;
X-CSE-ConnectionGUID: yGS6vBjNS+KAvfBAwsH0ow==
X-CSE-MsgGUID: kVjtRFtEQm6Rxpc5DUSvPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65968442"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="65968442"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:06 -0800
X-CSE-ConnectionGUID: lPzpv+AcT8iVUKZtnvObkg==
X-CSE-MsgGUID: Fbanu4rkSo60+rtibQ7XXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="232650327"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 03/25] drm/vblank: remove superfluous pipe check
Date: Fri,  5 Dec 2025 13:27:19 +0200
Message-ID: <01228ac6a3733ba5fe4e999bd4113a9ec69dd9c7.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
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

