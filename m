Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F12D2C5B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 14:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DC56E951;
	Tue,  8 Dec 2020 13:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0B56E92D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 13:58:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8DwHQ2096211;
 Tue, 8 Dec 2020 07:58:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607435897;
 bh=8u7GBisZm/kOJ0SvJc36jjltDWkw3zWYYYX2arxLlyo=;
 h=From:To:CC:Subject:Date;
 b=IAVOpQ16bOAb/zf2wdQ9JfP6qmvCMEX2jAcl0gvDYknYAQN96nBxXxePdfROqbbR/
 YH/s2szRMTWmK/AFMfFEVM+HGTTtPXPaQ/rHlVSw1yrZIebd7hTmRK9gsHKWLDF4oz
 r22AmdjXKSWT8IuzQfuh9nZWrcr7pdtV7wbf5HMU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8DwHLE107969
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 07:58:17 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 07:58:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 07:58:16 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8DwCrN051014;
 Tue, 8 Dec 2020 07:58:12 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 0/2] drm: fix and cleanup legacy gamma support
Date: Tue, 8 Dec 2020 15:57:57 +0200
Message-ID: <20201208135759.451772-1-tomi.valkeinen@ti.com>
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

This is v2 of the series.

The first patch fixes legacy gamma table for HW which have a degamma lut
block before CTM block, but no gamma lut after the CTM. This will allow
us to add CTM support to omapdrm, which only has "pre-gamma" i.e.
de-gamma table.

The second one cleans up the legacy gamma support a bit by handling
legacy gamma for modern drivers in the drm core.

Changes in v2:
- Use bitfields for has_gamma_prop and has_degamma_prop
- Drop use_degamma variable
- Also fix gamma/degamma handling in setcmap_atomic, which I had missed
  earlier.
- Fix comments that were still referring to drm_atomic_helper_legacy_gamma_set
- Drop drm_atomic_helper_legacy_gamma_set use from intel_display.c which
  I had missed earlier.
- Move the declaration of the new functions to drm_crtc_internal.h

I didn't add Laurent's RBs as I felt the changes were too big to keep
the RB.

Ville has a WIP branch at

git://github.com/vsyrjala/linux.git fb_helper_c8_lut_4

which does more extensive cleanups to the gamma handling. That work is
slightly overlapping with this series, but afaics the concepts do not
conflict as such (but the code changes do conflict).

 Tomi

Tomi Valkeinen (2):
  drm: add legacy support for using degamma for gamma
  drm: automatic legacy gamma support

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 -
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |   1 -
 drivers/gpu/drm/arm/malidp_crtc.c             |   1 -
 drivers/gpu/drm/armada/armada_crtc.c          |   1 -
 drivers/gpu/drm/ast/ast_mode.c                |   1 -
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |   1 -
 drivers/gpu/drm/drm_atomic_helper.c           |  70 ----------
 drivers/gpu/drm/drm_color_mgmt.c              | 122 ++++++++++++++++--
 drivers/gpu/drm/drm_crtc_internal.h           |   6 +
 drivers/gpu/drm/drm_fb_helper.c               |  21 +--
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
 include/drm/drm_crtc.h                        |   3 +
 22 files changed, 135 insertions(+), 109 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
