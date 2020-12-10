Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E82D5D2D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1726E5CA;
	Thu, 10 Dec 2020 14:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1199C6E5B9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:09:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAE9520076524;
 Thu, 10 Dec 2020 08:09:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607609345;
 bh=JRiy+LdtqsdKArVFNr0hcziIHZyTgUVjAK3byBNXKzk=;
 h=From:To:CC:Subject:Date;
 b=aQNTsSM7Zh/8UOArdwOHoIMlYLBAL1epyt16S8vtUIf7o0CSE9bAOV2njMdsetrUd
 SXMAsT3lYqhnSp5ZKxENy4/yqyfCt5tyuSw00hn0B7aWKiow6c7iBtZ11630qXSlvb
 DjtPC8ceCK48ngC4f95wLSpsL1sjQVKGTm+4oxrk=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAE95ei011140
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 08:09:05 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 08:09:05 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 08:09:05 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAE90cA086731;
 Thu, 10 Dec 2020 08:09:01 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 0/2] drm: automatic legacy gamma support
Date: Thu, 10 Dec 2020 16:08:50 +0200
Message-ID: <20201210140852.1040054-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Russell King <linux@armlinux.org.uk>, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Another try.

I dropped the has_gamma_prop and has_degamma_prop variables and use
drm_mode_obj_find_prop_id() instead.

I also changed the order of the patches, and added a new helper for
setting the gamma ramp to the properties.

 Tomi

Tomi Valkeinen (2):
  drm: automatic legacy gamma support
  drm: add legacy support for using degamma for gamma

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 -
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |   1 -
 drivers/gpu/drm/arm/malidp_crtc.c             |   1 -
 drivers/gpu/drm/armada/armada_crtc.c          |   1 -
 drivers/gpu/drm/ast/ast_mode.c                |   1 -
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |   1 -
 drivers/gpu/drm/drm_atomic_helper.c           |  70 --------
 drivers/gpu/drm/drm_color_mgmt.c              | 150 ++++++++++++++++--
 drivers/gpu/drm/drm_crtc_internal.h           |  10 ++
 drivers/gpu/drm/drm_fb_helper.c               |  28 ++--
 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   2 -
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   1 -
 drivers/gpu/drm/nouveau/dispnv50/head.c       |   2 -
 drivers/gpu/drm/omapdrm/omap_crtc.c           |   1 -
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   1 -
 drivers/gpu/drm/stm/ltdc.c                    |   1 -
 drivers/gpu/drm/vc4/vc4_crtc.c                |   1 -
 drivers/gpu/drm/vc4/vc4_txp.c                 |   1 -
 include/drm/drm_atomic_helper.h               |   4 -
 include/drm/drm_color_mgmt.h                  |   1 -
 22 files changed, 160 insertions(+), 121 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
