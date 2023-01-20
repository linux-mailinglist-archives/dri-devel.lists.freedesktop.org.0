Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F21A675E1B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730ED10E39D;
	Fri, 20 Jan 2023 19:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E3110E39D;
 Fri, 20 Jan 2023 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243317; x=1705779317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JkJ/6DM+yJ+S9/cGDmr03heCuMLdJmi6DdGD4GNk6pU=;
 b=hzxhJ6DkMf07b7jIwTsDNlxaTWd9OYigbijVcl3UBD7WlFENINwrBhC4
 uYkhcoYZw0pIvpQWClmLg+yyE4KAd8nLtz7I2GcZXBzP1Oob9qeP/dJzs
 Fpa8F3IyPtM91CdOIajp6Pkpd2sjOrd6MB56TxcVYUkzbFfftUC47p3ab
 SMRXGf8vapxBZrwRNXUAre3bjDRq2a3Bsdp9RQYw0WuA/IwOLX5cSi2A0
 wjjq5c3qIUKQ0+O9h49WOL5lIlyQEOxh3RZpmRz1h2rfWS97iaSxIM2mv
 adAbIkdhUplhAwLuKDFFg1rjBBKSr4ko8aCa8sNbFqoVxoaXGG+D2suv+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903527"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903527"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518293"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518293"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/8] Add _PICK_EVEN_2RANGES
Date: Fri, 20 Jan 2023 11:34:49 -0800
Message-Id: <20230120193457.3295977-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
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

Add a new macro, _PICK_EVEN_2RANGES, that supports using 2 address
ranges. This can be considered a v2 of
https://patchwork.freedesktop.org/series/109606/

I think I converted all the _PICK() uses that could be easily done
without making it much harder to read. We do have some cases of 3
ranges: I left those alone.

As commented in the original series and like Jani I think we may need
something else to cover all the use cases in future. Right now I don't
think we have a good alternative though. This new macro both improves
the current code and can be used for cases the ranges change in new
platforms, so I think it's good enough.  In future I think just saving
the reg during initialization and using different functions if the
bitfields change may be an alternative.

This was lightly tested on ADL-S and DG2.

Lucas De Marchi (8):
  drm/i915: Add _PICK_EVEN_2RANGES()
  drm/i915: Fix coding style on DPLL*_ENABLE defines
  drm/i915: Convert pll macros to _PICK_EVEN_2RANGES
  drm/i915: Replace _MMIO_PHY3() with _PICK_EVEN_2RANGES()
  drm/i915: Convert PIPE3/PORT3 to _PICK_EVEN_2RANGES()
  drm/i915: Convert _FIA() to _PICK_EVEN_2RANGES()
  drm/i915: Convert MBUS_ABOX_CTL() to _PICK_EVEN_2RANGES()
  drm/i915: Convert PALETTE() to _PICK_EVEN_2RANGES()

 .../drm/i915/display/intel_display_reg_defs.h |  10 +-
 .../gpu/drm/i915/display/intel_mg_phy_regs.h  |   4 +-
 drivers/gpu/drm/i915/i915_reg.h               | 106 +++++++++---------
 drivers/gpu/drm/i915/i915_reg_defs.h          |  28 +++++
 4 files changed, 89 insertions(+), 59 deletions(-)

-- 
2.39.0

