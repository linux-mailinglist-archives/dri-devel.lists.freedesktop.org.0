Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2E4BC224
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0DE10EA3E;
	Fri, 18 Feb 2022 21:33:08 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0B910EA3E;
 Fri, 18 Feb 2022 21:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645219988; x=1676755988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kSXGjbJ00xQzwjw2AE7oeCO5vMvetHOJzLq0UDaMMzU=;
 b=hrycMY6gTEHixLRc9kL+3uoNUOSw+c4VAbf2KHGfFjB0hMg0Mp3kO1nV
 xFEIwwxH55Row7O5AeUOH3JbbjyvRDbRSbwlIzHcT0a9bINDPjpr8CEEF
 YqHSLuDSdCF8iWwjHMidCApI7IwWefjXABkmQ+RRQ4cBK9n0mZ5RZwB+1
 ODT1eaicrxzJtwEetXu9m3fDtECZK6RdiJmghpms37tt/QGVdFMCj/rsQ
 5S2A96YPgLPMSbhF0mzF2twMHP9wddNTb91Ksa4mZLQvdnqHf6+hhdhjo
 d9OqKsVBd8efg5rZk/qJZmpvPPf7IYz3mUYxAodEgbSX5p5aSMjrS7Szf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238638708"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238638708"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="546499002"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 18 Feb 2022 13:33:07 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] Improve anti-pre-emption w/a for compute workloads
Date: Fri, 18 Feb 2022 13:33:04 -0800
Message-Id: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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

Compute workloads are inherently not pre-emptible on current hardware.
Thus the pre-emption timeout was disabled as a workaround to prevent
unwanted resets. Instead, the hang detection was left to the heartbeat
and its (longer) timeout. This is undesirable with GuC submission as
the heartbeat is a full GT reset rather than a per engine reset and so
is much more destructive. Instead, just bump the pre-emption timeout
to a big value. Also, update the heartbeat to allow such a long
pre-emption delay in the final heartbeat period.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/guc: Limit scheduling properties to avoid overflow
  drm/i915/gt: Make the heartbeat play nice with long pre-emption
    timeouts
  drm/i915: Improve long running OCL w/a for GuC submission

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 37 +++++++++++++++++--
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 16 ++++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c       | 14 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  9 +++++
 4 files changed, 73 insertions(+), 3 deletions(-)

-- 
2.25.1

