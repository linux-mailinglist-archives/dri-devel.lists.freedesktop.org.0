Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA227FEBA8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E4310E6C6;
	Thu, 30 Nov 2023 09:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E1410E6CA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701335762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JX+J2VV+vvWeuPCMVDxVXWEjK5HUiYnHdyaWWrsXriI=;
 b=PmNwjYiPVtuyAnHARKV+J4I2HldxfSugEy2x+B4EaHvVoHE5WTn5gCHz4lVPzaExyiprCJ
 3G4RjHlf8TxwuTEhzAHVtKieG//kytsTkXdV+VXAa5bsBwpZ4sQpxi4JkIGQMy+65CfuCm
 hgMJZgVQDkHLOH/oeMWMBZN2tAVFwoQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-NVoji7tvMg6k5cPTAE-zhA-1; Thu, 30 Nov 2023 04:16:00 -0500
X-MC-Unique: NVoji7tvMg6k5cPTAE-zhA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1cfc42c3786so8051885ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 01:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701335759; x=1701940559;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JX+J2VV+vvWeuPCMVDxVXWEjK5HUiYnHdyaWWrsXriI=;
 b=dFaCURJQav1Iao57tM/FUebtnLP5ZmcQkFL5fozYhc5gmjww8tiI1IjUoZjecCy5JY
 kt30pPEJEuMC1GWLPFrB5QVtu9M3roaZgstnGsl66SfKE0vsQ8kr2DYvuuEza8cvHl/V
 /9ATR4L8t2eTPoe8CwNskIuWktS1TBvXQwskb6x0nx8Le+vfd/QV7dlcJS8piV9oez0G
 iynRSo3Ebxwb5KAeQ32tgBe2xhrFcgd2K1hEuUGlvHFYLCgnRZyQMftcU3E9rtWETDwf
 b7arHorApS7nxRNiOeB8YE69jqp22fY2R++aNyymd2EjrmOL97ueO5gBjwnxKXsajCK2
 NZmA==
X-Gm-Message-State: AOJu0YwVKkFECeKVagITWhnvep8S3VrY5RCNgwxl+jjvOCJOnHdi/yb7
 LcBewlBHoVYyhe8R0hOWhmUhe7rHOaZpRbzQlzmhQbx6ByHKhKLbcC6rCQZBEyWRX+SI74mrH4F
 nDUF/VeLAuKWGmKocB4QVgsFQ684O
X-Received: by 2002:a17:902:7446:b0:1d0:44fd:feb4 with SMTP id
 e6-20020a170902744600b001d044fdfeb4mr1190plt.10.1701335758593; 
 Thu, 30 Nov 2023 01:15:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbDN67OdR9ijoecaM5R9B+72ierI7LI1l/L1/JdK1kYSd3AlJ3u/lNjPj8gF3yyZ/OT8Hxrg==
X-Received: by 2002:a17:902:7446:b0:1d0:44fd:feb4 with SMTP id
 e6-20020a170902744600b001d044fdfeb4mr1160plt.10.1701335758163; 
 Thu, 30 Nov 2023 01:15:58 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a170902821400b001ca86a9caccsm833145pln.228.2023.11.30.01.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 01:15:57 -0800 (PST)
Date: Thu, 30 Nov 2023 10:15:52 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <c7so3afih3xc4lsvd6jjbr4jihp7e2x3lzcwh7st3xisho3xuq@roym7mckdr3e>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ozrz3itdugvntclu"
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


--ozrz3itdugvntclu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-next PR

Thanks!
Maxime

drm-misc-next-2023-11-30:
drm-misc-next for 6.8:

UAPI Changes:
 - Introduction of DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
 - Introduction of DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT

Cross-subsystem Changes:
 - fbdev: Convert a big chunks of drivers to helper macros

Core Changes:
 - atomic: Add support for mouse hotspots

Driver Changes:
 - ast: Model Detection improvements
 - imagination: plenty of fixes
 - nouveau: use GPUVM, scheduling improvements
