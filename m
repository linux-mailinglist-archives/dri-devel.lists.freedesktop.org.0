Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9551D536
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9C610F8ED;
	Fri,  6 May 2022 10:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04D710F8ED;
 Fri,  6 May 2022 10:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831839; x=1683367839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vhVVmTUo+Qqqz1ReDjPQo/2m/CdCMtQ2SsrNtgup9mo=;
 b=mxLPFtxprk51/LKKqml+17f0hsfPT22SsY7ez5tjQ6gf2Wo3aaxYUXBN
 TCtMgkdTkDa8Zz+RzwbmOAF5nBqupNI480MnlGJNDvtWMSOxUYO4eP9aH
 AB547ck4byZsp0UZWi4DJqgZpzMd+61AP5/2b1uOMdy9fT8NMxitPHHGE
 Zp2/Ef4ahxhfI+FxV/Paq7IgJ6W2I+TTZLwEg9mFqf2fja2h6LQbpCkZA
 sBQINxuAwAojkUrlIPxdmSh5sHV3kcUkjxHRk9kg0HoH3lafIMg45oI+V
 HmMnE8tO1+r467QifP4S+A4uVPDWHcDHouK3R5nQM6TTh1R0nGGTfveQD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="266016431"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="266016431"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:10:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="537816081"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:10:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/25] drm/edid: introduce struct drm_edid
Date: Fri,  6 May 2022 13:10:07 +0300
Message-Id: <cover.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce struct drm_edid and start converting struct edid * to struct
drm_edid * in the EDID parsing. The rationale for drm_edid is explained
in depth in commit message for patch 3.

Initially, there's little functional benefit in the series, it's mostly
just prep work. It's also intended to be relatively straightforward to
review.

Later on, we'll add interfaces around drm_edid that let us utilize the
actual EDID buffer allocation size as metadata outside of the size
contained within the EDID blob. This is a requirement for safely
handling HF-EEODB without a huge flag day switch from struct edid
usage. See [1] for that work.


BR,
Jani.


[1] https://cgit.freedesktop.org/~jani/drm/log/?h=edid-hfeeodb-2022-05-06


Jani Nikula (25):
  drm/edid: use else-if in CTA extension parsing
  drm/edid: convert drm_for_each_detailed_block() to edid iter
  drm/edid: add struct drm_edid container
  drm/edid: start propagating drm_edid to lower levels
  drm/edid: keep propagating drm_edid to display info
  drm/edid: propagate drm_edid to drm_edid_to_eld()
  drm/edid: convert drm_edid_connector_update() to drm_edid fully
  drm/edid: convert struct detailed_mode_closure to drm_edid
  drm/edid: convert drm_mode_detailed() to drm_edid
  drm/edid: convert drm_dmt_modes_for_range() to drm_edid
  drm/edid: convert drm_gtf_modes_for_range() to drm_edid
  drm/edid: convert drm_cvt_modes_for_range() to drm_edid
  drm/edid: convert drm_mode_std() and children to drm_edid
  drm/edid: convert mode_in_range() and drm_monitor_supports_rb() to
    drm_edid
  drm/edid: convert get_monitor_name() to drm_edid
  drm/edid: convert drm_for_each_detailed_block() to drm_edid
  drm/edid: add drm_edid helper for drm_edid_to_sad()
  drm/edid: add drm_edid helper for drm_edid_to_speaker_allocation()
  drm/edid: add drm_edid helper for drm_detect_hdmi_monitor()
  drm/edid: add drm_edid helper for drm_detect_monitor_audio()
  drm/edid: convert cea_db_iter_edid_begin() to drm_edid
  drm/edid: convert drm_edid_iter_begin() to drm_edid
  drm/edid: add drm_edid helper for drm_update_tile_info()
  drm/displayid: convert to drm_edid
  drm/edid: convert version_greater() to drm_edid

 drivers/gpu/drm/drm_displayid.c |  16 +-
 drivers/gpu/drm/drm_edid.c      | 542 +++++++++++++++++++-------------
 include/drm/drm_displayid.h     |   6 +-
 include/drm/drm_edid.h          |   6 +-
 4 files changed, 337 insertions(+), 233 deletions(-)

-- 
2.30.2

