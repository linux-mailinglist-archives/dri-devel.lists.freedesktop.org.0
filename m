Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3361FE88
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E77610E374;
	Mon,  7 Nov 2022 19:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFC110E367
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667849148; x=1699385148;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ywj8YfojFBAUOpLNAccTq+tCjrDyuSor2ninZHU0c40=;
 b=FUaF+t2C0iMYLdsRCKgNi7tozBJj51Y0CTmJ4q9FQv57B5Yvg+0JwHhR
 KJFWBRrP/JGgnPPE7Rg+N8vQoDyM61x58DvRAuviuCke5U8Kt6nOwqyeK
 eL8Drv+wYE/hQZJVQ/N7iRJVU6zIM/Ct4QMypgQgQPV01Yp9qgZ/Lp7mw
 68QrUHt87Z+xYcXtiF2778wGM/nidFpPP8nbp5jvvOGL8Luh/ASk8fUWK
 U/M9bIAYeYpadS2oXD6OdEt0k5/8q06nQpUSLjla12/oOfNZCzPCYn1ws
 u8EEHhWI6BDydVZIchqxbeH81337y40CS8ujBHKvMvg+dAi4Qyv5RW5cl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308125541"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308125541"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 11:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705009758"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="705009758"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga004.fm.intel.com with SMTP; 07 Nov 2022 11:25:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:25:45 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm: Review of mode copies
Date: Mon,  7 Nov 2022 21:25:38 +0200
Message-Id: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Repost of the stragglers from
https://patchwork.freedesktop.org/series/100393/

Note that I didn't rerun the cocci stuff, nor have I had
time to come up with something to inluce the cocci scripts
in the tree. So it's possible this is missing some new
things that have snuck in the meantime.

Ville Syrjälä (7):
  drm/amdgpu: Use drm_mode_init() for on-stack modes
  drm/hisilicon: Use drm_mode_init() for on-stack modes
  drm/msm: Use drm_mode_init() for on-stack modes
  drm/msm: Use drm_mode_copy()
  drm/mtk: Use drm_mode_init() for on-stack modes
  drm/rockchip: Use drm_mode_copy()
  drm/sti: Use drm_mode_copy()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 3 ++-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c         | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
 drivers/gpu/drm/msm/dp/dp_display.c                  | 2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c               | 2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c                 | 2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c               | 2 +-
 drivers/gpu/drm/sti/sti_dvo.c                        | 2 +-
 drivers/gpu/drm/sti/sti_hda.c                        | 2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                       | 2 +-
 11 files changed, 16 insertions(+), 12 deletions(-)

-- 
2.37.4

