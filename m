Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B928098EDED
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC9010E802;
	Thu,  3 Oct 2024 11:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0GFqGxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DDD10E802
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954345; x=1759490345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D8PW7P5fIG+disVu/YM1q9FamLijmhwWTpmppbmEMsU=;
 b=n0GFqGxpv3hNfPsZxHAvgFjua1/AomyjjVmKNb/+14w7UVP0cZwHwMhM
 zLMekqC9Aog5KV+WhoElelcP0N5+8AjGUU+c6mMD3m4/Vah55H2rYtu+Q
 qciO/o+MLrjmvYhI7S5gMlC9Po0gUpScn+bQ4taDtw7QPny3bwATmkOJ9
 y9aFlZhFEiU1OSOr7/FJ0iP7ppLdDmCUtxhQY6Rs1oXgcyTLg6fsx4T9X
 Q1VMiCgaz0SJr84vTPtt8W7ZUEwK1Xkyn69i/KBiQlJwg/ZARRLDW8vqi
 ZtSCt0IE7G9xO/3cDIV+NgdfoVh3cZwtwu40zrSS1WtsfeAr0LjgZwUuK A==;
X-CSE-ConnectionGUID: aXJvBtHGTBaQUyazJhJMiQ==
X-CSE-MsgGUID: jMBZlOtSQkCNWyHwDJPEoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012964"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012964"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:19:05 -0700
X-CSE-ConnectionGUID: OScSDHFRTuqUCHm5e+snmw==
X-CSE-MsgGUID: SphFhNE6QV2Va6l040sM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423720"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:19:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 03/10] drm/armada: Fix printk arguments
Date: Thu,  3 Oct 2024 14:18:44 +0300
Message-ID: <20241003111851.10453-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
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
2.45.2

