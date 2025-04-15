Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0BA897A0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C596710E695;
	Tue, 15 Apr 2025 09:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfkHXPwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCD910E0C9;
 Tue, 15 Apr 2025 09:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744708423; x=1776244423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eT09ZGkfujX+nvthus87tmeuIMZozYbGYyFoKcQlems=;
 b=cfkHXPwx0YqWe7c8ZYkxubTIi2PzLHL5R79TuExVpHkSp5dwCD7z41AM
 NSFnL0DJPgdiOlIVm/jvhg1boBI/CKTRlXw4p8BYtA0T16az2W7BZ/dtr
 prHcbKYeJa/lEcoi7ZSZK3yLZbCdCkeUPksAl6BmWPoDNhJ2og8ExjBWD
 BSFTMZgOAo6h4s6Vc8JzI48R9UFjxQdWMXgaffVhexr+GKGfAuXVxJleN
 pV7SpKVzPhjupOhKf5yjpQHjVMzKQqWMQ/DTYshWJT7s+J3iYoSmNFsNk
 HWOZoMeFGEawWsRwdOhqT8ylSpPBgZBgJJlr5oHxW+SPq8Z9oNa+tCuEY Q==;
X-CSE-ConnectionGUID: BsfWOvXSTPWfmT6mQ2FUbw==
X-CSE-MsgGUID: 8whOEPlFSwGVP2yL+sPoeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46371155"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46371155"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:13:42 -0700
X-CSE-ConnectionGUID: TusXxcogSau29wTSjDb3Mg==
X-CSE-MsgGUID: OcgWT7I+SxSmI5VedDqZQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130596221"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:13:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Egor Vorontsov <sdoregor@sdore.me>
Subject: [RESEND 0/2] drm/edid: more displayid timing parsing and cleanups
Date: Tue, 15 Apr 2025 12:13:29 +0300
Message-Id: <cover.1744708239.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Resend of Egor's patches [1].

[1] https://lore.kernel.org/r/20250214110643.506740-1-sdoregor@sdore.me

Cc: Egor Vorontsov <sdoregor@sdore.me>

Egor Vorontsov (2):
  drm/edid: Implement DisplayID Type IX & X timing blocks parsing
  drm/edid: Refactor DisplayID timing block structs

 drivers/gpu/drm/drm_displayid_internal.h | 31 +++++---
 drivers/gpu/drm/drm_edid.c               | 91 ++++++++++++++++++++----
 2 files changed, 99 insertions(+), 23 deletions(-)

-- 
2.39.5

