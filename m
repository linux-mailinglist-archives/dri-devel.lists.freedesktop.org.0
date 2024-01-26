Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB1383D988
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 12:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B52210F9B7;
	Fri, 26 Jan 2024 11:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC6D10F9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 11:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706269444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ojog/GgB6QeEVgouu+JXqSacV8wR1Bfe5vGGDzfdD00=;
 b=f7H3Olp6VhZv1Qfugt+puaBkxGyWYMbFR9fkII6OwV1Au6YEZNunvbZ9xOZG6PbLqCUv+t
 o9cxWLD3yJFyxoKvJrjVXio5YU3oP//xtAJdmFgXudhPmb3G1IevbqLvm83Eg5GP+/W2zS
 zOE2y/YWqG8ysVI5kLwX67OgH+8agLk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-yBJC8LoGNsOnF37GXF35Jw-1; Fri, 26 Jan 2024 06:44:02 -0500
X-MC-Unique: yBJC8LoGNsOnF37GXF35Jw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33932e8b3e6so158303f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 03:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706269441; x=1706874241;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojog/GgB6QeEVgouu+JXqSacV8wR1Bfe5vGGDzfdD00=;
 b=kNQ3f/SrHA2+hWjMRDn3VDNZxivI0z7kwgkIpJIBd+AApkzy/X62mfxNYn2HzmZzZO
 ugprbWBfDpNWxgGp6PPk9/h8nLwmSWG+6j+uG2rr2ZkJDm3bMDhBEr841XwRoSBYQLjk
 UXzFqDADGqc4kSxbVCYGKVwVaowjuvjvJRDwFSu+oi4dSO62oYu23snP7UgpSOnq9iiM
 pYPeDWvi8La4rkGm4ZkbjEPBpyFISehusum6+8TJo0OM6bkuJqZrRLvMzzusjcQzkR5f
 n+yxp9hvdv7DRFezrNM3vLbxnS9MZJeU4AzLMZYY8Z/ZuawKW5JHdWBe9Y2SWB2rgdnx
 ZhAA==
X-Gm-Message-State: AOJu0YzVkCaIJJqbY1+vaNdc3tlVZvsu6axYCWlDGcX19ZJqNMUW89pX
 78fmMnW1O8gIb/eBhz5mI4+CqtNe5X52nZKDJ+/ttXUZ3ogvGpCJO13ZUQb2WN2uXxUQ/Nq1XTP
 Je7a9nq9SZC+CAZ7v4J8hL+xtE3uvxWD16i9LhGTrret7REMIrbo+Zx+YsX/xrQ5Png==
X-Received: by 2002:adf:f047:0:b0:339:367c:d996 with SMTP id
 t7-20020adff047000000b00339367cd996mr882320wro.93.1706269441511; 
 Fri, 26 Jan 2024 03:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX5Jv2bItiikoMDio+zyUI6FtwwRV6Ma3TtXvYMcjl98b9mn8zQZcMGcOUDLXCdEYd/jOuWA==
X-Received: by 2002:adf:f047:0:b0:339:367c:d996 with SMTP id
 t7-20020adff047000000b00339367cd996mr882304wro.93.1706269441051; 
 Fri, 26 Jan 2024 03:44:01 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 z5-20020adff745000000b003395642bc9bsm1079492wrp.117.2024.01.26.03.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 03:44:00 -0800 (PST)
Date: Fri, 26 Jan 2024 12:44:00 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <tp77e5fokigup6cgmpq6mtg46kzdw2dpze6smpnwfoml4kmwpq@bo6mbkezpkle>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4bagkb36gkokciv5"
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
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4bagkb36gkokciv5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Sima,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2024-01-26:
Plenty of ivpu fixes to improve the general stability and debugging, a
suspend fix for the anx7625 bridge, a revert to fix an initialization
order bug between i915 and simpledrm and a documentation warning fix for
dp_mst.
The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2024-01-26

for you to fetch changes up to 27d19268cf394f2c78db732be0cb31852eeadb0a:

  accel/ivpu: Improve recovery and reset support (2024-01-25 10:17:37 +0100)

----------------------------------------------------------------
Plenty of ivpu fixes to improve the general stability and debugging, a
suspend fix for the anx7625 bridge, a revert to fix an initialization
order bug between i915 and simpledrm and a documentation warning fix for
dp_mst.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/panel/raydium-rm692e5: select CONFIG_DRM_DISPLAY_DP_HELPER

Artur Weber (1):
      drm/panel: samsung-s6d7aa0: drop DRM_BUS_FLAG_DE_HIGH for lsl080al02

