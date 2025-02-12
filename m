Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB68A321B8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 10:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A1510E812;
	Wed, 12 Feb 2025 09:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KxqiIXLu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p0Td/j5a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KxqiIXLu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p0Td/j5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73A110E80D;
 Wed, 12 Feb 2025 09:06:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BA4133760;
 Wed, 12 Feb 2025 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739351187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vAqi8P2K+BceEj0AQqpVMTZ/OMHk2AZXfkopVzsiOLw=;
 b=KxqiIXLunfg1BewYnzowy4do7WYzKSbj70bRDBKWpny/EGhiprrxQhBhKzxzaHE17oR8wY
 gDryF035kBsJCcTM9EzCYE6Yzlw/m03wpktGuxxlKcVi+OYce/ggAy0dbVOSJFH0KLTZlO
 9pk0ujilXH9jjhTPLGl9PcA3l65Fxgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739351187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vAqi8P2K+BceEj0AQqpVMTZ/OMHk2AZXfkopVzsiOLw=;
 b=p0Td/j5a3xk1xQM4HlaDcwE2EK5STo9kwW/DtBhnQzwJo0yQCV0z85pvA8VeAssZDkSEHF
 pK5RpFkr8oIDMiDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KxqiIXLu;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="p0Td/j5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739351187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vAqi8P2K+BceEj0AQqpVMTZ/OMHk2AZXfkopVzsiOLw=;
 b=KxqiIXLunfg1BewYnzowy4do7WYzKSbj70bRDBKWpny/EGhiprrxQhBhKzxzaHE17oR8wY
 gDryF035kBsJCcTM9EzCYE6Yzlw/m03wpktGuxxlKcVi+OYce/ggAy0dbVOSJFH0KLTZlO
 9pk0ujilXH9jjhTPLGl9PcA3l65Fxgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739351187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vAqi8P2K+BceEj0AQqpVMTZ/OMHk2AZXfkopVzsiOLw=;
 b=p0Td/j5a3xk1xQM4HlaDcwE2EK5STo9kwW/DtBhnQzwJo0yQCV0z85pvA8VeAssZDkSEHF
 pK5RpFkr8oIDMiDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D6DC13AEF;
 Wed, 12 Feb 2025 09:06:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NQSsAZNkrGeLOwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Feb 2025 09:06:27 +0000
Date: Wed, 12 Feb 2025 10:06:25 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20250212090625.GA24865@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7BA4133760
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

Hi Dave, Sima,

here's the first PR from drm-misc-next for what will become Linux v6.15.

Most of the changes contain small improvements, fixes and feature additions
to existing drivers. Qaic got support for AIC200 accelerators, mgag200 now
support the new G220eH5 chips, and there's the usual long list of newly
supported panels. The panic screen's QR code now implements the Fido 2.2
standard.

Best regards
Thomas

drm-misc-next-2025-02-12:
drm-misc-next for v6.15:

UAPI Changes:

fourcc:
- Add modifiers for MediaTek tiled formats

Cross-subsystem Changes:

bus:
- mhi: Enable image transfer via BHIe in PBL

dma-buf:
- Add fast-path for single-fence merging

Core Changes:

atomic helper:
- Allow full modeset on connector changes
- Clarify semantics of allow_modeset
- Clarify semantics of drm_atomic_helper_check()

buddy allocator:
- Fix multi-root cleanup

ci:
- Update IGT

display:
- dp: Support Extendeds Wake Timeout
- dp_mst: Fix RAD-to-string conversion

panic:
- Encode QR code according to Fido 2.2

probe helper:
- Cleanups

scheduler:
- Cleanups

ttm:
- Refactor pool-allocation code
- Cleanups

Driver Changes:

amdxdma:
- Fix error handling
- Cleanups

ast:
- Refactor detection of transmitter chips
- Refactor support of VBIOS display-mode handling
- astdp: Fix connection status; Filter unsupported display modes

bridge:
- adv7511: Report correct capabilities
- it6505: Fix HDCP V compare
- sn65dsi86: Fix device IDs
- Cleanups

i915:
- Enable Extendeds Wake Timeout

imagination:
- Check job dependencies with DRM-sched helper

ivpu:
- Improve command-queue handling
- Use workqueue for IRQ handling
- Add suport for HW fault injection
- Locking fixes
- Cleanups

mgag200:
- Add support for G200eH5 chips

msm:
- dpu: Add concurrent writeback support for DPU 10.x+

nouveau:
- Move drm_slave_encoder interface into driver
- nvkm: Refactor GSP RPC

omapdrm:
- Cleanups

panel:
- Convert several panels to multi-style functions to improve error
  handling
