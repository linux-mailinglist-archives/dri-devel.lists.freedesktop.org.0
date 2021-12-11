Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE4470FA9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6900710E698;
	Sat, 11 Dec 2021 01:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E94D10E68D;
 Sat, 11 Dec 2021 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639184516; x=1670720516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9GHjpu2JWB/LfIDhmPB1fbJtv8dI+453iXK0DeIytDQ=;
 b=ItIDDB4recCzG7oYSJvhOdN5PpWyFD6dC5G1h7xLnt+UpHZPHA80QhqY
 faK9DfT97QPEEtVbd3ZKReO/PxBlV/+/JReJNO8JzLOgws+Zd8/Vn7ihw
 Y55XzDTqQXzwZvIaa0mlxjOmqHKwQhNm3MFot5AwvAZ26GzL9NIV6ym3P
 D4Wv7mkgE37pQ47QyX1hAiVvGHH/jkud8lg0MrIYOFJj3400ai/P6DGvf
 T04ajhk1PGmBKY1sPeOtAn7cP0xZfa++B27px5tdGZ6ZakwEcHa7/64r8
 Teys1pG9+boaS32Q1WTeHfukNwMoZZFSO7Ocr2tA+2cYdPNDtBxKZ39QM A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238298241"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="238298241"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517002944"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] Fix stealing guc_ids + test 
Date: Fri, 10 Dec 2021 16:56:05 -0800
Message-Id: <20211211005612.8575-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches 1 & 2 address bugs in stealing of guc_ids and patch 7 tests this
path.

Patches 4-6 address some issues with the CTs exposed by the selftest in
patch 7. Basically if a lot of contexts were all deregistered all at
once, the CT channel could deadlock.

Patch 3 is a small fix that is already review but just included for CI.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

John Harrison (1):
  drm/i915/guc: Don't hog IRQs when destroying contexts

Matthew Brost (6):
  drm/i915/guc: Use correct context lock when callig
    clr_context_registered
  drm/i915/guc: Only assign guc_id.id when stealing guc_id
  drm/i915/guc: Remove racey GEM_BUG_ON
  drm/i915/guc: Add extra debug on CT deadlock
  drm/i915/guc: Kick G2H tasklet if no credits
  drm/i915/guc: Selftest for stealing of guc ids

 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  12 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  18 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  68 ++++---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 171 ++++++++++++++++++
 4 files changed, 241 insertions(+), 28 deletions(-)

-- 
2.33.1

