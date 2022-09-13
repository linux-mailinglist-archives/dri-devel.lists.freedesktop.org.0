Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8B5B6F59
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A0E10E4CC;
	Tue, 13 Sep 2022 14:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2863410E4CC;
 Tue, 13 Sep 2022 14:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663078407; x=1694614407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TDmMQ2xxrdAHQ6+EuRrGqT3fOxHMBNnCJe3UQFYdS4s=;
 b=KRaf1UNYZo9dReCY+VReNiQ1DkV6CfqxX5AlnhpSBqMNT7BPuKN+oSKE
 qZlrgbQOQ2T6VTxiS1x7Z39ycppwWu8NoPTLTnMCCEQL4GgAQM+FhysFA
 R5bm8AJVgkD7RbqDVC0l/rWciyf08++sSOdpXecVeg8SKAchG5W/3fghn
 kvSngo7YQfEyPH6FsmvKcsUJKVTuX+jDlJT3UJKz8sPO374EZ29wjgD+t
 xFmVC8w45Wxr4pmJap8T3oM9Re7HhRr/NtYkS+vpJ47fvEkHBRTPWiqS9
 ZYYpWTMt47wPXJqtZg7vFo4Q5N6h951+DL2QLbJLNXmQ+vIz9NI0LDRzv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="299484604"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="299484604"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 07:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="678584514"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2022 07:13:24 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] Add DP MST DSC support to i915
Date: Tue, 13 Sep 2022 17:14:13 +0300
Message-Id: <20220913141417.8131-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we have only DSC support for DP SST.

Stanislav Lisovskiy (4):
  drm: Add missing DP DSC extended capability definitions.
  drm/i915: Fix intel_dp_mst_compute_link_config
  drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to separate
    function
  drm/i915: Add DSC support to MST path

 drivers/gpu/drm/i915/display/intel_dp.c     |  73 ++++----
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 189 ++++++++++++++++++--
 include/drm/display/drm_dp.h                |   9 +-
 4 files changed, 231 insertions(+), 57 deletions(-)

-- 
2.37.3

