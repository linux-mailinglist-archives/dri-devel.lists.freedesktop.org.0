Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6324FB803
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F10810F9ED;
	Mon, 11 Apr 2022 09:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7B910F86A;
 Mon, 11 Apr 2022 09:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670459; x=1681206459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NoTsu4CrHlYPCqds/VG2oU5VNnI9Rc+UbeXIi2i91MA=;
 b=nLI8GmrvlgctzRSTRQoVkjaTSjMWX1RilL3j0wzTrjlsbDTXJpTSgoD0
 NFMCasuDjyxaiaBuLSjj0ubuOAqxHPIc1tmKJw182r60KCp2gELNI5Dtz
 B4wh3a4nQxwK3G7zPxLx298P9Kl4uMdrCIKRmrh28Hkr5DTpgFKiv9H2c
 gw9BtUzZHNq2G5gGKpDVJKa0P7pVLXSsdjzfpjsNo3ydkI0jjOHmuLApf
 wBxm+lU88hsqayJJ/M2nRyjCCTvqJDIrF7ikA3GcBKZ5hI0e7qabX21y7
 DsJjv3/7BuQPge/bdF7HotOMWRUL+UdpdB+YAI7qrC3l6XSICRyzjLr89 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="287085116"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="287085116"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:47:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="525914086"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:47:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v2 00/12] drm/edid: low level EDID block read refactoring etc.
Date: Mon, 11 Apr 2022 12:47:21 +0300
Message-Id: <cover.1649670305.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Submitting [1] again for CI. Just a slight change in patch 3 to address
review.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/102329/

Jani Nikula (12):
  drm/edid: convert edid_is_zero() to edid_block_is_zero() for blocks
  drm/edid: have edid_block_check() detect blocks that are all zero
  drm/edid: refactor EDID block status printing
  drm/edid: add a helper to log dump an EDID block
  drm/edid: pass struct edid to connector_bad_edid()
  drm/edid: add typedef for block read function
  drm/edid: abstract an EDID block read helper
  drm/edid: use EDID block read helper in drm_do_get_edid()
  drm/edid: convert extension block read to EDID block read helper
  drm/edid: drop extra local var
  drm/edid: add single point of return to drm_do_get_edid()
  drm/edid: add EDID block count and size helpers

 drivers/gpu/drm/drm_edid.c | 350 ++++++++++++++++++++++++-------------
 1 file changed, 225 insertions(+), 125 deletions(-)

-- 
2.30.2

