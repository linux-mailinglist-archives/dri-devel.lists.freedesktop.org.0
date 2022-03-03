Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1D4CC92B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3110E38E;
	Thu,  3 Mar 2022 22:37:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DD710E38C;
 Thu,  3 Mar 2022 22:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646347058; x=1677883058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SAIZn7QMcErgUj045llNbSAaHZzAH+QF2uvWKFGNeXg=;
 b=dI7O9OBt+ullKZjoGAQHCGBtEPRrJumOdMIhZwGnTNI4Y2agMRC23GWV
 4DOSVubWp0TIZ6O72pCkfcAxi9aP9QRbeqeXqSyFWYVybkhF4YpT03PPU
 tHby3QG/WrUFkTTu0n5EYA5scYauK0kh3qInzhrFY7HVjHEC/6aLosH4w
 ugXs6JVeJ+tQ1FSm6fEHl/S3utb+zIKJ49ae75if8g1HeupdJtCdw0otM
 TQlUjAhyYQZwGqIaNZsL5sFrtWWhtpAQRbIn2Fdm12X2AR8jcLXTMy+BJ
 YNSe1cNInqr7hmUyeFve8M9Tdxk+n9OtCk3gEtpUhgEd7iAIjNZE+nWan Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233794761"
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="233794761"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 14:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="609745278"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2022 14:37:37 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/4] Improve anti-pre-emption w/a for compute workloads
Date: Thu,  3 Mar 2022 14:37:33 -0800
Message-Id: <20220303223737.708659-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/i915/guc: Limit scheduling properties to avoid overflow
  drm/i915: Fix compute pre-emption w/a to apply to compute engines
  drm/i915: Make the heartbeat play nice with long pre-emption timeouts
  drm/i915: Improve long running OCL w/a for GuC submission

 drivers/gpu/drm/i915/Kconfig.profile          | 26 +++++-
 drivers/gpu/drm/i915/gt/intel_engine.h        |  6 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 92 +++++++++++++++++--
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 18 ++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c       | 25 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  9 ++
 6 files changed, 153 insertions(+), 23 deletions(-)

-- 
2.25.1

