Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543112CD4E4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 12:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01686E983;
	Thu,  3 Dec 2020 11:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48F06E98D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 11:49:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B3Bn5EV046622;
 Thu, 3 Dec 2020 05:49:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606996145;
 bh=RsmOZU5yg9w3M2vFoiH7jIP2zxdoIhcPSv8nZUHvDo0=;
 h=From:To:CC:Subject:Date;
 b=QCCSzpspyjhJqpO9uwQw7GH/FlHZejgYMXDOzLiIW3Ywb68uqWL8ipyHM3cMfBgGa
 fA5/mSrjUEhwAQPCZFZZ+dzbysDNq2R67cla5bDlHFJW5BxgVIEp3OQMxHkIak+gpW
 7xd/dRABM7WnR1ioEwzALGPjVR1Y1CM/dre+JCZE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B3Bn5RI114463
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Dec 2020 05:49:05 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Dec
 2020 05:49:05 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Dec 2020 05:49:05 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B3Bn0PI094649;
 Thu, 3 Dec 2020 05:49:01 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm: fix and cleanup legacy gamma support
Date: Thu, 3 Dec 2020 13:48:43 +0200
Message-ID: <20201203114845.232911-1-tomi.valkeinen@ti.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

The first patch fix legacy gamma table for HW which have a degamma lut
block before CTM block, but no gamma lut after the CTM.

The second one cleans up the legacy gamma support a bit by handling
legacy gamma for modern drivers in the drm core.

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
 drivers/gpu/drm/drm_atomic_helper.c           |  70 -----------
 drivers/gpu/drm/drm_color_mgmt.c              | 117 +++++++++++++++++-
 drivers/gpu/drm/drm_fb_helper.c               |  12 +-
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
 include/drm/drm_color_mgmt.h                  |   7 ++
 include/drm/drm_crtc.h                        |   3 +
 21 files changed, 130 insertions(+), 100 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
