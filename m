Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DE44E4867
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FE910E55A;
	Tue, 22 Mar 2022 21:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7609C10E105;
 Tue, 22 Mar 2022 21:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985263; x=1679521263;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r9fnBAPvFB6USRE8reZYFiGh+uA0BlSeZOJ1ryCTEX8=;
 b=MxqsVcOqhnwN3BhjSeQOX8KeWIKGYqNqCm2e8Oq9saT0PpjcObbKiQuC
 eUYKSP86HhspAe8wDscfxmBXmo2gstBa2xiZdnLGZv0yGCM0UgEdwAER0
 Ald7EGbfyT72DNEZyiLQngFe2t0uAUruct1BgRxf25J5eOjOPI0ztw1i5
 RmnZWJDKTePchWd4buDf6aM6jq4qYOspXmkqTpMZ9ZPccNV5yLvud6IKV
 BBCpVWNnqXiveWVUAVf0Np1M8K1dlaGogW44DBV3TTN6MbbJjDYpuxS/u
 MeMZ3uKmMYviKoPTVIEehiVfiqVU3Ap+WQ+ljpXly8I1UYb2e4aDZdkxM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="238559459"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="238559459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="560605379"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:40:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 00/19] drm/edid: overhaul CEA data block iteration
Date: Tue, 22 Mar 2022 23:40:29 +0200
Message-Id: <cover.1647985054.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Cooper Chiou <cooper.chiou@intel.com>, william.tseng@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Drew Davenport <ddavenport@chromium.org>, ankit.k.nautiyal@intel.com,
 Shawn C Lee <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add iterators for EDID blocks and CEA data blocks, to iterate through
all data blocks across all CEA extensions and CTA blocks in DisplayID
data blocks. Fix all code assuming only one CEA extension. Fix code
assuming CTA blocks contain everything that CEA extensions do. Sprinkle
a bunch of cleanups on top.

This is completely UNTESTED, didn't even smoke test it. It builds. ;)

This superseeds parts of [1] and [2].

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/101241/
[2] https://patchwork.freedesktop.org/patch/msgid/20220321044330.27723-1-cooper.chiou@intel.com


Cc: Shawn C Lee <shawn.c.lee@intel.com>
Cc: Cooper Chiou <cooper.chiou@intel.com>
Cc: william.tseng@intel.com
Cc: ankit.k.nautiyal@intel.com
Cc: ville.syrjala@linux.intel.com
Cc: Drew Davenport <ddavenport@chromium.org>

Jani Nikula (19):
  drm/edid: add drm_edid_extension_block_count() and drm_edid_size()
  drm: use drm_edid_extension_block_count() and drm_edid_size()
  drm/edid: clean up CEA data block tag definitions
  drm/edid: add iterator for EDID base and extension blocks
  drm/edid: add iterator for CEA data blocks
  drm/edid: clean up cea_db_is_*() functions
  drm/edid: convert add_cea_modes() to use cea db iter
  drm/edid: convert drm_edid_to_speaker_allocation() to use cea db iter
  drm/edid: convert drm_edid_to_sad() to use cea db iter
  drm/edid: convert drm_detect_hdmi_monitor() to use cea db iter
  drm/edid: convert drm_detect_monitor_audio() to use cea db iter
  drm/edid: convert drm_parse_cea_ext() to use cea db iter
  drm/edid: convert drm_edid_to_eld() to use cea db iter
  drm/edid: sunset the old unused cea data block iterators
  drm/edid: restore some type safety to cea_db_*() functions
  drm/edid: detect basic audio only on CEA extension
  drm/edid: detect color formats and CEA revision only on CEA extension
  drm/edid: skip CEA extension scan in drm_edid_to_eld() just for CEA
    rev
  drm/edid: sunset drm_find_cea_extension()

 drivers/gpu/drm/drm_connector.c |   2 +-
 drivers/gpu/drm/drm_debugfs.c   |   3 +-
 drivers/gpu/drm/drm_edid.c      | 781 ++++++++++++++++++--------------
 include/drm/drm_edid.h          |   2 +
 4 files changed, 455 insertions(+), 333 deletions(-)

-- 
2.30.2