- edp: Add support for B140UAN04.4, BOE NV140FHM-NZ, CSW MNB601LS1-3,
  LG LP079QX1-SP0V, MNE007QS3-7, STA 116QHD024002, Starry 116KHD024006,
  Lenovo T14s Gen6 Snapdragon
- himax-hx83102: Add support for CSOT PNA957QT1-1, Kingdisplay
  kd110n11-51ie, Starry 2082109qfh040022-50e

panthor:
- Expose sizes of intenral BOs via fdinfo
- Fix race between reset and suspend
- Cleanups

qaic:
- Add support for AIC200
- Cleanups

renesas:
- Fix limits in DT bindings

rockchip:
- rk3576: Add HDMI support
- vop2: Add new display modes on RK3588 HDMI0 up to 4K
- Don't change HDMI reference clock rate
- Fix DT bindings

solomon:
- Set SPI device table to silence warnings
- Fix pixel and scanline encoding

v3d:
- Cleanups

vc4:
- Use drm_exec
- Use dma-resv for wait-BO ioctl
- Remove seqno infrastructure

virtgpu:
- Support partial mappings of GEM objects
- Reserve VGA resources during initialization
- Fix UAF in virtgpu_dma_buf_free_obj()
- Add panic support

vkms:
- Switch to a managed modesetting pipeline
- Add support for ARGB8888

xlnx:
- Set correct DMA segment size
- Fix error handling
- Fix docs
The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-02-12

for you to fetch changes up to 50625eab3972e5d37dcf3a250d9e3cdecbd6c13b:

  drm/edp-panel: Add panel used by T14s Gen6 Snapdragon (2025-02-11 10:05:37 -0800)

----------------------------------------------------------------
drm-misc-next for v6.15:

UAPI Changes:

fourcc:
- Add modifiers for MediaTek tiled formats

Cross-subsystem Changes:

bus:
- mhi: Enable image transfer via BHIe in PBL

dma-buf:
- Add fast-path for single-fence merging

Core Changes:

atomic helper:
- Allow full modeset on connector changes
- Clarify semantics of allow_modeset
- Clarify semantics of drm_atomic_helper_check()

buddy allocator:
- Fix multi-root cleanup

ci:
- Update IGT

display:
- dp: Support Extendeds Wake Timeout
- dp_mst: Fix RAD-to-string conversion

panic:
- Encode QR code according to Fido 2.2

probe helper:
- Cleanups

scheduler:
- Cleanups

ttm:
- Refactor pool-allocation code
- Cleanups

Driver Changes:

amdxdma:
- Fix error handling
- Cleanups

ast:
- Refactor detection of transmitter chips
- Refactor support of VBIOS display-mode handling
- astdp: Fix connection status; Filter unsupported display modes

bridge:
- adv7511: Report correct capabilities
- it6505: Fix HDCP V compare
- sn65dsi86: Fix device IDs
- Cleanups

i915:
- Enable Extendeds Wake Timeout

imagination:
- Check job dependencies with DRM-sched helper

ivpu:
- Improve command-queue handling
- Use workqueue for IRQ handling
- Add suport for HW fault injection
- Locking fixes
- Cleanups

mgag200:
- Add support for G200eH5 chips

msm:
- dpu: Add concurrent writeback support for DPU 10.x+

nouveau:
- Move drm_slave_encoder interface into driver
- nvkm: Refactor GSP RPC

omapdrm:
- Cleanups

panel:
- Convert several panels to multi-style functions to improve error
  handling
- edp: Add support for B140UAN04.4, BOE NV140FHM-NZ, CSW MNB601LS1-3,
  LG LP079QX1-SP0V, MNE007QS3-7, STA 116QHD024002, Starry 116KHD024006,
  Lenovo T14s Gen6 Snapdragon
- himax-hx83102: Add support for CSOT PNA957QT1-1, Kingdisplay
  kd110n11-51ie, Starry 2082109qfh040022-50e

panthor:
- Expose sizes of intenral BOs via fdinfo
- Fix race between reset and suspend
- Cleanups

qaic:
- Add support for AIC200
- Cleanups

renesas:
- Fix limits in DT bindings

rockchip:
- rk3576: Add HDMI support
- vop2: Add new display modes on RK3588 HDMI0 up to 4K
- Don't change HDMI reference clock rate
- Fix DT bindings

solomon:
- Set SPI device table to silence warnings
- Fix pixel and scanline encoding

v3d:
- Cleanups

vc4:
- Use drm_exec
- Use dma-resv for wait-BO ioctl
- Remove seqno infrastructure

virtgpu:
- Support partial mappings of GEM objects
- Reserve VGA resources during initialization
- Fix UAF in virtgpu_dma_buf_free_obj()
- Add panic support

vkms:
- Switch to a managed modesetting pipeline
- Add support for ARGB8888

xlnx:
- Set correct DMA segment size
- Fix error handling
- Fix docs

