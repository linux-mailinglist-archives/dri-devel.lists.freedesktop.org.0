Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBFB8ACF81
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB3410F634;
	Mon, 22 Apr 2024 14:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCrF2ctz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC53010F634
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713796425; x=1745332425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kUSH5icI3VbYb/9ZFjrv+Z3d0DVDjFWYXsZm49p18/Y=;
 b=mCrF2ctzqGm5MvuT1K3deKVmbI0IZ9qcqXxMZocLhZ8yWQmCZhNdkvrH
 z87BdG+32RSL6QMWjscT0vsmEC7OwHT+KG0/sgRqCkHf3vC48T9eAYlkx
 7wYa2qrBU102ypv5IuYL1AMdXZEuF8aOjqoJVPEsL0+PxiOeALGGrXr+f
 loYjkl8kfqDDVa1TQt69OgdBe0/OsgVLpp8O7WC/VUqdvaRfYcJ19cdGH
 ID7jzzoCVx5iHck9Q6vQRq9iaBNQ9xxHaecQieaa8QX4iWQNyQvWjV0OW
 3MJCh7AxoYSdWOGAlhDLAlddajgfp1iXh14mkVRLcBrsGDq6gub6H2Vjr g==;
X-CSE-ConnectionGUID: oRNRojY1TM+COn6BPZ00dQ==
X-CSE-MsgGUID: 9UlKp85aSyG544Ai2VNM5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13118789"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="13118789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:33:44 -0700
X-CSE-ConnectionGUID: tiLdCrN6RNWgar1Aq6aroA==
X-CSE-MsgGUID: T4jz1+MkSLaC0tbKPPSypg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28545254"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP; 22 Apr 2024 07:33:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 70B38FD; Mon, 22 Apr 2024 17:33:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] drm: fixed: Don't use "proxy" headers
Date: Mon, 22 Apr 2024 17:33:38 +0300
Message-ID: <20240422143338.2026791-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/drm/drm_fixed.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 81572d32db0c..387fb81d5b81 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -25,8 +25,9 @@
 #ifndef DRM_FIXED_H
 #define DRM_FIXED_H
 
-#include <linux/kernel.h>
 #include <linux/math64.h>
+#include <linux/types.h>
+#include <linux/wordpart.h>
 
 typedef union dfixed {
 	u32 full;
-- 
2.43.0.rc1.1336.g36b5255a03ac

