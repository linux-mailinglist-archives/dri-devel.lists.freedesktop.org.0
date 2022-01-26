Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8749C046
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 01:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF4C10E34E;
	Wed, 26 Jan 2022 00:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE6A10E4AF;
 Wed, 26 Jan 2022 00:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643157792; x=1674693792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CSrj0PzGPZfsj10jCjWwU27jdY4HQLhuz3oscafP5Nk=;
 b=DqYKuVNIQ7+yube8mlbocufxUsW9EJys1JNHR+2lO/EptxwNPTem0plV
 nTsjx6eMUjLN/d4AXRYY4Q8xxMRgsmuAn/1X/+2QIYZjw2Pnp8ASgv1FL
 /Fy7xYzTdqZvP9Yn3xt4fqaeld3CTBJJm8dUgNXUURS4W96q2oM46Pvra
 DuOO7Bqz3oCGEPK4A5i56GAOCCgbC8rfUGMPRA4nVbiRdhEC1wYreVR8T
 0i2Yre5bHYzpV88/6qJweBNitdm3CoqbXASzRBVC6A6INSyrm7MPigGMx
 rxAA/ORwGrA1+pjWuG7F9hihEIuztsFoZCVEA6IX0dyaVqhPkAiHrzOMK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309766312"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="309766312"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 16:43:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="563241485"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 16:43:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Fix header test for !CONFIG_X86
Date: Tue, 25 Jan 2022 16:43:45 -0800
Message-Id: <20220126004345.1137674-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126004345.1137674-1-lucas.demarchi@intel.com>
References: <20220126004345.1137674-1-lucas.demarchi@intel.com>
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
Cc: Siva Mullati <siva.mullati@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Architectures others than x86 have a stub implementation calling
WARN_ON_ONCE(). The appropriate headers need to be included, otherwise
the header-test target will fail with:

  HDRTEST drivers/gpu/drm/i915/i915_mm.h
In file included from <command-line>:
./drivers/gpu/drm/i915/i915_mm.h: In function ‘remap_io_mapping’:
./drivers/gpu/drm/i915/i915_mm.h:26:2: error: implicit declaration of function ‘WARN_ON_ONCE’ [-Werror=implicit-function-declaration]
   26 |  WARN_ON_ONCE(1);
      |  ^~~~~~~~~~~~

v2: Do not include <linux/printk.h> since call to pr_err() has been
removed

Fixes: 67c430bbaae1 ("drm/i915: Skip remap_io_mapping() for non-x86 platforms")
Cc: Siva Mullati <siva.mullati@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_mm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_mm.h b/drivers/gpu/drm/i915/i915_mm.h
index ed04fc756271..bc30581b20f6 100644
--- a/drivers/gpu/drm/i915/i915_mm.h
+++ b/drivers/gpu/drm/i915/i915_mm.h
@@ -6,6 +6,7 @@
 #ifndef __I915_MM_H__
 #define __I915_MM_H__
 
+#include <linux/bug.h>
 #include <linux/types.h>
 
 struct vm_area_struct;
-- 
2.34.1