----------------------------------------------------------------
Abhinav Kumar (1):
      drm: allow encoder mode_set even when connectors change for crtc

Adrián Larumbe (5):
      Documentation/gpu: Clarify format of driver-specific fidnfo keys
      drm/file: Add fdinfo helper for printing regions with prefix
      drm/panthor: Expose size of driver internal BO's over fdinfo
      Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
      drm/panthor: Fix race condition when gathering fdinfo group samples

Andrew Kreimer (1):
      drm/tidss: Fix typos

Andrzej Kacprowski (2):
      accel/ivpu: Add missing locks around mmu queues
      accel/ivpu: Prevent runtime suspend during context abort work

Andy Yan (4):
      drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
      dt-bindings: display: rockchip: Add rk3576 hdmi controller
      drm/rockchip: dw_hdmi_qp: Add basic RK3576 HDMI output support
      drm/panel-edp: Add BOE NV140FHM-NZ panel entry

Arunpravin Paneer Selvam (1):
      drm/buddy: Add a testcase to verify the multiroot fini

Boris Brezillon (1):
      drm/panthor: Fix a race between the reset and suspend path

Charles Han (1):
      drm: xlnx: zynqmp_dpsub: Add NULL check in zynqmp_audio_init

Christian König (1):
      dma-buf: add selftest for fence order after merge

Cristian Ciocaltea (4):
      dt-bindings: display: vop2: Add optional PLL clock properties
      drm/rockchip: vop2: Drop unnecessary if_pixclk_rate computation
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI0
      drm/bridge: dw-hdmi: Sync comment block with actual bus formats order

Damon Ding (2):
      drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
      dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588 HDMI TX Controller

Derek Foreman (1):
      drm/rockchip: Don't change hdmi reference clock rate

Dmitry Baryshkov (8):
      drm/encoder_slave: make mode_valid accept const struct drm_display_mode
      drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
      drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
      drm/connector: make mode_valid_ctx take a const struct drm_display_mode
      drm/connector: make mode_valid take a const struct drm_display_mode
      drm/nouveau: incorporate I2C TV encoder drivers
      drm/nouveau: vendor in drm_encoder_slave API
      drm/atomic-helper: document drm_atomic_helper_check() restrictions

Dmitry Osipenko (2):
      drm/virtio: Set missing bo->attached flag
      drm/virtio: Factor out common dmabuf unmapping code

Douglas Anderson (1):
      drm/panel-edp: Add Starry 116KHD024006

Dr. David Alan Gilbert (1):
      drm/omap: Remove hdmi5_core_handle_irqs()

Eric R. Smith (1):
      drm: add modifiers for MediaTek tiled formats

Florent Tomasin (1):
      drm/panthor: Remove dead code

Geert Uytterhoeven (1):
      drm/bridge: ti-sn65dsi86: Fix multiple instances

Gwenael Georgeault (1):
      drm/mgag200: Added support for the new device G200eH5

Hermes Wu (1):
      drm/bridge: it6505: fix HDCP V match check is not performed correctly

Jacek Lawrynowicz (4):
      accel/ivpu: Enable HWS by default on all platforms
      MAINTAINERS: Update intel_vpu maintainer list
      accel/ivpu: Add support for hardware fault injection
      accel/ivpu: Update last_busy in IRQ handler

Javier Martinez Canillas (1):
      drm/ssd130x: Set SPI .id_table to prevent an SPI core warning

Jeffrey Hugo (2):
      accel/qaic: Add config structs for supported cards
      accel/qaic: Add AIC200 support

Jesse Van Gavere (1):
      drm/bridge: adv7511: Switch to atomic operations

Jessica Zhang (5):
      drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
      drm: add clone mode check for CRTC
      drm/tests: Add test for drm_crtc_in_clone_mode()
      drm: Add valid clones check
      drm/tests: Add test for drm_atomic_helper_check_modeset()

Jocelyn Falempe (2):
      drm/ast: Fix ast_dp connection status
      drm/panic: Better binary encoding in QR code

John Keeping (2):
      drm/ssd130x: fix ssd132x encoding
      drm/ssd130x: ensure ssd132x pitch is correct

Karol Wachowski (17):
      accel/ivpu: Separate DB ID and CMDQ ID allocations from CMDQ allocation
      accel/ivpu: Add API for command queue create/destroy/submit
      accel/ivpu: Abort all jobs after command queue unregister
      accel/ivpu: Dump only first MMU fault from single context
      accel/ivpu: Move parts of MMU event IRQ handling to thread handler
      accel/ivpu: Fix missing MMU events from reserved SSID
      accel/ivpu: Set command queue management capability based on HWS
      accel/ivpu: Fix locking order in ivpu_cmdq_destroy_ioctl
      accel/ivpu: Fix locking order in ivpu_job_submit
      accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW
      accel/ivpu: Add platform detection for presilicon
      accel/ivpu: Fix missing MMU events if file_priv is unbound
      accel/ivpu: Turn on HWS by default on all platforms
      accel/ivpu: Move recovery work to system_unbound_wq
      accel/ivpu: Add debugfs interface for setting HWS priority bands
      accel/ivpu: Add test modes to toggle clock relinquish disable
      accel/ivpu: Implement D0i2 disable test mode

