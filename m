Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EF194CB03
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 09:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFCA10E080;
	Fri,  9 Aug 2024 07:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="x/AvmDJn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pUQyeNn8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x/AvmDJn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pUQyeNn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3E410E042;
 Fri,  9 Aug 2024 07:12:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A5D14219CB;
 Fri,  9 Aug 2024 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723187563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w071fiM7L3tuhJ1q6MDJ6CUnmo4/yjURXUym4vUqqM8=;
 b=x/AvmDJnU3VmORYeE6LsCjcR5T7egScbAUpauYCnXlwxn9xXUYEKuekK4OZCJQ79s025Kb
 WjsnUJ0tku+hGMsjP7wiFLIgYubXO5dDHNtkQhZpIntwxrk+kIEcAfGaWn6peur2sZg602
 shZmFgNG7FwvD5WNRXHSCRsSvnXvfXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723187563;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w071fiM7L3tuhJ1q6MDJ6CUnmo4/yjURXUym4vUqqM8=;
 b=pUQyeNn89vA8DDirHXTZgU9iRhn8vX70pGE8p89WulHQa6ZgX46d/4YUB7gbu4kiK19vSe
 bigYdSjgLfJYHGAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="x/AvmDJn";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pUQyeNn8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723187563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w071fiM7L3tuhJ1q6MDJ6CUnmo4/yjURXUym4vUqqM8=;
 b=x/AvmDJnU3VmORYeE6LsCjcR5T7egScbAUpauYCnXlwxn9xXUYEKuekK4OZCJQ79s025Kb
 WjsnUJ0tku+hGMsjP7wiFLIgYubXO5dDHNtkQhZpIntwxrk+kIEcAfGaWn6peur2sZg602
 shZmFgNG7FwvD5WNRXHSCRsSvnXvfXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723187563;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w071fiM7L3tuhJ1q6MDJ6CUnmo4/yjURXUym4vUqqM8=;
 b=pUQyeNn89vA8DDirHXTZgU9iRhn8vX70pGE8p89WulHQa6ZgX46d/4YUB7gbu4kiK19vSe
 bigYdSjgLfJYHGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3876713A7D;
 Fri,  9 Aug 2024 07:12:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yPN9DGvBtWb7DQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Aug 2024 07:12:43 +0000
Date: Fri, 9 Aug 2024 09:12:41 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <20240809071241.GA222501@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: A5D14219CB
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

here's a fairly small PR for drm-misc-next for this this week. The
controversial Power Saving Policy has been removed. Mgag200 finally
has good support for the BMC output. CI added some more drivers.

Best regards
Thomas

drm-misc-next-2024-08-09:
drm-misc-next for v6.12:

UAPI Changes:

- remove Power Saving Policy property

Core Changes:

- update connector documentation

CI:
- add tests for mediatek, meson, rockchip

Driver Changes:

amdgpu:
- revert support for Power Saving Policy property

bridge:
- lt9611uxc: require DRM_BRIDGE_ATTACH_NO_CONNECTOR

mgag200:
- transparently support BMC outputs

omapdrm:
- use common helper for_each_endpoint_of_node()

panel:
- panel-edp: fix name for HKC MB116AN01

vkms:
- clean up endianess warnings
The following changes since commit d97e71e449373efbd2403f1d7a32d416599f32ac:

  drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by default (2024-08-01 13:34:18 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-08-09

for you to fetch changes up to 219b45d023ed0902b05c5902a4f31c2c38bcf68c:

  drm/mgag200: Remove BMC output (2024-08-09 08:13:48 +0200)

----------------------------------------------------------------
drm-misc-next for v6.12:

UAPI Changes:

- remove Power Saving Policy property

Core Changes:

- update connector documentation

CI:
- add tests for mediatek, meson, rockchip

Driver Changes:

amdgpu:
- revert support for Power Saving Policy property

bridge:
- lt9611uxc: require DRM_BRIDGE_ATTACH_NO_CONNECTOR

mgag200:
- transparently support BMC outputs

omapdrm:
- use common helper for_each_endpoint_of_node()

panel:
- panel-edp: fix name for HKC MB116AN01

vkms:
- clean up endianess warnings

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/bridge: lt9611uxc: properly attach to a next bridge
      drm/bridge: lt9611uxc: drop support for !DRM_BRIDGE_ATTACH_NO_CONNECTOR

Hamza Mahfooz (2):
      Revert "drm: Introduce 'power saving policy' drm property"
      Revert "drm/amd: Add power_saving_policy drm property to eDP connectors"

José Expósito (2):
      drm/connector: Document destroy hook in drmm init functions
      drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings

Kuninori Morimoto (1):
      gpu: drm: use for_each_endpoint_of_node()

Terry Hsiao (1):
      drm/panel-edp: Fix HKC MB116AN01 name

Thomas Zimmermann (5):
      drm/mgag200: Add VGA-BMC output
      drm/mgag200: vga-bmc: Transparently handle BMC
      drm/mgag200: vga-bmc: Control CRTC VIDRST flag from encoder
      drm/mgag200: vga-bmc: Control BMC scanout from encoder
      drm/mgag200: Remove BMC output

Vignesh Raman (6):
      drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
      drm/ci: skip tools_test on non-intel platforms
      drm/ci: mediatek: add tests for mediatek display driver
      drm/ci: mediatek: add tests for powervr gpu driver
      drm/ci: meson: add tests for meson display driver
      drm/ci: rockchip: add tests for rockchip display driver

 MAINTAINERS                                        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   4 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  52 +------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 -
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         | 103 ++------------
 drivers/gpu/drm/ci/arm64.config                    |   1 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   3 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |  10 --
 drivers/gpu/drm/ci/test.yml                        | 123 ++++++++++++----
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   1 -
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |   1 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   1 -
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |   1 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |  28 +++-
 .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |  20 +++
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |   5 +-
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |  19 ++-
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt     |   5 +-
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   1 -
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt    |   1 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |   1 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |   1 +
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   1 -
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |   1 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   1 -
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |   1 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   1 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |   1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt  |   1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt  |  23 +++
 .../gpu/drm/ci/xfails/panfrost-mt8183-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-mt8183-skips.txt    |  23 +++
 .../gpu/drm/ci/xfails/panfrost-rk3288-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-skips.txt    |  26 ++++
 .../gpu/drm/ci/xfails/panfrost-rk3399-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt   |   6 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-skips.txt    |  26 ++++
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |  22 ++-
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |   6 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |  55 +-------
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |  90 +++++++++++-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |  50 ++++++-
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |   8 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |   1 -
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |   1 +
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |   1 -
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |   1 +
 drivers/gpu/drm/drm_connector.c                    |  52 +------
 drivers/gpu/drm/mgag200/Makefile                   |   1 +
 drivers/gpu/drm/mgag200/mgag200_bmc.c              | 102 --------------
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  13 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   9 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   9 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |   9 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   6 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   9 --
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c          | 156 +++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/base.c                 |   3 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   2 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  14 +-
 include/drm/drm_connector.h                        |   2 -
 include/drm/drm_mode_config.h                      |   5 -
 include/uapi/drm/drm_mode.h                        |   7 -
 66 files changed, 630 insertions(+), 521 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
