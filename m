Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057B359DAEA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 13:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7E411A7EE;
	Tue, 23 Aug 2022 11:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3077F11AF07;
 Tue, 23 Aug 2022 11:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661254251; x=1692790251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2HOoJcm20SZkyrXYw1/MfDsWZQF/it67HYYyFCWAIU8=;
 b=Bam4fZZsahjcQ5TKTB5OulL4aEvEuiJ0TMO3luvkqvDewAju8ckjfZwR
 0FTtnHO9oW6TMAPR0uVRq56/RJ1Uiqw5zg2SqPzi7ilvd55otiJB0Gcg3
 oLaxZaCbovcd0v2aaRvMFLDqOUe0UQyxLUwgC2MltED4bJPT/plvZqDJW
 3iGgnlSJxFzig3NR294TgVqujiRw8jfmgmd8L9bHj+PR5iz1YvBhZWXtF
 pPh+Fr3B2JwlCwDkCKxmj6XG+aFrFWrpat9KrrXx7nzWxGuKZBXxFfaTj
 NTdnuE9ECMiWFMZX0r51z7s13We2j9zamZ8TYDp2MFQEK9jeA7PKfsyOG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379953313"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="379953313"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:30:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="669990847"
Received: from fjohn-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.42.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:30:46 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/4] Fixes for damage clips handling
Date: Tue, 23 Aug 2022 14:29:16 +0300
Message-Id: <20220823112920.352563-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently damage clips handling is broken for planes when using big
framebuffer + offset in case kms driver adjusts drm_plane_state.src
coords. This is because damage clips are using coords relative to
original coords from user-space.

This patchset is fixing this by using original
coords from user-space instead of drm_plane_state.src when iterating
damage_clips.

v2: Modify drm unit tests accordingly

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Maíra Canal <mairacanal@riseup.net>

Jouni Högander (4):
  drm: Use original src rect while initializing damage iterator
  drm/i915/display: Use original src in psr2 sel fetch area calculation
  drm/i915/display: Use drm helper instead of own loop for damage clips
  drm/tests: Set also mock plane src_x, src_y, src_w and src_h

 drivers/gpu/drm/drm_damage_helper.c           | 11 ++++++----
 drivers/gpu/drm/i915/display/intel_psr.c      | 20 +++++++------------
 .../gpu/drm/tests/drm_damage_helper_test.c    |  5 +++++
 3 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.34.1

