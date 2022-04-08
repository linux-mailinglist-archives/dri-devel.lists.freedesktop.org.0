Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD794F8EF8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 08:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948A710F724;
	Fri,  8 Apr 2022 06:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548E810EA7A;
 Fri,  8 Apr 2022 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649400964; x=1680936964;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vt6vMrMrVTzohy71/f48zr+/GBHY6470J2SAFq82sA4=;
 b=WWlxEuhjHMiyUIwrShGWpUimJ5MfiGI9USDvCZr8ubd+X6yVzBR3V1sg
 730k+5VgP9biwGE3adGgdTH02S1/3sVZrxKUVBebr1fNFp+A2kqL9fgCE
 ejagSWUJ+Dq/8iGqooX36OCcM/mbzKbT8P1zOwYqXhn041W4idqa9qBC4
 BV96QqOkROlQ407z/1hEKscA69DzHbozfMklEtPIR6wpSw9NyV06mm6c2
 LMzr5HpFFhPuFrleXUSitd3zPtk4DCnj+Uaw8wia5INWQesWWHwTKTa3P
 CPNEFsrcbnqZ/9+N0Z8p+FEeHDOpxe54aJLWRx6mw67LFY2Q2fycKplry A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261219245"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="261219245"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:55:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="506457568"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:55:48 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Subject: [PATCH 0/3] Expose max and current bpc via debugfs
Date: Fri,  8 Apr 2022 12:23:47 +0530
Message-Id: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
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

Test-with: 20220408065143.1485069-2-bhanuprakash.modem@intel.com

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

