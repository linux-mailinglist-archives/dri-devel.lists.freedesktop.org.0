Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D49519914
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9610F1E6;
	Wed,  4 May 2022 08:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7877A10F1E6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651651314; x=1683187314;
 h=resent-to:resent-from:resent-date:resent-message-id:
 mime-version:from:to:cc:subject:date:message-id:
 content-transfer-encoding;
 bh=n3wf47AudIEDFl7MgLRbyWzaIMiAsgB2M8PkQNtCNns=;
 b=NI+q3dzglGM3Z8S5E2/ZxQ2f+WoeucZaST7e9ko3dw46xy+rUXRBdlJo
 /7q1NAdIzZFWzLxJ/wF9TOiVKHyTUXX4meJJJG3OHvM9jjWR12yt3fNTn
 zMRAc76/JR/g3sITfrRiz6Ux26bPBn3N+f+T3m4xLN/UWwzr2vXDxZeET
 Vjqa8tYWFi7JjaIsoKSG6ttID2yRDwTomioS0vd9kBenVmYmW6BnjwXV2
 0Pp/GhLmRR7H8ZQ+7bN77fF9qgWOXJ7ju65lxBY83U5G7SPdilXU0w4GW
 +psgT/N59qJzSzgp2w/5EpwKdqnEjBa291FYHvtIzviFYBsQ+gZ5V+h2E Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="255159467"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="255159467"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:01:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="734291785"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:01:52 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:01:49 +0300
Resent-Message-ID: <87zgjxpvyq.fsf@intel.com>
MIME-Version: 1.0
Received: from outlook.iglb.intel.com [163.33.184.135]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:24:17 +0300 (EEST)
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Mailbox Transport; Tue, 3 May 2022 02:24:11 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 3 May 2022 02:24:11 -0700
Received: from orsmga007.jf.intel.com (10.7.209.58) by
 fmsmsx606.amr.corp.intel.com (10.18.84.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 3 May 2022 02:24:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="562142035"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 00/20] drm/edid: CEA data block iterators, and more
Date: Tue, 3 May 2022 12:23:45 +0300
Message-ID: <cover.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-Network-Message-Id: 5663dcd5-34f0-4b28-4fd7-08da2ce6aead
X-MS-Exchange-Organization-AuthSource: fmsmsx606.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-SCL: -1
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.4732507
X-MS-Exchange-Processed-By-BccFoldering: 15.01.2308.027
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've kind of lost track of the version numbers on some of the iterator
patches, but this is the next version (or mostly a resend) of
[1]. There's an additional rename patch for SCDS.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/102703/


Jani Nikula (19):
  drm/edid: reset display info in drm_add_edid_modes() for NULL edid
  drm/edid: rename HDMI Forum VSDB to SCDS
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

 drivers/gpu/drm/drm_edid.c | 799 +++++++++++++++++++++----------------
 1 file changed, 458 insertions(+), 341 deletions(-)

-- 
2.30.2

