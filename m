Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A85EEB8B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 04:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E919A10E9B2;
	Thu, 29 Sep 2022 02:17:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717CD10E9AE;
 Thu, 29 Sep 2022 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664417840; x=1695953840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3n0ZptjGd1JWUWEDnjy8Aqmi5SSxi2m4VPOI8Uo0zdU=;
 b=mCXSLzOjl+IcD78zrOk03FonHWyKgkeXWnPNOfVPfJBT1wZlROCI/kVo
 NwE8HVRbBh/Zkba55KRyshrp+xAFH6DohyzG89DvxULryFbOnnfH8ff/m
 ntyyblF35o7wOLTTXK9XniJ1f/MQGKLH+vRG/CrNLRdugkfulY+aS8hEI
 8qQvJsuXing0KS1nXWNVo/Me+x5fER9tJHXP0LHp2DWmc7+CBIwWLxDkZ
 /6lR8Znst4wPsLbXSN2iQCUZgHP+dZChaEJZl+3r4GmC02aDMmdDGqTt9
 d8oG12nVnVnamQf1gC9sKqXVJkeETihGjpus3NLTzJaszwPepOhGh1/TL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="281484115"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="281484115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 19:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="573275930"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="573275930"
Received: from relo-linux-5.jf.intel.com ([10.165.21.142])
 by orsmga003.jf.intel.com with ESMTP; 28 Sep 2022 19:17:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 0/4] Improve anti-pre-emption w/a for compute workloads
Date: Wed, 28 Sep 2022 19:18:09 -0700
Message-Id: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: Add clamping helpers.
v3: Remove long timeout algorithm and replace with hard coded value
(review feedback from Tvrtko). Also, fix execlist selftest failure and
fix bug in compute enabling patch related to pre-emption timeouts.
v4: Add multiple BUG_ONs to re-check already range checked values (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/i915/guc: Limit scheduling properties to avoid overflow
  drm/i915: Fix compute pre-emption w/a to apply to compute engines
  drm/i915: Make the heartbeat play nice with long pre-emption timeouts
  drm/i915: Improve long running compute w/a for GuC submission

 drivers/gpu/drm/i915/Kconfig.profile          |  26 ++++-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   6 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 102 +++++++++++++++---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |  19 ++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c       |  25 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  21 ++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   8 ++
 7 files changed, 179 insertions(+), 28 deletions(-)

-- 
2.37.3

