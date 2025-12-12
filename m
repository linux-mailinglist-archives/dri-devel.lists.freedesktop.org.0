Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D62CB8585
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 09:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EB810E5AF;
	Fri, 12 Dec 2025 08:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zmu/05Kf";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="lRQnuVe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CE110E5AF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765529924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=3OOl1KO64zmLiW61+N6ESdQ47YbE4y382fLZJzrbSBQ=;
 b=Zmu/05KfkrcKEp1dqzo47QajSEXDfRtUWLIvVD9cgXwlfuzOmH+ZMfku9n0daVWlWGrbuh
 /pOvnoEpWjsiA7gpIJZxjlDzFrSmjGRsEYclpDxhsN3plWmlUAzFXfA73MFof9ZwHwj0Nz
 naWCTTKdPS4y7bM62fjleRmtZ4GV0Sk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-_rLjrFm1NHyCWBW8lHR2tQ-1; Fri, 12 Dec 2025 03:58:39 -0500
X-MC-Unique: _rLjrFm1NHyCWBW8lHR2tQ-1
X-Mimecast-MFC-AGG-ID: _rLjrFm1NHyCWBW8lHR2tQ_1765529918
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4792bd2c290so7743515e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1765529918; x=1766134718; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3OOl1KO64zmLiW61+N6ESdQ47YbE4y382fLZJzrbSBQ=;
 b=lRQnuVe4/x0fMslbIOIM1dbgvdlVfwogc9+xBgnM0RinICKCyldGjG1PPPFuZRgvZ3
 iHI3V0jJZGgz40AX22BcIJiEqZWV9cWirDRML6be65n9VmHM72Qk8ZLAqQ4JQvJUiX70
 /dJJhNsxTK97Qnno5xVx31B4kOM/UYyzotLFCWzvI4arGwRkxcOsYe4s+3FahiqSLLy3
 Yx2NOzDQ/l7S8zXyNssvVxemo4VeFTUduzszKkCbiIxZiYcy/6LNh/oz5JJxaYe9rOJN
 TmnudSR/z2Z0LXRJA/Xk4ncJru6ccKmAI6dj+/jsA2Geal0eVkZIu0ihBHCAqU9hDzlf
 eQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765529918; x=1766134718;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3OOl1KO64zmLiW61+N6ESdQ47YbE4y382fLZJzrbSBQ=;
 b=H5xuaZUmD8UKxuO8+R1ZGc9vvFvpId2ciF8Te3G+oIltg+12PyBQnyz4jm3VuHIr26
 V0VZRr7BaFfUKS2keQYbpsJoeCYlEhYCZjypXQyZq3As8fUGIeHESBWaeO6RdMZBVMjN
 Rrgl1lbOMNCP0XWQUHDU41Z13urTGSBfQY0x15t4tn4v/jQV8hGt7cp7k/F5Em6aLt1M
 lArci7h2TbX376bVB0IygOwxAGgTT8R6ehraxyyvHuA/VdMYRo3K/VTuaro3FJl/Ob1c
 1i32tsNkI4ptxpy1c9TvJhi0BYYfTN8Y5XrBbwBvrxd6tsuv77jGAe35Qve4iypl+QHO
 9MwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDUCrjJHoh21jTVOvYSYBeH4leArvAIZvSfULN94+xRGzmblymAer4OJN2rGBAxGceyMIfBHJ5swk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyresCTONRHbT8MskKo+3mO29lmlhoxtDqQ1aus4ONPL3C7icKB
 0qEs0k6PQNqaQ+yLojCv40i9PznSFgOZitawJbLRiCNA4PI9bIM2M6WYpIArLdkA8MecJqHqN7n
 5CReQhDg6UBrwU0qhAtMsEl52KxrwbLyIuLeBuAwyfdzeUVGZcd7+OuSwkSwb08kO9oBtgw==
