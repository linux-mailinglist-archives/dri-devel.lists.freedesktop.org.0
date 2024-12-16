Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524BF9F2E38
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5D410E191;
	Mon, 16 Dec 2024 10:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SkzXHCrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357BE10E191
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734345315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=f41nAC3G1i8SIbBR6tov32VFNUP9POdzXL1V3iWaHAk=;
 b=SkzXHCrjCFjw2pGIRWiz23IDdxbn1y020jWOepCbRBcbRFDq+js8R9xZn7PmVSGZjPlf2j
 yLSRErXy2Q+k9S5kG+0xMsiSZ3zlvMxryzhMq/8i/Ic+hfWEInixq3ePXprQ0X76zekAfv
 1SdlRa9fWBW5abz6IG/n2PDhkexljQ0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-NiH1yqnSPTaOVNLGQLa0Ag-1; Mon, 16 Dec 2024 05:35:13 -0500
X-MC-Unique: NiH1yqnSPTaOVNLGQLa0Ag-1
X-Mimecast-MFC-AGG-ID: NiH1yqnSPTaOVNLGQLa0Ag
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43623bf2a83so33309815e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 02:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734345312; x=1734950112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f41nAC3G1i8SIbBR6tov32VFNUP9POdzXL1V3iWaHAk=;
 b=DmEhAJgUx8puH8l6TR1tPq2xIuCmDAi2NzZla307ecxtuDnZXqMOj0xpOjUlc47z9U
 4buJ3XNxS20du/1k1M2q34At7zvOuCb/8Fhz5/VWlAceaIlPNAWnrQowcp03108VBvg0
 4CcKenDQBVujLAyIWFgTtny56mEHZkpKyq0awB9qtG0+sztBTLqPKOmSj9/iT8Akjx/F
 6hy5UN40NQhc0u8eJD226EUTH3BUjfXk22DziKhmAVpytBmAA7kSij7vx5Ap9mDsD+gm
 SLH3KNWw4xSa/x1RGOWZYYl1KuKdlw+ZBKWhHHeky9XA2NgX4LJaquV8DbLXCG04+IBP
 RtKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT4yzOa+hmvFtXink3BjMiEHPl/81UK70Ntue+KNlcq70tvw9/cgCl/uqDFvFo6dJNXAnJhipZXEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi+5is+Kj7T/MZAdgaLVzKzbZO+PngGOFvzoBZQzytl3/Z68fU
 uMfRagsxw570Zy8RZQyETswrMVYZILoaQHAkyT9Gswu/s4Hs6ct7KXW5kQF0KQKKDyUxtU6ahfQ
 O3JLi2OXCl5/5nHfC8c1M234h8IFe5/rdxqgJKJOfkfhTsuuOb3U7rHYjfPyRfE7iEw==
X-Gm-Gg: ASbGncvh2lCl33emxoOiSS8XidKPFqXF8v45LHXVo/iTmngBFaAniiiQpoqte3N1TpX
 ksokmaoqM6UW+LVJ84j+0UROqcarMV4OqBJYcKajfHQ9RDonIvqngTpHRsIvSj5gMRm3GgbGASd
 EsG4lk5VUngIp73dPF+FKRxMxTNTR7Wy82CDxDF/hOH/x+SxZ6dt+tayyZIEL1uGdQkhplQKQ6Y
 Vif8dI4Eye3WXmMnqiGaK8ND6DTJG8u
X-Received: by 2002:a05:600c:5023:b0:434:e9ee:c2d with SMTP id
 5b1f17b1804b1-4362aa9789dmr86117155e9.26.1734345311702; 
 Mon, 16 Dec 2024 02:35:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6Asu8MQhXV5lULprpnYHQvGlg0xFbK3IdPDPM1O0W3jZgsiS3/GBw0nggujYgh1SgRGojyw==
X-Received: by 2002:a05:600c:5023:b0:434:e9ee:c2d with SMTP id
 5b1f17b1804b1-4362aa9789dmr86116785e9.26.1734345311183; 
 Mon, 16 Dec 2024 02:35:11 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8060144sm7878864f8f.89.2024.12.16.02.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 02:35:10 -0800 (PST)
