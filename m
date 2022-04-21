Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6682250963F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 07:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6D810F33E;
	Thu, 21 Apr 2022 05:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456D810F33F;
 Thu, 21 Apr 2022 05:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650517696; x=1682053696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PzmU/jrIGrU3GShXrIxD7LsKASc+Pzy8wBHcFdn1N1E=;
 b=neh/oAv2sl1R6xj02yJ+PoIfu1ttlbi3F9iyvcmAtDqIATsbMAynQOmM
 VIf+hHy9H4J1VuQbHmfNoszHkGeSMihlsUynbTilXn3OLD5QMj6smlNP+
 ab1tSCWgB4KzhyU4Vuf1nZc5dxoxoKJ/QUTVxm9+KH+/SNJdahE/M9hqK
 lci1XmSGNbgWwr/phdVLDFSoCAw4Pmd9GGYTUOOPGF4EV33nAxXf/b53N
 nk4eQ289zwb/fAnGI3UvlieUnryZag4vzBaGte4F36+cVQeLcP4hQuh2Y
 BgTxvE/sUxbXzNmHvzAAoonfaGMhmZBze5QialDcDHlIB2YJlRksJurYD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="289353845"
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; d="scan'208";a="289353845"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 22:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; d="scan'208";a="555577564"
Received: from kandpal.iind.intel.com ([10.190.239.32])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2022 22:08:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/3] i915 writeback private framework
Date: Thu, 21 Apr 2022 10:37:53 +0530
Message-Id: <20220421050756.2036609-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: jani.nikula@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A patch series was floated in the drm mailing list which aimed to change
the drm_connector and drm_encoder fields to pointer in the
drm_connector_writeback structure, this received a huge pushback from
the community but since i915 expects each connector present in the
drm_device list to be a intel_connector but drm_writeback framework.
[1] https://patchwork.kernel.org/project/dri-devel/patch/20220202081702.22119-1-suraj.kandpal@intel.com/
[2] https://patchwork.kernel.org/project/dri-devel/patch/20220202085429.22261-6-suraj.kandpal@intel.com/
This forces us to use a drm_connector which is not embedded in
intel_connector the current drm_writeback framework becomes very
unfeasible to us as it would mean a lot of checks at a lot of places
to take into account the above issue.Since no one had an issue with
encoder field being changed into a pointer it was decided to break the
connector and encoder pointer changes into two different series.The
encoder field changes is currently being worked upon by Abhinav Kumar
[3]https://patchwork.kernel.org/project/dri-devel/list/?series=633565
In the meantime for i915 to start using the writeback functionality we
came up with a interim solution to own writeback pipeline bypassing one
provided by drm which is what these patches do.
Note: these are temp patches till we figure out how we can either change
drm core writeback to work with our intel_connector structure or find a
different solution which allows us to work with the current
drm_writeback framework

Suraj Kandpal (3):
  drm/i915: Creating writeback pipeline to bypass drm_writeback
    framework
  drm/i915: Define WD trancoder for i915
  drm/i915: Enabling WD Transcoder

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/display/intel_acpi.c     |   1 +
 drivers/gpu/drm/i915/display/intel_display.c  |  89 +-
 drivers/gpu/drm/i915/display/intel_display.h  |  15 +
 .../drm/i915/display/intel_display_types.h    |  18 +
 drivers/gpu/drm/i915/display/intel_dpll.c     |   3 +
 drivers/gpu/drm/i915/display/intel_opregion.c |   3 +
 .../gpu/drm/i915/display/intel_wb_connector.c | 296 ++++++
 .../gpu/drm/i915/display/intel_wb_connector.h |  99 ++
 drivers/gpu/drm/i915/display/intel_wd.c       | 978 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_wd.h       |  82 ++
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_irq.c               |   8 +-
 drivers/gpu/drm/i915/i915_pci.c               |   7 +-
 drivers/gpu/drm/i915/i915_reg.h               | 139 +++
 15 files changed, 1742 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_wb_connector.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_wb_connector.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_wd.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_wd.h

-- 
2.35.1