The following changes since commit a13fee31f56449fc600d9e064c7b32302f92dcef:

  Merge v6.7-rc3 into drm-next (2023-11-28 11:55:56 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-11-30

for you to fetch changes up to 9ee33dc47772724ff583b060bb37c62b92b2d9c4:

  drm/imagination: Fix IS_ERR() vs NULL bug in pvr_request_firmware() (2023=
-11-30 09:16:59 +0100)

----------------------------------------------------------------
drm-misc-next for 6.8:

UAPI Changes:
 - Introduction of DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
 - Introduction of DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT

Cross-subsystem Changes:
 - fbdev: Convert a big chunks of drivers to helper macros

Core Changes:
 - atomic: Add support for mouse hotspots

Driver Changes:
 - ast: Model Detection improvements
 - imagination: plenty of fixes
 - nouveau: use GPUVM, scheduling improvements

----------------------------------------------------------------
Andr=E9 Almeida (1):
      drm: Refuse to async flip with atomic prop changes

Bert Karwatzki (1):
      drm/sched: Partial revert of "Qualify drm_sched_wakeup() by drm_sched=
_entity_is_ready()"

Colin Ian King (1):
      drm/imagination: Fix a couple of spelling mistakes in literal strings

Dan Carpenter (2):
      drm/imagination: Fix error codes in pvr_device_clk_init()
      drm/imagination: Fix IS_ERR() vs NULL bug in pvr_request_firmware()

Danilo Krummrich (6):
      drm/nouveau: use GPUVM common infrastructure
      drm/nouveau: implement 1:1 scheduler - entity relationship
      drm/nouveau: enable dynamic job-flow control
      drm/imagination: vm: prevent duplicate drm_gpuvm_bo instances
      drm/imagination: vm: check for drm_gpuvm_range_valid()
      drm/imagination: vm: fix drm_gpuvm reference count

Dario Binacchi (1):
      drm/bridge: Fix typo in post_disable() description

Donald Robson (1):
      drm/imagination: Numerous documentation fixes.

Hsin-Yi Wang (3):
      drm/panel-edp: Add override_edid_mode quirk for generic edp
      drm/panel-edp: Add auo_b116xa3_mode
      drm/panel-edp: Avoid adding multiple preferred modes

Javier Martinez Canillas (5):
      drm: Allow drivers to indicate the damage helpers to ignore damage cl=
ips
      drm/virtio: Disable damage clipping if FB changed since last page-flip
      drm/vmwgfx: Disable damage clipping if FB changed since last page-flip
      drm/plane: Extend damage tracking kernel-doc
      drm/todo: Add entry about implementing buffer age for damage tracking

Jean Delvare (1):
      drm/loongson: Add platform dependency

Liu Ying (1):
      drm/bridge: imx93-mipi-dsi: Fix a couple of building warnings

Luben Tuikov (4):
      drm/sched: Fix bounds limiting when given a malformed entity
      drm/sched: Rename priority MIN to LOW
      drm/sched: Reverse run-queue priority enumeration
      drm/sched: Fix compilation issues with DRM priority rename

Michael Banack (1):
      drm: Introduce documentation for hotspot properties

Rajneesh Bhardwaj (1):
      drm/ttm: Schedule delayed_delete worker closer

Rob Herring (1):
      drm: Use device_get_match_data()

Simon Ser (2):
      drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
      drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP

Thomas Hellstr=F6m (1):
      Documentation/gpu: VM_BIND locking document

Thomas Zimmermann (43):
      Merge drm/drm-next into drm-misc-next
      drm/ast: Turn ioregs_lock to modeset_lock
      drm/ast: Rework I/O register setup
      drm/ast: Retrieve I/O-memory ranges without ast device
      drm/ast: Add I/O helpers without ast device
      drm/ast: Enable VGA without ast device instance
      drm/ast: Enable MMIO without ast device instance
      drm/ast: Partially implement POST without ast device instance
      drm/ast: Add enum ast_config_mode
      drm/ast: Detect ast device type and config mode without ast device
      drm/ast: Move detection code into PCI probe helper
      fbdev/acornfb: Fix name of fb_ops initializer macro
      fbdev/sm712fb: Use correct initializer macros for struct fb_ops
      fbdev/vfb: Set FBINFO_VIRTFB flag
      fbdev/vfb: Initialize fb_ops with fbdev macros
      fbdev/arcfb: Set FBINFO_VIRTFB flag
      fbdev/arcfb: Use generator macros for deferred I/O
      auxdisplay/cfag12864bfb: Set FBINFO_VIRTFB flag
      auxdisplay/cfag12864bfb: Initialize fb_ops with fbdev macros
      auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
      auxdisplay/ht16k33: Initialize fb_ops with fbdev macros
      hid/picolcd_fb: Set FBINFO_VIRTFB flag
      fbdev/sh_mobile_lcdcfb: Set FBINFO_VIRTFB flag
      fbdev/sh_mobile_lcdcfb: Initialize fb_ops with fbdev macros
      fbdev/smscufx: Select correct helpers
      fbdev/udlfb: Select correct helpers
      fbdev/au1200fb: Set FBINFO_VIRTFB flag
      fbdev/au1200fb: Initialize fb_ops with fbdev macros
      fbdev/ps3fb: Set FBINFO_VIRTFB flag
      fbdev/ps3fb: Initialize fb_ops with fbdev macros
      media/ivtvfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/clps711x-fb: Initialize fb_ops with fbdev macros
      fbdev/vt8500lcdfb: Initialize fb_ops with fbdev macros
      fbdev/wm8505fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/cyber2000fb: Initialize fb_ops with fbdev macros
      staging/sm750fb: Declare fb_ops as constant
      staging/sm750fb: Initialize fb_ops with fbdev macros
      fbdev: Rename FB_SYS_FOPS token to FB_SYSMEM_FOPS
      fbdev: Remove trailing whitespaces
      fbdev: Push pgprot_decrypted() into mmap implementations
      fbdev: Move default fb_mmap code into helper function
      fbdev: Warn on incorrect framebuffer access
      fbdev: Remove default file-I/O implementations

Uwe Kleine-K=F6nig (2):
      drm/tilcdc: Convert to platform remove callback returning void
      drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()

Xin Ji (2):
      Revert "drm/bridge: Add 200ms delay to wait FW HPD status stable"
      drm/bridge: anx7625: Fix Set HPD irq detect window to 2ms

Yang Li (1):
      drm/imagination: Remove unneeded semicolon

Yuran Pereira (1):
      drm/nouveau: Removes unnecessary args check in nouveau_uvmm_sm_prepare

Zack Rusin (8):
      drm: Disable the cursor plane on atomic contexts with virtualized dri=
vers
      drm/atomic: Add support for mouse hotspots
      drm/vmwgfx: Use the hotspot properties from cursor planes
      drm/qxl: Use the hotspot properties from cursor planes
      drm/vboxvideo: Use the hotspot properties from cursor planes
      drm/virtio: Use the hotspot properties from cursor planes
      drm: Remove legacy cursor hotspot code
      drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT

 Documentation/core-api/pin_user_pages.rst       |   2 +
 Documentation/gpu/drm-kms.rst                   |   8 +
 Documentation/gpu/drm-mm.rst                    |   4 +
 Documentation/gpu/drm-vm-bind-locking.rst       | 582 ++++++++++++++++++++=
++++
 Documentation/gpu/imagination/index.rst         |   2 +-
 Documentation/gpu/imagination/uapi.rst          |   5 +-
 Documentation/gpu/implementation_guidelines.rst |   1 +
 Documentation/gpu/rfc/xe.rst                    |   5 +
 Documentation/gpu/todo.rst                      |  23 +
 drivers/auxdisplay/Kconfig                      |  10 +-
 drivers/auxdisplay/cfag12864bfb.c               |  10 +-
 drivers/auxdisplay/ht16k33.c                    |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c         |   2 +-
 drivers/gpu/drm/armada/armada_crtc.c            |  24 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         |  10 +-
 drivers/gpu/drm/ast/ast_drv.c                   | 263 ++++++++++-
 drivers/gpu/drm/ast/ast_drv.h                   | 101 ++--
 drivers/gpu/drm/ast/ast_main.c                  | 244 +---------
 drivers/gpu/drm/ast/ast_mode.c                  |  26 +-
 drivers/gpu/drm/ast/ast_post.c                  |  81 ++--
 drivers/gpu/drm/ast/ast_reg.h                   |  12 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c       |  54 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.h       |   4 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c     |   4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c           |   6 +-
 drivers/gpu/drm/drm_atomic_state_helper.c       |  14 +
 drivers/gpu/drm/drm_atomic_uapi.c               |  97 +++-
 drivers/gpu/drm/drm_crtc_internal.h             |   2 +-
 drivers/gpu/drm/drm_damage_helper.c             |   3 +-
 drivers/gpu/drm/drm_ioctl.c                     |  13 +
 drivers/gpu/drm/drm_mode_object.c               |   2 +-
 drivers/gpu/drm/drm_plane.c                     | 150 +++++-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c         |   9 +-
 drivers/gpu/drm/imagination/pvr_cccb.h          |   1 +
 drivers/gpu/drm/imagination/pvr_device.c        |   8 +-
 drivers/gpu/drm/imagination/pvr_device.h        |  25 +-
 drivers/gpu/drm/imagination/pvr_free_list.c     |   2 +-
 drivers/gpu/drm/imagination/pvr_fw.h            |   3 +-
 drivers/gpu/drm/imagination/pvr_fw_info.h       |   8 +-
 drivers/gpu/drm/imagination/pvr_hwrt.h          |   1 +
 drivers/gpu/drm/imagination/pvr_job.c           |   4 +-
 drivers/gpu/drm/imagination/pvr_mmu.c           |   3 +-
 drivers/gpu/drm/imagination/pvr_queue.c         |   2 +-
 drivers/gpu/drm/imagination/pvr_queue.h         |   4 +-
 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h |   4 +-
 drivers/gpu/drm/imagination/pvr_vm.c            |  32 +-
 drivers/gpu/drm/imagination/pvr_vm.h            |   3 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c             |   9 +-
 drivers/gpu/drm/loongson/Kconfig                |   1 +
 drivers/gpu/drm/msm/msm_gpu.h                   |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               |  10 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c         |  19 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.h         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c            |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c           |  31 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h           |   9 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c          |  70 +--
 drivers/gpu/drm/nouveau/nouveau_exec.h          |   6 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c         | 211 +++++----
 drivers/gpu/drm/nouveau/nouveau_sched.h         |  43 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c          | 210 ++++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h          |   4 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c             |   4 +-
 drivers/gpu/drm/omapdrm/dss/dss.c               |   5 +-
 drivers/gpu/drm/panel/panel-edp.c               |  79 +++-
 drivers/gpu/drm/qxl/qxl_display.c               |  14 +-
 drivers/gpu/drm/qxl/qxl_drv.c                   |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c        |  14 +-
 drivers/gpu/drm/scheduler/sched_main.c          |  20 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c             |   9 +-
 drivers/gpu/drm/ttm/ttm_bo.c                    |   8 +-
 drivers/gpu/drm/ttm/ttm_device.c                |   6 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c            |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c           |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c            |   2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c          |  18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c             |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c             |  20 +-
 drivers/hid/hid-picolcd_fb.c                    |   1 +
 drivers/media/pci/ivtv/Kconfig                  |   4 +-
 drivers/media/pci/ivtv/ivtvfb.c                 |   6 +-
 drivers/staging/sm750fb/sm750.c                 |  65 ++-
 drivers/video/fbdev/Kconfig                     |  50 +-
 drivers/video/fbdev/acornfb.c                   |   2 +-
 drivers/video/fbdev/amba-clcd.c                 |   2 +
 drivers/video/fbdev/arcfb.c                     | 114 ++---
 drivers/video/fbdev/au1100fb.c                  |   2 +
 drivers/video/fbdev/au1200fb.c                  |  11 +-
 drivers/video/fbdev/clps711x-fb.c               |   4 +-
 drivers/video/fbdev/core/Kconfig                |   7 +-
 drivers/video/fbdev/core/Makefile               |   2 +-
 drivers/video/fbdev/core/cfbcopyarea.c          |   3 +
 drivers/video/fbdev/core/cfbfillrect.c          |   3 +
 drivers/video/fbdev/core/cfbimgblt.c            |   3 +
 drivers/video/fbdev/core/fb_chrdev.c            |  72 +--
 drivers/video/fbdev/core/fb_defio.c             |   2 +
 drivers/video/fbdev/core/fb_io_fops.c           |  36 ++
 drivers/video/fbdev/core/fb_sys_fops.c          |   6 +
 drivers/video/fbdev/core/syscopyarea.c          |   3 +
 drivers/video/fbdev/core/sysfillrect.c          |   3 +
 drivers/video/fbdev/core/sysimgblt.c            |   3 +
 drivers/video/fbdev/cyber2000fb.c               |   9 +-
 drivers/video/fbdev/ep93xx-fb.c                 |   2 +
 drivers/video/fbdev/gbefb.c                     |   2 +
 drivers/video/fbdev/omap/omapfb_main.c          |   2 +
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c  |   2 +
 drivers/video/fbdev/ps3fb.c                     |  11 +-
 drivers/video/fbdev/sa1100fb.c                  |   2 +
 drivers/video/fbdev/sbuslib.c                   |   5 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c          |  16 +-
 drivers/video/fbdev/sm712fb.c                   |   6 +-
 drivers/video/fbdev/smscufx.c                   |   2 +
 drivers/video/fbdev/udlfb.c                     |   2 +
 drivers/video/fbdev/vermilion/vermilion.c       |   2 +
 drivers/video/fbdev/vfb.c                       |  10 +-
 drivers/video/fbdev/vt8500lcdfb.c               |   4 +-
 drivers/video/fbdev/wm8505fb.c                  |   2 +
 include/drm/drm_bridge.h                        |   2 +-
 include/drm/drm_drv.h                           |   9 +
 include/drm/drm_file.h                          |  12 +
 include/drm/drm_framebuffer.h                   |  12 -
 include/drm/drm_plane.h                         |  24 +
 include/drm/gpu_scheduler.h                     |   6 +-
 include/linux/fb.h                              |  16 +-
 include/uapi/drm/drm.h                          |  35 +-
 include/uapi/drm/drm_mode.h                     |   9 +
 include/uapi/drm/pvr_drm.h                      |  10 +-
 128 files changed, 2243 insertions(+), 1102 deletions(-)
 create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst

--ozrz3itdugvntclu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWhSyAAKCRDj7w1vZxhR
xV6jAQDo5PVh1f80x2owjN5oxnhbE7goXo80oi2JFMC5R31oJAEApoD8/x+3GcrZ
Wy55IgJvZL4d10cGlUIIIHv23WeqEgo=
=l3cp
-----END PGP SIGNATURE-----

--ozrz3itdugvntclu--

