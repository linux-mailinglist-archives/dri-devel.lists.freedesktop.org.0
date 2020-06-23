Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF3206D1C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEA1898A7;
	Wed, 24 Jun 2020 06:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185F88AA0;
 Wed, 24 Jun 2020 06:58:00 +0000 (UTC)
IronPort-SDR: 4hhdmANfEQWZ/khTqRigviYsozuxgX1EBr9VEIxGCr+zXY8zVzAO+ngWNK5hil4hAg9GCYobZM
 Xo9CnQR+dG9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="132782653"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="132782653"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 23:57:59 -0700
IronPort-SDR: OkiIk134guVqc+q97E5fIO2c8cUF4rKWyyaYhwzaecUaXDyUirwlvjnmoXJvMRKaG81VJjfnyC
 Oim35NCgasOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="301525034"
Received: from unknown (HELO joshikun.iind.intel.com) ([10.223.74.209])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2020 23:57:55 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/3] Send a hotplug when edid changes
Date: Wed, 24 Jun 2020 00:27:53 +0530
Message-Id: <20200623185756.19502-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: stanislav.lisovskiy@intel.com, daniel.vetter@intel.com,
 arkadiusz.hiler@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

This series introduce to drm a way to determine if something else
except connection_status had changed during probing, which
can be used by other drivers as well. Another i915 specific part
uses this approach to determine if edid had changed without
changing the connection status and send a hotplug event.

Stanislav Lisovskiy (3):
  drm: Add helper to compare edids.
  drm: Introduce epoch counter to drm_connector
  drm/i915: Send hotplug event if edid had changed

 drivers/gpu/drm/drm_connector.c              | 16 ++++++++
 drivers/gpu/drm/drm_edid.c                   | 39 +++++++++++++++++++-
 drivers/gpu/drm/drm_probe_helper.c           | 38 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_hotplug.c | 26 +++++++------
 include/drm/drm_connector.h                  |  2 +
 include/drm/drm_edid.h                       |  9 +++++
 6 files changed, 113 insertions(+), 17 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
