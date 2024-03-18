Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C937A87FA86
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1426C10F8D6;
	Tue, 19 Mar 2024 09:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMLsvD1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6C810F8D7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839678; x=1742375678;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DYk1kkQmtaawJ6CjjwaxJSU6NAhmGbkgyXFZBhjn/mM=;
 b=BMLsvD1Md3/MSrBJLdeWUUjgWJZhT6aoMhWhCs6SOndoXMA8wekH/ncr
 03EnTWujTGAZWIXCBLm59RFfnIRwICAOyTeALsXlNKsPPSfA8m9UIFvtb
 3PGt7IqtlqVjyW0Oou/G2mH23DNT/GHvXoidDQ1APDXIWrgo94pOWBoPN
 aIfqazOoB4cERohXFst0YOmASlEEnvp1mJpG10plRNtMFdZ3d0ailpbtM
 RAlHgCZewObXeGkAKBI4MhXiq/b1QKIDO9ac7BinJpWEVM+SagOReraIZ
 fX55jy9KdF8NRsdtU+WtLZa+mmk5Wzi7Xa9F7dWJ+glvT+dizxOpU1rhw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5529710"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5529710"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:14:37 -0700
X-ExtLoopCount2: 2 from 10.237.72.74
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782078"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="827782078"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:14:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:14:33 +0200
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Tue, 19 Mar 2024 11:14:33 +0200
Resent-Message-ID: <ZflXefCKTRQBRysW@intel.com>
Resent-To: dri-devel@lists.freedesktop.org
X-Original-To: ville.syrjala@linux.intel.com
Delivered-To: ville.syrjala@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by stinkbox.stink.local with IMAP (fetchmail-6.4.37)
 for <vsyrjala@localhost> (single-drop); Mon, 18 Mar 2024 22:49:02 +0200 (EET)
Received: from orsmga001.jf.intel.com (orsmga001.jf.intel.com [10.7.209.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B119B580D4E
 for <ville.syrjala@linux.intel.com>; Mon, 18 Mar 2024 13:44:12 -0700 (PDT)
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827781920"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="827781920"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2024 13:44:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Mar 2024 22:44:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v3 0/2] drm: Add plane SIZE_HINTS property
Date: Mon, 18 Mar 2024 22:44:06 +0200
Message-ID: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

Final final version I hope. Mainly for CI to test against the
new IGTs.

Real userspace implementation:
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3165                                                           

IGT:
https://patchwork.freedesktop.org/series/131199/

Changes from v2:
- Limit to cursor planes only (Simon)

Test-with: 20240315191505.27620-1-ville.syrjala@linux.intel.com
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
 drivers/gpu/drm/drm_plane.c                 | 56 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cursor.c | 24 +++++++++
 include/drm/drm_mode_config.h               |  5 ++
 include/drm/drm_plane.h                     |  4 ++
 include/uapi/drm/drm_mode.h                 | 11 ++++
 6 files changed, 107 insertions(+)

-- 
2.43.2
