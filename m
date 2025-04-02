Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6641A78EDD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF18A10E77E;
	Wed,  2 Apr 2025 12:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0GvEm2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF4810E77E;
 Wed,  2 Apr 2025 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743598036; x=1775134036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gj2aB2JqBmqXPO78uNKvPd/l2jxWVWHHMd/bVheBitA=;
 b=A0GvEm2ASQdClm4umbZDKin41Vf0GX3vO0v/3U6WtqlSXomrYI5hyQM1
 rD2cW4CBddOTBj05KfhoiIqpdpEFje6s35CPvzuU1y3CpB2nQsLQlR9iX
 Is0DTT+tLPqY+Gpo/cCdo0GEfI3PFCPZ3isnhhfpBxkq+zmBC7vEW6RFz
 KSIY3sHJ7CxZ5LuHGaqYNeaWlRD5xPUJY7EO19bQ9o85cVPcQ7L7sYK1K
 6l7Yjl2G1HGtqnoJrHSVQivzqq0zi1KKsxbXAQ/7iRXSwkK8wU5HEEPAj
 gsZcAvkv/HIHwpoVRmtDf/2+2cis52HG0ZKFOcbXL7ABmrugkozFsrO+Q A==;
X-CSE-ConnectionGUID: aW4t6a2aSvCg4wRwsfJq5Q==
X-CSE-MsgGUID: B3ZT9gB5Q7STmFmxrzlkoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55953437"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="55953437"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:47:11 -0700
X-CSE-ConnectionGUID: gPJlNXYbQLS1e6N7A65cbg==
X-CSE-MsgGUID: xLyK4DAQQ6S0hlKPTGmchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127180570"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:47:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com, Jason Gunthorpe <jgg@nvidia.com>,
 Masahiro Yamada <masahiroy@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/4] kbuild: resurrect generic header check facility
Date: Wed,  2 Apr 2025 15:46:52 +0300
Message-Id: <20250402124656.629226-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Another go at hiding the turds.

In v1 [1] I hid the build artifacts under .hdrtest subdirectories, one in each
$(obj) directory, but the feedback from Linus [2] was to have one top level
directory for this.

This is not possible without turning the whole thing back into a generic header
check facility. Personally, I think this is a good thing. Just look at patches
2-4, it's great.

The main reason we've been doing this in the subsystem/driver level at all is
the opposition from the kbuild maintainer. We'd very much like for Masahiro to
support us in our efforts, but without that support, we're limited to hacking in
the subsystem/driver Makefiles.

BR,
Jani.


[1] https://lore.kernel.org/r/20250401121830.21696-1-jani.nikula@intel.com

[2] https://lore.kernel.org/r/CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com


Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org


Jani Nikula (4):
  kbuild: add generic header check facility
  drm: switch to generic header check facility
  drm/i915: switch to generic header check facility
  drm/xe: switch to generic header check facility

 drivers/gpu/drm/Kconfig           |  2 +-
 drivers/gpu/drm/Makefile          | 15 +--------------
 drivers/gpu/drm/i915/Makefile     | 14 ++------------
 drivers/gpu/drm/xe/Makefile       | 10 ++--------
 drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++++
 include/drm/Makefile              | 15 +--------------
 init/Kconfig                      | 25 +++++++++++++++++++++++++
 scripts/Makefile.build            | 13 +++++++++++++
 scripts/Makefile.lib              |  7 +++++++
 9 files changed, 56 insertions(+), 49 deletions(-)

-- 
2.39.5

