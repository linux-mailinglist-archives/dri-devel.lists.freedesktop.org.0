Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A905ECA47
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AB810E05B;
	Tue, 27 Sep 2022 17:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B84910E05B;
 Tue, 27 Sep 2022 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664298010; x=1695834010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JQzOFuT+Wecw4ac9Rm6mhmaj07/jTbOEy5IPKbwi6cs=;
 b=EVtLjXoMso/lmwgL+jq65DXZyl9rBCitinBBI5IkIkQbLDDb6QlGow+t
 fPOV2qx9UdHbUqr4B8H1lT1jtSVVNawDHhiTliZbLqA50h/dOMOh1LABg
 +9kofZC9ic96FPG5JmlRzTGx+WfFtGq1XB+zi/jQLZWCFB6E3e0o62HXr
 ZH5dcheAXEx4PSUtcJQ4O4tbakwksHO//f0Y7lJznz0HgfNq98rFcBBu6
 fNIPrpiNqtVUm+xrHaCiqIP7XpY+4LMFyRSIs+e/gLAwwLVk292dM94J/
 ymtcl74ynFDXX483zBWWtsF0eG8YrNMc2Rb0NiR92mQ3kzURRllWpjpyr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="363208112"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="363208112"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 10:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623821343"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="623821343"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 27 Sep 2022 10:00:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Sep 2022 20:00:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm/edid: Range descriptor stuff
Date: Tue, 27 Sep 2022 19:59:57 +0300
Message-Id: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Various improvements (mostly) related to the EDID
range descriptor handling.

v2:
- One patch got merged already
- Reorder the struct rename to be last
- Drop the "infer vrr range for eDP" for now. While we may
  want it eventually for now I'm just thinking of adding all
  the EDID declared modes whether we have drrs/vrr panel or
  not. This seems to be what Windows does and it'll get us
  the alternate refresh rates just w/o actual vrr support.
  Anyways, that'll be a separate series.

Ville Syrjälä (9):
  drm/edid: Clarify why we only accept the "range limits only"
    descriptor
  drm/edid: Define more flags
  drm/edid: Only parse VRR range for continuous frequency displays
  drm/edid: Extract drm_gtf2_mode()
  drm/edid: Use GTF2 for inferred modes
  drm/edid: Use the correct formula for standard timings
  drm/edid: Unconfuse preferred timing stuff a bit
  drm/edid: Make version checks less convoluted
  drm/edid: s/monitor_rage/vrr_range/

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
 drivers/gpu/drm/drm_debugfs.c                 |   4 +-
 drivers/gpu/drm/drm_edid.c                    | 217 ++++++++++++------
 drivers/gpu/drm/i915/display/intel_vrr.c      |   6 +-
 include/drm/drm_connector.h                   |   4 +-
 include/drm/drm_edid.h                        |  14 +-
 6 files changed, 169 insertions(+), 88 deletions(-)

-- 
2.35.1

