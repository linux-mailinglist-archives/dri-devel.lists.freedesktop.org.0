Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Io8HYPNnWnfSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:10:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99E18992D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68B010E5CE;
	Tue, 24 Feb 2026 16:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uTB1im2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CFC10E5D0;
 Tue, 24 Feb 2026 16:10:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65FDB61118;
 Tue, 24 Feb 2026 16:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C47FC116D0;
 Tue, 24 Feb 2026 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771949438;
 bh=T0YWfymtQNrEs5hzUd88lUy+/hAsWJqHQKQFm7O92Hk=;
 h=From:Subject:Date:To:Cc:From;
 b=uTB1im2V9ydk0nAKQ2NkEDLDwJgN/sce2uY+KOIsYFlUnxBoUKJLKqIfL1Zpcvk3a
 R/UcyVTIIwVNw/aKgIMXLAUI3M1gtk4rdCr5Ndd0xyj0AsOuZV+dnFZ1ClI3XM3Me6
 L9TsxkgHnQ0yAzjicfdg4qMqL2lrtX5k+TTRg1E7WxeYTH8oT1j4phRUQuvYkZqcIl
 YXLD+N8PNE8M013osfW38PsoY2BT8y52xvk5E8qoUJWYr5/N63BqemqivtcEH2zTDN
 w6gPv44Zjnsd50tdhBaEFOX1M2n/krWWKaoXXDcSokMyYWusIuN4mAQLroevNF1/Ms
 Q/a0jNuOIgjqg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v5 0/4] drm/atomic: Allocate drm_private_state through a
 callback
Date: Tue, 24 Feb 2026 17:10:25 +0100
Message-Id: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XPzWoCMRDA8VeRnBuZfK0bT75H6WFiRjdt3chkC
 YrsuzdaCpay9PgfmN8wN1GIExWxXd0EU00l5bGFe1mJ/YDjkWSKrYUG7RRALyOf5JlTxYlkDu+
 SqdAkkRTpjVWgNyja7pnpkC4P9/Wt9ZDKlPn6OFPVffqfWJUE2YPDYA1S53D3QTzS5zrzUdzJq
 p8YZZcY3Zguxg7I9458/MOYH6YDpfwSYxoTvFEYyKAjs2OKA07rfT59M/aJ0YtP2cZ46L06oIk
 mwC9mnucvuvl8LJABAAA=
X-Change-ID: 20251008-drm-private-obj-reset-ae1e2741027a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3150; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T0YWfymtQNrEs5hzUd88lUy+/hAsWJqHQKQFm7O92Hk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzz1YKZUacTc/dqc6Ys/3mK/GX/umPzza7ntbhrOcTX
 DmvzT6/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkK4Kx4eL/u7nd68/KLpZL
 0uszcA3/HaCUfV/GXI+Bv/zWnbyL2QGSPeejd8fHRrVunnhrQ5ILY8OpTjah2Ufq9e+v6ryhWrT
 qq584p4DWylkHOqeVvej0tb4UoPT6gc7DBe8FJy9Xqa/RPwQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,amd.com,igalia.com,ideasonboard.com,gmail.com,nvidia.com,vger.kernel.org,oss.qualcomm.com,arm.com,intel.com,linaro.org,crapouillou.net,raspberrypi.com,kwiboo.se,linux.dev,poorly.run,somainline.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0C99E18992D
X-Rspamd-Action: no action

Hi,

This series started from my work on the hardware state readout[1], and
was suggested by Dmitry[2].

This series deal with the fact that drm_private_obj (and thus bridges)
are not initialized using the same pattern than any other object. This
series solves that inconsistency by aligning it to what we're doing for
all the other objects.

This was tested on a TI SK-AM62, with three bridges.

Let me know what you think,
Maxime

1: https://lore.kernel.org/dri-devel/20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org/
2: https://lore.kernel.org/dri-devel/zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x/

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v5:
- Rebase to drm-misc-next
- Link to v4: https://lore.kernel.org/r/20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com

Changes in v4:
- Fix a circular dependencies between modules by calling
  __drm_atomic_helper_private_obj_create_state from
  __drm_atomic_helper_bridge_reset instead of
  drm_bridge_atomic_create_priv_state()
- Link to v3: https://lore.kernel.org/r/20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com

Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org

Changes in v2:
- Switch to a new hook instead of reset since some drm_private_objs want
  to persist across suspends
- Drop the call to drm_private_obj_funcs.reset in
  drm_mode_config_reset()
- Link to v1: https://lore.kernel.org/r/20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org

---
Maxime Ripard (4):
      drm/amdgpu: Switch private_obj initialization to atomic_create_state
      drm/omapdrm: Switch private_obj initialization to atomic_create_state
      drm/tegra: Switch private_obj initialization to atomic_create_state
      drm/atomic: Remove state argument to drm_atomic_private_obj_init

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 51 ++++++++++++----------
 .../drm/arm/display/komeda/komeda_private_obj.c    | 16 +++----
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  1 -
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  2 +-
 drivers/gpu/drm/drm_atomic.c                       | 22 +++-------
 drivers/gpu/drm/drm_bridge.c                       |  1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  1 -
 drivers/gpu/drm/omapdrm/omap_drv.c                 | 22 +++++++---
 drivers/gpu/drm/tegra/hub.c                        | 22 +++++++---
 drivers/gpu/drm/vc4/vc4_kms.c                      |  4 +-
 include/drm/drm_atomic.h                           |  1 -
 14 files changed, 76 insertions(+), 72 deletions(-)
---
base-commit: 196b2b95fec447c2c4460f753b277d840633fbef
change-id: 20251008-drm-private-obj-reset-ae1e2741027a

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

