Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2CBA8471E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA91310E9E2;
	Thu, 10 Apr 2025 14:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNwwT+OC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E93610E9E2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744297158; x=1775833158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ABX79TSwALNjJ0ijchNwhWYCR+YrJTzJ6RM3uucwsQ0=;
 b=LNwwT+OCcH81y0/y9ssKhLNOicCvZPLSf0ou8+5HA+6FIk9nnH/glKlL
 OXukw4yUU6MesCI7DMgjtILvQ2wZ4aXgvpFf/+UqWGXVGVA7wYaJlVDaR
 84o2ab+S6pNtfcZLcQW30ejKMT1/oCIjAROZZ8165m523OjhS2H09qjjL
 Rb05g+fFw3xViAgPVr4bPcMyIo4+kAe9nrQSdU0q2CpmhVPVsA520Z3gx
 SyR9bsyYCrOPueJKn/tW+7PGj+LIuvANmAh8K/7xyAs0FeVSpPC4fRd8n
 zOZxyZq3bWMsffBKrBEvKwFCDiWPgcvVD7RanR9gML9+XxDMErOOrrLi8 g==;
X-CSE-ConnectionGUID: 7VM+U4tsQROJDv0qtqB1IA==
X-CSE-MsgGUID: nH1T3082SXyPJ2aMSzxsUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71208144"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71208144"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:59:18 -0700
X-CSE-ConnectionGUID: DH9ZhIvAR52UMsZxSlCArw==
X-CSE-MsgGUID: KuL/4jRbR2ivtp5XSh8Srg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134101992"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 07:59:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 17:59:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 3/6] drm/armada: Fix printk arguments
Date: Thu, 10 Apr 2025 17:59:01 +0300
Message-ID: <20250410145904.25550-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
References: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
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
index 1a1680d71486..aca601fb1307 100644
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
2.49.0