X-Gm-Gg: AY/fxX7ld1y28tCB5MQKp0jtJTDVlebUfjSc2LRmcmqH/Ya0x6Oorp/0kSKCsw0RDSS
 LWpYbu5m+chFctEBVE7GtnArJG5dYscy/yRYGrBrK94WV7G6WM117hOsO8j83v6AnZB4up3ij6r
 TZr3wT5cMGhQcBAQiD1bwZ5xx8+j9gMRp6+6G2HrJ8hGlLnG7SP32XQ7eO+x6R8zdYaJf/uAraY
 IFvL0Uo7gk+gUbP21qMCYhALgISUu8Wpcwz+P6UnyRg5djPRk634565iQ+t+prx+fIqAicKP5zq
 hXHF8T9TSCu8cc8xa3JxDouV338pnh3niQP3srNl53L+K+G5jfy0bT4v3e9imFZFbPdZ9sXWjrA
 8Ouaf
X-Received: by 2002:a05:600c:a40e:b0:477:b734:8c52 with SMTP id
 5b1f17b1804b1-47a900bd6cfmr7722995e9.14.1765529917680; 
 Fri, 12 Dec 2025 00:58:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3JXRc3h+O8u1zjrMyTE89J5hyP/hmb4XogIOQ7L6CxCbB2I3JXsuZeZwCc2dBBAQ9gkXx2g==
X-Received: by 2002:a05:600c:a40e:b0:477:b734:8c52 with SMTP id
 5b1f17b1804b1-47a900bd6cfmr7722815e9.14.1765529917191; 
 Fri, 12 Dec 2025 00:58:37 -0800 (PST)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f32f7easm8364805e9.0.2025.12.12.00.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 00:58:36 -0800 (PST)
Date: Fri, 12 Dec 2025 09:58:35 +0100
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
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20251212-spectacular-agama-of-abracadabra-aaef32@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sces6ytv4ypvenxt"
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


--sces6ytv4ypvenxt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Dave, Sima,

Here's the first drm-misc-next PR, a bit ahead of time to make next week
easier.

Thanks!
Maxime

drm-misc-next-2025-12-12:
drm-misc-next for 6.19:

UAPI Changes:

  - panfrost: Add PANFROST_BO_SYNC ioctl
  - panthor: Add PANTHOR_BO_SYNC ioctl

Core Changes:

  - atomic: Add drm_device pointer to drm_private_obj
  - bridge: Introduce drm_bridge_unplug, drm_bridge_enter, and
    drm_bridge_exit
  - dma-buf: Improve sg_table debugging
  - dma-fence: Add new helpers, and use them when needed
  - dp_mst: Avoid out-of-bounds access with VCPI=3D=3D0
  - gem: Reduce page table overhead with transparent huge pages
  - panic: Report invalid panic modes
  - sched: Add TODO entries
  - ttm: Various cleanups
  - vblank: Various refactoring and cleanups

  - Kconfig cleanups
  - Removed support for kdb

Driver Changes:

  - amdxdna: Fix race conditions at suspend, Improve handling of zero
    tail pointers, Fix cu_idx being overwritten during command setup
  - ast: Support imported cursor buffers
  -
  - panthor: Enable timestamp propagation, Multiple improvements and
    fixes to improve the overall robustness, notably of the scheduler.

  - panels:
    - panel-edp: Support for CSW MNE007QB3-1, AUO B140HAN06.4, AUO B140QAX0=
