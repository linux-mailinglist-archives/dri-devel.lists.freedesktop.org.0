Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3951A75A86C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A5C10E576;
	Thu, 20 Jul 2023 07:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B7510E574
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689839907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=rBsqY2ARWfqTa1dHwVMnq2zequY3dOjM13Ekx3jcS5Y=;
 b=KzFMeiYnAOxBuNZyg/aStbNvm22kOYBzUv93Gh6jwCpdWNZpt7tvIwC7lDAcaDKUJOAXNg
 RLxIsP08qOsz274DzDEs7kB96Hd5vysOn60e1f2+jX/23fcaIDs2a92/+yGkCgzMBIvwdZ
 FH9nHmJvHsY4gBdw/BGffX4QnVarLeM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-M0G4fJBFOFOzI6hd8KWQIw-1; Thu, 20 Jul 2023 03:58:25 -0400
X-MC-Unique: M0G4fJBFOFOzI6hd8KWQIw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3113da8b778so310525f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 00:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689839904; x=1690444704;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rBsqY2ARWfqTa1dHwVMnq2zequY3dOjM13Ekx3jcS5Y=;
 b=cTz/drGgbTYY8Pb1FCDqNf/3RLJC9tVeDR/HEfLvnRDQPIj4GuMzrJn/LvgZnmv48M
 DwCEUzpZBYEcl+kEQaA6XefvM1qXzfxhLXgq8hKkk2ASW86zrOADLsi/tZTx2wWsJ84y
 XeZxbFfrvvZdZ87pxZeQgk8j0UDCEF4gMSu0TziCelMNU1ew6HiuXxAZFF+OxnSz1OcM
 c5a07opdySKWkQJ9iEWfOvJwuP/ZtEs8N4n2QD5uciEDvPXiSP1wuDaMQNDwKki9Abpj
 PUYGJ0pU7D09cG/xFpDRq38m2bvFBcfY5mxqccpIyR5wTsP6crDOnfk6NPKja2rxUI9U
 17Tg==
X-Gm-Message-State: ABy/qLbKRqGOloykKOMH0jxZpepfPbBVNwAnkNrqKuyUEWerhigHcWe9
 lN1W03hXl4dA10zvj0nf98sWY1l5UQum7VxH5TMW8NzQrZYfi5UEfZBH37L+Xp3Z2ZgREf0XjTL
 Dj/OCLVXRbXI/pP8uXZePI78k8YS0
X-Received: by 2002:a5d:4902:0:b0:313:e6fa:fae4 with SMTP id
 x2-20020a5d4902000000b00313e6fafae4mr1581775wrq.38.1689839904699; 
 Thu, 20 Jul 2023 00:58:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFKY9K36OMmmTRHeqT/hY4MtBLJ5HwtGaAPFPVDaWTc0bd4nxmxiFwWmGRYfffQNx6RmOVACw==
X-Received: by 2002:a5d:4902:0:b0:313:e6fa:fae4 with SMTP id
 x2-20020a5d4902000000b00313e6fafae4mr1581761wrq.38.1689839904400; 
 Thu, 20 Jul 2023 00:58:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adfea50000000b0031424f4ef1dsm534302wrn.19.2023.07.20.00.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 00:58:23 -0700 (PDT)
Date: Thu, 20 Jul 2023 09:58:23 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <fmj5nok7zggux2lcpdtls2iknweba54wfc6o4zxq6i6s3dgi2r@7z3eawwhyhen>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sydt4qtivjifpf3g"
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sydt4qtivjifpf3g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-07-20:
Memory leak fixes in drm/client, memory access/leak fixes for
accel/qaic, another leak fix in dma-buf and three nouveau fixes around
hotplugging.
The following changes since commit 835a65f51790e1f72b1ab106ec89db9ac15b47d6:

  drm/nouveau: bring back blit subchannel for pre nv50 GPUs (2023-07-12 22:=
38:41 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-07-20

for you to fetch changes up to ea293f823a8805735d9e00124df81a8f448ed1ae:

  drm/nouveau/kms/nv50-: init hpd_irq_lock for PIOR DP (2023-07-19 11:08:47=
 +0200)

----------------------------------------------------------------
Memory leak fixes in drm/client, memory access/leak fixes for
accel/qaic, another leak fix in dma-buf and three nouveau fixes around
hotplugging.

----------------------------------------------------------------
Ben Skeggs (3):
      drm/nouveau/i2c: fix number of aux event slots
      drm/nouveau/disp: PIOR DP uses GPIO for HPD, not PMGR AUX interrupts
      drm/nouveau/kms/nv50-: init hpd_irq_lock for PIOR DP

Dan Carpenter (4):
      accel/qaic: tighten bounds checking in encode_message()
      accel/qaic: tighten bounds checking in decode_message()
      accel/qaic: Add consistent integer overflow checks
      accel/qaic: Fix a leak in map_user_pages()

Jocelyn Falempe (2):
      drm/client: Fix memory leak in drm_client_target_cloned
      drm/client: Fix memory leak in drm_client_modeset_probe

Ville Syrj=E4l=E4 (1):
      dma-buf/dma-resv: Stop leaking on krealloc() failure

 drivers/accel/qaic/qaic_control.c                 | 39 +++++++++++++++----=
----
 drivers/dma-buf/dma-resv.c                        | 13 +++++---
 drivers/gpu/drm/drm_client_modeset.c              |  6 ++++
 drivers/gpu/drm/nouveau/dispnv50/disp.c           |  4 +++
 drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h |  4 +--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 27 ++++++++++------
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c    | 11 +++++--
 7 files changed, 73 insertions(+), 31 deletions(-)

--sydt4qtivjifpf3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLjpHwAKCRDj7w1vZxhR
xciZAQCW5/Ou+y/wvw0UokZBa5THjAMoHIv70GbQIvTtMOf0egD/fXpuWCUOXCf7
r2BatfjEqzyf2zrCPiL+ZFJjmzX6Tg0=
=9ZZy
-----END PGP SIGNATURE-----

--sydt4qtivjifpf3g--

