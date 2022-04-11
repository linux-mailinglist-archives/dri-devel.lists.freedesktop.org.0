Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5664FB896
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D893610EBB1;
	Mon, 11 Apr 2022 09:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3446610E344;
 Mon, 11 Apr 2022 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670817; x=1681206817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FSibAL3MvWjIr1YAtYjlscBQwpddrhbzKlDAvMnbOUA=;
 b=VIOkoT6qwKIj6Fi6yB9pvaxWFFnYMEnX9DoWT6PTAXbKsUhVLIQ80OHb
 83I49vOVqx+yr68GJG7DBwqLCHbMlE3r5NZ35xrKPqOTsI58GlIVDUhSG
 d/MHpbSI4l3/ThUc+f0qOhwX+/YomtLwb1qbvtamjQ3fPbGeXp0xmxSPA
 AuFSu7jY28vAzohJKzByeR9eNggQhiXrJiOcF8WszjX57SB0Qhn3adFns
 qVXfFz8nwbS5ixNdfjzuAhNajpDcQpQ4mwfFzui/Fzu3rzc3zIWKKZQCA
 ARFvMfiixUy+BaE6MsRU9n9itRZFnmNj6Yawb+jIpv2oblEtw6XXkrmV8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="259673783"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="259673783"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:53:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="659985316"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:53:33 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Subject: [V2 0/3] Expose max and current bpc via debugfs
Date: Mon, 11 Apr 2022 15:21:26 +0530
Message-Id: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
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

Test-with: 20220411094147.1650859-2-bhanuprakash.modem@intel.com

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

