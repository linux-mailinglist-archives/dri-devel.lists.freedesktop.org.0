Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C647051F84B
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 11:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8696610E857;
	Mon,  9 May 2022 09:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E443310E800;
 Mon,  9 May 2022 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088657; x=1683624657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/RIgezBLOF+MXamCszJHFsxvkDXIArAWNBIn8z9Ay+E=;
 b=aCgDKL7KC5EBFMHcgt0MZ1lc73NxayLEaut5tY4xNPtAWAgEc+Q3/QcJ
 z0jfQO3z3T47BKbRCaklDwzw3t/+i/gCQWlPyxDf225dxLLHwTloW7+pp
 wHGvMHRJUKVBRKu7gkgBXNkj4x3Gk2VGEqej/j9ZEw6HFeLlyw6yX+Gnz
 mPeeDA9LoD6lwptzSA7KSXyifxf3RXEeFJH6Jv87Mx0J0Pe97qTptY2Ar
 p7+kWHJvEacL6+HNyzxgIFIj1KX2Y9sO3rSuD1baYl/jKPH5GbIB61j5D
 A6Zj0tLlWDnQ09MSYJ6hJFLl7M794Dfbdi8OEysV6MmvpUpFM0SWr2cVu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294218297"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="294218297"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:30:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="591551125"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:30:47 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Prune unsupported modes as per HDMI2.1 spec
Date: Mon,  9 May 2022 15:01:28 +0530
Message-Id: <20220509093130.3511032-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modes like 4K100, 4K120, 8K50, 8K60 need FRL and/or DSC from source.
Since FRL and DSC are not currently supported natively by intel
platforms (are supported only via DP-HDMI2.1 PCONs), these modes must
be pruned as per spec.
Currently these modes are not getting pruned as we check the TMDS clock,
which passes some of these with YCbCr420 format and with lower bpc.
This causes failures during compliance test (e.g. HFR1-67).

This patch prunes the modes, if FRL, DSC not supported, or the support
requirement not met as per the spec.
Although the spec mentions 4K100, 4K120, 8K50, and 8K60 video timings,
I have used the check for clock >= 2376 MHz (or 1188 MHz with 420
format), instead of using individual VICs.

While at it, fix a bug while parsing the compressed bpc supported
from edid.

Ankit Nautiyal (2):
  drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI sink
  drm/i915/hdmi: Prune unsupported modes as per HDMI2.1 spec

 drivers/gpu/drm/drm_edid.c                |  3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c | 48 +++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)

-- 
2.25.1

