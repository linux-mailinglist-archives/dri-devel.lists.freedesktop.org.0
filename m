Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52829943802
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 23:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8645710E6D2;
	Wed, 31 Jul 2024 21:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjTxSaAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDD510E6D0;
 Wed, 31 Jul 2024 21:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722461500; x=1753997500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=afauhDP4n3sfudcJzqI+YKboxR7J7yG7hB1IurHYCVU=;
 b=GjTxSaAZZfq30SCLzO8hl22XX0PF4+mcckA2Wa7bjsWGwf/lyDv1SfRs
 iXzB4/H0AZaMw7ufEjqNeYw2i3cyNwX+1T9rGXwxaqET6Cu6zUWH+gIty
 0bhdwL9lI+I4LveSztOglKJPB6cV+0cYsfFwHJcMZenLA/4J+n7s6OwvA
 cnTb0iQDTtT8bbOG3wKQGvMkL7tEkd9uQTsMaWKMkSwLL8HCnk2lD3dq7
 TagU/uEPmXZVi5r42eVhKyK/wmFmeYUJVCAtOmaDKYCjv0Jwd0M+z6Dbe
 5hxjFXs62Sh/EUE14iR6MVOq0cIpcErUDaDS9Dt7MHv0QwRiMHhL1dX9E w==;
X-CSE-ConnectionGUID: 6f8iq2wBSb29ySXSgLKN/g==
X-CSE-MsgGUID: pGjOBQdnRaWir7wZsGAT3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24234736"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="24234736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:31:39 -0700
X-CSE-ConnectionGUID: Z29vXvJZTRStESjr3XE7Jg==
X-CSE-MsgGUID: OQ7yIgL4TTGsdOA+BLuI/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="58938894"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:31:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v4 0/3] Faster devcoredump and fixes
Date: Wed, 31 Jul 2024 14:32:18 -0700
Message-Id: <20240731213221.2523989-1-matthew.brost@intel.com>
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

Combine [1] [2] for complete series to speedup devcoredump and fix it.

[1] https://patchwork.freedesktop.org/series/136541/
[2] https://patchwork.freedesktop.org/series/136545/

Matthew Brost (3):
  drm/xe: Take ref to VM in delayed snapshot
  drm/printer: Allow NULL data in devcoredump printer
  drm/xe: Faster devcoredump

 drivers/gpu/drm/drm_print.c               |  13 ++-
 drivers/gpu/drm/xe/xe_devcoredump.c       | 112 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   4 +
 drivers/gpu/drm/xe/xe_lrc.c               |  15 ++-
 4 files changed, 107 insertions(+), 37 deletions(-)

-- 
2.34.1

