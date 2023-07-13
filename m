Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061BB751B60
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0210E023;
	Thu, 13 Jul 2023 08:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D5210E023
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689236276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=rl/uagV4whhYbT4iZd2vwBuRZ5VqINPxAE7CInS7aQE=;
 b=h7jNFtkw+MJ/zsiQTklWelmQz/UcynQseglI+pl364RPWxV4qxwblaYNznVIufwlsLB9wT
 alQ3MFyaPJxBtlPDIIokVyppNbM2/f684b6qcNGmnn8bKYl0NxxdvNN0xbL+NM90M7QWtv
 Vf4hVrZee7Aekm8pNpBCtM1E8UG9H+4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-4ccvrZpUO4yloDgS_lNypA-1; Thu, 13 Jul 2023 04:17:54 -0400
X-MC-Unique: 4ccvrZpUO4yloDgS_lNypA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-63511adcf45so5125576d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 01:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689236274; x=1691828274;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rl/uagV4whhYbT4iZd2vwBuRZ5VqINPxAE7CInS7aQE=;
 b=YfRE98eO8v+w7Z8IurtK0zBmVAmQWAp+IsJjQRja8j2d5Tc3f2cygQWC+Q/SSvsdU5
 iz71KPCelax/DNW1Yn7ecBGMS1GANx/PkiT0/dBaQdq/lY/Tg9rlbmDpqUOvKliNhOPk
 8ny9Q2kSjggGhOlq1icFqI49+v22iIAka0PfKOkFmLjQd1CnTRMrRi+5v/c5Q55oQ1g8
 WdgQ6q+QjQPuzXuLLC7XfbBbYu5W9AwBKPYFDIAIY68UlrvoYqRzrLIqlxhxYno0Kiak
 CuSNgg0LsdPb0SmncoHCrSztcHzJlOHyz3gWIoQHWe5n/g+HNbL2+ZaX/7iTEqBv/coh
 5Sow==
X-Gm-Message-State: ABy/qLZXmQYdmmeVUl6RTZW+evGBYfJTcnP19NaOwTi2Kw0GwyCpDTyT
 d3+h7quSkWw/F1UValGh0+uynYVRxJ1RycbGwB3igQrrcfrN+NcWKxvXsCpGWzFF01tZFmzU5iP
 nepm2KhDtv2AAipfhCtG2RW6qOdvi
X-Received: by 2002:a0c:f501:0:b0:635:dd30:8181 with SMTP id
 j1-20020a0cf501000000b00635dd308181mr952475qvm.56.1689236274429; 
 Thu, 13 Jul 2023 01:17:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHH2p39j0wFtvsSB9zi2aRUzFSFtVm1NLwrpq73ze+7mX70VxxYNo1zLHGV+vQsUoopgNz6UQ==
X-Received: by 2002:a0c:f501:0:b0:635:dd30:8181 with SMTP id
 j1-20020a0cf501000000b00635dd308181mr952459qvm.56.1689236274140; 
 Thu, 13 Jul 2023 01:17:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a0ce4d0000000b00636064e3d2bsm2834609qvm.106.2023.07.13.01.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 01:17:53 -0700 (PDT)
Date: Thu, 13 Jul 2023 10:17:52 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PULL] drm-misc-fixes
Message-ID: <nq3ke75juephbex5acfyi5t6bxv22nhmfcpfhru55haj2nv3us@gehrlmjbqgjk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bnp3giwzvbzynl3k"
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
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bnp3giwzvbzynl3k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sending again because I had to send it by hand and forgot to add all the
recipients in Cc.

Here's this week drm-misc-fixes PR, plus last week as well that got
dropped for some reason.

Thanks!
Maxime

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/drm/drm-misc tags/drm-misc-fixes-2023-07-13

for you to fetch changes up to 835a65f51790e1f72b1ab106ec89db9ac15b47d6:

  drm/nouveau: bring back blit subchannel for pre nv50 GPUs (2023-07-12 22:=
38:41 +0200)

----------------------------------------------------------------
A couple of nouveau patches addressing improving HDMI support and
firmware handling, a fix for TTM to skip pinned BO when evicting, and a
fix for the fbdev documentation.

----------------------------------------------------------------
Adri=E1n Larumbe (1):
      drm: bridge: dw_hdmi: fix connector access for scdc