Date: Mon, 16 Dec 2024 11:35:10 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20241216-imperial-mandrill-of-joy-9fbeb2@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="goam7ess2goaceah"
Content-Disposition: inline
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


--goam7ess2goaceah
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Dave, Simona,

Here's last week (late) PR for drm-misc-next

Thanks!
Maxime


drm-misc-next-2024-12-16:
drm-misc-next for 6.14:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - hdmi: Implement drm_connector.mode_valid helper
  - panic: Implement boot logger

Driver Changes:
  - amdxdna: Various fixes
  - panthor: Fix fast-reset logic
  - rockchip: MIPI-DSI support for RK3588, HDMI0 support for RK3588
  - bridges
    - ite6263: Support VESA-24 input format
    - new drivers: Synopsys MIPI-DSI2 host controller
  - panels:
    - new drivers: Multi-Inno Technology MI0700A2T-30, AUO G084SN05 V9
The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
4-12-16

for you to fetch changes up to 67a615c5cb6dc33ed35492dc0d67e496cbe8de68:

  drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get() (2024-12-16 =
12:03:30 +0200)

----------------------------------------------------------------
drm-misc-next for 6.14:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - hdmi: Implement drm_connector.mode_valid helper
  - panic: Implement boot logger

Driver Changes:
  - amdxdna: Various fixes
  - panthor: Fix fast-reset logic
  - rockchip: MIPI-DSI support for RK3588, HDMI0 support for RK3588
  - bridges
    - ite6263: Support VESA-24 input format
    - new drivers: Synopsys MIPI-DSI2 host controller
  - panels:
    - new drivers: Multi-Inno Technology MI0700A2T-30, AUO G084SN05 V9

----------------------------------------------------------------
Andy Yan (5):
      drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset
      drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
      drm/rockchip: Fix Copyright description
      drm/rockchip: vop2: Add debugfs support
      drm/rockchip: vop2: Fix the windows switch between different layers

Arnd Bergmann (2):
      drm/log: select CONFIG_FONT_SUPPORT
      accel/amdxdna: use modern PM helpers

Biju Das (2):
      drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
      drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot clock for DPI

Boris Brezillon (5):
      drm/panthor: Preserve the result returned by panthor_fw_resume()
      drm/panthor: Be robust against runtime PM resume failures in the susp=
end path
      drm/panthor: Ignore devfreq_{suspend, resume}_device() failures
      drm/panthor: Be robust against resume failures
      drm/panthor: Fix the fast-reset logic

Chen-Yu Tsai (1):
      drm/panel: visionox-rm69299: Remove redundant assignments of panel fi=
elds

Cristian Ciocaltea (2):
      drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1 output
      drm/rockchip: dw_hdmi_qp: Simplify clock handling

Dan Carpenter (1):
      drm/vc4: unlock on error in vc4_hvs_get_fifo_frame_count()

Dave Stevenson (1):
      drm/vc4: plane: Remove WARN on state being set in plane_reset

Dmitry Baryshkov (10):
      drm/tests: hdmi: handle empty modes in find_preferred_mode()
      drm/tests: hdmi: rename connector creation function
      drm/tests: hdmi: return meaningful value from set_connector_edid()
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
      drm/sun4i: use drm_atomic_helper_connector_hdmi_check()

Fabio Estevam (1):
      dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9

Guoqing Jiang (1):
      drm/rockchip: Remove unnecessary checking

Heiko Stuebner (3):
      drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
      dt-bindings: display: rockchip: Add schema for RK3588 DW DSI2 control=
ler
      drm/rockchip: Add MIPI DSI2 glue driver for RK3588

Jeffrey Hugo (1):
      accel/qaic: Fix typo for struct qaic_manage_trans_passthrough

Jocelyn Falempe (7):
      drm/panic: Move drawing functions to drm_draw
      drm/log: Introduce a new boot logger to draw the kmsg on the screen
      drm/log: Do not draw if drm_master is taken
      drm/log: Color the timestamp, to improve readability
      drm/log: Implement suspend/resume
      drm/log: Add integer scaling support
      drm/client: Fix drm client endless Kconfig loop

