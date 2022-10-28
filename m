Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3DF611B11
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 21:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D3910E8CD;
	Fri, 28 Oct 2022 19:45:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ADB10E8CB;
 Fri, 28 Oct 2022 19:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666986319; x=1698522319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OW4h/gqZom5+5uqhuhcgFnLemBRxlYvMbal0u5NpBgw=;
 b=nUO0YPjXEGn/09BeHS+1ZCSZ6iFoGhBQcUkM94tZ/CWBCaH/LcUyGBmT
 yAn+P03twHJuXdOzA7Hq+G7gN6tf3Q7d/P/EoSJmuEX5U1+L6L0Fbti0B
 m1Nr6IZreTAH2YHACVuHMqpdINy2foPr8LGzAcwzszRCQUP4TUczXqLSm
 uApsQQy3HilVNaJY+E04q1x+5GcU5AfKv9nFCJ8oTG2J/jWwVtkpghkEM
 YP52igFgCorO3ciKYPuqEbaoPw4XqL2ymeFndhS33m6r+yTn9jEk7rKUq
 5mn5vmlsn+s2qR6gkKIzMt1CbbgeaZpzLzxUje0DGvxJYdxB6BayZPFEp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372787685"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="372787685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 12:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="775491781"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="775491781"
Received: from relo-linux-5.jf.intel.com ([10.165.21.195])
 by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2022 12:45:09 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Fix for two GuC issues
Date: Fri, 28 Oct 2022 12:46:47 -0700
Message-Id: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
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

Fix for a deadlock issue between the GuC busyness stats worker and GT
resets. Also fix kernel contexts not getting the correct scheduling
priority at start of day.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/guc: Properly initialise kernel contexts
  drm/i915/guc: Don't deadlock busyness stats vs reset

 drivers/gpu/drm/i915/gt/intel_reset.c             | 15 ++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_reset.h             |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  9 +++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.37.3

