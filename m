Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B396DB99
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CCD10E8D0;
	Thu,  5 Sep 2024 14:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IIsi0f8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DB410E8C9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725545969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=2Gi0RGtaEPC+XFQvdDhNwBUax6aPftdX7/tX6dIH77s=;
 b=IIsi0f8fN4WHdbj7wzi5ALJ+W8xsKCxNYZY2NUiFw8XZ5Z1Af1MiWLYzQ+hvxjp03DyZWE
 Vif5QeHrhQKb7EkrLKobEs5c1c/xuI3L9gtkBQbKb2On2vK/l0shOpGz5dlE7OpP09wZGx
 Rlb++SPcsDNIjSLdy2GtgKqsAct0GOY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-dJ0RK71jMm2A-U4GgJO6Rw-1; Thu, 05 Sep 2024 10:19:28 -0400
X-MC-Unique: dJ0RK71jMm2A-U4GgJO6Rw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374b35856aeso567450f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 07:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725545967; x=1726150767;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Gi0RGtaEPC+XFQvdDhNwBUax6aPftdX7/tX6dIH77s=;
 b=J1dt1Nf/sy8LYSuY6KITz/9eLx04gx+/AdzGeLB2I9O22/QBXI8SHghco/kXubnbYr
 qpnLX2/fJ2Ldz8DOr+QFzs4RcUYHPKV5H9EQc1SrdhgZasnfUmBBD2wXcWEsK64qmxQA
 PIaRfExggMQqBjcR9hPXXEhX0NIteiWR3hbmmlo1BzUiiscn9uxyuJ4zS/rblYzzytyh
 x7BizEouuEUSfnONirmZjz4+FcTU4G+UkgpcLWN2fGY7XouW8O6foOaO1hP9KbQ7nluM
 iNxEJqvqeyrrxPMRAXrjx1wxxSA7rE/6yZeMhgxj7jbkRSgIjCydFbj6KpcPgo6OxC2p
 QHew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbihRzrofOQvyQKkBpkfJ+AtP6Vczmi9WbiehmefCvlqmvz7kpRkxSV2YD4bkit0RFWFY6KNkji3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqBaxDLJ4bLlJ9VNbYeAGnbbUnF+hsnJpvJvAm+0If3YUi2qKX
 nf+dZNoMwI8CEPB3jb1+mCg7DKoKJtUwkDljSu3wOxCJheaQh5ukI+ZR1k6NH7k923BL4CGIy6G
 SN9ABfRCpElOuu1BwqtTR4NtS8kYBIGs44aPYvh1BfMnHuvqj9mT/QaVIlOxv/ID9Aw==
X-Received: by 2002:a05:6000:dcb:b0:374:c1bd:f7c0 with SMTP id
 ffacd0b85a97d-374ecc8f4a4mr7801193f8f.22.1725545966965; 
 Thu, 05 Sep 2024 07:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF30d04IlQlOIOSlvdd5J/Fxnec/qeJplk+pFN2xTGLKMJOzWGfKFGulgcuPGDj488UG7EcAg==
X-Received: by 2002:a05:6000:dcb:b0:374:c1bd:f7c0 with SMTP id
 ffacd0b85a97d-374ecc8f4a4mr7801158f8f.22.1725545966414; 
 Thu, 05 Sep 2024 07:19:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cef1e179sm9515054f8f.46.2024.09.05.07.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:19:26 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:19:25 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20240905-original-radical-guan-e7a2ae@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="owhljulxk7urdqng"
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


