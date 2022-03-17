Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF014DC5CA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 13:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCF610EB17;
	Thu, 17 Mar 2022 12:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CED10EB17;
 Thu, 17 Mar 2022 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647520070; x=1679056070;
 h=from:to:cc:subject:date:message-id;
 bh=JiYH14tC3dCADzDP2XJOuC4Xmiv1fcFd4/KNnrxa3pU=;
 b=RAwLkmlGT9+GOTMGikmKmlGR/ac1ONpCxBr6cMHCTqsDu/XfCKnVtoyz
 eEvMJFdbB6sdEcE5DGHXFBoUm9lBFACki9kEsgqrA0/nTcJs76IuKBKze
 hxaeNfOpjtF1H6yo94hHQ+urWnQroiqiQM+ygT4uFmYqVn5W1n+7tY6NK
 vsvfOrJJ/8CfEsqj5NaysVR7uo34OLeEGheWRQG7WnPCW3Yhd/QxHvdvC
 gPKDzIKhpnoscLZ3SgHXL6TCX0n7M3wYNp8Pf8VKWYaftp2yJnz8j7K2M
 OVfMxE4vCd/CT+y4G9MibNIHZZPXX2JvRNk0FrRtKLHFGmifvU0uc9az1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237463776"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237463776"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 05:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="581276695"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga001.jf.intel.com with ESMTP; 17 Mar 2022 05:27:47 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v8 0/5] enhanced edid driver compatibility
Date: Thu, 17 Mar 2022 20:41:57 +0800
Message-Id: <20220317124202.14189-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: cooper.chiou@intel.com, william.tseng@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support to parse multiple CEA extension blocks and HF-EEODB to
extend drm edid driver's capability.

v4: add one more patch to support HF-SCDB
v5: HF-SCDB and HF-VSDBS carry the same SCDS data. Reuse
    drm_parse_hdmi_forum_vsdb() to parse this packet.
v6: save proper extension block index if CTA data information
    was found in DispalyID block.
v7: using different parameters to store CEA and DisplayID block index.
    configure DisplayID extansion block index before search available
    DisplayID block.
v8: revert patch [v7 2/5] change.
    And check cea pointer return from drm_find_cea_extension().
    If drvier got the same cea pointer then exit this routine.

Lee Shawn C (5):
  drm/edid: seek for available CEA block from specific EDID block index
  drm/edid: parse multiple CEA extension block
  drm/edid: read HF-EEODB ext block
  drm/edid: parse HF-EEODB CEA extension block
  drm/edid: check for HF-SCDB block

 drivers/gpu/drm/drm_connector.c |   8 +-
 drivers/gpu/drm/drm_displayid.c |   5 +-
 drivers/gpu/drm/drm_edid.c      | 174 ++++++++++++++++++++++++--------
 include/drm/drm_edid.h          |   4 +-
 4 files changed, 144 insertions(+), 47 deletions(-)

-- 
2.17.1

