Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B606A47973
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 10:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B333610EA6C;
	Thu, 27 Feb 2025 09:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mgDD5HEZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pAY5LEVV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MHgHZsx6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1T/xVoA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E8410E30E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:40:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AEB821F38A;
 Thu, 27 Feb 2025 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740649244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zz+7M5C4MZ7l0sk/jGurbKSwYvLoESq2dPdbOOhZZ2A=;
 b=mgDD5HEZNA0tQ9GpuqXK3iExE7uJLAm2Qwg5kY3U25qoHyksijMHmhNJOTLNlM1cprntlL
 Ztb4G+gyRMNHdFt3rfT93FP1kU+njVt7zyINNeEpATt7N9kWD4JHh2zA8f3nrw09Vzzfj2
 a5Lalkcu1xOlidIMGiCjIrl5R5204CA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740649244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zz+7M5C4MZ7l0sk/jGurbKSwYvLoESq2dPdbOOhZZ2A=;
 b=pAY5LEVVlqXAyFzlp4QfWOFe6tlZP6srKUvXTSB53Hk2SVdtqFQJlwkhHnXpicVmI2OIeG
 u5A7iSYmm7KiEgDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MHgHZsx6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1T/xVoA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740649243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zz+7M5C4MZ7l0sk/jGurbKSwYvLoESq2dPdbOOhZZ2A=;
 b=MHgHZsx6oIACueyauGqkFHdYlO+h6JQ6szQ7CxWXBly562yLN2G72XUY6wdkHGQYTZYrY3
 Z5UCQzm+8Zml4Uhin/rG9rrT74wKK6d4C/mT/f9gTQSof0/AAnyrO3kTsnoYzsFqmh5wti
 z/IrJMKqkYR9OIimxP1gTIlpXhya808=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740649243;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zz+7M5C4MZ7l0sk/jGurbKSwYvLoESq2dPdbOOhZZ2A=;
 b=1T/xVoA8ePD1V02RB1BJF4EZ/oljj0WJyhFHhn/DTUiV7oKB+XfkzfhoNkFGYFdarGYOLe
 qUUDisZhCM9SbfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40DE11376A;
 Thu, 27 Feb 2025 09:40:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fuj6DRszwGe6FwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Feb 2025 09:40:43 +0000
Date: Thu, 27 Feb 2025 10:40:41 +0100
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
Message-ID: <20250227094041.GA114623@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AEB821F38A
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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

this is the weekly PR for drm-misc-next. It's very quiet: a few more
panels supported, some refactoring.

Best regards
Thomas

drm-misc-next-2025-02-27:
drm-misc-next for v6.15:

Cross-subsystem Changes:

bus:
- mhi: Avoid access to uninitialized field

Core Changes:

- Fix docmentation

dp:
- Add helpers for LTTPR transparent mode

sched:
- Improve job peek/pop operations
- Optimize layout of struct drm_sched_job

Driver Changes:

arc:
- Convert to devm_platform_ioremap_resource()

aspeed:
- Convert to devm_platform_ioremap_resource()

bridge:
- ti-sn65dsi86: Support CONFIG_PWM tristate

i915:
- dp: Use helpers for LTTPR transparent mode

mediatek:
- Convert to devm_platform_ioremap_resource()

msm:
- dp: Use helpers for LTTPR transparent mode

nouveau:
- dp: Use helpers for LTTPR transparent mode

panel:
- raydium-rm67200: Add driver for Raydium RM67200
- simple: Add support for BOE AV123Z7M-N17, BOE AV123Z7M-N17
- sony-td4353-jdi: Use MIPI-DSI multi-func interface
- summit: Add driver for Apple Summit display panel
- visionox-rm692e5: Add driver for Visionox RM692E5

repaper:
- Fix integer overflows

stm:
- Convert to devm_platform_ioremap_resource()