Boris Brezillon (2):
      drm/sched: Make sure we wait for all dependencies in kill_jobs_cb()
      drm/sched: Call drm_sched_fence_set_parent() from drm_sched_fence_sch=
eduled()

Christian K=F6nig (3):
      drm/ttm: fix warning that we shouldn't mix && and ||
      dma-buf: keep the signaling time of merged fences v3
      drm/ttm: never consider pinned BOs for eviction&swap

Dan Carpenter (1):
      dma-buf: fix an error pointer vs NULL bug

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime

Fabio Estevam (1):
      drm/panel: simple: Add connector_type for innolux_at043tn24

Geert Uytterhoeven (1):
      drm/fbdev-dma: Fix documented default preferred_bpp value

Karol Herbst (4):
      drm/nouveau/disp: fix HDMI on gt215+
      drm/nouveau/disp/g94: enable HDMI
      drm/nouveau/acr: Abort loading ACR if no firmware was found
      drm/nouveau: bring back blit subchannel for pre nv50 GPUs

Karol Wachowski (2):
      accel/ivpu: Fix VPU register access in irq disable
      accel/ivpu: Clear specific interrupt status bits on C0

Lyude Paul (1):
      drm/nouveau/kms/nv50-: Fix drm_dp_remove_payload() invocation

Marek Vasut (1):
      drm/panel: simple: Add Powertip PH800480T013 drm_display_mode flags

Maxime Ripard (1):
      Merge v6.5-rc1 into drm-misc-fixes

Thomas Hellstr=F6m (2):
      drm/ttm: Don't leak a resource on eviction error
      drm/ttm: Don't leak a resource on swapout move error

Thomas Zimmermann (1):
      drm/client: Send hotplug event after registering a client

Yunxiang Li (1):
      drm/ttm: fix bulk_move corruption when adding a entry

 drivers/accel/ivpu/ivpu_drv.h                    |  1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c                 | 20 ++++++++----
 drivers/dma-buf/dma-fence-unwrap.c               | 26 ++++++++++++---
 drivers/dma-buf/dma-fence.c                      |  7 ++--
 drivers/gpu/drm/armada/armada_fbdev.c            |  4 ---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c        |  9 +++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c            | 35 ++++++++++++--------
 drivers/gpu/drm/drm_client.c                     | 21 ++++++++++++
 drivers/gpu/drm/drm_fbdev_dma.c                  |  6 +---
 drivers/gpu/drm/drm_fbdev_generic.c              |  4 ---
 drivers/gpu/drm/drm_syncobj.c                    |  6 ++--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c        |  4 ---
 drivers/gpu/drm/gma500/fbdev.c                   |  4 ---
 drivers/gpu/drm/msm/msm_fbdev.c                  |  4 ---
 drivers/gpu/drm/nouveau/dispnv50/disp.c          |  8 +++--
 drivers/gpu/drm/nouveau/nouveau_chan.c           |  1 +
 drivers/gpu/drm/nouveau/nouveau_chan.h           |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c            | 20 ++++++++++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c   |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c   |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c             |  4 ---
 drivers/gpu/drm/panel/panel-simple.c             |  2 ++
 drivers/gpu/drm/radeon/radeon_fbdev.c            |  4 ---
 drivers/gpu/drm/scheduler/sched_entity.c         | 41 +++++++++++++++++++-=
----
 drivers/gpu/drm/scheduler/sched_fence.c          | 40 ++++++++++++++------=
---
 drivers/gpu/drm/scheduler/sched_main.c           |  3 +-
 drivers/gpu/drm/tegra/fbdev.c                    |  4 ---
 drivers/gpu/drm/ttm/ttm_bo.c                     | 29 ++++++++++-------
 drivers/gpu/drm/ttm/ttm_resource.c               |  5 ++-
 include/drm/gpu_scheduler.h                      |  5 ++-
 include/linux/dma-fence.h                        |  2 +-
 32 files changed, 206 insertions(+), 119 deletions(-)

--bnp3giwzvbzynl3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZK+zMAAKCRDj7w1vZxhR
xZ9jAP4pvnS+rNN58KkJ7QTkarg753rDDKt3O8mxCuzzfRC+dgD8CZjs7xrv2Wbv
JyThW4ytIiFYrbBcB66ALRrwEdax3wo=
=2xZQ
-----END PGP SIGNATURE-----

--bnp3giwzvbzynl3k--

