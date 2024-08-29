Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6990964ADE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BCD10E71A;
	Thu, 29 Aug 2024 16:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyyP/xwQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D1010E71A;
 Thu, 29 Aug 2024 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724947202; x=1756483202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FZMzouHuGgFWMsyvFfqSWdgkqnTzjcd2HKW5qqix9aE=;
 b=gyyP/xwQ6h6wIjGDWdSm7JRcVSY7TZP59QRupUAIXfT78nHcLWmTSUEY
 j5g8Fyn5yX6NDViXqqlp+AzwFKT/8Akpf1Ip8R1uBed2LBjwpEkUvZgl2
 Vq3YozXwP/KNi8C01A7lWWgdQEmT1Y+jw6hB0QB1BWzWEhZFnjY9lxw3r
 DKcMg/7rYZtaALWyNNiyy2/cxseodWQbl97WD8z2gvR+d1RX02MMHhYmU
 dfsiv6YFK6c2Gw4u2XV3HZayxtweQzlYpcNBqDvqb07ejagrhacR+voPU
 iGRRceU2k0PhS30W4ZnzcZ4e/dIo7U84wsz1skUjxODA/keKugjnyFtdJ g==;
X-CSE-ConnectionGUID: gXlk4j7YRDy82hu/NmTIvg==
X-CSE-MsgGUID: BdlwQx3USSuGE+z26NBSlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23695915"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23695915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:00:02 -0700
X-CSE-ConnectionGUID: ji0B6GX1TiCrXeH6j7zzXA==
X-CSE-MsgGUID: uttuXp35TnSqnZou/4qUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68440628"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP; 29 Aug 2024 08:59:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A75D2610; Thu, 29 Aug 2024 18:59:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
Date: Thu, 29 Aug 2024 18:58:36 +0300
Message-ID: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
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

With CONFIG_WERROR=y and `make W=1` build fails on my x86_64 machine.
This is due to some unused functions. Hence these quick fixes.

Andy Shevchenko (2):
  drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
  drm/i915/fence: Mark debug_fence_free() with __maybe_unused

 drivers/gpu/drm/i915/i915_sw_fence.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