vc4:
- Convert to devm_platform_ioremap_resource()
The following changes since commit fb51bf02551958265b7116f6ba92752295c83c26:

  Merge tag 'v6.14-rc4' into drm-next (2025-02-25 17:36:09 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-02-27

for you to fetch changes up to 7cb3274341bfa5977f3c90503b632986a82705fa:

  drm/panel: Add Visionox RM692E5 panel driver (2025-02-27 09:43:38 +0100)

----------------------------------------------------------------
drm-misc-next for v6.15:

Cross-subsystem Changes:

bus:
- mhi: Avoid access to uninitialized field

Core Changes:

- Fix docmentation

dp:
- Add helpers for LTTPR transparent mode

sched:
- Improve job peek/pop operations
- Optimize layout of struct drm_sched_job

Driver Changes:

arc:
- Convert to devm_platform_ioremap_resource()

aspeed:
- Convert to devm_platform_ioremap_resource()

bridge:
- ti-sn65dsi86: Support CONFIG_PWM tristate

i915:
- dp: Use helpers for LTTPR transparent mode

mediatek:
- Convert to devm_platform_ioremap_resource()

msm:
- dp: Use helpers for LTTPR transparent mode

nouveau:
- dp: Use helpers for LTTPR transparent mode

panel:
- raydium-rm67200: Add driver for Raydium RM67200
- simple: Add support for BOE AV123Z7M-N17, BOE AV123Z7M-N17
- sony-td4353-jdi: Use MIPI-DSI multi-func interface
- summit: Add driver for Apple Summit display panel
- visionox-rm692e5: Add driver for Visionox RM692E5

repaper:
- Fix integer overflows

stm:
- Convert to devm_platform_ioremap_resource()

vc4:
- Convert to devm_platform_ioremap_resource()

----------------------------------------------------------------
Abel Vesa (4):
      drm/dp: Add helper to set LTTPRs in transparent mode
      drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      drm/msm/dp: Add support for LTTPR handling

Alex Lanzano (1):
      MAINTAINERS: Update maintainer of repaper and mi0283qt

Anusha Srivatsa (5):
      drm/aspeed: move to devm_platform_ioremap_resource() usage
      drm/mediatek: move to devm_platform_ioremap_resource() usage
      drm/stm: move to devm_platform_ioremap_resource() usage
      drm/tiny: move to devm_platform_ioremap_resource() usage
      drm/vc4: move to devm_platform_ioremap_resource() usage

Danila Tikhonov (1):
      dt-bindings: display: panel: Add Visionox RM692E5

Eugene Lepshy (1):
      drm/panel: Add Visionox RM692E5 panel driver

Herve Codina (1):
      drm/atomic-helper: Add a note in drm_atomic_helper_reset_crtc() kernel-doc

Jeff Hugo (2):
      MAINTAINERS: Update my email address
      bus: mhi: host: Avoid possible uninitialized fw_load_type

John Keeping (1):
      drm/panel: ilitek-ili9882t: fix GPIO name in error message

Louis Chauvet (1):
      drm: writeback: Fix kernel doc name

Maud Spierings (4):
      dt-bindings: display: simple: add BOE AV101HDT-A10 panel
      dt-bindings: display: simple: Add BOE AV123Z7M-N17 panel
      drm/panel: simple: add BOE AV101HDT-A10 panel
      drm/panel: simple: Add BOE AV123Z7M-N17 panel

Maxime Ripard (1):
      drm/doc: Document KUnit expectations

Nikita Zhandarovich (1):
      drm/repaper: fix integer overflows in repeat functions

Sasha Finkelstein (1):
      drm: panel: Add a panel driver for the Summit display

Sebastian Reichel (2):
      dt-bindings: display: panel: Add Raydium RM67200
      drm/panel: add Raydium RM67200 panel driver

Tejas Vipin (1):
      drm/mipi-dsi: extend "multi" functions and use them in sony-td4353-jdi

Thomas Zimmermann (1):
      Merge drm/drm-next into drm-misc-next

Tvrtko Ursulin (6):
      drm/sched: Add internal job peek/pop API
      drm/amdgpu: Pop jobs from the queue more robustly
      drm/sched: Remove a hole from struct drm_sched_job
      drm/sched: Move drm_sched_entity_is_ready to internal header
      drm/sched: Move internal prototypes to internal header
      drm/sched: Group exported prototypes by object type

Uwe Kleine-König (1):
      drm/bridge: ti-sn65dsi86: Check for CONFIG_PWM using IS_REACHABLE()

 .mailmap                                           |   3 +-
 .../panel/panel-simple-lvds-dual-ports.yaml        |   2 +
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../bindings/display/panel/raydium,rm67200.yaml    |  72 +++
 .../bindings/display/panel/visionox,rm692e5.yaml   |  77 ++++
 Documentation/gpu/drm-internals.rst                |   7 +
 MAINTAINERS                                        |   8 +-
 drivers/bus/mhi/host/boot.c                        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  22 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   6 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  61 +++
 drivers/gpu/drm/drm_atomic_helper.c                |   4 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  42 +-
 drivers/gpu/drm/drm_writeback.c                    |   2 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  24 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   4 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   4 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  15 +
 drivers/gpu/drm/nouveau/nouveau_dp.c               |  17 +-
 drivers/gpu/drm/panel/Kconfig                      |  29 ++
 drivers/gpu/drm/panel/Makefile                     |   3 +
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |   2 +-
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      | 499 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  64 +++
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      | 107 +----
 drivers/gpu/drm/panel/panel-summit.c               | 132 ++++++
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c     | 442 ++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_entity.c           |  23 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |   2 +
 drivers/gpu/drm/scheduler/sched_internal.h         |  91 ++++
 drivers/gpu/drm/scheduler/sched_main.c             |   7 +-
 drivers/gpu/drm/stm/ltdc.c                         |   4 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |   4 +-
 drivers/gpu/drm/tiny/repaper.c                     |   4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  53 +--
 include/drm/display/drm_dp_helper.h                |   2 +
 include/drm/drm_mipi_dsi.h                         |   2 +-
 include/drm/gpu_scheduler.h                        | 124 +++--
 45 files changed, 1681 insertions(+), 315 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm67200.c
 create mode 100644 drivers/gpu/drm/panel/panel-summit.c
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm692e5.c
 create mode 100644 drivers/gpu/drm/scheduler/sched_internal.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
