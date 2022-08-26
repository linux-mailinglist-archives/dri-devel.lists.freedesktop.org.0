Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F05A3109
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B7410E58D;
	Fri, 26 Aug 2022 21:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D651010E58D;
 Fri, 26 Aug 2022 21:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549704; x=1693085704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z6ohzWa5wiBxYNpPusEm7q+9JctyV9avCbexYSHeajg=;
 b=fQTlFj/yEEjzH6+77soLK6HCiJdyaRhtJh+wgXBnJkm8bI0nBnLnT/bk
 mXhflnNOib4ieeYXorh5x6f03eKwn3MpPj30T5CVxuVRgtImgnzO42Whh
 a3amT95IvJ+fY7XX97HONcF+/827DKIYdGAUZO1i/QyszYQvRDF/BvDaS
 1T/1yaun3iHl0HWCHntt/jvVCGnn+YHFJ//dXZ1Rkxw8LC3vLzeu5n9mD
 nWGNRgnEWcs2Gj3LFm9ICAiX6uyUhcgtpMYPr9Ho8vQ19kctDE5FB7qjZ
 5H4mS0iDyt5p6Ej4XFUIJumr1yA4rhxJP8zNB47DLn+n6QOKYzYmNC6JY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320706506"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="320706506"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="714115416"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 26 Aug 2022 14:35:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:01 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/11] drm/edid: Range descriptor stuff
Date: Sat, 27 Aug 2022 00:34:50 +0300
Message-Id: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
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

Entire series available here:
https://github.com/vsyrjala/linux.git edid_range_descriptor

Ville Syrjälä (11):
  drm/edid: Handle EDID 1.4 range descriptor h/vfreq offsets
  drm/edid: Clarify why we only accept the "range limits only"
    descriptor
  drm/edid: s/monitor_rage/vrr_range/
  drm/edid: Define more flags
  drm/edid: Only parse VRR range for continuous frequency displays
  drm/edid: Extract drm_gtf2_mode()
  drm/edid: Use GTF2 for inferred modes
  drm/edid: Use the correct formula for standard timings
  drm/edid: Unconfuse preferred timing stuff a bit
  drm/edid: Make version checks less convoluted
  drm/i915: Infer vrefresh range for eDP if the EDID omits it

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
 drivers/gpu/drm/drm_debugfs.c                 |   4 +-
 drivers/gpu/drm/drm_edid.c                    | 231 ++++++++++++------
 drivers/gpu/drm/i915/display/intel_dp.c       |  45 ++++
 drivers/gpu/drm/i915/display/intel_vrr.c      |   6 +-
 include/drm/drm_connector.h                   |   8 +-
 include/drm/drm_edid.h                        |  19 +-
 7 files changed, 234 insertions(+), 91 deletions(-)

-- 
2.35.1