Bagas Sanjaya (1):
      drm/dp_mst: Separate @failing_port list in drm_dp_mst_atomic_check_mg=
r() comment

Douglas Anderson (2):
      drm/bridge: parade-ps8640: Wait for HPD when doing an AUX transfer
      drm/bridge: parade-ps8640: Make sure we drop the AUX mutex in the err=
or case

Hsin-Yi Wang (1):
      drm/bridge: anx7625: Ensure bridge is suspended in disable()

Jacek Lawrynowicz (8):
      accel/ivpu: Fix for missing lock around drm_gem_shmem_vmap()
      accel/ivpu: Free buffer sgt on unbind
      accel/ivpu: Disable buffer sharing among VPU contexts
      accel/ivpu: Improve buffer object debug logs
      accel/ivpu: Disable PLL after VPU IP reset during FLR
      accel/ivpu: Fix dev open/close races with unbind
      accel/ivpu: Improve stability of ivpu_submit_ioctl()
      accel/ivpu: Improve recovery and reset support

Markus Niebel (1):
      drm: panel-simple: add missing bus flags for Tianma tm070jvhg[30/33]

Maxime Ripard (1):
      Merge v6.8-rc1 into drm-misc-fixes

Micha=C5=82 Winiarski (1):
      drm/tests: mm: Call drm_mm_print in drm_test_mm_debug

Pin-yen Lin (1):
      drm/bridge: parade-ps8640: Ensure bridge is suspended in .post_disabl=
e()

Thomas Zimmermann (1):
      Revert "drivers/firmware: Move sysfb_init() from device_initcall to s=
ubsys_initcall_sync"

Tomi Valkeinen (2):
      drm/bridge: sii902x: Fix probing race issue
      drm/bridge: sii902x: Fix audio codec unregistration

Wachowski, Karol (5):
      accel/ivpu: Dump MMU events in case of VPU boot timeout
      accel/ivpu: Call diagnose failure in ivpu_mmu_cmdq_sync()
      accel/ivpu: Add debug prints for MMU map/unmap operations
      accel/ivpu: Add diagnostic messages when VPU fails to boot or suspend
      accel/ivpu: Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY param

Yangyu Chen (1):
      drm/ttm: allocate dummy_read_page without DMA32 on fail

 drivers/accel/ivpu/ivpu_debugfs.c             |  20 +++-
 drivers/accel/ivpu/ivpu_drv.c                 | 124 +++++++++++---------
 drivers/accel/ivpu/ivpu_drv.h                 |   5 +-
 drivers/accel/ivpu/ivpu_gem.c                 | 142 +++++++++--------------
 drivers/accel/ivpu/ivpu_gem.h                 |   3 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c             |  14 +--
 drivers/accel/ivpu/ivpu_hw_40xx.c             |  29 ++++-
 drivers/accel/ivpu/ivpu_ipc.c                 |   6 +-
 drivers/accel/ivpu/ivpu_job.c                 | 160 ++++++++++++----------=
----
 drivers/accel/ivpu/ivpu_job.h                 |   3 +-
 drivers/accel/ivpu/ivpu_mmu.c                 |  22 ++--
 drivers/accel/ivpu/ivpu_mmu.h                 |   1 +
 drivers/accel/ivpu/ivpu_mmu_context.c         |   9 ++
 drivers/accel/ivpu/ivpu_pm.c                  |  52 ++++++---
 drivers/accel/ivpu/ivpu_pm.h                  |   6 +-
 drivers/firmware/sysfb.c                      |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |   7 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h     |   2 +
 drivers/gpu/drm/bridge/parade-ps8640.c        |  23 ++++
 drivers/gpu/drm/bridge/sii902x.c              |  48 +++++---
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +
 drivers/gpu/drm/panel/Kconfig                 |   2 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c |   2 +-
 drivers/gpu/drm/panel/panel-simple.c          |   2 +
 drivers/gpu/drm/tests/drm_mm_test.c           |   5 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  12 +-
 include/uapi/drm/ivpu_accel.h                 |  25 +++-
 27 files changed, 413 insertions(+), 315 deletions(-)

--4bagkb36gkokciv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbOa/wAKCRDj7w1vZxhR
xYiGAQC1TWsKIasMAp4y47KRlvJ/tk5s/cS9vzLKsuoqNs331QEApR8OwBg6xD/U
Lp9ZArT14fHEY/v4aVHVKH2gO5ZJLws=
=QsQp
-----END PGP SIGNATURE-----

--4bagkb36gkokciv5--

