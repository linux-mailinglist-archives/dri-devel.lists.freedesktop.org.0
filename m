Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A13F83A0E3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 06:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C490D10F62D;
	Wed, 24 Jan 2024 05:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8771610F61D;
 Wed, 24 Jan 2024 05:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706072550; x=1737608550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QrLe4l6tUvy4yjcm1YiMZuA6FEvLl4W5POoznrEmBKU=;
 b=mv5qUzvzlgoLD6EPa/VuDBm4gcDZapXj5R8aPbbwy46bRE0Ri0EHNPUS
 AGbTPfeRFKK2+nJCFPy3VEY+9en2JtLiz6KYtCYyIb6VNa5RMuBnQz+RM
 EzYTya7xvFB5rEqLg3b/mfMy3dEi6xySMYnyGK4RpfW21G0e1YeGCkXCJ
 C5aMFYqBEttbJMJcJWfeknD8f+ig/KhlaChGqxrik340RxpIh4hdcNuiy
 2EdNpBhUmr4uT5UjdRIOqjYIVKoq3TkArZSOyoFAE9jcjmI5Dk9t7AmVJ
 K6H3TihhUFZk5Eb+uyWsJ8YZrewYspu0O06SBhT1pGe2mENVt/IRywIsi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401399354"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401399354"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 21:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909551502"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="909551502"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 21:02:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 0/3] Fixed-type GENMASK/BIT
Date: Tue, 23 Jan 2024 21:02:02 -0800
Message-ID: <20240124050205.3646390-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the implementation of REG_GENMASK/REG_BIT to a more appropriate
place to be shared by i915, xe and possibly other parts of the kernel.

For now this re-defines the old macros. In future we may start using the
new macros directly, but that's a more intrusive search-and-replace.

Yury, I added a little bit more information to the commit message in
patch 1. First 2 patches may go through your tree. For the last one we
may have potential conflicts, so I'm not sure. +Jani from i915 side to
chime in.

v1: https://lore.kernel.org/intel-xe/20230509051403.2748545-1-lucas.demarchi@intel.com/

Lucas De Marchi (2):
  bits: Introduce fixed-type BIT
  drm/i915: Convert REG_GENMASK* to fixed-width GENMASK_*

Yury Norov (1):
  bits: introduce fixed-type genmasks

 drivers/gpu/drm/i915/i915_reg_defs.h | 108 +++------------------------
 include/linux/bitops.h               |   1 -
 include/linux/bits.h                 |  33 +++++---
 3 files changed, 33 insertions(+), 109 deletions(-)

-- 
2.43.0

