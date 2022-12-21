Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E91D65301C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 12:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4272E10E02F;
	Wed, 21 Dec 2022 11:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18CB10E02F;
 Wed, 21 Dec 2022 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671621597; x=1703157597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kmvv4aYRLngUsdCDZ2HF9P5I0IqXNuAI3JxWzddx614=;
 b=QukQc+mM0MvqANOsxtjqYYS4yw3Po6nQsEzVEbwC8vsxFrk/CGd6xueT
 boqOeWB6G6QxcxN4PZaIR1oIB+b/68v0t+3Wl5HAgw+gXWc4zB3XU5NCq
 F96koTMJ2gDFC21Lz5j03/Tp887A5TAihrF3vegx/2mKUrNpFbSMgyMve
 Mb9M+AJFbMh1wr8+3f3owoLhb+3d2Reu8w0DOCoYTXtyW/UgNl/AjmA6T
 VFOPo4YILI7dnNp6D1TmFJvLmUaG8KyAlHGQ1CQb5+3Lfsod7byQ4VcMo
 GY0QZfDy1n+Z7hZe6OQAGhAhqVKXpyj7EpSDJAEpGoJt122s6wSsTYrwC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="321024981"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="321024981"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 03:19:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="758480049"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="758480049"
Received: from cbenthin-mobl1.amr.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.61.207])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 03:19:48 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Fixes for intel fb helper
Date: Wed, 21 Dec 2022 13:19:00 +0200
Message-Id: <20221221111902.1742095-1-jouni.hogander@intel.com>
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set is fixing Intel fb console update issues introduced by
splitting generic drm_fb_helper into it's own file.

Also damage clip check moved to higher level to share it between fb
helpers.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@intel.com>

Jouni Högander (2):
  drm/i915/fbdev: Implement fb_dirty for intel custom fb helper
  drm/fbdev: Move damage clip check to higher level

 drivers/gpu/drm/drm_fb_helper.c            | 4 ++++
 drivers/gpu/drm/drm_fbdev_generic.c        | 4 ----
 drivers/gpu/drm/i915/display/intel_fbdev.c | 9 +++++++++
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.34.1

