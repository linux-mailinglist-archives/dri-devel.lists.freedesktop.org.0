Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E44D5722
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 02:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D058A10E57D;
	Fri, 11 Mar 2022 01:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035A710E57D;
 Fri, 11 Mar 2022 01:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960916; x=1678496916;
 h=from:to:cc:subject:date:message-id;
 bh=9UmNcVCnepel3cqGUVznzkOLrTEl4qCYbpD4/05ivDQ=;
 b=ZOi2MdFmAv058wd4/005Jv75c9af+ByJQOel0rPopB8XeRZA6kkRhDmh
 vk1t7yck6CfwbiiYZHh6sJHRBT3DlbpgCx1EqxiS+tfAb5+9mWGQUjhvC
 3MR1qRCeM5nKAMIMRtF+nHrKc3I1ikg75Ve4tPKaoXY4ATD9zISmdCNMI
 QULfRORZeGP24mbxoVE6EDxvH7H1SUtVhJ4IT31fyZH9t3NbiRJvBvYL+
 lDbqmQCRiKmGTZJNojesIob12l74PuakiyuU/pR37RCYuMx8g1VNw7yO/
 Hjisq8KAgGV+S3cZknHJiAL8IbmncK/8dcoQbOvwN4j72IjftmJ0THHW7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255196072"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="255196072"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 17:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="781701013"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2022 17:08:32 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v6 0/5] enhanced edid driver compatibility
Date: Fri, 11 Mar 2022 09:22:13 +0800
Message-Id: <20220311012218.19025-1-shawn.c.lee@intel.com>
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

Lee Shawn C (5):
  drm/edid: seek for available CEA block from specific EDID block index
  drm/edid: parse multiple CEA extension block
  drm/edid: read HF-EEODB ext block
  drm/edid: parse HF-EEODB CEA extension block
  drm/edid: check for HF-SCDB block

 drivers/gpu/drm/drm_connector.c |   8 +-
 drivers/gpu/drm/drm_displayid.c |   5 +-
 drivers/gpu/drm/drm_edid.c      | 173 ++++++++++++++++++++++++--------
 include/drm/drm_edid.h          |   4 +-
 4 files changed, 143 insertions(+), 47 deletions(-)

-- 
2.17.1

