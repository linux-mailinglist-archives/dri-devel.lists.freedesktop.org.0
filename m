Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945756FBE8E
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 07:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCD410E1A1;
	Tue,  9 May 2023 05:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD8910E0AD;
 Tue,  9 May 2023 05:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609290; x=1715145290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XM2Ye2n0y+Kiee92BBLzr685tndOBfrVRty6jZErojY=;
 b=F4CIYMCOg56ZIVKKWm3kzCfkzFkFis2LOC4tthLbeJrfz6awNDWwazGs
 mOBVNr9ST/8ra8BrWL8w45IQKDXJRQUrXjLZyZkCsFiDF2w0yj46aGsVh
 i0XSsVVde3RBtABTGj+c2VCtriGgHgPGf1gEs7C4k3YcoUVH80W8nbJxl
 9vVlcUJ9DirM7ORVV0nG1ZSAPjMRUagZepv2wqM1JT85D3lRVDMnweo6X
 K6ZrCVn7qo2aJWSwx3YEw/vW3IzKZx4njLa41hdpk81PMhU8De6l7Cqs0
 2aegajtFtMdc/eNN4lYtbS4Ol0tZ/UrCZV5ABcd5/N2R0lmeXPHKmJ0Jm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339037101"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="339037101"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="873033247"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="873033247"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:14:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Fixed-width mask/bit helpers
Date: Mon,  8 May 2023 22:14:00 -0700
Message-Id: <20230509051403.2748545-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generalize the REG_GENMASK*() and REG_BIT*() macros so they can be used
by other drivers. The intention is to migrate i915 to the generic
helpers and also make use of them on the upcoming xe driver. There are
possibly other users in the kernel that need u32/u16/u8 bit handling.

First patch is one of the possible alternatives in radeon/amdgpu drivers
so they use the U32() that is planned to be used here. Other
alternatives would be to use a amd/radeon prefix or use a _Generic().

Last patch is a temporary one to demonstrate what would be changed on
the i915 side. However instead of replacing the implementation of the
REG_* macros, the goal is to replace the callers as well.

Patches here are currently based on drm-tip branch.

Lucas De Marchi (3):
  drm/amd: Remove wrapper macros over get_u{32,16,8}
  linux/bits.h: Add fixed-width GENMASK and BIT macros
  drm/i915: Temporary conversion to new GENMASK/BIT macros

 drivers/gpu/drm/amd/amdgpu/atom.c       | 212 ++++++++++++------------
 drivers/gpu/drm/amd/include/atom-bits.h |   9 +-
 drivers/gpu/drm/i915/i915_reg_defs.h    |  28 +---
 drivers/gpu/drm/radeon/atom-bits.h      |   9 +-
 drivers/gpu/drm/radeon/atom.c           | 209 +++++++++++------------
 include/linux/bits.h                    |  22 +++
 include/uapi/linux/const.h              |   2 +
 include/vdso/const.h                    |   1 +
 8 files changed, 249 insertions(+), 243 deletions(-)

-- 
2.40.1

