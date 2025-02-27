Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5AFA4764D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 08:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2B910E303;
	Thu, 27 Feb 2025 07:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7ipVkAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA7710E152
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 07:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740640106; x=1772176106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VLD9AGYPVrzIRyGKCwkTW7NwmELi6gc28QkKz9UEbYo=;
 b=O7ipVkAZhmLsXPCvK1+0d9gRmH8L6PJuDetno7DSvqfms3cWqM4wy4A/
 JJTZne91pnjfMym+3YNT53OIGnIi0UKA0twSNv3D+eZ/bDim3rPbNPpHD
 Zdf7kVuq+Ub96/Q+Rp+/kA2zvnWLub3xQ8dAVMoX82rsQDp/tPzoMganh
 33fGjUpQT/+OGoP6Bld6a8yLTyczPIl+IHyApXDtnhMu4j7bZBHV0SL2L
 M70nwqqbCGmbqvysSeMkbL4v718X8tTJm9uDIdpytzC3R8GvWlsxumAQ3
 gAu1sAKiSygKVPFVABnZJgCI6d3icXyWAj5py9mKSELLfkr6an5U7Yr75 Q==;
X-CSE-ConnectionGUID: cReyqYnBRCKppwfzmF9qwA==
X-CSE-MsgGUID: 00xy1FOTRmCoVcETfOKbyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52505364"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52505364"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 23:08:24 -0800
X-CSE-ConnectionGUID: NKBHePo0THW+Nc1WzaPAdA==
X-CSE-MsgGUID: oNZ/3igYTZCjER70cxN2iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154125491"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 23:08:22 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/2] Cleanup io.h
Date: Thu, 27 Feb 2025 12:37:45 +0530
Message-Id: <20250227070747.3105451-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series attempts to cleanup io.h with "include what you use" approach.
This depends on changes available on immutable tag[1].

Although this series is too trivial in the grand scheme of things, it is
still a tiny step towards untangling core headers. I have success results
from LKP for this series but there can still be corner cases. So perhaps
we can queue this on a temporary branch which we can use to submit fixes
in case of fallout.

Future plan is to use the excellent analysis[2][3] by Arnd to cleanup other
headers.

[1] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com
[2] https://lore.kernel.org/r/2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com
[3] https://lore.kernel.org/r/f6eb011b-40fb-409a-b2b2-a09d0e770bbd@app.fastmail.com

v2: Fix sparc build errors
v3: Fix nios2 build errors and re-order patches

Raag Jadav (2):
  drm/draw: include missing headers
  io.h: drop unused headers

 drivers/gpu/drm/drm_draw.c | 2 ++
 include/linux/io.h         | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)


base-commit: b8c38ccb2ca52b9a38cfeb9f89abab5d6e713221
-- 
2.34.1

