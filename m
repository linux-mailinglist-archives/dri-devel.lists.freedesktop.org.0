Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE3CB0401
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033A310E5E4;
	Tue,  9 Dec 2025 14:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeawTFhI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21C210E5E4;
 Tue,  9 Dec 2025 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290203; x=1796826203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=slW9Ol0iLgFIetepIUAHaTCdvw+XXi6Hah5b3LZ5Djc=;
 b=PeawTFhIBBnB+0k6ANULzkJHJ+6G3ThzPqGmHC9YQI8lSnv97kdzUHsq
 upJQf7aHutvwdPrTIPpPj/KSPyQ0rG/4i+3xt/jv97G/g+ya6YgROqMmb
 XOqtVQxT6QvKdBiq5lKvngZ2HgSKD6Aj+PmSIEMh9+NI6mxN+iGydtfE5
 k8EtqMcthPHp4hORrIWvJSe1MwA7EQgjyT8706Tmp2ibQahTc5mhXf02h
 j+P9txK2zN1wpV7Wz2RrUdmycb1TDd2e2ueqhS4Nd2UGuA8Uq58WImow4
 UxT0GDI92uIdBVRK1J9HCTvKb1dVKGGW3z0CLKL8FVbKXGQKkOFd8FNTe A==;
X-CSE-ConnectionGUID: NAQqBNNaTH2CzHRli4oQjQ==
X-CSE-MsgGUID: yqyiH8ZoRqiDofiriIEyVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67140875"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67140875"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:23 -0800
X-CSE-ConnectionGUID: DCEKcG2SSxqODL5DrBL3yQ==
X-CSE-MsgGUID: ILmbwFw8RxS8N59ZTwhzAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="201160650"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH 0/7] drm/vblank: refactoring and cleanups, part 1
Date: Tue,  9 Dec 2025 16:23:08 +0200
Message-ID: <cover.1765290097.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is just the first 6 patches from [1], because there are still
issues with kunit tests that do not have vblanks enabled.

[1] https://lore.kernel.org/r/cover.1764933891.git.jani.nikula@intel.com

Jani Nikula (6):
  drm/vblank: remove drm_wait_one_vblank() completely
  drm/vblank: remove superfluous pipe check
  drm/vblank: add return value to drm_crtc_wait_one_vblank()
  drm/vblank: limit vblank variable scope to atomic
  drm/vblank: use the drm_vblank_crtc() and drm_crtc_vblank_crtc()
    helpers more
  drm/vblank: prefer drm_crtc_vblank_crtc() over drm_vblank_crtc()

Thomas Zimmermann (1):
  drm/vblank: Unexport drm_wait_one_vblank()

 drivers/gpu/drm/drm_vblank.c | 52 +++++++++++++++---------------------
 include/drm/drm_vblank.h     |  3 +--
 2 files changed, 22 insertions(+), 33 deletions(-)

-- 
2.47.3