Krzysztof Kozlowski (4):
      drm/omap/dss: Use of_property_present() to test existence of DT property
      drm/omap/dss: Use syscon_regmap_lookup_by_phandle_args
      dt-bindings: display: renesas,du: narrow interrupts and resets per variants
      dt-bindings: display: renesas,du: add top-level constraints

Langyan Ye (9):
      drm/panel-edp: Add B140UAN04.4 and MNE007QS3-7
      drm/panel-edp: Add CSW MNB601LS1-3
      drm/panel-edp: Add STA 116QHD024002
      dt-bindings: vendor-prefixes: add csot
      dt-bindings: display: panel: Add compatible for CSOT PNA957QT1-1
      drm/panel: panel-himax-hx83102: support for csot-pna957qt1-1 MIPI-DSI panel
      dt-bindings: display: panel: Add KD110N11-51IE and 2082109QFH040022-50E
      drm/panel: panel-himax-hx83102: support for kingdisplay-kd110n11-51ie MIPI-DSI panel
      drm/panel: panel-himax-hx83102: support for starry-2082109qfh040022-50e MIPI-DSI panel

Lin.Cao (1):
      drm/buddy: fix issue that force_merge cannot free all roots

Lizhi Hou (3):
      accel/amdxdna: Return error when setting clock failed for npu1
      accel/amdxdna: Remove casting mailbox payload pointer
      accel/amdxdna: Declare sched_ops as static

Louis Chauvet (11):
      drm/vkms: Switch to managed for connector
      drm/vkms: Switch to managed for encoder
      drm/managed: Add DRM-managed alloc_ordered_workqueue
      drm/vkms: Switch to managed for crtc
      drm: writeback: Create an helper for drm_writeback_connector initialization
      drm: writeback: Add missing cleanup in case of initialization failure
      drm: writeback: Create drmm variants for drm_writeback_connector initialization
      drm/vkms: Switch to managed for writeback connector
      drm/vkms: Switch to dynamic allocation for connector
      drm/vkms: Switch to dynamic allocation for encoder
      drm/vkms: Switch to dynamic allocation for CRTC

Luca Ceresoli (10):
      drm/drm_mode_object: fix typo in kerneldoc
      drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message
      drm/panel: remove unnecessary forward declaration
      drm/bridge: nxp-ptn3460: remove unused drm_panel.h include
      drm/bridge: parade-ps8622: remove unused drm_panel.h include
      drm/bridge: parade-ps8640: remove unused drm_panel.h include
      drm/bridge: tc358762: remove unused drm_panel.h include, add drm_bridge.h
      drm/bridge: tc358775: remove unused drm_panel.h include
      drm/bridge: ti-sn65dsi83: remove unused drm_panel.h include
      drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include

Maciej Falkowski (2):
      accel/ivpu: Expose NPU memory utilization info in sysfs
      accel/ivpu: Use workqueue for IRQ handling

Matthew Auld (1):
      drm/tests/buddy: fix build with unused prng

Matthew Leung (2):
      bus: mhi: host: Refactor BHI/BHIe based firmware loading
      bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL

Maxime Ripard (1):
      Merge drm/drm-next into drm-misc-next

Maíra Canal (4):
      drm/v3d: Remove `v3d->cpu_job`
      drm/vc4: Use DRM Execution Contexts
      drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
      drm/vc4: Remove BOs seqnos

Noralf Trønnes (1):
      MAINTAINERS: Remove Noralf Trønnes as driver maintainer

Olivier Moysan (3):
      drm: bridge: adv7511: fill stream capabilities
      ASoC: hdmi-codec: allow to refine formats actually supported
      drm: bridge: adv7511: remove s32 format from i2s capabilities

Paz Zcharya (1):
      drm/vkms: Add support for ABGR8888 pixel format

Philipp Stanner (2):
      MAINTAINERS: Update DRM GPU Scheduler section
      MAINTAINERS: Add DRM GPU Scheduler reviewer

Randy Dunlap (1):
      drm/panthor: fix all mmu kernel-doc comments

Rob Herring (Arm) (1):
      drm/panthor: Convert IOCTL defines to an enum

Ryosuke Yasuoka (1):
      drm/virtio: Add drm_panic support

Sasha Finkelstein (1):
      drm/virtio: Support partial maps of GEM objects

