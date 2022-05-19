Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6CE52CFD1
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB81111B31D;
	Thu, 19 May 2022 09:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A9B11B31C;
 Thu, 19 May 2022 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652954090; x=1684490090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gLrNbsLL4R1/Ij+moC1oZoITvN+dHCZida9/VCiLqr0=;
 b=F9N5/gqf6c6nh0UYr2Epdilld0hsJbSL+lquR2WHkeKcZ2pCiQ/fLRlD
 dctaJbov0k/dpBEc8/L8dI6VGxyTjMxOukJaUdfK3Q+WKYGD+JzwxhXN7
 PX132EAE6F3SBpUsGjK8bI+5X4LWzDPjEqdZfHCLxbnQxPrY/7J60oyEg
 Wa4cPp2FTFpHddvCD6XarXKR8RrUXzhjJ09NZpyHpLtrAEqCqABL3bwFf
 xRPiRXWQlkgm+pvXJRl1cJy/A2/WtVCrC5LkdlJOQ9aj3lCcFwjFd8XBN
 2TMcKf6WW2Tw04cBH4bBDtbGSjKFfH9o5gEN4rhYSqC1QBEajEOYslnov w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="252019937"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="252019937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="606404149"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:47 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [CI 0/3] Expose max and current bpc via debugfs
Date: Thu, 19 May 2022 15:21:46 +0530
Message-Id: <20220519095149.3560034-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series will expose the Connector's max supported bpc via connector
debugfs and Crtc's current bpc via crtc debugfs. Also move the existing
vendor specific "output_bpc" logic to drm.

Bhanuprakash Modem (3):
  drm/debug: Expose connector's max supported bpc via debugfs
  drm/i915/display/debug: Expose crtc current bpc via debugfs
  drm/amd/display: Move connector debugfs to drm

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 --
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 38 +++++++------------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |  2 -
 drivers/gpu/drm/drm_debugfs.c                 | 21 ++++++++++
 .../drm/i915/display/intel_display_debugfs.c  | 28 ++++++++++++++
 5 files changed, 62 insertions(+), 31 deletions(-)

--
2.35.1

