Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ACF576EBA
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17E10F139;
	Sat, 16 Jul 2022 14:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DB810E166;
 Fri, 15 Jul 2022 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896865; x=1689432865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NBk5N2wxwZXDYKlrDAYaoH2PoT0/jMtOTMknCzNvqEI=;
 b=lQIDsup3HAGPgXnV0DFvHWkPZ/xGaEfkMaJiPSkFuI+jlEON7/Cre1ii
 zMomAtvKHUjhd2QU2MF0kBW9ijretkktAnV96TAbimFEYhFfkhomVaCKM
 4ngZL/Gr3n8oeRrfMOU9hN4Iyjc5NRJ8H4VNl/ABl/POlCpFbR2FyGibQ
 C9ZUbDpUFqjdEZSZBdCxdU4DVAZeEXjeZl0jPnDXB6TgbZbstuxIXIjQm
 J+fmhju8cEJ9VuOpsDjmHfjxluKoYd8uEf6NUs5xx7R2TA8pCVq9Qf/l9
 LD/n0B9U8FAm2uSQFY4cAIT83aR/YRRBVDhMvAqhkTvcnpz2fTPYGG5bD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="285822261"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="285822261"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 06:51:14 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="654340370"
Received: from jgrajkow-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.38.223])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 06:51:11 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] Fixes for damage clips handling
Date: Fri, 15 Jul 2022 16:49:55 +0300
Message-Id: <20220715134958.2605746-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
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

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>

Jouni Högander (3):
  drm: Use original src rect while initializing damage iterator
  drm/i915/display: Use original src in psr2 sel fetch area calculation
  drm/i915/display: Use drm helper instead of own loop for damage clips

 drivers/gpu/drm/drm_damage_helper.c      | 11 +++++++----
 drivers/gpu/drm/i915/display/intel_psr.c | 20 +++++++-------------
 2 files changed, 14 insertions(+), 17 deletions(-)

-- 
2.25.1