Karol Przybylski (1):
      drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()

Lizhi Hou (3):
      accel/amdxdna: Add device status for aie2 devices
      accel/amdxdna: Replace mmput with mmput_async to avoid dead lock
      accel/amdxdna: Add query firmware version

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Marek Vasut (2):
      dt-bindings: display: simple: Document Multi-Inno Technology MI0700A2=
T-30 panel
      drm/panel: simple: add Multi-Inno Technology MI0700A2T-30

Ma=EDra Canal (1):
      drm/v3d: Fix miscellaneous documentation errors

Mike Lothian (1):
      accel/amdxdna: Add include interrupt.h to amdxdna_mailbox.c

Piotr Zalewski (1):
      drm/rockchip: vop2: don't check color_mgmt_changed in atomic_enable

Thomas Zimmermann (6):
      drm/fsl-dcu: Include <linux/of.h>
      drm/panel: Include <linux/of.h>
      drm/panel: panel-orisetech-otm8009a: Include <linux/mod_devicetable.h>
      drm/panel: panel-samsung-s6e3ha2: Include <linux/mod_devicetable.h>
      drm/panel: panel-samsung-s6e63m0: Include <linux/property.h>
      drm/tiny: panel-mipi-dbi: Include <linux/of.h>

Tommaso Merciai (1):
      drm/bridge: ite-it6263: Support VESA-24 input format

Uwe Kleine-K=F6nig (1):
      drm: Drop explicit initialization of struct i2c_device_id::driver_dat=
a to 0

Ville Syrj=E4l=E4 (1):
      drm/modes: Fix drm_mode_vrefres() docs

 Documentation/accel/amdxdna/amdnpu.rst             |  281 ++++++
 Documentation/accel/amdxdna/index.rst              |   11 +
 Documentation/accel/index.rst                      |    1 +
 .../bindings/display/brcm,bcm2711-hdmi.yaml        |    2 +
 .../bindings/display/brcm,bcm2835-hvs.yaml         |    5 +-
 .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |    3 +
 .../bindings/display/brcm,bcm2835-txp.yaml         |    5 +-
 .../bindings/display/brcm,bcm2835-vc4.yaml         |    1 +
 .../bindings/display/panel/panel-lvds.yaml         |    2 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    2 +
 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml        |  120 +++
 Documentation/gpu/drm-kms-helpers.rst              |    3 +
 MAINTAINERS                                        |   14 +-
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/amdxdna/Kconfig                      |   18 +
 drivers/accel/amdxdna/Makefile                     |   21 +
 drivers/accel/amdxdna/TODO                         |    5 +
 drivers/accel/amdxdna/aie2_ctx.c                   |  900 +++++++++++++++++
 drivers/accel/amdxdna/aie2_error.c                 |  360 +++++++
 drivers/accel/amdxdna/aie2_message.c               |  791 +++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h              |  370 +++++++
 drivers/accel/amdxdna/aie2_pci.c                   |  799 +++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h                   |  266 +++++
 drivers/accel/amdxdna/aie2_psp.c                   |  146 +++
 drivers/accel/amdxdna/aie2_smu.c                   |  119 +++
 drivers/accel/amdxdna/aie2_solver.c                |  330 +++++++
 drivers/accel/amdxdna/aie2_solver.h                |  154 +++
 drivers/accel/amdxdna/amdxdna_ctx.c                |  553 +++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h                |  162 +++
 drivers/accel/amdxdna/amdxdna_gem.c                |  622 ++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h                |   65 ++
 drivers/accel/amdxdna/amdxdna_mailbox.c            |  571 +++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h            |  124 +++
 drivers/accel/amdxdna/amdxdna_mailbox_helper.c     |   61 ++
 drivers/accel/amdxdna/amdxdna_mailbox_helper.h     |   42 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |  409 ++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |  123 +++
 drivers/accel/amdxdna/amdxdna_sysfs.c              |   67 ++
 drivers/accel/amdxdna/npu1_regs.c                  |  101 ++
 drivers/accel/amdxdna/npu2_regs.c                  |  118 +++
 drivers/accel/amdxdna/npu4_regs.c                  |  118 +++
 drivers/accel/amdxdna/npu5_regs.c                  |  118 +++
 drivers/accel/habanalabs/common/habanalabs_drv.c   |    1 -
 drivers/accel/ivpu/ivpu_drv.c                      |    8 -
 drivers/accel/ivpu/ivpu_pm.c                       |    2 +-
 drivers/accel/qaic/qaic_drv.c                      |    1 -
 drivers/accel/qaic/sahara.c                        |    3 +-
 drivers/gpu/drm/Kconfig                            |   81 +-
 drivers/gpu/drm/Makefile                           |   11 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h            |    1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    6 +
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    1 -
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    3 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |    3 +-
 drivers/gpu/drm/armada/armada_drv.c                |    3 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    3 +-
 drivers/gpu/drm/ast/ast_drv.c                      |    3 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    1 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    3 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    2 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |   28 -
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h    |    3 -
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |    2 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   27 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |    2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    4 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    8 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    4 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    8 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    4 +-
 drivers/gpu/drm/bridge/sii902x.c                   |    4 +-
 drivers/gpu/drm/bridge/sii9234.c                   |    4 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    4 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |    6 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |    1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   12 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     | 1030 ++++++++++++++++=
