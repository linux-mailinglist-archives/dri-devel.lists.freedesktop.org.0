Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC66A3306A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF5B10E987;
	Wed, 12 Feb 2025 20:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJ+4ud52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1042610E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739390768; x=1770926768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1YJbzurhRAfke5H4H9g/dulbokwhS2QPZpJr6FRO4y4=;
 b=lJ+4ud523jR0NaVO8PUFNwOEz1htIZW8ivxGD2o1fYfKynYBncslhabF
 F2xfNwbN5Uo8xnsHbFha/rYWQYsahDar7yXrU0yd/QjohyWC10Us89/Zv
 NoF1kcEN9uDfdVFg2Zb+vYCQHdSa5OsHuxuhUFVyGbCykc5XOVv+PAUuy
 ZDDDlKyjkNdESvsdCuyq9dtcipVmwUG9UVOS1N9J/T1oNne/TIpIiN4b5
 a/wRi5enKKMLp+DR1oxMKF9NGc124feVzFexv+412q3AqzA3BoEwotBA4
 Ce7ECEaWek0NeH3ypxwdUNAgYKFe3IqFnKE8CAok6wtI62WRRBnwKvQMc g==;
X-CSE-ConnectionGUID: l0b+ukfzTYi6smuI+q4UAQ==
X-CSE-MsgGUID: GPYIYnuqQHCev0UbO2rh7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50718485"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50718485"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:07 -0800
X-CSE-ConnectionGUID: fb7QRtBwQRq3P1ire6C55A==
X-CSE-MsgGUID: JTmdfeUPTviGPc3Qxk63qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="118010751"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/6] Make devres cleanup and component compatible
Date: Wed, 12 Feb 2025 12:05:36 -0800
Message-ID: <20250212200542.515493-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
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

While trying to convert the xe driver probe sequence to use more devm, I
stumbled upon it not being compatible with component driver that is used
by xe to work with mei and audio.

First patch makes that possible with the 2nd and 3rd being some drive by
improvements.

The last 3 patches here are just to show it being used in xe,
but they require https://lore.kernel.org/intel-xe/20250212193600.475089-1-lucas.demarchi@intel.com/.
If this is acceptable I may even drop the first patch of that series and
convert it straight to devm rather than with an intermediate step.

Lucas De Marchi (6):
  drivers: base: devres: Allow to release group on device release
  drivers: base: devres: Fix find_group() documentation
  drivers: base: component: Add debug message for unbind
  drm/xe: Stop setting drvdata to NULL
  drm/xe: Switch from xe to devm actions
  drm/xe: Drop remove callback support

 drivers/base/component.c                |  3 +
 drivers/base/devres.c                   | 12 +++-
 drivers/gpu/drm/xe/display/xe_display.c |  4 +-
 drivers/gpu/drm/xe/xe_device.c          | 79 -------------------------
 drivers/gpu/drm/xe/xe_device.h          |  4 --
 drivers/gpu/drm/xe/xe_device_sysfs.c    |  6 --
 drivers/gpu/drm/xe/xe_device_types.h    | 17 ------
 drivers/gpu/drm/xe/xe_gsc_proxy.c       |  4 +-
 drivers/gpu/drm/xe/xe_pci.c             | 11 +---
 9 files changed, 20 insertions(+), 120 deletions(-)

-- 
2.48.1

