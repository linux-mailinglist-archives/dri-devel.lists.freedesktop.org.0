Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7901A4A4B9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0FA10E0D7;
	Fri, 28 Feb 2025 21:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b23NN+M3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BCC10E0D7;
 Fri, 28 Feb 2025 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740777298; x=1772313298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9095NKrE0Fb7IQlGmDqxLN4xmrabliHU/p0N7YYy2lY=;
 b=b23NN+M3WaT02lSBPzo9rbGiVrLqJ98n7L0YH29fBk43Pr2a9T9HnUlU
 gsPrM+iwlDJO2l6EByJLLSHgjeuGX5ODAesXLh5eJXRqwLqtiX5YwQ7+Z
 qnr4IVgteIFEC6vB3rc0p8EEJUdXptxn86JFs9vmkFsIggNZoL8gP50wA
 kQuX3DtUphbIJyqWVYimWh1rjoOyNhmYIUrsz+D2fD5sPHKb6Dw5iE7Og
 9x2HP2Ey5aorYqEGjlydZ2rdGNtPVATjCkhFiL3DJPxepevexXNF5RvX0
 4I/1pHnlp3i5t0ls0Qtod30amPS43g7YCr59VBhE9yG+yvP8Z5/XpLSWo w==;
X-CSE-ConnectionGUID: 2pvnrDmDQJqlUwk75/lerw==
X-CSE-MsgGUID: 4TnEIbGwT0OicgloRXDWJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52352286"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52352286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 13:14:58 -0800
X-CSE-ConnectionGUID: q5MEE3oJQhylCeN68mQRhA==
X-CSE-MsgGUID: g48MiYe5SKSqpX99cRY2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122684748"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 13:14:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 23:14:54 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/8] drm/client: Stop using legacy crtc->mode and a bunch
 of cleanups
Date: Fri, 28 Feb 2025 23:14:46 +0200
Message-ID: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The most interesting part is the change to modes[] to solve
the lifetime issue so that we can stop using the legacy
crtc->mode for atomic drivers.

Additionally I included a bunch of cleanups, some of which were
inherited from https://patchwork.freedesktop.org/series/132051/

v2: Changed modes[] back to storing pointers rather
    than the actual mode structures, wasn't as ugly
    as I recalled last time

Ville Syrjälä (8):
  drm/client: Constify modes
  drm/client: Use array notation for function arguments
  drm/client: Streamline mode selection debugs
  drm/client: Make copies of modes
  drm/client: Stop using the legacy crtc->mode
  drm/client: s/new_crtc/crtc/
  drm/client: Move variables to tighter scope
  drm/client: s/unsigned int i/int i/

 drivers/gpu/drm/drm_client_modeset.c | 257 +++++++++++++++------------
 1 file changed, 140 insertions(+), 117 deletions(-)

-- 
2.45.3

