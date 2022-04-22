Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118BD50C082
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD2510E57E;
	Fri, 22 Apr 2022 19:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6976810E626;
 Fri, 22 Apr 2022 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650657021; x=1682193021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OqgG0GR+0VBBJuq+Vgw7mJj008P4RyMJ8mEZV2ZoE8g=;
 b=JbaQEaWOqKUymaUcsBOWKsHoNfE3od8p9Mj3dK4afaQ6nPlgFDsz88xc
 z0IgkwvvbTK61ZJYcp6P34ZKRyhDl4kdMH960osNfJ+ZUKwhGcqmy0iQ+
 5WgB0gfI409pFJw2WhSkVBVAGMzlLNEZBSXWm5SR1XZ8+E7gxFfirjsUt
 wGfmdPVcdTpsWe+AxGzA0WIurRACPeB7ZmD75kV2hvlJ0UmDG7YuIZEss
 oWWH6O/s6MOOKoQA2nIjtoRkxR3s5+4rDsPKkeVWiEv246N2WPKX/YUtX
 yYszzOyGAXXiBqpf/ZPQDzl0Om5MTePkbqoPzOj9rR6BWEjH580kGlR0W g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351219967"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="351219967"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 12:50:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="672595742"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 12:50:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] i915: Turn on compute engine support
Date: Fri, 22 Apr 2022 12:50:05 -0700
Message-Id: <20220422195007.4019661-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the necessary GuC-based hardware workarounds have landed, we're
finally ready to actually enable compute engines for use by userspace.
All of the "under-the-hood" heavy lifting already landed a while back in
other series so all that remains now is to add I915_ENGINE_CLASS_COMPUTE
to the uapi enum and add the CCS engines to the engine lists for the
Xe_HP SDV and DG2.

Userspace (both Mesa and compute drivers) are linked in the ABI patch.
Existing IGT tests (e.g., i915_hangman) provide test coverage for
general engine behavior since compute engines should follow the same
general rules as other engines.  We've also recently added some
additional subtests like igt@gem_reset_stats@shared-reset-domain to
cover the user-visible impacts of the compute engines sharing the same
hardware reset domain as the render engine.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Daniele Ceraolo Spurio (1):
  drm/i915: Xe_HP SDV and DG2 have up to 4 CCS engines

Matt Roper (1):
  drm/i915/xehp: Add compute engine ABI

 drivers/gpu/drm/i915/gt/intel_engine_user.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
 drivers/gpu/drm/i915/i915_drm_client.c      |  1 +
 drivers/gpu/drm/i915/i915_drm_client.h      |  2 +-
 drivers/gpu/drm/i915/i915_pci.c             |  6 +-
 include/uapi/drm/i915_drm.h                 | 62 +++++++++++++++++++--
 6 files changed, 64 insertions(+), 10 deletions(-)

-- 
2.35.1

