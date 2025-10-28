Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F130C16B99
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C22210E658;
	Tue, 28 Oct 2025 20:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCP/F0Xx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F07D10E657;
 Tue, 28 Oct 2025 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682053; x=1793218053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zM9KX8WIkbK1db8SoBh5mI14NuM2toHucWHkzqa/6kA=;
 b=hCP/F0XxpRnEgfr8KZe6+EXw+LWnyWnfeQK2Q9qhcByggFtnID0TAaO+
 sjYujt4smLPk2UTAVCl+xkKvlU7InsHvcD6vemWNiD5Sq393eDXhlsEPU
 WP0MJtbEltOS7JDMeGczDDWzP5FhNmXONFBTsy3MQNFXEBvb9AxPRxtVk
 y9w+i//GSwO85mWir3fR4dx/xtAQt25VxrmxAH5vxGVcCLg+YSyv6jyDZ
 ZzIkDqJ4cZ1EFMrySVstNfXRaPio3PU6W2dfFpkpT/kmFS8pEYY2P1U5w
 NWREqD0aleqxV8ZjXVXIfczeWT6ZA+I/tdNAFW2BMQ0JqeSHaNE39J3jC Q==;
X-CSE-ConnectionGUID: SXLUxYRdS9KYH+orXLLdGQ==
X-CSE-MsgGUID: q1qprMB6SJSrqvyy51HL7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89264556"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="89264556"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:07:33 -0700
X-CSE-ConnectionGUID: muta0ydOQlKH0+qImbOB6w==
X-CSE-MsgGUID: 57qw2427Sp2Oehs4BBpB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="184694251"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:07:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 tiago.martins.araujo@gmail.com, jani.nikula@intel.com
Subject: [PATCH 0/3] drm/displayid: quirk incorrect DisplayID checksums
Date: Tue, 28 Oct 2025 22:07:24 +0200
Message-ID: <cover.1761681968.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Jani Nikula (3):
  drm/displayid: pass iter to drm_find_displayid_extension()
  drm/edid: add DRM_EDID_IDENT_INIT() to initialize struct
    drm_edid_ident
  drm/displayid: add quirk to ignore DisplayID checksum errors

 drivers/gpu/drm/drm_displayid.c          | 58 ++++++++++++++++++------
 drivers/gpu/drm/drm_displayid_internal.h |  2 +
 include/drm/drm_edid.h                   |  6 +++
 3 files changed, 51 insertions(+), 15 deletions(-)

-- 
2.47.3