++++
 drivers/gpu/drm/bridge/tc358767.c                  |    2 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    4 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    6 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    2 +-
 drivers/gpu/drm/clients/Kconfig                    |  123 +++
 drivers/gpu/drm/clients/Makefile                   |    8 +
 .../gpu/drm/clients/drm_client_internal.h          |   10 +-
 drivers/gpu/drm/{ =3D> clients}/drm_client_setup.c   |   34 +-
 drivers/gpu/drm/{ =3D> clients}/drm_fbdev_client.c   |    4 +-
 drivers/gpu/drm/clients/drm_log.c                  |  420 ++++++++
 drivers/gpu/drm/display/drm_bridge_connector.c     |   16 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  125 ++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   88 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   21 +
 drivers/gpu/drm/drm_draw.c                         |  233 +++++
 drivers/gpu/drm/drm_draw_internal.h                |   56 ++
 drivers/gpu/drm/drm_modes.c                        |    3 +-
 drivers/gpu/drm/drm_of.c                           |    4 +-
 drivers/gpu/drm/drm_panel.c                        |    1 +
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |   94 ++
 drivers/gpu/drm/drm_panic.c                        |  269 +----
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |    4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    3 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |    1 +
 drivers/gpu/drm/gma500/psb_drv.c                   |    3 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    1 -
 drivers/gpu/drm/gud/gud_drv.c                      |    3 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    3 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    1 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    4 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                   |    2 +-
 drivers/gpu/drm/i2c/sil164_drv.c                   |    2 +-
 drivers/gpu/drm/i2c/tda9950.c                      |    4 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |    2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |    1 -
 drivers/gpu/drm/i915/i915_driver.h                 |    1 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |    1 -
 drivers/gpu/drm/imagination/pvr_drv.c              |    1 -
 drivers/gpu/drm/imagination/pvr_drv.h              |    1 -
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    3 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |    3 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    3 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    3 +-
 drivers/gpu/drm/kmb/kmb_drv.h                      |    1 -
 drivers/gpu/drm/lima/lima_drv.c                    |    1 -
 drivers/gpu/drm/logicvc/logicvc_drm.c              |    3 +-
 drivers/gpu/drm/loongson/lsdc_drv.c                |   10 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |    3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    4 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |    1 -
 drivers/gpu/drm/msm/msm_drv.c                      |    3 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    3 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    3 +-
 drivers/gpu/drm/nouveau/include/nvif/log.h         |   51 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |   21 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   16 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.h          |   16 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   45 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |  508 +++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    2 -
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    8 +
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    1 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |    2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |    1 +
 drivers/gpu/drm/panel/panel-simple.c               |   30 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    9 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    1 -
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    4 +
 drivers/gpu/drm/panthor/panthor_devfreq.c          |   12 +-
 drivers/gpu/drm/panthor/panthor_devfreq.h          |    4 +-
 drivers/gpu/drm/panthor/panthor_device.c           |   90 +-
 drivers/gpu/drm/panthor/panthor_device.h           |   37 +
 drivers/gpu/drm/panthor/panthor_drv.c              |    3 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |  140 ++-
 drivers/gpu/drm/panthor/panthor_gpu.c              |   23 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |   26 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |    4 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |    3 +-
 drivers/gpu/drm/qxl/Kconfig                        |    1 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |    3 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    8 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   68 +-
 drivers/gpu/drm/radeon/Kconfig                     |    1 +
 drivers/gpu/drm/radeon/radeon.h                    |    7 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |   45 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    3 +-
 drivers/gpu/drm/radeon/radeon_drv.h                |    1 -
 drivers/gpu/drm/radeon/radeon_gem.c                |   39 +-
 drivers/gpu/drm/radeon/radeon_object.c             |   25 +-
 drivers/gpu/drm/radeon/radeon_object.h             |    2 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |   10 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |    3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c      |    8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |    3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |   18 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |    6 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |    3 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   10 +
 drivers/gpu/drm/rockchip/Makefile                  |    1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    4 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   11 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |    2 +-
 drivers/gpu/drm/rockchip/cdn-dp-reg.c              |    2 +-
 drivers/gpu/drm/rockchip/cdn-dp-reg.h              |    2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c   |  487 +++++++++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    2 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  147 ++-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.h               |    2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.h             |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   11 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.h         |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  545 ++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   18 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.h           |    2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |    2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.h            |    2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  193 +++-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |    2 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |    4 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |    2 -
 drivers/gpu/drm/sti/sti_drv.c                      |    4 +-
 drivers/gpu/drm/stm/drv.c                          |    3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    3 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   32 +-
 drivers/gpu/drm/tegra/drm.c                        |    4 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  409 +++++---
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  102 ++
 drivers/gpu/drm/tidss/tidss_dispc.c                |   28 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |    5 +-
 drivers/gpu/drm/tidss/tidss_drv.h                  |    5 +-
 drivers/gpu/drm/tidss/tidss_irq.c                  |   34 +-
 drivers/gpu/drm/tidss/tidss_irq.h                  |    4 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |    8 +
 drivers/gpu/drm/tidss/tidss_plane.h                |    2 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    3 +-
 drivers/gpu/drm/tiny/Makefile                      |    2 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |    6 +-
 drivers/gpu/drm/tiny/bochs.c                       |    3 +-
 drivers/gpu/drm/tiny/{cirrus.c =3D> cirrus-qemu.c}   |   10 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |    4 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    3 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    3 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    3 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    3 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    3 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    3 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |    4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    4 +-
 drivers/gpu/drm/tiny/repaper.c                     |    3 +-
 drivers/gpu/drm/tiny/sharp-memory.c                |    3 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    4 +-
 drivers/gpu/drm/tiny/st7586.c                      |    3 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    3 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   14 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    3 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    3 +-
 drivers/gpu/drm/udl/udl_drv.h                      |    1 -
 drivers/gpu/drm/v3d/v3d_bo.c                       |    4 -
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |    4 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    3 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |    8 +
 drivers/gpu/drm/v3d/v3d_mmu.c                      |    8 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   57 +-
 drivers/gpu/drm/v3d/v3d_performance_counters.h     |   12 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |   29 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   26 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |   19 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |    1 -
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |    8 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     |  106 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |   96 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   24 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   54 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  112 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    4 +
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |  640 ++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |  217 +++++
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  737 +++++++++++++-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  105 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  873 ++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_regs.h                     |  297 ++++++
 drivers/gpu/drm/vc4/vc4_txp.c                      |   91 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |    2 -
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   21 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |   23 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |    6 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   24 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             |  125 ++-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |  178 +++-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   35 +
 drivers/gpu/drm/vkms/vkms_composer.c               |  310 ++++--
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    6 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    9 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   63 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  413 +++++---
 drivers/gpu/drm/vkms/vkms_formats.h                |    4 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |   49 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   19 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    5 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    1 -
 drivers/gpu/drm/xe/xe_bo_types.h                   |    1 -
 drivers/gpu/drm/xe/xe_device.c                     |    1 -
 drivers/gpu/drm/xe/xe_drv.h                        |    1 -
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |    1 -
 drivers/gpu/drm/xe/xe_vm.c                         |    1 -
 drivers/gpu/drm/xe/xe_vm.h                         |    1 -
 drivers/gpu/drm/xen/xen_drm_front.c                |    6 -
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    3 +-
 include/drm/bridge/dw_mipi_dsi2.h                  |   95 ++
 include/drm/{ =3D> clients}/drm_client_setup.h       |    0
 include/drm/display/drm_dp_helper.h                |    5 +
 include/drm/display/drm_hdmi_state_helper.h        |    4 +
 include/drm/drm_drv.h                              |    2 -
 include/drm/drm_utils.h                            |    4 +
 include/trace/events/amdxdna.h                     |  101 ++
 include/uapi/drm/amdxdna_accel.h                   |  450 +++++++++
 include/uapi/drm/qaic_accel.h                      |    2 +-
 include/uapi/drm/v3d_drm.h                         |   18 +
 lib/fonts/Kconfig                                  |    2 +-
 333 files changed, 18104 insertions(+), 1874 deletions(-)
 create mode 100644 Documentation/accel/amdxdna/amdnpu.rst
 create mode 100644 Documentation/accel/amdxdna/index.rst
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rock=
chip,rk3588-mipi-dsi2.yaml
 create mode 100644 drivers/accel/amdxdna/Kconfig
 create mode 100644 drivers/accel/amdxdna/Makefile
 create mode 100644 drivers/accel/amdxdna/TODO
 create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
 create mode 100644 drivers/accel/amdxdna/aie2_error.c
 create mode 100644 drivers/accel/amdxdna/aie2_message.c
 create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
 create mode 100644 drivers/accel/amdxdna/aie2_pci.c
 create mode 100644 drivers/accel/amdxdna/aie2_pci.h
 create mode 100644 drivers/accel/amdxdna/aie2_psp.c
 create mode 100644 drivers/accel/amdxdna/aie2_smu.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
 create mode 100644 drivers/accel/amdxdna/npu1_regs.c
 create mode 100644 drivers/accel/amdxdna/npu2_regs.c
 create mode 100644 drivers/accel/amdxdna/npu4_regs.c
 create mode 100644 drivers/accel/amdxdna/npu5_regs.c
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
 create mode 100644 drivers/gpu/drm/clients/Kconfig
 create mode 100644 drivers/gpu/drm/clients/Makefile
 rename include/drm/drm_fbdev_client.h =3D> drivers/gpu/drm/clients/drm_cli=
