Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541A789CA42
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4E911288E;
	Mon,  8 Apr 2024 17:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jR3metUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251E6112854
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595873; x=1744131873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GDTb2AOVhBcDXMyGU85jB79LpVC7WmIrryK5iL8loDA=;
 b=jR3metUMzbVAAtq2ocL1mvUsngsNApeevAI4IEf5T3U2tRXKTSbK2Stj
 sZNVW6+RMCdbnu8xGoJNZAqyJ4o5jBZGvpKU0kYcEHxabLcEhlVtmFB23
 3Hdb1kN5ddEs8mw1tSOca3rmZvPIJPpzy2y8o1SqIeil1s5VdEnEWLhUe
 m3nxchq4vkxGS3tH9xgZ7D1VNnvh9bvFGjB77zE9i4VK9sY5IBpBC+SAi
 +l23Gck+K5MbGSPajxuftRCW3Qt1It2voUmVMQEiXkx3WSCWs9RPujPKM
 l0ySYpqzHe3sb+eB1BkQFmIrQ5xIYrmkHaZIX9Rnb2Jzt/Blkh/K0Srb1 g==;
X-CSE-ConnectionGUID: iHEgKJ1zQguqGHhH51u+pA==
X-CSE-MsgGUID: d/mLPY7lQOqLoBudhZQCFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793340"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793340"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792325"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792325"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH 01/21] drm/armada: Fix printk arguments
Date: Mon,  8 Apr 2024 20:04:06 +0300
Message-ID: <20240408170426.9285-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

../drivers/gpu/drm/armada/armada_gem.c: In function ‘armada_gem_pwrite_ioctl’:
../drivers/gpu/drm/armada/armada_gem.c:367:27: warning: format ‘%u’ expects argument of type ‘unsigned int’, but argument 2 has type ‘size_t’ {aka ‘long unsigned int’} [-Wformat=]
  367 |                 DRM_ERROR("invalid size: object size %u\n", dobj->obj.size);
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~
      |                                                                      |
      |                                                                      size_t {aka long unsigned int}

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/armada/armada_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 26d10065d534..e9575ef5aaef 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -364,7 +364,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 
 	if (args->offset > dobj->obj.size ||
 	    args->size > dobj->obj.size - args->offset) {
-		DRM_ERROR("invalid size: object size %u\n", dobj->obj.size);
+		DRM_ERROR("invalid size: object size %zu\n", dobj->obj.size);
 		ret = -EINVAL;
 		goto unref;
 	}
-- 
2.43.2

