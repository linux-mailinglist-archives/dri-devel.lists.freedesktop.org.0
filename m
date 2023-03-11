Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD296B5904
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 07:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325B210E0D1;
	Sat, 11 Mar 2023 06:38:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFECB10E09D;
 Sat, 11 Mar 2023 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678516695; x=1710052695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5T/Qfg8LrWGipj+pJLk2Y8UMxub4EmJlIXrOMNsl+DU=;
 b=PYxOVM/lPaRJCt5v4Sg0kIIx/QL78bVbIMls8TYMdbLkPBm4CR7Y434Y
 as4/B97P1lhzkBCDjHIErMm/Ak+ha86m9T7SoeJ6XV9wei8GDZEMort8a
 yU5SBPYpIHh5jANbUwLv2zmYSMwB+NE4m0UqTT17pURNMtn+gUQr8b55H
 j+hsO/K8D4ed2FfWMJ9SFritKoPsSN5GHhlha4qORTKz2ih0+DZL6NzpP
 pjYK0OsccYdUsrzkrccHdYJNL8qB3rzpjxbVF2Dhvf20vcXTc/3+s8eH1
 AQ+MEt58tiD2LRS/F90N2dztGn3b26MynFnU6TYsEsMyYmZcyn4Oxn6P6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335579551"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="335579551"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 22:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="678086690"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="678086690"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 22:38:15 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/3] More error capture improvements
Date: Fri, 10 Mar 2023 22:37:11 -0800
Message-Id: <20230311063714.570389-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Ecodes got lost with the switch to GuC based register lists. Put them
back.

Seqno values got lost with the switch to per context timelines. Put
those back too.

v2: Rework the timeline patch to just read the single seqno value
rather than copying the entire object (Daniele)
v3: %d -> %d (Alan)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/guc: Fix missing ecodes
  drm/i915/guc: Clean up of register capture search
  drm/i915: Include timeline seqno in error capture

 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 27 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_gpu_error.c         |  3 +++
 drivers/gpu/drm/i915/i915_gpu_error.h         |  1 +
 3 files changed, 28 insertions(+), 3 deletions(-)

-- 
2.39.1

