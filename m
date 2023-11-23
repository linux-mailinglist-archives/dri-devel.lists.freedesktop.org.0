Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027077F5F9A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 13:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104BA10E738;
	Thu, 23 Nov 2023 12:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC91C10E738
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700744335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=/7ObfiPqZ+LlSreBiTL2Aa55YSP6Ys8mNnpf4ICQ3I0=;
 b=IwNuTU1wYpuOzMcJw1ZXk9VCLoB6gEUeIfe4XKh/5RnzXqJJEMwKhQysC6Rj2v7pwfDhOn
 fuXonz8klpL+C5q5TPDYATZQM2/D5IzvdUMl2FLagyLe5k8u0CteP8oT3LqRNJ/xuOo4sk
 SeFhyKyUwHWaZ+pDW5ZBknEx0oL79GE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-7ntaEv5gMHCD6Vlo1NNqxw-1; Thu, 23 Nov 2023 07:58:53 -0500
X-MC-Unique: 7ntaEv5gMHCD6Vlo1NNqxw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40b357e2a01so3586905e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 04:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700744332; x=1701349132;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/7ObfiPqZ+LlSreBiTL2Aa55YSP6Ys8mNnpf4ICQ3I0=;
 b=BDAkcMDifKcHAplM3nIugVfUwB0H7DaT/BR+irPAC/aQeBeb5rjEbOJFuriUB+sApV
 VjSVXtSxBD4j6Dc9Wt0oi8N7AfF4NK2lVYlaJ7wuHzthnfqxyIhPJihXq9JIbWGSOvJ0
 B6AdioXA7RHsz+u3RLetKQ2weAtkxjmQ/rn1How9wRRzEHlB3B+FIyE5/Iv7mEkiXR23
 ZUFcX09mc1d6qsNpYxfB38np9VIb33uLQehcDVoUmU9uGyKf71lhnXSqruf9T419Nxs2
 esOJgQjjy0vaz/xgqmkoUiJ3IOTCc9dmkTfltVUJHXg4duEFUnfq9W38KdmIrSATJ7Lu
 HgMg==
X-Gm-Message-State: AOJu0YwwU5nhcCrO0e08BaSJJBLtGrQ3TkcaCyUtI1pUVQiKhAO8sTLb
 gHzSn7qYJjnXBFHM2Y76stEtZZvtm+PvDmQO75cCtsknmrCZfFtTdErSlkWLYTpkpUDD6KBCUlX
 GzxaSFY39aMzyGiamGZGuHldalhmv
X-Received: by 2002:adf:f78f:0:b0:32d:9d80:4039 with SMTP id
 q15-20020adff78f000000b0032d9d804039mr3633199wrp.34.1700744332281; 
 Thu, 23 Nov 2023 04:58:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpWgSPYx8zY62FkgX2BZkJCBito0oBsQoboWfkrhEz4uFJxxqm8j/fIgNDjmQ49+9rxyGQog==
X-Received: by 2002:adf:f78f:0:b0:32d:9d80:4039 with SMTP id
 q15-20020adff78f000000b0032d9d804039mr3633180wrp.34.1700744331836; 
 Thu, 23 Nov 2023 04:58:51 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b00332c7d4a232sm1564569wrv.82.2023.11.23.04.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 04:58:51 -0800 (PST)
Date: Thu, 23 Nov 2023 13:58:50 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <drzvrbsej2txf6a6npc4ukkpadj3wio7edkjbgsfdm4l33szpe@fgwtdy5z5ev7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ma5tqxtnhq4wwnph"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ma5tqxtnhq4wwnph
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-next PR.

It's been fairly calm, but there's one big change: the IMG GPU driver is
now merged!

Maxime

drm-misc-next-2023-11-23:
drm-misc-next for 6.8:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - Drop deprecated drm_kms_helper.edid_firmware module parameter

