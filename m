Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMxkOJMEemlg1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97784A1680
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742A710E6B7;
	Wed, 28 Jan 2026 12:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O6iijq1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A7010E125;
 Wed, 28 Jan 2026 12:43:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B97844301;
 Wed, 28 Jan 2026 12:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B149C4CEF1;
 Wed, 28 Jan 2026 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604239;
 bh=21o7Sk1LvcwFGTtlndbPMNt9Skdhx9N7m/IPcsY4r4I=;
 h=From:Subject:Date:To:Cc:From;
 b=O6iijq1UXavDudl1Ma5LeKPtHarFTnU/sK32yJaRS7mIMrId2lF0cw1JHdrnfQHkj
 MRkIe6i4+u1fUkn1jg6nemXkpkFlAoV0/+vGwjf8AMLCYGU+3VVHL71uZmok3f9J6B
 czeoykWTutBy2D+kCQ2xJtF3B518S7HZaFgZCkLK3GGgCv5KFdcXSuf8UCqU3OSDdi
 SfRO79j+EYDNT48nW4wYBwRvxVT1631IxTFcShVnBAdSaL70QbLmIt5cLFWKYlRNNh
 G4pDbEuS9P+6gOxEBp2mJhQh7U6X7L0sZF4qTecGT+MiUNUJNQ/tIEC0Pouyt1OJKP
 6v7l7JqjMEZRg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v4 00/15] drm/atomic: Allocate drm_private_state through a
 callback
Date: Wed, 28 Jan 2026 13:43:44 +0100
Message-Id: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XN0WoCMRCF4VeRXDeSSTbrbq98j+LFrDm60bqRy
 RJaZN+9USgUinj5H5hvbipDIrJ6X92UoMQc01SjeVup/cjTETqG2soa68mYTge56KvEwjN0Gk5
 akDFrBsFuGjJ2w6reXgWH+PVwP3a1x5jnJN+PN4Xu6yuxkDa6M56HxjFaz9szZMLnOslR3cli/
 zDUPGNsZdoQWoO+8+jDP8b9Mq0h6p8xrjJD74gHOPZwW0EYeV7v00XtlmX5AZ8rZlVJAQAA
X-Change-ID: 20251008-drm-private-obj-reset-ae1e2741027a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 kernel-list@raspberrypi.com, Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4027; i=mripard@redhat.com;
 h=from:subject:message-id; bh=21o7Sk1LvcwFGTtlndbPMNt9Skdhx9N7m/IPcsY4r4I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLK32mTpTgmL9V12Jc+9d9CrJKaYuRyXpl7e10lSJE
 i/hnzs6prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwES+RDI2rDN7Ucwd3Tf/fPAM
 zh2dbQa+2ts3sD70ZWUI+8kUcjZAqfP71hsTuQ9k9i6JL3fbGD6bseGH6oeZExYrTXgkLn7rg/G
 Sv/a8xl9r/yuxMzFxX/f/sKLswid+111tjU1N/zflPfnPtxIA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,linux.intel.com,oss.qualcomm.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,amd.com,igalia.com,arm.com,crapouillou.net,vger.kernel.org,linux.dev,poorly.run,somainline.org,nvidia.com,raspberrypi.com];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 97784A1680
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
Maxime Ripard (15):
      drm/atomic: Make drm_atomic_private_obj_init fallible
      drm/atomic: Add new atomic_create_state callback to drm_private_obj
      drm/atomic-helper: Add private_obj atomic_create_state helper
      drm/bridge: Switch private_obj initialization to atomic_create_state
      drm/dp_mst: Switch private_obj initialization to atomic_create_state
      drm/dp_tunnel: Switch private_obj initialization to atomic_create_state
      drm/amdgpu: Switch private_obj initialization to atomic_create_state
      drm/arm: komeda: Switch private_obj initialization to atomic_create_state
      drm/ingenic: Switch private_obj initialization to atomic_create_state
      drm/msm: mdp5: Switch private_obj initialization to atomic_create_state
      drm/msm: dpu1: Switch private_obj initialization to atomic_create_state
      drm/omapdrm: Switch private_obj initialization to atomic_create_state
      drm/tegra: Switch private_obj initialization to atomic_create_state
      drm/vc4: Switch private_obj initialization to atomic_create_state
      drm/atomic: Remove state argument to drm_atomic_private_obj_init

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  51 ++---
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   2 +
 .../drm/arm/display/komeda/komeda_private_obj.c    | 208 ++++++++++++++-------
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  36 ++--
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  25 ++-
 drivers/gpu/drm/drm_atomic.c                       |  22 ++-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  23 +++
 drivers/gpu/drm/drm_bridge.c                       |  30 +--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  28 +--
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  28 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  41 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  40 ++--
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  22 ++-
 drivers/gpu/drm/tegra/hub.c                        |  22 ++-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  67 ++++---
 include/drm/drm_atomic.h                           |  20 +-
 include/drm/drm_atomic_state_helper.h              |   3 +
 17 files changed, 436 insertions(+), 232 deletions(-)
---
base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
change-id: 20251008-drm-private-obj-reset-ae1e2741027a

Best regards,
-- 
Maxime Ripard <mripard@redhat.com>

