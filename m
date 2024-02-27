Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF20586A049
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 20:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7C210E53F;
	Tue, 27 Feb 2024 19:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAWLWCPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E918310E50D;
 Tue, 27 Feb 2024 19:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709062529; x=1740598529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EqYImp9gtBVxiVchOmb4nc3lf6aUa1fGHNdsKThCpKg=;
 b=CAWLWCPYT6KhgwLdHUFOT9LCZBOTU7vNHtrUtmu7zZ2+DgYQLs7zJkxl
 9Rp+wB1Gqc60AbcamW42eHVHMfQVupHGecULvPgiiH++bkH4Fg+98hKA0
 yb50QvQeHays86Vnar1zMBkfUeqnSgHwPRoFq1OEhNao/nhGAStaY61rd
 ux3icEFG0bDe0loKZovuJzCMr6/o4+4f3pyP3/rn0V7Sq1/aF1eMmDt6q
 TTV0XZgOf9OCogsZ/46BoWVWkggwaAeEXgMshNGCgUKNBgcKctv8kjRnr
 r9Yxi5rN2ai3eyxrRCU83SfSfU5Lh2bRfch8ryVJ7swnUzJdGMJvCdcDU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6377133"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="6377133"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 11:35:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="827770856"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="827770856"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 27 Feb 2024 11:35:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Feb 2024 21:35:23 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v2 0/2] drm: Add plane SIZE_HINTS property
Date: Tue, 27 Feb 2024 21:35:21 +0200
Message-ID: <20240227193523.5601-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Final version for a new plane SIZE_HINTS property to
essentially replace the cursor size caps, based on recent
discussion in this gitlab bug:
https://gitlab.freedesktop.org/drm/intel/-/issues/7687

As for userspace, so far I only did a quick modetest
blob decoder (mainly to verify that it looks correct):
https://gitlab.freedesktop.org/vsyrjala/libdrm/-/commits/plane_size_hints

Sameer & co. have done a real mutter implementation:
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3165

This final version follows the original idea of having
just a list of sizes in a blob, rather than the mode
complex "2D bitmap" approach I also proposed later.
I think that's fair, the bitmap was probably overly
complicated.

The only difference to the previous version of this approach
is that the documentation now states that the list is sorted
in order of preference, and thus userspace should pick the
first suitable size from the list. This should match the
aforementioned mutter implementation.

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>

Ville Syrjälä (2):
  drm: Introduce plane SIZE_HINTS property
  drm/i915: Add SIZE_HINTS property for cursors

 drivers/gpu/drm/drm_mode_config.c           |  7 +++
 drivers/gpu/drm/drm_plane.c                 | 52 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cursor.c | 24 ++++++++++
 include/drm/drm_mode_config.h               |  5 ++
 include/drm/drm_plane.h                     |  4 ++
 include/uapi/drm/drm_mode.h                 | 11 +++++
 6 files changed, 103 insertions(+)

-- 
2.43.0