--owhljulxk7urdqng
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2024-09-05:
A zpos normalization fix for komeda, a register bitmask fix for nouveau,
a memory leak fix for imagination, three fixes for the recent bridge
HDMI work, a potential DoS fix and a cache coherency for panthor, a
change of panel compatible and a deferred-io fix when used with
non-highmem memory.
The following changes since commit 9d824c7fce58f59982228aa85b0376b113cdfa35:

  drm/v3d: Disable preemption while updating GPU stats (2024-08-28 11:36:53=
 -0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-20=
24-09-05

for you to fetch changes up to 5a498d4d06d6d9bad76d8a50a7f8fe01670ad46f:

  drm/fbdev-dma: Only install deferred I/O if necessary (2024-09-05 11:05:1=
0 +0200)

----------------------------------------------------------------
A zpos normalization fix for komeda, a register bitmask fix for nouveau,
a memory leak fix for imagination, three fixes for the recent bridge
HDMI work, a potential DoS fix and a cache coherency for panthor, a
change of panel compatible and a deferred-io fix when used with
non-highmem memory.

----------------------------------------------------------------
Adri=E1n Larumbe (1):
      drm/panthor: flush FW AS caches in slow reset path

Dave Airlie (1):
      nouveau: fix the fwsec sb verification register.

Dmitry Baryshkov (3):
      drm/display: stop depending on DRM_DISPLAY_HELPER
      drm/bridge-connector: move to DRM_DISPLAY_HELPER module
      drm/bridge-connector: reset the HDMI connector state

Mary Guillemard (1):
      drm/panthor: Restrict high priorities on group_create

Matt Coster (1):
      drm/imagination: Free pvr_vm_gpuva after unlink

Ryan Walklin (2):
      dt-bindings: display: panel: Rename WL-355608-A8 panel to rg35xx-*-pa=
nel
      drm: panel: nv3052c: Correct WL-355608-A8 panel compatible

Thomas Zimmermann (1):
      drm/fbdev-dma: Only install deferred I/O if necessary

hongchi.peng (1):
      drm: komeda: Fix an issue related to normalized zpos

 ...608-a8.yaml =3D> anbernic,rg35xx-plus-panel.yaml} | 15 ++--
 MAINTAINERS                                        |  2 +-
 drivers/gpu/drm/Makefile                           |  1 -
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    | 10 ++-
 drivers/gpu/drm/bridge/Kconfig                     |  1 +
 drivers/gpu/drm/display/Kconfig                    | 24 ++++---
 drivers/gpu/drm/display/Makefile                   |  2 +
 .../gpu/drm/{ =3D> display}/drm_bridge_connector.c   | 13 +++-
 drivers/gpu/drm/drm_fbdev_dma.c                    | 83 +++++++++++++++++-=
----
 drivers/gpu/drm/imagination/pvr_vm.c               |  4 ++
 drivers/gpu/drm/imx/dcss/Kconfig                   |  2 +
 drivers/gpu/drm/imx/lcdc/Kconfig                   |  2 +
 drivers/gpu/drm/ingenic/Kconfig                    |  2 +
 drivers/gpu/drm/kmb/Kconfig                        |  2 +
 drivers/gpu/drm/mediatek/Kconfig                   |  2 +
 drivers/gpu/drm/meson/Kconfig                      |  2 +
 drivers/gpu/drm/msm/Kconfig                        |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c    |  2 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |  2 +
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |  2 +-
 drivers/gpu/drm/panthor/panthor_drv.c              | 23 ++++++
 drivers/gpu/drm/panthor/panthor_fw.c               |  8 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c              | 21 +++++-
 drivers/gpu/drm/panthor/panthor_mmu.h              |  1 +
 drivers/gpu/drm/panthor/panthor_sched.c            |  2 +-
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |  2 +
 drivers/gpu/drm/renesas/rz-du/Kconfig              |  2 +
 drivers/gpu/drm/renesas/shmobile/Kconfig           |  2 +
 drivers/gpu/drm/rockchip/Kconfig                   |  4 ++
 drivers/gpu/drm/tegra/Kconfig                      |  1 +
 drivers/gpu/drm/tidss/Kconfig                      |  2 +
 drivers/gpu/drm/xlnx/Kconfig                       |  1 +
 include/uapi/drm/panthor_drm.h                     |  6 +-
 33 files changed, 202 insertions(+), 47 deletions(-)
 rename Documentation/devicetree/bindings/display/panel/{wl-355608-a8.yaml =
=3D> anbernic,rg35xx-plus-panel.yaml} (67%)
 rename drivers/gpu/drm/{ =3D> display}/drm_bridge_connector.c (97%)

--owhljulxk7urdqng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtm97QAKCRAnX84Zoj2+
die5AYDOXAF4W817j1k+zI/Ft1eHHGc6q3N7XE404uloFt6pTmGRGWGfmbVcQh8k
8H2y7q4BfiSKY91AOan6+BaBmk5LpkvkOrhVEZuXWkuOL4ia3k4wK0+DDPVdsPbd
pzTW8RtIyA==
=h6TI
-----END PGP SIGNATURE-----

--owhljulxk7urdqng--

