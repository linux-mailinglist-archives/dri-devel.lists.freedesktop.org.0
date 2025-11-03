Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C480EC2AB5E
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3802210E050;
	Mon,  3 Nov 2025 09:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDKOXwJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B469E10E050
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 09:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762161765; x=1793697765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nWu0C6Qci9EemmyCcPbSN3cpoNKU7cVc7wGPN4fNQIA=;
 b=nDKOXwJGYBMFsVw1zQ6GD4uqCGpE2J7J72OdOzINUA7nDyJRNP55OnGJ
 BJyfUI/jZkbJReBx1BCK2VVQCp40FCCqi+4nVKOr5nYOXZAM383NEjNJS
 E9qdBS+B7Q+SM7N0RN0nO+VhsCA9eL7Vgkj4FGD76x6e1zov4v8IRrw8s
 FJRCaVotde2u0kyt5Ptm/jsZJXiD0LFHP4x4z1xenp/5LON2GYP7OZ0rZ
 pg2PT2uaLHDFAupkmOhE0xI2CQHbuPtn2X11fu8lKpXZlwYqGVEhvOqBF
 D02CEL8m+xPmFneGDuvCPvcrdpGN7F7czEehf8L/E9+8hO0h7QD9V+X9H Q==;
X-CSE-ConnectionGUID: SIxQpOD1Rx67XONIZBm4Og==
X-CSE-MsgGUID: +gM+PusgRAm3wlU+MzfGeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75583841"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="75583841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:22:45 -0800
X-CSE-ConnectionGUID: t+2eedNsSmGIb56/18jPjQ==
X-CSE-MsgGUID: KkWUfbb4QhqeKmCWmznLpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186059406"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.127])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:22:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: jani.nikula@intel.com
Subject: [PATCH 0/2] drm: fix fallout from drm_print.h include cleanups
Date: Mon,  3 Nov 2025 11:22:37 +0200
Message-ID: <cover.1762161597.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Fix some (I guess inevitable) fallout from the drm_print.h cleanups.

Note: I'm setting Fixes: f6e8dc9edf96 ("drm: include drm_print.h where
needed") instead of the ones removing drm_print.h includes, because that
was the one that was supposed to have them all.

Jani Nikula (2):
  drm/renesas: include drm_print.h where needed
  drm/rockchip: include drm_print.h where needed

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.47.3

