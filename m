Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22874501236
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E96810FEEE;
	Thu, 14 Apr 2022 15:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B77210FEAB;
 Thu, 14 Apr 2022 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948838; x=1681484838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tq6g9TUYU6cilRnhCVU8XsklaIbrEZocMrSoAwf2ldk=;
 b=B3KCnMy5QYhnOriVR1zpkUDMRanfvWFugv0zGtBfGYgPd6Z3uxYESK/e
 UMRycdXPXRiYaZ9mSKSQK6eHon/Twawu3QXkKnvbpYy7F+VTWv7CsvEyt
 NnDlSi30g+m/l/walm+FDIi/wgsOvuC0eKGy1bCd32KIhb2WU9p9mGmOW
 +sktXo9DmvtlOAOH8+1WWfHbsrxwl7etOIqOsQ2aGMiR9NuqSYx3Ob6Q2
 GlqqiBi493i4d5Jtsya8+i5f9j0oZJqhML/mMvM5f8NNPXlVjCWWK1fRZ
 AgAtByIveZdmmfWiSDGlZp147OWOs/X9gCWpAS0EB5W89hUinTQq2vUHY w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="260545820"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="260545820"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="552718728"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/19] drm/edid: CEA data block iterators, and more
Date: Thu, 14 Apr 2022 18:06:43 +0300
Message-Id: <cover.1649948562.git.jani.nikula@intel.com>
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

Get back to the CEA data block iterator stuff now that a bunch of prep
work has landed.

My git repo at [1], branch edid-hfeeodb-2022-04-14, contains where this
is all headed after this.

[1] https://cgit.freedesktop.org/~jani/drm/log/?h=edid-hfeeodb-2022-04-14

Jani Nikula (18):
  drm/edid: reset display info in drm_add_edid_modes() for NULL edid
  drm/edid: clean up CTA data block tag definitions
  drm/edid: add iterator for EDID base and extension blocks
  drm/edid: add iterator for CTA data blocks
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
  drm/edid: detect basic audio in all CEA extensions
  drm/edid: detect color formats and CTA revision in all CTA extensions
  drm/edid: skip CTA extension scan in drm_edid_to_eld() just for CTA
    rev
  drm/edid: sunset drm_find_cea_extension()

Lee Shawn C (1):
  drm/edid: check for HF-SCDB block

 drivers/gpu/drm/drm_edid.c | 760 +++++++++++++++++++++----------------
 1 file changed, 438 insertions(+), 322 deletions(-)

-- 
2.30.2