1.H
The following changes since commit db2bad93fe206c95808b7a164a29424791728752:

  drm/amd/display: Enable support for Gamma 2.2 (2025-11-26 23:09:44 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
5-12-12

for you to fetch changes up to 470cb09a2936d3c1ff8aeff46e3c14dcc4314e9b:

  drm/plane: Fix IS_ERR() vs NULL bug drm_plane_create_color_pipeline_prope=
rty() (2025-12-11 17:39:15 +0100)

----------------------------------------------------------------
drm-misc-next for 6.19:

UAPI Changes:

  - panfrost: Add PANFROST_BO_SYNC ioctl
  - panthor: Add PANTHOR_BO_SYNC ioctl

Core Changes:

  - atomic: Add drm_device pointer to drm_private_obj
  - bridge: Introduce drm_bridge_unplug, drm_bridge_enter, and
    drm_bridge_exit
  - dma-buf: Improve sg_table debugging
  - dma-fence: Add new helpers, and use them when needed
  - dp_mst: Avoid out-of-bounds access with VCPI=3D=3D0
  - gem: Reduce page table overhead with transparent huge pages
  - panic: Report invalid panic modes
  - sched: Add TODO entries
  - ttm: Various cleanups
  - vblank: Various refactoring and cleanups

  - Kconfig cleanups
  - Removed support for kdb

Driver Changes:

  - amdxdna: Fix race conditions at suspend, Improve handling of zero
    tail pointers, Fix cu_idx being overwritten during command setup
  - ast: Support imported cursor buffers
  -
  - panthor: Enable timestamp propagation, Multiple improvements and
    fixes to improve the overall robustness, notably of the scheduler.

  - panels:
    - panel-edp: Support for CSW MNE007QB3-1, AUO B140HAN06.4, AUO B140QAX0=
1.H

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Remove redundant call to disable the MCU

Alexey Klimov (1):
      gpu/panel-edp: add AUO panel entry for B140HAN06.4

Ashley Smith (1):
      drm/panthor: Enable timestamp propagation

Boris Brezillon (26):
      drm/panthor: Always wait after sending a command to an AS
      drm/panthor: Kill lock_region()
      drm/panthor: Recover from panthor_gpu_flush_caches() failures
      drm/panthor: Add support for atomic page table updates
      drm/panthor: Make panthor_vm_[un]map_pages() more robust
      drm/panthor: Relax a check in panthor_sched_pre_reset()
      drm/panthor: Simplify group idleness tracking
      drm/panthor: Don't try to enable extract events
      drm/panthor: Fix the full_tick check
      drm/panthor: Fix the group priority rotation logic
      drm/panthor: Fix immediate ticking on a disabled tick
      drm/panthor: Fix the logic that decides when to stop ticking
      drm/panthor: Make sure we resume the tick when new jobs are submitted
      drm/panthor: Kill panthor_sched_immediate_tick()
      drm/panthor: Drop a WARN_ON() in group_free_queue()
      drm/panthor: Make sure caches are flushed/invalidated when an AS is r=
ecycled
      drm/panthor: Unlock the locked region before disabling an AS
      drm/panthor: Provide a custom dma_buf implementation
      drm/panthor: Fix panthor_gpu_coherency_set()
      drm/panthor: Expose the selected coherency protocol to the UMD
      drm/panthor: Add a PANTHOR_BO_SYNC ioctl
      drm/panthor: Add an ioctl to query BO flags
      drm/panfrost: Provide a custom dma_buf implementation
      drm/panfrost: Expose the selected coherency protocol to the UMD
      drm/panfrost: Add an ioctl to query BO flags
      drm/gem: Fix builds with CONFIG_MMU=3Dn

Chia-I Wu (1):
      drm/panthor: fix queue_reset_timeout_locked

Christian K=F6nig (3):
      dma-buf: replace "#if" with just "if"
      dma-buf: improve sg_table debugging hack v4
      dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels

Dan Carpenter (1):
      drm/plane: Fix IS_ERR() vs NULL bug drm_plane_create_color_pipeline_p=
roperty()

Eslam Khafagy (1):
      drm: pl111: replace dev_* print functions with drm_* variants

Faith Ekstrand (4):
      drm/panthor: Bump the driver version to 1.7
      drm/panfrost: Add a PANFROST_SYNC_BO ioctl
      drm/panfrost: Add flag to map GEM object Write-Back Cacheable
      drm/panfrost: Bump the driver version to 1.6

Jani Nikula (10):
      drm/hyperv: move Kconfig under driver directory
      drm/vgem: move Kconfig under driver directory
      drm/Kconfig: move generic Kconfig options above drivers
      drm/Kconfig: sort driver Kconfig source list
      drm/vblank: remove drm_wait_one_vblank() completely
      drm/vblank: remove superfluous pipe check
      drm/vblank: add return value to drm_crtc_wait_one_vblank()
      drm/vblank: limit vblank variable scope to atomic
      drm/vblank: use the drm_vblank_crtc() and drm_crtc_vblank_crtc() help=
ers more
      drm/vblank: prefer drm_crtc_vblank_crtc() over drm_vblank_crtc()

Langyan Ye (1):
      drm/panel-edp: Add CSW MNE007QB3-1

Lizhi Hou (4):
      accel/amdxdna: Poll MPNPU_PWAITMODE after requesting firmware suspend
      accel/amdxdna: Fix tail-pointer polling in mailbox_get_msg()
      accel/amdxdna: Fix race condition when checking rpm_on
      accel/amdxdna: Fix cu_idx being cleared by memset() during command se=
tup

Lo=EFc Molinari (12):
      drm/shmem-helper: Simplify page offset calculation in fault handler
      drm/shmem-helper: Map huge pages in fault handler
      drm/gem: Introduce drm_gem_get_unmapped_area() fop
      drm/gem: Add huge tmpfs mountpoint helpers
      drm/i915: Use huge tmpfs mountpoint helpers
      drm/v3d: Use huge tmpfs mountpoint helpers
      drm/gem: Get rid of *_with_mnt helpers
      drm/panthor: Introduce huge tmpfs mountpoint option
      drm/panfrost: Introduce huge tmpfs mountpoint option
      Documentation/gpu/drm-mm: Add THP paragraph to GEM mapping section
      drm/panthor: Add flag to map GEM object Write-Back Cacheable
      drm/i915: Fix BO alloc flags

Luca Ceresoli (2):
      drm/bridge: add drm_bridge_unplug() and drm_bridge_enter/exit()
      drm/bridge: ti-sn65dsi83: protect device resources on unplug

Maxime Ripard (1):
      drm/atomic: Add dev pointer to drm_private_obj

Philipp Stanner (9):
      drm/todo: Add section with task for GPU scheduler
      drm/todo: Add entry for unlocked drm/sched rq readers
      dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
      dma-buf/dma-fence: Add dma_fence_check_and_signal()
      amd/amdkfd: Use dma_fence_check_and_signal()
      drm/xe: Use dma_fence_check_and_signal_locked()
      dma-buf: Don't misuse dma_fence_signal()
      drm/ttm: Use dma_fence_check_and_signal()
      dma-buf/dma-fence: Remove return code of signaling-functions

Suraj Kandpal (1):
      drm/display/dp_mst: Add protection against 0 vcpi

Thomas Zimmermann (9):
      drm/ast: Move cursor format conversion into helper function
      drm/ast: Support cursor buffers objects in I/O memory
      drm/ast: Wrap cursor framebuffer access in drm_gem_fb_begin/end_cpu_a=
ccess()
      drm/amdgpu: Do not implement mode_set_base_atomic callback
      drm/nouveau: Do not implement mode_set_base_atomic callback
      drm/radeon: Do not implement mode_set_base_atomic callback
      drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
      fbcon: Remove fb_debug_enter/_leave from struct fb_ops
      drm/vblank: Unexport drm_wait_one_vblank()

Tvrtko Ursulin (5):
      drm/panic: Report invalid or unsupported panic modes
      drm/ttm: Make ttm_bo_init_validate safe against ttm_operation_ctx re-=
ordering
      drm/ttm: Resource cannot be NULL in ttm_resource_intersects
      drm/ttm: Tidy ttm_operation_ctx initialization
      drm/ttm: Tidy usage of local variables a little bit

Val Packett (1):
      drm/panel-edp: Add AUO B140QAX01.H panel

 Documentation/gpu/drm-mm.rst                     |  29 ++-
 Documentation/gpu/todo.rst                       |  45 ++++
 Documentation/process/debugging/kgdb.rst         |  28 --
 drivers/accel/amdxdna/aie2_message.c             |  18 +-
 drivers/accel/amdxdna/aie2_pci.c                 |   2 +-
 drivers/accel/amdxdna/aie2_pci.h                 |   3 +
 drivers/accel/amdxdna/aie2_pm.c                  |  17 +-
 drivers/accel/amdxdna/aie2_psp.c                 |  15 ++
 drivers/accel/amdxdna/aie2_smu.c                 |  27 +-
 drivers/accel/amdxdna/amdxdna_mailbox.c          |  19 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h          |   1 -
 drivers/accel/amdxdna/amdxdna_pm.c               |  22 +-
 drivers/accel/amdxdna/npu1_regs.c                |   2 +
 drivers/accel/amdxdna/npu2_regs.c                |   2 +
 drivers/accel/amdxdna/npu4_regs.c                |   2 +
 drivers/accel/amdxdna/npu5_regs.c                |   2 +
 drivers/accel/amdxdna/npu6_regs.c                |   2 +
 drivers/dma-buf/Kconfig                          |   2 +-
 drivers/dma-buf/dma-buf.c                        |  77 ++++--
 drivers/dma-buf/dma-fence.c                      | 100 +++++---
 drivers/dma-buf/st-dma-fence.c                   |   4 +-
 drivers/gpu/drm/Kconfig                          | 213 +++++----------
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c           |  35 +--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c            |  35 +--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c            |  35 +--
 drivers/gpu/drm/amd/amdkfd/kfd_process.c         |   6 +-
 drivers/gpu/drm/ast/ast_cursor.c                 |  83 ++++--
 drivers/gpu/drm/bridge/ti-sn65dsi83.c            |  86 +++++--
 drivers/gpu/drm/display/drm_dp_mst_topology.c    |   3 +-
 drivers/gpu/drm/drm_atomic.c                     |   1 +
 drivers/gpu/drm/drm_bridge.c                     |  62 +++++
 drivers/gpu/drm/drm_fb_helper.c                  | 108 --------
 drivers/gpu/drm/drm_gem.c                        | 204 +++++++++++----
 drivers/gpu/drm/drm_gem_shmem_helper.c           |  79 +++---
 drivers/gpu/drm/drm_panic.c                      |  77 +++++-
 drivers/gpu/drm/drm_plane.c                      |   4 +-
 drivers/gpu/drm/drm_vblank.c                     |  52 ++--
 drivers/gpu/drm/hyperv/Kconfig                   |  14 +
 drivers/gpu/drm/i915/Makefile                    |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c        |  58 +++--
 drivers/gpu/drm/i915/gem/i915_gemfs.c            |  71 -----
 drivers/gpu/drm/i915/gem/i915_gemfs.h            |  14 -
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c  |  15 +-
 drivers/gpu/drm/i915/i915_drv.h                  |   5 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c          |  24 +-
 drivers/gpu/drm/panel/panel-edp.c                |   3 +
 drivers/gpu/drm/panfrost/panfrost_device.c       |   3 +
 drivers/gpu/drm/panfrost/panfrost_device.h       |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c          | 107 +++++++-
 drivers/gpu/drm/panfrost/panfrost_drv.h          |   9 +
 drivers/gpu/drm/panfrost/panfrost_gem.c          | 257 +++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h          |  12 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c          |  26 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h         |  10 +-
 drivers/gpu/drm/panthor/panthor_device.c         |  13 +-
 drivers/gpu/drm/panthor/panthor_drv.c            |  87 ++++++-
 drivers/gpu/drm/panthor/panthor_drv.h            |   9 +
 drivers/gpu/drm/panthor/panthor_fw.c             |   4 +-
 drivers/gpu/drm/panthor/panthor_gem.c            | 258 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h            |   8 +
 drivers/gpu/drm/panthor/panthor_gpu.c            |  21 +-
 drivers/gpu/drm/panthor/panthor_mmu.c            | 314 +++++++++++++------=
----
 drivers/gpu/drm/panthor/panthor_sched.c          | 252 +++++++++---------
 drivers/gpu/drm/pl111/pl111_display.c            |   4 +-
 drivers/gpu/drm/pl111/pl111_drv.c                |  29 ++-
 drivers/gpu/drm/pl111/pl111_nomadik.c            |   4 +-
 drivers/gpu/drm/pl111/pl111_nomadik.h            |   4 +-
 drivers/gpu/drm/pl111/pl111_versatile.c          |  53 ++--
 drivers/gpu/drm/pl111/pl111_versatile.h          |   2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c           |  74 ++----
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c      |  23 +-
 drivers/gpu/drm/radeon/radeon_mode.h             |  10 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                     |  64 ++---
 drivers/gpu/drm/ttm/ttm_bo_util.c                |  57 ++--
 drivers/gpu/drm/ttm/ttm_bo_vm.c                  |  12 +-
 drivers/gpu/drm/ttm/ttm_device.c                 |   5 +-
 drivers/gpu/drm/ttm/ttm_pool.c                   |  26 +-
 drivers/gpu/drm/ttm/ttm_resource.c               |  14 +-
 drivers/gpu/drm/ttm/ttm_tt.c                     |   2 +-
 drivers/gpu/drm/v3d/Makefile                     |   3 +-
 drivers/gpu/drm/v3d/v3d_bo.c                     |   6 +-
 drivers/gpu/drm/v3d/v3d_drv.c                    |   2 +-
 drivers/gpu/drm/v3d/v3d_drv.h                    |  11 +-
 drivers/gpu/drm/v3d/v3d_gem.c                    |  21 +-
 drivers/gpu/drm/v3d/v3d_gemfs.c                  |  62 -----
 drivers/gpu/drm/vgem/Kconfig                     |   9 +
 drivers/gpu/drm/xe/xe_hw_fence.c                 |   4 +-
 drivers/video/fbdev/core/fbcon.c                 |  24 --
 drivers/video/fbdev/core/fbcon.h                 |   1 -
 include/drm/drm_atomic.h                         |   5 +
 include/drm/drm_bridge.h                         |  12 +
 include/drm/drm_device.h                         |  15 ++
 include/drm/drm_fb_helper.h                      |  21 --
 include/drm/drm_gem.h                            |  45 +++-
 include/drm/drm_gem_shmem_helper.h               |   3 -
 include/drm/drm_modeset_helper_vtables.h         |  23 --
 include/drm/drm_vblank.h                         |   3 +-
 include/linux/dma-fence.h                        |  35 ++-
 include/linux/fb.h                               |   4 -
 include/uapi/drm/panfrost_drm.h                  |  76 +++++-
 include/uapi/drm/panthor_drm.h                   | 157 +++++++++++-
 103 files changed, 2546 insertions(+), 1491 deletions(-)
 create mode 100644 drivers/gpu/drm/hyperv/Kconfig
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.h
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_drv.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_drv.h
 delete mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
 create mode 100644 drivers/gpu/drm/vgem/Kconfig

--sces6ytv4ypvenxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTvZOwAKCRAnX84Zoj2+
dlexAYCcSc/B9LtsrZtZD3dDtHqbQwYji+tAfPy14jms6zlvziKkjBfltZPQqBEh
kkwyQJwBfAm6KEdsuuPGhjJ8C6NW+Lx4QOzgLNMp9nKHVzcyoPM5IT16AoSzMVsA
zp+9oGSqyQ==
=KAYi
-----END PGP SIGNATURE-----

--sces6ytv4ypvenxt--