ent_internal.h (62%)
 rename drivers/gpu/drm/{ =3D> clients}/drm_client_setup.c (72%)
 rename drivers/gpu/drm/{ =3D> clients}/drm_fbdev_client.c (98%)
 create mode 100644 drivers/gpu/drm/clients/drm_log.c
 create mode 100644 drivers/gpu/drm/drm_draw.c
 create mode 100644 drivers/gpu/drm/drm_draw_internal.h
 create mode 100644 drivers/gpu/drm/drm_panel_backlight_quirks.c
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h
 create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
 rename drivers/gpu/drm/tiny/{cirrus.c =3D> cirrus-qemu.c} (99%)
 create mode 100644 include/drm/bridge/dw_mipi_dsi2.h
 rename include/drm/{ =3D> clients}/drm_client_setup.h (100%)
 create mode 100644 include/trace/events/amdxdna.h
 create mode 100644 include/uapi/drm/amdxdna_accel.h

--goam7ess2goaceah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2ACXQAKCRAnX84Zoj2+
dtXVAX40w0aTTF1IVrg0e4aQ1aZoCemnGtayvNa2EOkWD+Nbzs75cREHvCcRyO0b
PdoHjrEBfiMp+C/lba83006c2omkz9b69sAujFHftUmbTmdUsaRSszjojgeH+201
X7EvHdsmwA==
=RhHE
-----END PGP SIGNATURE-----

--goam7ess2goaceah--

