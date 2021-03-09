Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982033327C8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 14:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8452A6E8F9;
	Tue,  9 Mar 2021 13:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58F36E8F8;
 Tue,  9 Mar 2021 13:54:30 +0000 (UTC)
IronPort-SDR: +H60CmI7t/Vb1Pl6Wg9IGOmWnGKxcnYhbc9KUXKPrk8pcGMGavWLAnq+nKU3zzb1Y+3m/iZELF
 RNRToCBCB2qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="249612595"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="249612595"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:29 -0800
IronPort-SDR: 5Cf3GPmtKNDmgPWeGCENASff79NB0aApTTI3t+181YBfQYNn8gpjAMcnfKrptnjd53IvE+fjsp
 D93Z0j0gVg+g==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="409740896"
Received: from kjwindec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.180])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 0/6] drm/edid: overhaul displayid iterator
Date: Tue,  9 Mar 2021 15:54:08 +0200
Message-Id: <cover.1615297748.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Iterating DisplayID is overcomplicated as it is, and it's not getting
easier when we eventually add support for DisplayID from DDC 0xA4
instead of EDID extensions. Prepare by abstracting the complexities away
from EDID code.

Untested, let's see what our CI thinks. ;)


Jani Nikula (6):
  drm/edid: make a number of functions, parameters and variables const
  drm/displayid: add separate drm_displayid.c
  drm/displayid: add new displayid section/block iterators
  drm/edid: use the new displayid iterator for detailed modes
  drm/edid: use the new displayid iterator for finding CEA extension
  drm/edid: use the new displayid iterator for tile info

 drivers/gpu/drm/Makefile        |   2 +-
 drivers/gpu/drm/drm_displayid.c | 133 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_edid.c      | 171 +++++++-------------------------
 include/drm/drm_displayid.h     |  28 ++++--
 include/drm/drm_edid.h          |   3 +
 5 files changed, 196 insertions(+), 141 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_displayid.c

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
