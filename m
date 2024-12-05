Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822B49E51B1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 10:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5ED10E38A;
	Thu,  5 Dec 2024 09:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFpwGCiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203F710E386;
 Thu,  5 Dec 2024 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733392182; x=1764928182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DZCx6zBn1GOxFbWbp61kkKAjxV3QtXgFB+dvw5uJHBA=;
 b=AFpwGCiqq3hWjB4ZWlO6mnttdV6xV2Gy/bZDvhC7EMAuKfqeHABrweZm
 S9O5Un6ymALSmWO9x6r5mDCVFMJkR3Rjh2F1kk/jHfM3hqxNayyK37L7Y
 gZ8tJhyj4nSn0qSexcUIwzUeNUYjCHe3LsoMUEZK+rE84X5mbooPRWnQi
 gpjlZQtvA8mhFDeziJbqQBwpBTqJ8jodZFNT8bXkjbVB03dGijepo4lRG
 S6rWm5UYyaaKtxaatOMy1ci+tTD6W6PVgKACjmRyEscii3G5afwx7v8eY
 lpjrGGQuJEE/ujiInsI2bxj9AP3HpeS78bTBgLCb/3OsTvJlEMALGmQpR g==;
X-CSE-ConnectionGUID: InBrXAOzR+CxERh8LXoEYQ==
X-CSE-MsgGUID: qZrcYIW+QAW++2dXEa9+tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33938931"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33938931"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:49:41 -0800
X-CSE-ConnectionGUID: tGN48ZQoQdOYyJUxGKvRyA==
X-CSE-MsgGUID: OkY2glvFSB6+uj2T5hGD1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="124862164"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:49:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/3] drm: add drm_printer based hex dumper and use it
Date: Thu,  5 Dec 2024 11:49:32 +0200
Message-Id: <cover.1733392101.git.jani.nikula@intel.com>
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

Add a hex dumper for drm_printer, and use it to simplify hex dumping in
i915.

Jani Nikula (3):
  drm/print: add drm_print_hex_dump()
  drm/i915/display: use drm_print_hex_dump() for crtc state dump
  drm/i915/display: use drm_print_hex_dump() for buffer mismatch dumps

 drivers/gpu/drm/drm_print.c                   | 23 +++++++++++++++++++
 .../drm/i915/display/intel_crtc_state_dump.c  | 14 ++---------
 drivers/gpu/drm/i915/display/intel_display.c  | 17 ++------------
 include/drm/drm_print.h                       |  2 ++
 4 files changed, 29 insertions(+), 27 deletions(-)

-- 
2.39.5

