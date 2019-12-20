Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E358128018
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 16:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053A46EC5F;
	Fri, 20 Dec 2019 15:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87CE6EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 15:55:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBKFtHgo026055;
 Fri, 20 Dec 2019 09:55:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576857317;
 bh=2Mb0c+dOlwfsL6ve4ik/6/xjjtAIDmXAIiGHuMekctk=;
 h=From:To:CC:Subject:Date;
 b=yIuae4Ybpe/mcJYHGKIgbT27+q09P1OPE4d7rLCXVRWmuoUCFoAG1xjQ5m7OasQHL
 7hAhDVCEb80dgC3P7ASEv3N0YNuEDkZd1xUdZ7Vv40McTHyPFxdrAiUxgIlek/OdXz
 TNW0DmiogFVs52Y1RZA7yi6r+1VXcp2NqeJZOtzo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBKFtHw1109925
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Dec 2019 09:55:17 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Dec 2019 09:55:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Dec 2019 09:55:16 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKFtEDx005603;
 Fri, 20 Dec 2019 09:55:14 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v5 0/5] drm/tidss: New driver for TI Keystone platform Display
 SubSystem
Date: Fri, 20 Dec 2019 17:55:08 +0200
Message-ID: <cover.1576857145.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
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
Cc: yamonkar@cadence.com, praneeth@ti.com, robh+dt@kernel.org,
 peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com, sam@ravnborg.org,
 maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v4:
- itemize named resource property descriptions in dt binding
- fix wp to wb in the ti,j721e-dss reg property description
- remove fifo underflow irq handling, it is not an error and
  it should be used for debug purposes only
- memory tuning, prefetch plane fifo up to high-threshold value to
  minimize possibility of underflows.

Changes since v3:
- Add descriptions some yaml binding properites
- Remove redundant minItems directives from yaml bindings
- Remove ports node from ti,k2g-dss yaml binding
- no change to MAINTAINERS or to the driver code

Changes since v2:
- Add version history to commit messages
- Fix yaml bindings now that got dt_binding_check dtbs_check working propery
- Move tidss entry in MAINTAINERS after omapdrm and add "T: git
  git://anongit.freedesktop.org/drm/drm-misc"
- no change to driver code

Changes since the first version of the patch series [2]:
- "drm/tidss: New driver for TI Keystone platform Display SubSystem"
 - rebased on top of drm-next-2019-11-27
 - sort all include lines in all files
 - remove all include <drm/drmP.h>
 - remove select "select VIDEOMODE_HELPERS"
 - call dispc_vp_setup() later in tidss_crtc_atomic_flush() (there is no
   to call it in new modeset case as it is also called in vp_enable())
 - change probe sequence and drm_device allocation (follow example in drm_drv.c)
 - use __maybe_unused instead of #ifdef for pm functions
 - remove "struct drm_fbdev_cma *fbdev;" from driver data
 - check panel connector type before connecting it
- No change to binding or MAINTAINERS patches

There was couple of attempts upstream an earlier version of this
driver about a year ago [1]. Back then I needed to stop my efforts to
implement support for next Keystone DSS version, so now the driver
supports three different Keystone DSS version on three different SoCs.

I am starting the patch series versioning from the beginning because it
has been over a year since the previous patch set and the structure of
the driver has evolved quite a bit. However, all the earlier comments
should be addressed in this series.

[1] https://patchwork.freedesktop.org/series/44947/
[2] https://lists.freedesktop.org/archives/dri-devel/2019-November/246542.html

Jyri Sarha (5):
  dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding
  dt-bindings: display: ti,am65x-dss: Add dt-schema yaml binding
  dt-bindings: display: ti,j721e-dss: Add dt-schema yaml binding
  drm/tidss: New driver for TI Keystone platform Display SubSystem
  MAINTAINERS: add entry for tidss

 .../bindings/display/ti/ti,am65x-dss.yaml     |  152 +
 .../bindings/display/ti/ti,j721e-dss.yaml     |  208 ++
 .../bindings/display/ti/ti,k2g-dss.yaml       |  109 +
 MAINTAINERS                                   |   11 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/tidss/Kconfig                 |   14 +
 drivers/gpu/drm/tidss/Makefile                |   12 +
 drivers/gpu/drm/tidss/tidss_crtc.c            |  376 +++
 drivers/gpu/drm/tidss/tidss_crtc.h            |   46 +
 drivers/gpu/drm/tidss/tidss_dispc.c           | 2647 +++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h           |  132 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  243 ++
 drivers/gpu/drm/tidss/tidss_drv.c             |  285 ++
 drivers/gpu/drm/tidss/tidss_drv.h             |   39 +
 drivers/gpu/drm/tidss/tidss_encoder.c         |   88 +
 drivers/gpu/drm/tidss/tidss_encoder.h         |   17 +
 drivers/gpu/drm/tidss/tidss_irq.c             |  146 +
 drivers/gpu/drm/tidss/tidss_irq.h             |   72 +
 drivers/gpu/drm/tidss/tidss_kms.c             |  248 ++
 drivers/gpu/drm/tidss/tidss_kms.h             |   15 +
 drivers/gpu/drm/tidss/tidss_plane.c           |  217 ++
 drivers/gpu/drm/tidss/tidss_plane.h           |   25 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.c     |  202 ++
 drivers/gpu/drm/tidss/tidss_scale_coefs.h     |   22 +
 25 files changed, 5329 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
 create mode 100644 drivers/gpu/drm/tidss/Kconfig
 create mode 100644 drivers/gpu/drm/tidss/Makefile
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc_regs.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.h

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