Sebastian Reichel (1):
      drm/edp-panel: Add panel used by T14s Gen6 Snapdragon

Shixiong Ou (1):
      drm/bridge: convert to use devm_platform_ioremap_resource()

Simona Vetter (1):
      drm/atomic: clarify the rules around drm_atomic_state->allow_modeset

Suraj Kandpal (3):
      drm/dp: Add the DPCD register required for Extended wake timeout
      drm/display/dp: Define function to setup Extended wake time
      drm/i915/lttpr: Enable Extended Wake Timeout

Tejas Vipin (4):
      drm/panel: ebbg-ft8719: transition to mipi_dsi wrapped functions
      drm/panel: xinpeng-xpp055c272: transition to mipi_dsi wrapped functions
      drm/panel: samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped functions
      drm/panel: sharp-ls060t1sx01: transition to mipi_dsi wrapped functions

Thomas Hellström (2):
      drm/ttm: Balance ttm_resource_cursor_init() and ttm_resource_cursor_fini()
      drm/ttm/pool: Restructure the pool allocation code

Thomas Zimmermann (29):
      drm/probe-helper: Call connector detect functions in single helper
      drm/ast: Detect wide-screen support before creating modeset pipeline
      drm/ast: Detect DRAM before TX-chip
      drm/ast: Refactor ast_post_gpu() by Gen
      drm/ast: Initialize ASTDP in ast_post_gpu()
      drm/ast: Hide Gens 1 to 3 TX detection in branch
      drm/ast: Align Gen1 DVO detection to register manual
      drm/ast: Merge TX-chip detection code for Gen4 and later
      drm/ast: Only warn about unsupported TX chips on Gen4 and later
      drm/ast: Remove 1152x864 from list of widescreen resolutions
      drm/ast: Align naming in widescreen detection code to manual
      drm/ast: Rename support_wide_screen to support_wsxga_p
      drm/ast: Reorganize widescreen test around hardware Gens
      drm/ast: Add support_fullhd flag to struct ast_device
      drm/ast: Add support_wuxga flag to struct ast_device
      drm/ast: Always validate H/V sync flags
      drm/ast: Find VBIOS mode from regular display size
      drm/ast: Add empty initializer for VBIOS modes
      drm/ast: Add helpers for VBIOS mode lookup
      drm/ast: Validate DRM display modes against VBIOS modes
      drm/ast: Inline ast_get_vbios_mode_info()
      drm/ast: astdp: Rework display-mode setting
      drm/ast: astdp: Look up mode index from table
      drm/ast: Remove struct ast_vbios_mode_info
      drm/ast: Only look up VBIOS mode on full modesets
      drm/ast: astdp: Add connector state
      drm/ast: astdp: Inline mode-index calculation
      drm/ast: astdp: Store mode index in connector state
      drm/ast: astdp: Validate display modes

Timur Tabi (1):
      drm/nouveau: fix kernel-doc comments

Tomasz Rusinowicz (2):
      accel/ivpu: Enable recovery and adjust timeouts for fpga
      accel/ivpu: Allow to import single buffer into multiple contexts

Tomi Valkeinen (3):
      drm: xlnx: zynqmp_dpsub: Fix kernel doc
      MAINTAINERS: Update drm/rcar-du maintainers
      drm: xlnx: zynqmp: Fix max dma segment size

Tvrtko Ursulin (7):
      dma-fence: Add a single fence fast path for fence merging
      dma-fence: Add some more fence-merge-unwrap tests
      drm/sched: Delete unused update_job_credits
      drm/sched: Remove weak paused submission checks
      drm/sched: Add helper to check job dependencies
      drm/imagination: Use the drm_sched_job_has_dependency helper
      drm/scheduler: Remove some unused prototypes

Vignesh Raman (4):
      drm/ci: uprev IGT
      drm/ci: uprev mesa
      drm/ci: update gitlab rules
      drm/ci: update expectation files

Vivek Kasireddy (3):
      drm/virtio: Fix UAF in virtgpu_dma_buf_free_obj()
      drm/virtio: Lock the VGA resources during initialization
      drm/virtio: Don't return error if virtio-gpu PCI dev is not found

Wayne Lin (2):
      drm/dp_mst: Fix drm RAD print
      drm/dp_mst: Add helper to get port number at specific LCT from RAD

Youssef Samir (4):
      accel/qaic: Change aic100_image_table definition
      accel/qaic: Allocate an exact number of MSIs
      accel/qaic: Add support for MSI-X
      accel/qaic: Mask out SR-IOV PCI resources

Zhaoyu Liu (1):
      drm/ttm: use ttm_resource_unevictable() to replace pin_count and swapped

