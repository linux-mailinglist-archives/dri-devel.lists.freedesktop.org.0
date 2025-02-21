Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9037CA3EC16
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 06:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53CD10EA1C;
	Fri, 21 Feb 2025 05:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elVXVA04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED92E10EA1C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 05:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740114505; x=1771650505;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+NmOMgp3sw/84tlLSWQsgw92FEDnHBV7l1MrBV4clM8=;
 b=elVXVA04YC6EgMMcgDgZDOHp0P00PR+UbwXoOr99qF7nf/eIP74S2uOd
 nHWGy5tGwvR2M5Mc4IzbNsHebmQjzC0eF0md+odhI65pTOZoC/jE0SwjK
 PKLSiq1tajIu1v0M6ET/7NyeveoVeUC/gVCkB/vjakNvoSeJaU51T6OLQ
 1BYIIyccy1OLckTWWnW74IG7SVGO+KoM1OeU0jyW+EUt+MVVFKDCq3FF9
 tJk9sX/tEjU6r6ZWFYONcVjRiGkXTz+1Ei9FzDCNuAuBT2us/cXd/AeSt
 QkGp8iD8wmMo4hetKdQDl45Sejl9XuJJEWOyTdHqHHvXtkqnteEGjtPW4 A==;
X-CSE-ConnectionGUID: Q9sT4rBtTc694g0QAe4PAg==
X-CSE-MsgGUID: e0xS11M4QCm769wXeA1mhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28518718"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="28518718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 21:08:24 -0800
X-CSE-ConnectionGUID: qTsMHrWiRTCuCs7zoi3UGQ==
X-CSE-MsgGUID: Gl/KwtSER5eXgTAaj6HP9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115459297"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 21:08:22 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/2] Cleanup io.h
Date: Fri, 21 Feb 2025 10:38:02 +0530
Message-Id: <20250221050804.2764553-1-raag.jadav@intel.com>
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

In a wider effort to improve build speeds, we're attempting to split/cleanup
core headers.

This series attempts to cleanup io.h with "include what you need" approach.

This depends on earlier modifications available in immutable tag[1]. Feel
free to carry your subsystem patches with it, or let Andy know if you'd
rather let him carry them.

[1] https://lore.kernel.org/r/Z7cqCaME4LxTTBn6@black.fi.intel.com/

v2: Fix drm_draw.c build errors

Raag Jadav (2):
  io.h: drop unused headers
  drm/draw: include bug.h

 drivers/gpu/drm/drm_draw.c | 1 +
 include/linux/io.h         | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)


base-commit: b16e9f8547a328b19af59afc213ce323124d11e9
-- 
2.34.1

