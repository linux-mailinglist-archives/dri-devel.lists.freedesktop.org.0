Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D7B5332C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE03E10EB24;
	Thu, 11 Sep 2025 13:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="W6SE1o9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC4F10EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757596060;
 bh=bbnalqvY5A3l8cvL7U5HDpDMoY9NXeyH1En7bvaGJNs=;
 h=From:To:Cc:Subject:Date:From;
 b=W6SE1o9OIbkieRAgk3+6DBSTLQc965Z3T81rwSteG+6G6ih/v1RAWOr6ADfWS4bA/
 W6K85F9DypcmumBoAzywP14b8QA/+IPkcac2i//8XK2Sg+QBPd3adshcEEhnx9ZoId
 aIBcGMiRNDyMeLOzxYJxv5hyFU4EiHlaB8yU5CmqV1FaqPRfA4IGkVaz6P1TB2dQE9
 A/FPmnadj0/fV8gr6tA+49le+ZYke9jn9+euRGdkN9crpniLSJxr+IA0yin2RpaqKJ
 iswg01Wm52+7nmp7Erern8dV4rHlBlpgyS9bPIQCKlN0f00UXL4fRdz0lzeE5jp63e
 LjE92ECVvWrJQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:840b:7800:3261:5c97:2de4:16d3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B34D17E0A2B;
 Thu, 11 Sep 2025 15:07:40 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 harry.wentland@amd.com, christian.koenig@amd.com,
 derek.foreman@collabora.com
Subject: [PATCH v3 0/8] Add new general DRM property "color format"
Date: Thu, 11 Sep 2025 16:07:31 +0300
Message-ID: <20250911130739.4936-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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

Hi,

This is the v3 patch series, a follow-up from Andri's v2
patch series posted at
https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/ where
a new DRM connector property has been added allowing users to
force a particular color format. 

Andri's changes on their own are actually a follow-up from
Werner Sembach's posted at 
https://lore.kernel.org/dri-devel/20210630151018.330354-1-wse@tuxedocomputers.com/

I've basically picked-up where Andri left and since v2 the following
changes have been made:

- renamed the property to just 'color format'
- the property is added dynamically similar to the Colorspace property
- a key point from previous comments was that drivers should advertise
  the color formats they support and userspace would query EDID and
  perform an intersection from those color formats which users can
  further use. With this patch set each driver that adds this property
  has such list of hard-coded color formats, but fundamentally the idea
  is that driver can query the HW and do that on its own. The
  infrastructure is now in place to allow to do that
- by default the 'AUTO' color format is set. With this patch series that
  has been introduced as a fallback to RGB. Drivers could further
  customize this behavour and could perform additional checks on the sink
  to pick another suitable color format they'd like for AUTO
- drm_bridge bridge code has been improved to allow initialization with 
  the same color formats list as the DRM connector property. Similarly, bpc
  pick-up now takes the color format into consideration when deciding
  which bpc to choose from
- The new DRM color format re-uses HDMI_COLORPSACE enum and provides an 
  enum translations between the two to avoid touching all other drivers that 
  use HDMI_COLORPSACE enum. I believe at this point that this allows the
  least amount of disruption and avoids a massive bike shedding around
  that part
- a rockchip implementation has been by my colleague Derek Foreman
- YUV444 color format has been added in i915
- address comment about "Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A
  check" where aconnector might be invalid

With that in mind we have an implementation in Weston at 
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1825 that
adds support for this property. This patch series has been tested against that MR on 
i915 and on rockchip.

But you can also manually test this with modetest like so:

$ modetest -s 115:1920x1080-60@NV12 -w 115:'color format':4

where 115 is the connector ID and '4' is the enum value for a particular
color format.

Feedback and testing is welcome and highly appreciated. Unfortunately
don't have an AMD card and I've picked the changes from Andri as is.

I've kept Andri as the original author and I hope that is fine with
everyone.

Andri Yngvason (3):
  drm: Add new general DRM property "color format"
  drm/i915: Implement the "color format" DRM property
  drm/amdgpu: Implement "color format" DRM property

Derek Foreman (1):
  drm/rockchip: Implement "color format" DRM property

Marius Vlad (3):
  hdmi: Add HDMI_COLORSPACE_AUTO enum option
  drm: Add enum conversion from/to HDMI_COLORSPACE to DRM_COLOR_FORMAT
  drm: Pass supported color formats straight onto drm_bridge

Werner Sembach (1):
  drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  78 ++++++-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  13 ++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |   2 +-
 drivers/gpu/drm/bridge/ite-it6263.c           |   2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   3 +-
 .../gpu/drm/display/drm_bridge_connector.c    |   4 +-
 .../gpu/drm/display/drm_hdmi_state_helper.c   |   7 +-
 drivers/gpu/drm/drm_atomic_helper.c           |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_connector.c               | 196 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_connector.c    |  21 ++
 .../gpu/drm/i915/display/intel_connector.h    |   2 +
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  60 +++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   5 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  58 +++++-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  58 +++++-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |   2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c    |   3 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c    |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c               |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c               |   2 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_encoder.c |   2 +-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   2 +-
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    |  10 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          |   8 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   8 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  |  46 ++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |   2 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |   2 +-
 drivers/gpu/drm/tegra/hdmi.c                  |   2 +-
 drivers/gpu/drm/tegra/rgb.c                   |   2 +-
 drivers/gpu/drm/tidss/tidss_encoder.c         |   2 +-
 drivers/video/hdmi.c                          |   4 +-
 include/drm/drm_bridge_connector.h            |   3 +-
 include/drm/drm_connector.h                   |  57 ++++-
 include/linux/hdmi.h                          |   2 +-
 42 files changed, 639 insertions(+), 56 deletions(-)

-- 
2.47.2

