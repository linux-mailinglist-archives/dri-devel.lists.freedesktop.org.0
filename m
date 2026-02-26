Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIBfNBgGoGl/fQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:36:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B801A2A84
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8DC10E864;
	Thu, 26 Feb 2026 08:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MEzvUd2j";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SrXjmTMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9AE10E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772094995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Ohl1Ez7BeCQdSMgPkBEicSLs/08Ob1PpTVJeWELXJjM=;
 b=MEzvUd2jndyHVTsVnNgIUxjjxqPXBAiv+z1cmbfQBln2kYqE4WDFvESMumoBdJPfMDwrL4
 /mF8tYumj5/ZS23rgADJ075ZmmxnX9tNW+qaPx2yPdh5h+WxYqgWRIvPQKoQmROBAYt7cq
 bUD0y7e7dpT5t99V9bQ2K4xVk1Fkg8Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-U-Og1kSPM5yBLVPc3EoRAQ-1; Thu, 26 Feb 2026 03:36:33 -0500
X-MC-Unique: U-Og1kSPM5yBLVPc3EoRAQ-1
X-Mimecast-MFC-AGG-ID: U-Og1kSPM5yBLVPc3EoRAQ_1772094992
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48069a43217so1491655e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772094992; x=1772699792; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ohl1Ez7BeCQdSMgPkBEicSLs/08Ob1PpTVJeWELXJjM=;
 b=SrXjmTMCv1W8SXjWolM1UW3fDr+zZSifnZg17DzS5TL802XnDAbMWsz5hZqLM57eLF
 iyZmxso1JZ78tD4Orbh3ixrKB1ebwW35UriXcIqyqMAB2447pidfxOc9gr6Vh096wXkK
 Ey5N21IcIV2C4q6BIQ6cNuUQhqPasppPMT8nCtz1QJR4FTQLCmy00ZLv3RejBep68jci
 DIaLo2fEckY+ZvSgmvipE/guloEnMt6y5fjQJyx7BCor9Ag7cy0f7MgJpxmJWXG0HUKQ
 lT2lgSHIG8licou7oLrDzh2Agrb5chrv6lkl4/5Lfnt/1B5/+gCZlL0q9BHe5+PdHepm
 QGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772094992; x=1772699792;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ohl1Ez7BeCQdSMgPkBEicSLs/08Ob1PpTVJeWELXJjM=;
 b=R4U4h88e7qE5X63urTUiKtYLfdOhD5e/Vb1MXRlt1NxOq5sCAGkAdTAxzaAutRWfi+
 bc+Zp2R3ude7s9EEHhdNNy1EQv9qkDb7hlmAW7zwroB7rFcPUv+SYjjRx/K+u4BD5fGk
 skCOkjsPWy4As4L2h0I+7fXpsjCYyZORZk25B3eNfOiDLiK203O5HBldj191tOO9kGMf
 dBwF1sINg/1ue7iuG2zlbDEz2fSD3/Wsh+oBSSXJ1hHhDBoe6ZE/sKb5cLxq5QmP2yLj
 1vkbByMfBmX5piULjfkVpQzpGhfydhLeAkUU2cJ+yWpwEp2DeMlv0EJiCOe1ISi3W7CC
 qhCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCfBrwCjQJRxAaCRqPuiGTXEs9+peiJzC5J4ZRsz0GVarkj3aWmP3QRudNyJclFZ9KVxyuSzdStfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKoS9wCW0zIPmO0HpRSWtKNLIbEVO3KCc8GX3kLGlBN2bK6bfq
 gE7v/hBAaHioDCIOcKkjfeWMwbKcHTBTCdcQaOt6cAQhZAMUJpKQ5eA+jaopidonYHF5u2w1eT1
 1hr0Doat55XaWhvjjLnGBdZm+tP+IeKzVOQBU1vVk1UuNxhxXRIc3v30LWq2Oqm99u6jgiQ==
X-Gm-Gg: ATEYQzy/GWIUqiBObBe0MvVlkhl0NnUiXTalmTTaE7d6tFxVGjGTOZxT7U6J0oUyJmY
 a4m0UV1bLIDjSkMC52vfza0CsenmItuQ0vJUQeTN96uEcHjQrw626DAL2HHuGVxG2VdevZ3+wy/
 eWgbGwqrKq0zkaXU2pgMYXIMsze96qouf8FGeyLU5wI2Yd+GHa50e2rL3FmOHQQhDcb5fHvWZHI
 A0Jgnmk1hsOEfjOtIvvMT3ZC0LGQl6mNhBut8Hlm0UoFtUHddfOwjQiglLzwGVh/ElKJC4nuna/
 ETqq1tQaxTU1Y8Zl1+3BYthOzN5mPz84IgccgWKFCh2KC2Hy4DPAcZUfdI8fpSYIxWsJo9/D2zR
 hpoN5IsRFk1gq4V1c
X-Received: by 2002:a05:600c:4452:b0:483:5a29:9678 with SMTP id
 5b1f17b1804b1-483c21be3a5mr55276005e9.2.1772094991487; 
 Thu, 26 Feb 2026 00:36:31 -0800 (PST)
X-Received: by 2002:a05:600c:4452:b0:483:5a29:9678 with SMTP id
 5b1f17b1804b1-483c21be3a5mr55275345e9.2.1772094990875; 
 Thu, 26 Feb 2026 00:36:30 -0800 (PST)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750607sm129958415e9.10.2026.02.26.00.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:36:30 -0800 (PST)
Date: Thu, 26 Feb 2026 09:36:29 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20260226-heretic-stimulating-swine-6a2f27@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="h7jenyb2nigt3xo2"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:rodrigo.vivi@intel.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:ogabbay@kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:dim-tools@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 35B801A2A84
X-Rspamd-Action: no action


