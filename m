Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C043699E19
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D4210E37C;
	Thu, 16 Feb 2023 20:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D916A10E377;
 Thu, 16 Feb 2023 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676580309; x=1708116309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TbB3mH4jUeWkUke5XBU1vKo5qVFJcz/WRlJVrHdMUx8=;
 b=OoFkdggcPb9fprS90tWWtzjQs+63iRtR1kq4vcK0a4ieLuGQywGWX48F
 Gm/35XBl5ommZqizLu5UDtotHH5xB2swCgh0P515/zSfMBpN7UWeEsHcG
 4Cgfz/y/a/kqgPh0x4jUi1+7p/TyEmnldHLEkfjL1YWAy7UfF1r3mh11x
 Jnvek4qKccMYOkAQi6oOUzAWrg7w/qyGUTWlc8w3dh5vWR6yWIvMH6RR1
 PsFcRbQN5OFv+a4IBj9x87mnwy/jp4NGT+UoUbQNUKCLbTNzgBn3qhNap
 TWlJTDjgZm+PwSUkGV3R9BOgQs++qfDgSUK1Zx1lvqtK5NP5uPkfiP/Gd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394308369"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="394308369"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 12:45:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670311925"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="670311925"
Received: from uwah-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.106])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 12:45:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/displayid: use primary use case to figure out
 non-desktop
Date: Thu, 16 Feb 2023 22:44:57 +0200
Message-Id: <cover.1676580180.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Iaroslav Boliukin <iam@lach.pw>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mostly this is prep work and plumbing for easier use of displayid
structure version and primary use case for parsing the displayid blocks,
but it can be nicely used for figuring out non-desktop too.

Completely untested. :)

BR,
Jani.

Cc: Iaroslav Boliukin <iam@lach.pw>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Jani Nikula (4):
  drm/displayid: add displayid_get_header() and check bounds better
  drm/displayid: return struct displayid_header from
    validate_displayid()
  drm/displayid: provide access to DisplayID version and primary use
    case
  drm/edid: update non-desktop use also from DisplayID

 drivers/gpu/drm/drm_displayid.c | 62 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/drm_edid.c      | 25 +++++++++++++
 include/drm/drm_displayid.h     | 12 ++++++-
 3 files changed, 89 insertions(+), 10 deletions(-)

-- 
2.34.1