Driver Changes:
  - Convert platform drivers remove callback to return void
  - imagination: Introduction of the Imagination GPU Support
  - rockchip:
    - rk3066_hdmi: Convert to atomic
    - vop2: Support NV20 and NV30
  - panel:
    - elida-kd35t133: PM reworks
    - New panels: Powkiddy RK2023
The following changes since commit 3b434a3445fff3149128db0169da864d67057325:

  accel/ivpu: Use threaded IRQ to handle JOB done messages (2023-11-16 13:4=
1:49 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-11-23

for you to fetch changes up to 815d8b0425ad1164e45953ac3d56a9f6f63792cc:

  drm/imagination: Add driver documentation (2023-11-23 09:01:47 +0100)

----------------------------------------------------------------
drm-misc-next for 6.8:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - Drop deprecated drm_kms_helper.edid_firmware module parameter

Driver Changes:
  - Convert platform drivers remove callback to return void
  - imagination: Introduction of the Imagination GPU Support
  - rockchip:
    - rk3066_hdmi: Convert to atomic
    - vop2: Support NV20 and NV30
  - panel:
    - elida-kd35t133: PM reworks
    - New panels: Powkiddy RK2023

----------------------------------------------------------------
Abhinav Singh (1):
      drm/nouveau/fence:: fix warning directly dereferencing a rcu pointer

Arnd Bergmann (1):
      drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h

Chris Morgan (8):
      dt-bindings: display: nv3051d: Update NewVision NV3051D compatibles
      drm/panel: nv3051d: Hold panel in reset for unprepare
      drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
      drm/panel-elida-kd35t133: trival: update panel size from 5.5 to 3.5
      drm/panel-elida-kd35t133: hold panel in reset for unprepare
      drm/panel-elida-kd35t133: drop drm_connector_set_orientation_from_pan=
el
      drm/panel-elida-kd35t133: Drop shutdown logic
      drm/panel-elida-kd35t133: Drop prepare/unprepare logic

Donald Robson (2):
      drm/gpuvm: Helper to get range of unmap from a remap op.
      drm/imagination: Add GEM and VM related code

Jani Nikula (1):
      drm/edid/firmware: drop drm_kms_helper.edid_firmware backward compat

Jeffrey Hugo (1):
      accel/qaic: Update MAX_ORDER use to be inclusive

Johan Jonker (2):
      drm/rockchip: rk3066_hdmi: Remove useless mode_fixup
      drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic

Jonas Karlman (1):
      drm/rockchip: vop2: Add NV20 and NV30 support

Kees Cook (1):
      dma-buf: Replace strlcpy() with strscpy()

Luben Tuikov (1):
      drm/print: Handle NULL drm device in __drm_printk()

Matt Coster (1):
      sizes.h: Add entries between SZ_32G and SZ_64T

Richard Acayan (1):
      fbdev/simplefb: Suppress error on missing power domains

Sarah Walker (17):
      dt-bindings: gpu: Add Imagination Technologies PowerVR/IMG GPU
      drm/imagination/uapi: Add PowerVR driver UAPI
      drm/imagination: Add skeleton PowerVR driver
      drm/imagination: Get GPU resources
      drm/imagination: Add GPU register headers
      drm/imagination: Add firmware and MMU related headers
      drm/imagination: Add FWIF headers
      drm/imagination: Add GPU ID parsing and firmware loading
      drm/imagination: Implement power management
      drm/imagination: Implement firmware infrastructure and META FW support
      drm/imagination: Implement MIPS firmware processor and MMU support
      drm/imagination: Implement free list and HWRT create and destroy ioct=
ls
      drm/imagination: Implement context creation/destruction ioctls
      drm/imagination: Implement job submission and scheduling
      drm/imagination: Add firmware trace header
      drm/imagination: Add firmware trace to debugfs
      drm/imagination: Add driver documentation

Tomi Valkeinen (1):
      drm/tilcdc: Fix irq free on unload

Uwe Kleine-K=F6nig (14):
      drm/bridge: tpd12s015: Drop buggy __exit annotation for remove functi=
on
      drm/arcpgu: Convert to platform remove callback returning void
      drm/armada: Convert to platform remove callback returning void
      drm/bridge: cdns-mhdp8546: Improve error reporting in remove callback
      drm/bridge: cdns-mhdp8546: Convert to platform remove callback return=
ing void
      drm/bridge: tpd12s015: Convert to platform remove callback returning =
void
      drm/etnaviv: Convert to platform remove callback returning void
      drm/imx/dcss: Convert to platform remove callback returning void
      drm/imx: lcdc: Convert to platform remove callback returning void
      drm/kmb: Convert to platform remove callback returning void
      drm/mediatek: Convert to platform remove callback returning void
      drm/meson: Convert to platform remove callback returning void
      drm/nouveau: Convert to platform remove callback returning void
      drm/sprd: Convert to platform remove callback returning void

Yang Li (1):
      drm/nouveau/fifo: Remove duplicated include in chan.c

 .../bindings/display/panel/newvision,nv3051d.yaml  |    2 +-
 .../devicetree/bindings/gpu/img,powervr.yaml       |   73 +
 Documentation/gpu/drivers.rst                      |    2 +
 Documentation/gpu/imagination/index.rst            |   13 +
 Documentation/gpu/imagination/uapi.rst             |  174 +
 MAINTAINERS                                        |   10 +
 drivers/accel/qaic/qaic_data.c                     |    2 +-
 drivers/dma-buf/dma-buf.c                          |    4 +-
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/armada/armada_crtc.c               |    5 +-
 drivers/gpu/drm/armada/armada_drv.c                |    5 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   26 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |    6 +-
 drivers/gpu/drm/drm_edid_load.c                    |   16 -
 drivers/gpu/drm/drm_kms_helper_common.c            |   32 -
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    5 +-
 drivers/gpu/drm/imagination/Kconfig                |   18 +
 drivers/gpu/drm/imagination/Makefile               |   35 +
 drivers/gpu/drm/imagination/pvr_ccb.c              |  645 ++
 drivers/gpu/drm/imagination/pvr_ccb.h              |   71 +
 drivers/gpu/drm/imagination/pvr_cccb.c             |  267 +
 drivers/gpu/drm/imagination/pvr_cccb.h             |  109 +
 drivers/gpu/drm/imagination/pvr_context.c          |  464 ++
 drivers/gpu/drm/imagination/pvr_context.h          |  205 +
 drivers/gpu/drm/imagination/pvr_debugfs.c          |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h          |   29 +
 drivers/gpu/drm/imagination/pvr_device.c           |  658 +++
 drivers/gpu/drm/imagination/pvr_device.h           |  710 +++
 drivers/gpu/drm/imagination/pvr_device_info.c      |  254 +
 drivers/gpu/drm/imagination/pvr_device_info.h      |  186 +
 drivers/gpu/drm/imagination/pvr_drv.c              | 1501 +++++
 drivers/gpu/drm/imagination/pvr_drv.h              |  129 +
 drivers/gpu/drm/imagination/pvr_free_list.c        |  625 ++
 drivers/gpu/drm/imagination/pvr_free_list.h        |  195 +
 drivers/gpu/drm/imagination/pvr_fw.c               | 1489 +++++
 drivers/gpu/drm/imagination/pvr_fw.h               |  508 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h          |  135 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |  554 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h          |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |  252 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h          |   48 +
 drivers/gpu/drm/imagination/pvr_fw_startstop.c     |  306 +
 drivers/gpu/drm/imagination/pvr_fw_startstop.h     |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |  515 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h         |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c              |  414 ++
 drivers/gpu/drm/imagination/pvr_gem.h              |  170 +
 drivers/gpu/drm/imagination/pvr_hwrt.c             |  549 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h             |  165 +
 drivers/gpu/drm/imagination/pvr_job.c              |  788 +++
 drivers/gpu/drm/imagination/pvr_job.h              |  161 +
 drivers/gpu/drm/imagination/pvr_mmu.c              | 2637 +++++++++
 drivers/gpu/drm/imagination/pvr_mmu.h              |  108 +
 drivers/gpu/drm/imagination/pvr_params.c           |  147 +
 drivers/gpu/drm/imagination/pvr_params.h           |   72 +
 drivers/gpu/drm/imagination/pvr_power.c            |  433 ++
 drivers/gpu/drm/imagination/pvr_power.h            |   41 +
 drivers/gpu/drm/imagination/pvr_queue.c            | 1432 +++++
 drivers/gpu/drm/imagination/pvr_queue.h            |  169 +
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    | 6193 ++++++++++++++++=
++++
 .../gpu/drm/imagination/pvr_rogue_cr_defs_client.h |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h       |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h       | 2188 +++++++
 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h |  493 ++
 .../gpu/drm/imagination/pvr_rogue_fwif_client.h    |  373 ++
 .../drm/imagination/pvr_rogue_fwif_client_check.h  |  133 +
 .../gpu/drm/imagination/pvr_rogue_fwif_common.h    |   60 +
 .../gpu/drm/imagination/pvr_rogue_fwif_dev_info.h  |  113 +
 .../imagination/pvr_rogue_fwif_resetframework.h    |   28 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h    | 1648 ++++++
 .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    |  258 +
 .../drm/imagination/pvr_rogue_fwif_shared_check.h  |  108 +
 .../gpu/drm/imagination/pvr_rogue_fwif_stream.h    |   78 +
 .../gpu/drm/imagination/pvr_rogue_heap_config.h    |  113 +
 drivers/gpu/drm/imagination/pvr_rogue_meta.h       |  356 ++
 drivers/gpu/drm/imagination/pvr_rogue_mips.h       |  335 ++
 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h |   58 +
 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h   |  136 +
 drivers/gpu/drm/imagination/pvr_stream.c           |  285 +
 drivers/gpu/drm/imagination/pvr_stream.h           |   75 +
 drivers/gpu/drm/imagination/pvr_stream_defs.c      |  351 ++
 drivers/gpu/drm/imagination/pvr_stream_defs.h      |   16 +
 drivers/gpu/drm/imagination/pvr_sync.c             |  289 +
 drivers/gpu/drm/imagination/pvr_sync.h             |   84 +
 drivers/gpu/drm/imagination/pvr_vm.c               | 1107 ++++
 drivers/gpu/drm/imagination/pvr_vm.h               |   65 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c          |  238 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h          |   22 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |    6 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    6 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    5 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |    5 +-
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    6 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c         |    5 +-
 drivers/gpu/drm/nouveau/nv04_fence.c               |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |    1 -
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   37 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   57 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   47 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    5 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    2 +
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    6 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |    5 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |    6 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    2 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |    6 +-
 drivers/video/fbdev/simplefb.c                     |    4 +
 include/drm/drm_edid.h                             |    5 -
 include/drm/drm_gpuvm.h                            |   28 +
 include/drm/drm_print.h                            |    2 +-
 include/linux/sizes.h                              |    9 +
 include/uapi/drm/pvr_drm.h                         | 1297 ++++
 115 files changed, 34632 insertions(+), 204 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
 create mode 100644 drivers/gpu/drm/imagination/Kconfig
 create mode 100644 drivers/gpu/drm/imagination/Makefile
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check=
=2Eh
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_dev_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_resetframewo=
rk.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared_check=
=2Eh
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
 create mode 100644 include/uapi/drm/pvr_drm.h

--ma5tqxtnhq4wwnph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZV9MigAKCRDj7w1vZxhR
xXiXAP9dxjET+Sh7/zVEidwWHFNbgw3MC9CGhoGwd0Gfj0dEDgD7B1b0CT5MHzyh
KSoj4L/UivsPvTbBlpOtCA5Mc/pv0Qo=
=09Nj
-----END PGP SIGNATURE-----

--ma5tqxtnhq4wwnph--

