Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDC1522419
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0990010E021;
	Tue, 10 May 2022 18:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765310E021;
 Tue, 10 May 2022 18:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652207610; x=1683743610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oSEps9+R5JXIZfNwbKYkU7jEWQUHQly7GLLllzOm8Ro=;
 b=CumC8qlirZ4Wcu4yXzUeBQuZ07FHnSGJk62xR979fSIzRpYCrOlsE3fw
 C7nxlS2bwloSpgGloa0TVglmuWj7N1faXRFvD8adSql3d0ocOnz5mCpWc
 b7VKk+GDvEgddGRYVqsXB4+OGuzFpg+/BEapMW3RYo8OGto+Qg318+HD2
 ER/jfGyfFqpWaTJ38qeyZWonJ35rsz0jgv5/qTKqdL0G+Kz4A4KdE5QNU
 5YXi/wOAio6UQzWJ8KxAruub8pD1kyItDqg1kkEbow/ndcEtQ6HA8Gx+p
 0tALxYLaWvu/Ae1lU8cAposKwESyEiLDXAL7uoaJ3F1VTTr5KbCQ0f+Cc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="267058471"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="267058471"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:33:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593673554"
Received: from lengdahl-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.220.119])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:33:26 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/3] Fixes for selective fetch area calculation
Date: Tue, 10 May 2022 21:33:10 +0300
Message-Id: <20220510183313.1046628-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mark Pearson <markpearson@lenovo.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently selective fetch area calculation ends up as bogus area in
at least following cases:

1. Updated plane is partially or fully outside pipe area
2. Big fb with only part of memory area used for plane

These end up as y1 = 0, y2 = 4 or y2 being outside pipe area. This
patch set addresses these by ensuring update area is within pipe area
or by falling back to full update.

Patch set also adds drm_dbg_once* macros to print out debug message
only once. drm_dbg_once_kms is used to printout debug message when
selective fetch area calculation fails.

v3:
 - Add drm_dbg_once* and use it when sel fetch area calculation fails
 - Move drm_rect_intersect to clip_area_update
v2:
 - Update commit message of first patch
 - Set damaged_area x1 and x2 during initialization

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Mark Pearson <markpearson@lenovo.com>

Jouni Högander (3):
  drm/print: Add drm_debug_once* macros
  drm/i915/psr: Use full update In case of area calculation fails
  drm/i915: Ensure damage clip area is within pipe area

 drivers/gpu/drm/i915/display/intel_psr.c | 36 +++++++++++++++++++-----
 include/drm/drm_print.h                  | 29 +++++++++++++++++++
 2 files changed, 58 insertions(+), 7 deletions(-)

-- 
2.25.1