Zhi Wang (15):
      drm/nouveau: add a kernel doc to introduce the GSP RPC
      drm/nouveau: rename "repc" to "gsp_rpc_len" on the GSP message recv path
      drm/nouveau: rename "argv" to what it represents on the GSP message send path
      drm/nouveau: remove unused param repc in *rm_alloc_push()
      drm/nouveau: rename "argv" to what it represents in *rm_{alloc, ctrl}_*()
      drm/nouveau: rename "argc" to what it represents in GSP RPC routines
      drm/nouveau: fix the broken marco GSP_MSG_MAX_SIZE
      drm/nouveau: remove the magic number in r535_gsp_rpc_push()
      drm/nouveau: refine the variable names in r535_gsp_rpc_push()
      drm/nouveau: refine the variable names in r535_gsp_msg_recv()
      drm/nouveau: rename the variable "cmd" to "msg" in r535_gsp_cmdq_{get, push}()
      drm/nouveau: factor out r535_gsp_msgq_peek()
      drm/nouveau: factor out r535_gsp_msgq_recv_one_elem()
      drm/nouveau: support handling the return of large GSP message
      drm/nouveau: consume the return of large GSP message

 CREDITS                                            |   4 +
 .../bindings/display/panel/himax,hx83102.yaml      |   6 +
 .../devicetree/bindings/display/renesas,du.yaml    |  36 +-
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       |   3 +-
 .../bindings/display/rockchip/rockchip-vop2.yaml   |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/drivers.rst                      |   1 +
 Documentation/gpu/drm-usage-stats.rst              |   5 +-
 Documentation/gpu/nouveau.rst                      |  29 +
 Documentation/gpu/panthor.rst                      |  10 +
 MAINTAINERS                                        |  28 +-
 arch/arm/configs/multi_v7_defconfig                |   4 +-
 arch/parisc/configs/generic-32bit_defconfig        |   4 +-
 arch/parisc/configs/generic-64bit_defconfig        |   4 +-
 drivers/accel/amdxdna/aie2_ctx.c                   |  24 +-
 drivers/accel/amdxdna/aie2_error.c                 |   8 +-
 drivers/accel/amdxdna/aie2_message.c               |  10 +-
 drivers/accel/amdxdna/aie2_pci.h                   |  10 +-
 drivers/accel/amdxdna/aie2_smu.c                   |   2 +
 drivers/accel/amdxdna/amdxdna_mailbox.c            |   6 +-
 drivers/accel/amdxdna/amdxdna_mailbox.h            |   2 +-
 drivers/accel/amdxdna/amdxdna_mailbox_helper.c     |   6 +-
 drivers/accel/amdxdna/amdxdna_mailbox_helper.h     |   2 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |  89 +++
 drivers/accel/ivpu/ivpu_drv.c                      |  90 +--
 drivers/accel/ivpu/ivpu_drv.h                      |  14 +-
 drivers/accel/ivpu/ivpu_fw.c                       |   9 +-
 drivers/accel/ivpu/ivpu_gem.c                      |  43 ++
 drivers/accel/ivpu/ivpu_gem.h                      |   1 +
 drivers/accel/ivpu/ivpu_hw.c                       | 110 +--
 drivers/accel/ivpu/ivpu_hw.h                       |  14 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |  10 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |   1 +
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h          |   1 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |   4 +-
 drivers/accel/ivpu/ivpu_hw_reg_io.h                |  62 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |   7 +-
 drivers/accel/ivpu/ivpu_ipc.h                      |   2 +-
 drivers/accel/ivpu/ivpu_job.c                      | 522 +++++++++++----
 drivers/accel/ivpu/ivpu_job.h                      |   8 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |  29 +-
 drivers/accel/ivpu/ivpu_mmu.c                      | 121 +++-
 drivers/accel/ivpu/ivpu_mmu.h                      |   2 +
 drivers/accel/ivpu/ivpu_mmu_context.c              |  13 -
 drivers/accel/ivpu/ivpu_mmu_context.h              |   2 -
 drivers/accel/ivpu/ivpu_pm.c                       |  10 +-
 drivers/accel/ivpu/ivpu_pm.h                       |   2 +-
 drivers/accel/ivpu/ivpu_sysfs.c                    |  35 +-
 drivers/accel/qaic/mhi_controller.c                | 360 +++++++++-
 drivers/accel/qaic/mhi_controller.h                |   2 +-
 drivers/accel/qaic/qaic.h                          |  14 +-
 drivers/accel/qaic/qaic_drv.c                      |  97 ++-
 drivers/accel/qaic/qaic_timesync.c                 |   2 +-
 drivers/accel/qaic/sahara.c                        |  43 +-
 drivers/bus/mhi/host/boot.c                        | 203 ++++--
 drivers/bus/mhi/host/init.c                        |   2 +-
 drivers/bus/mhi/host/internal.h                    |   7 +
 drivers/dma-buf/dma-fence-unwrap.c                 |  11 +-
 drivers/dma-buf/st-dma-fence-unwrap.c              | 268 +++++++-
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   8 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.h           |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  12 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../drm/arm/display/komeda/komeda_wb_connector.c   |   2 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |   2 +-
 drivers/gpu/drm/ast/Makefile                       |   1 +
 drivers/gpu/drm/ast/ast_dp.c                       | 269 +++++---
 drivers/gpu/drm/ast/ast_drv.c                      |   8 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  32 +-
 drivers/gpu/drm/ast/ast_main.c                     | 215 ++++--
 drivers/gpu/drm/ast/ast_mode.c                     | 315 +++------
 drivers/gpu/drm/ast/ast_post.c                     |  51 +-
 drivers/gpu/drm/ast/ast_reg.h                      |  31 +-
 drivers/gpu/drm/ast/ast_tables.h                   | 187 +-----
 drivers/gpu/drm/ast/ast_vbios.c                    | 241 +++++++
 drivers/gpu/drm/ast/ast_vbios.h                    | 108 +++
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   5 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  16 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   7 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   7 -
 drivers/gpu/drm/bridge/microchip-lvds.c            |   3 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   1 -
 drivers/gpu/drm/bridge/parade-ps8622.c             |   1 -
 drivers/gpu/drm/bridge/parade-ps8640.c             |   1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   4 +-
 drivers/gpu/drm/bridge/tc358762.c                  |   2 +-
 drivers/gpu/drm/bridge/tc358775.c                  |   1 -
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   3 +-
 drivers/gpu/drm/ci/build.sh                        |   2 +-
 drivers/gpu/drm/ci/build.yml                       | 104 ++-
 drivers/gpu/drm/ci/container.yml                   |  22 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   | 197 +++---
 drivers/gpu/drm/ci/igt_runner.sh                   |  13 +-
 drivers/gpu/drm/ci/image-tags.yml                  |  11 +-
 drivers/gpu/drm/ci/lava-submit.sh                  | 100 ++-
 drivers/gpu/drm/ci/test.yml                        |  37 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   8 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |  21 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |   5 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |  20 +-
 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |  14 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |   1 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |   8 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |  22 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |   7 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |   1 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |  31 +-
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       | 298 +++++++++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt       |  18 +-
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt      |  15 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       | 112 ++++
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |  55 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |  13 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |  15 +-
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |   7 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   7 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |   7 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |   5 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |  12 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |   5 +
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   3 +
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   1 -
 .../msm-sc7180-trogdor-kingoftown-flakes.txt       |  14 +
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |   5 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   1 -
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |   5 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   2 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |   5 +
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt |   5 -
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |  26 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |  13 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |  56 ++
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |   5 +
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |   5 +
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |  10 +-
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      | 543 ++++++++++++++-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   2 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  58 ++
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  31 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |  44 +-
 drivers/gpu/drm/drm_buddy.c                        |  11 +-
 drivers/gpu/drm/drm_crtc.c                         |  20 +
 drivers/gpu/drm/drm_crtc_helper_internal.h         |   2 +-
 drivers/gpu/drm/drm_file.c                         |  26 +-
 drivers/gpu/drm/drm_managed.c                      |   8 +
 drivers/gpu/drm/drm_panic.c                        |   2 +-
 drivers/gpu/drm/drm_panic_qr.rs                    | 108 +--
 drivers/gpu/drm/drm_probe_helper.c                 |  35 +-
 drivers/gpu/drm/drm_writeback.c                    | 222 +++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |   2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |   2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |   2 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   2 +-
 drivers/gpu/drm/i2c/Kconfig                        |  18 -
 drivers/gpu/drm/i2c/Makefile                       |   6 -
 drivers/gpu/drm/i915/display/dvo_ch7017.c          |   2 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |   2 +-
 drivers/gpu/drm/i915/display/dvo_ivch.c            |   2 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |   2 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c          |   2 +-
 drivers/gpu/drm/i915/display/dvo_tfp410.c          |   2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   4 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   2 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |   2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   2 +-
 drivers/gpu/drm/imagination/pvr_job.c              |  12 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   2 +-
 drivers/gpu/drm/mgag200/Makefile                   |   1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   4 +
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   3 +
 drivers/gpu/drm/mgag200/mgag200_g200eh5.c          | 204 ++++++
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |   2 +-
 drivers/gpu/drm/nouveau/Kconfig                    |  18 +
 drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  17 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  32 +-
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
 .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 +-
 .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  35 +-
 .../dispnv04/nouveau_i2c_encoder.c}                |  95 +--
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  24 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   2 +-
 .../gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h |   4 +-
 .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h | 123 ++--
 .../gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h |   4 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |   8 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  12 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   2 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     | 734 ++++++++++++++-------
 drivers/gpu/drm/omapdrm/dss/dss.c                  |  14 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c           |  17 -
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h           |   1 -
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |  67 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  23 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c        | 380 +++++++++++
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |  91 +--
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |  59 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 174 +++--
 drivers/gpu/drm/panthor/panthor_device.c           |  22 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |  14 +
 drivers/gpu/drm/panthor/panthor_fw.c               |   1 -
 drivers/gpu/drm/panthor/panthor_gem.h              |   5 -
 drivers/gpu/drm/panthor/panthor_heap.c             |  26 +
 drivers/gpu/drm/panthor/panthor_heap.h             |   2 +
 drivers/gpu/drm/panthor/panthor_mmu.c              | 104 ++-
 drivers/gpu/drm/panthor/panthor_mmu.h              |   3 +
 drivers/gpu/drm/panthor/panthor_sched.c            |  61 +-
 drivers/gpu/drm/panthor/panthor_sched.h            |   3 +
 drivers/gpu/drm/qxl/qxl_display.c                  |   2 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |   2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |  10 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 234 +++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   4 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  36 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  42 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |   7 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   6 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hda.c                      |  12 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/tegra/dsi.c                        |   2 +-
 drivers/gpu/drm/tegra/hdmi.c                       |   2 +-
 drivers/gpu/drm/tegra/sor.c                        |   2 +-
 drivers/gpu/drm/tests/Makefile                     |   1 +
 drivers/gpu/drm/tests/drm_atomic_state_test.c      | 375 +++++++++++
 drivers/gpu/drm/tests/drm_buddy_test.c             |  30 +-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   3 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   3 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     | 183 ++---
 drivers/gpu/drm/ttm/ttm_resource.c                 |  50 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   1 -
 drivers/gpu/drm/v3d/v3d_sched.c                    |   2 -
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  33 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  27 -
 drivers/gpu/drm/vc4/vc4_gem.c                      | 183 ++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |   2 +-
 drivers/gpu/drm/vc4/vc4_validate.c                 |  11 -
 drivers/gpu/drm/virtio/virtgpu_display.c           |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |  41 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |  11 +
 drivers/gpu/drm/virtio/virtgpu_gem.c               |  14 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             |  96 +++
 drivers/gpu/drm/virtio/virtgpu_prime.c             |  36 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                | 154 +++++
 drivers/gpu/drm/virtio/virtgpu_vram.c              |   9 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |  35 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   9 -
 drivers/gpu/drm/vkms/vkms_drv.h                    |  11 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  32 +
 drivers/gpu/drm/vkms/vkms_output.c                 |  61 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   1 +
 drivers/gpu/drm/vkms/vkms_writeback.c              |  37 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c             |   4 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |   2 +
 include/drm/display/drm_dp.h                       |  14 +
 include/drm/display/drm_dp_helper.h                |   1 +
 include/drm/display/drm_dp_mst_helper.h            |   7 +
 include/drm/display/drm_hdmi_state_helper.h        |   2 +-
 include/drm/drm_atomic.h                           |  23 +-
 include/drm/drm_crtc.h                             |   2 +-
 include/drm/drm_file.h                             |   5 +
 include/drm/drm_managed.h                          |  12 +
 include/drm/drm_mode_object.h                      |   2 +-
 include/drm/drm_modeset_helper_vtables.h           |   4 +-
 include/drm/drm_panel.h                            |   1 -
 include/drm/drm_writeback.h                        |   6 +
 include/drm/gpu_scheduler.h                        |  20 +-
 include/drm/ttm/ttm_resource.h                     |  11 +-
 include/sound/hdmi-codec.h                         |   1 +
 include/uapi/drm/drm_fourcc.h                      |  41 ++
 include/uapi/drm/ivpu_accel.h                      |  84 +++
 include/uapi/drm/panthor_drm.h                     |  86 +--
 sound/soc/codecs/hdmi-codec.c                      |   4 +
 309 files changed, 7951 insertions(+), 3189 deletions(-)
 create mode 100644 Documentation/gpu/nouveau.rst
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.c
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.h
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild
 rename drivers/gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c (94%)
 rename drivers/gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c (98%)
 rename drivers/gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h (97%)
 rename drivers/gpu/drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c (92%)
 rename drivers/gpu/drm/{drm_encoder_slave.c => nouveau/dispnv04/nouveau_i2c_encoder.c} (54%)
 rename {include/drm => drivers/gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h (97%)
 rename include/drm/drm_encoder_slave.h => drivers/gpu/drm/nouveau/include/dispnv04/i2c/encoder_i2c.h (59%)
 rename {include/drm => drivers/gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h (96%)
 create mode 100644 drivers/gpu/drm/tests/drm_atomic_state_test.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