--h7jenyb2nigt3xo2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2026-02-26:
Several fixes for:
  - amdxdna: Fix for a deadlock, a NULL pointer dereference, a suspend
    failure, a hang, an out-of-bounds access, a buffer overflow, input
    sanitization and other minor fixes.
  - dw-dp: An error handling fix
  - ethosu: A binary shift overflow fix
  - imx: An error handling fix
  - logicvc: A dt node reference leak fix
  - nouveau: A WARN_ON removal
  - samsung-dsim: A memory leak fix
  - sharp-memory: A NULL pointer dereference fix
  - vmgfx: A reference count and error handling fix
The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-02-26

for you to fetch changes up to 75c151ceaacf5ca8f2f34ebf863d88002fb12587:

  accel/amdxdna: Use a different name for latest firmware (2026-02-25 13:51:31 -0800)

----------------------------------------------------------------
Several fixes for:
  - amdxdna: Fix for a deadlock, a NULL pointer dereference, a suspend
    failure, a hang, an out-of-bounds access, a buffer overflow, input
    sanitization and other minor fixes.
  - dw-dp: An error handling fix
  - ethosu: A binary shift overflow fix
  - imx: An error handling fix
  - logicvc: A dt node reference leak fix
  - nouveau: A WARN_ON removal
  - samsung-dsim: A memory leak fix
  - sharp-memory: A NULL pointer dereference fix
  - vmgfx: A reference count and error handling fix

----------------------------------------------------------------
Brad Spengler (1):
      drm/vmwgfx: Fix invalid kref_put callback in vmw_bo_dirty_release

Chen Ni (2):
      drm/imx: parallel-display: check return value of devm_drm_bridge_add() in imx_pd_probe()
      drm/bridge: synopsys: dw-dp: Check return value of devm_drm_bridge_add() in dw_dp_bind()

Dan Carpenter (1):
      accel: ethosu: Fix shift overflow in cmd_to_addr()

Dave Airlie (1):
      nouveau/gsp: drop WARN_ON in ACPI probes

Ethan Tidmore (1):
      drm/tiny: sharp-memory: fix pointer error dereference

Felix Gu (1):
      drm/logicvc: Fix device node reference leak in logicvc_drm_config_parse()

Franz Schnyder (1):
      drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is not used

Ian Forbes (2):
      drm/vmwgfx: Set a unique ID for each submitted command buffer
      drm/vmwgfx: Return the correct value in vmw_translate_ptr functions

Jonathan Cavitt (1):
      drm/client: Do not destroy NULL modes

Lizhi Hou (10):
      accel/amdxdna: Remove buffer size check when creating command BO
      accel/amdxdna: Switch to always use chained command
      accel/amdxdna: Fix crash when destroying a suspended hardware context
      accel/amdxdna: Fix dead lock for suspend and resume
      accel/amdxdna: Fix suspend failure after enabling turbo mode
      accel/amdxdna: Fix command hang on suspended hardware context
      accel/amdxdna: Fix out-of-bounds memset in command slot handling
      accel/amdxdna: Prevent ubuf size overflow
      accel/amdxdna: Validate command buffer payload count
      accel/amdxdna: Use a different name for latest firmware

Mario Limonciello (1):
      accel/amdxdna: Reduce log noise during process termination

Matthew Brost (1):
      drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Osama Abdelkader (1):
      drm/bridge: samsung-dsim: Fix memory leak in error path

Simon Ser (1):
      drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats

 drivers/accel/amdxdna/aie2_ctx.c                   | 32 ++++++++++-------
 drivers/accel/amdxdna/aie2_message.c               | 15 +++++---
 drivers/accel/amdxdna/aie2_pci.c                   | 40 ++++++++++++++++------
 drivers/accel/amdxdna/aie2_pm.c                    |  2 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                | 24 ++++++-------
 drivers/accel/amdxdna/amdxdna_gem.c                | 38 ++++++++++----------
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |  3 ++
 drivers/accel/amdxdna/amdxdna_pm.c                 |  2 ++
 drivers/accel/amdxdna/amdxdna_pm.h                 | 11 ++++++
 drivers/accel/amdxdna/amdxdna_ubuf.c               |  6 +++-
 drivers/accel/amdxdna/npu1_regs.c                  |  2 +-
 drivers/accel/amdxdna/npu4_regs.c                  |  2 +-
 drivers/accel/amdxdna/npu5_regs.c                  |  2 +-
 drivers/accel/amdxdna/npu6_regs.c                  |  2 +-
 drivers/accel/ethosu/ethosu_gem.c                  |  2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              | 23 ++++++++-----
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |  4 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  6 ++--
 drivers/gpu/drm/drm_client_modeset.c               |  3 +-
 drivers/gpu/drm/drm_gpusvm.c                       | 10 +++---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |  4 ++-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |  4 +--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 12 +++----
 drivers/gpu/drm/tiny/sharp-memory.c                |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |  4 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |  9 ++++-
 include/uapi/drm/drm_fourcc.h                      | 12 +++----
 28 files changed, 176 insertions(+), 106 deletions(-)

--h7jenyb2nigt3xo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaAGDQAKCRAnX84Zoj2+
drbsAYCEsDoqx/Gmbca8wv+gheQON5pIY63WyutXFjfIa0m3xv4JB84aD2h9Y4w7
HlQsiasBgIYLwdAk+Aje1uqb/27BfH6ygDtbX2vizqxqResf6lJANGndqEfT/zsh
Wn02s6t61g==
=aeey
-----END PGP SIGNATURE-----

--h7jenyb2nigt3xo2--

