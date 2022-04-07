Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8384F84BF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEABE10E1C1;
	Thu,  7 Apr 2022 16:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C6E10E1C1;
 Thu,  7 Apr 2022 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649348354; x=1680884354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YwPKjq/8WassANyC+LRTLgE+Ar0zHpwLSxm0/dDeX88=;
 b=NhHXH1dAQfVJ8AZgDj+dQUyqVpTMz7EzV4T2+ixhO7XGo2mr/Ely4mmZ
 GMDLfyzzR20p/GYw/vvbtJabPaLwwQgg5js2LREIK9FaZO+pSVqYfnXkA
 pt/kNnT4c0SbZF7QZ/FYHOVYcLA5JaaeXKwGDk2fWTU8qFY4SLezmQ40D
 b/ZxpamgRF4Au6lh9dutAf7gTqfsl/C3qwBZFLYy7T7x1Tn6Cf5JL0IuN
 4/tR8+bls6i5eUMMzT/hMhOfCzw35uNPJ5YL1WFZeW1k97TPvxn6xTW0E
 JP3wnlCMx0EdlsA2Q3MpQ1TLyxWCl3uzCWywxywA8/aTwlt9c0f0b/EPG Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261065161"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261065161"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 09:18:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="851739308"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 09:18:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Sunset igpu legacy mmap support based on
 GRAPHICS_VER_FULL
Date: Thu,  7 Apr 2022 09:18:39 -0700
Message-Id: <20220407161839.1073443-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The intent of the version check in the mmap ioctl was to maintain
support for existing platforms (i.e., ADL/RPL and earlier), but drop
support on all future igpu platforms.  As we've seen on the dgpu side,
the hardware teams are using a more fine-grained numbering system for IP
version numbers these days, so it's possible the version number
associated with our next igpu could be some form of "12.xx" rather than
13 or higher.  Comparing against the full ver.release number will ensure
the intent of the check is maintained no matter what numbering the
hardware teams settle on.

Fixes: d3f3baa3562a ("drm/i915: Reinstate the mmap ioctl for some platforms")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index c3ea243d414d..0c5c43852e24 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -70,7 +70,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
 	 * mmap ioctl is disallowed for all discrete platforms,
 	 * and for all platforms with GRAPHICS_VER > 12.
 	 */
-	if (IS_DGFX(i915) || GRAPHICS_VER(i915) > 12)
+	if (IS_DGFX(i915) || GRAPHICS_VER_FULL(i915) > IP_VER(12, 0))
 		return -EOPNOTSUPP;
 
 	if (args->flags & ~(I915_MMAP_WC))
-- 
2.34.1

