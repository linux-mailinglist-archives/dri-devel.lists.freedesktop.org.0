Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846E860002
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDDB10E9D1;
	Thu, 22 Feb 2024 17:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cZr8Y2hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586C10E9DA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708624140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=3ioFLGtXAzl49LxeGXZoB4HlsD4SiUYcXnlMZjKgpEQ=;
 b=cZr8Y2hrczt1SuO519tYoYOUVtT0KTx6MHMwMEr07IQIgVEl0AtGNHdgPgI+uI2jnU58io
 ovl2zrcpNeAf8ycGS32zdQqFaos3xlkDZkUvrZ5mubQVn6xSeTx+7GOh/bay/yGweMUl7Q
 jBuMELO1YCeMgowZIxqZcajVwqZ342o=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-ELeuctslOOKOpBBbF2-PXg-1; Thu, 22 Feb 2024 12:48:57 -0500
X-MC-Unique: ELeuctslOOKOpBBbF2-PXg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-50e55470b49so70108e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708624136; x=1709228936;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ioFLGtXAzl49LxeGXZoB4HlsD4SiUYcXnlMZjKgpEQ=;
 b=Zpbw/uCYXIsjOZSc6ZG82xsTMS5bKGgiIUOlGjEzpLwxxu+a55zAkHM8kr641Mr0of
 uUig5dm4YVz+YjNzw6KmR+tLrEEYSO6AkfTF4Er9b8uZ6qrZDBv5NzGboYpNGmCeeWl0
 hGTMuKWscl9SucBe0Uli1MYurCGj0qDUYrhCpUvYItm/ogt/1Dn0jKh9TFn/Rve4Sfyv
 RwhzVbRjewFWfxnD46QDMBhnff30dHydoxJXIGmH0ePAPSWhYVSK22DLmKq0t1A5wNAU
 cbhyqmZt16wfNY7CMvl0vtD1FKVxaHQZ3hk2w/lXDh1LQRA8Qn1+Lyqt+yeEZOgx+sF4
 EfPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTVa/ad2x8PaBkIh5CCI5D1stSBDkn20k3BaOXn5JgjEnIFseKvcHUOqOaur0w1tGsdqrTG24StgggLnzMLR6mq3tBL7LmIYSolF4o8tuM
X-Gm-Message-State: AOJu0YzsowKMlCQq65Xl5vGM/BUWFJHXV9IXoYZE/IWbBghV2KwPiubF
 ZOmFu8sYwfJML3XDWtoD0aqWCgt4fIUfoFBpQU/tAGHEA514zlK5N9orQo+gWg7/gE10ZzK9D7p
 R7C3sWgZEKnwzJrFO1hbQMlkXfBvgfTorfYvFXqC7jiNq18EA7iqcW9dw3xM0u9FuSQ==
X-Received: by 2002:a05:6512:3a88:b0:512:db76:4e16 with SMTP id
 q8-20020a0565123a8800b00512db764e16mr2123068lfu.4.1708624136188; 
 Thu, 22 Feb 2024 09:48:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBAWvm+yI3Pr7fiLFm9XFNOLrF5RmpV/2JkyZ9oYkZoK7MMkLsr2+wsHuHCHG7VLRplm5xSg==
X-Received: by 2002:a05:6512:3a88:b0:512:db76:4e16 with SMTP id
 q8-20020a0565123a8800b00512db764e16mr2123052lfu.4.1708624135720; 
 Thu, 22 Feb 2024 09:48:55 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a7bc047000000b0040fe4b733f4sm6742438wmc.26.2024.02.22.09.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 09:48:55 -0800 (PST)
Date: Thu, 22 Feb 2024 18:48:55 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <gl2antuifidtzn3dfm426p7xwh5fxj23behagwh26owfnosh2w@gqoa7vj5prnh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5hhkflxukzuxfpx5"
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


--5hhkflxukzuxfpx5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2024-02-22:
A list handling fix and 64bit division on 32bit platform fix for the
drm/buddy allocator, a cast warning and an initialization fix for
nouveau, a bridge handling fix for meson, an initialisation fix for
ivpu, a SPARC build fix for fbdev, a double-free fix for ttm, and two
fence handling fixes for syncobj.
The following changes since commit a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea:

  drm/tests/drm_buddy: add alloc_contiguous test (2024-02-14 15:22:21 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2024-02-22

for you to fetch changes up to 2aa6f5b0fd052e363bb9d4b547189f0bf6b3d6d3:

  drm/syncobj: handle NULL fence in syncobj_eventfd_entry_func (2024-02-22 =
13:52:52 +0100)

----------------------------------------------------------------
A list handling fix and 64bit division on 32bit platform fix for the
drm/buddy allocator, a cast warning and an initialization fix for
nouveau, a bridge handling fix for meson, an initialisation fix for
ivpu, a SPARC build fix for fbdev, a double-free fix for ttm, and two
fence handling fixes for syncobj.

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Don't enable any tiles by default on VPU40xx

Arnd Bergmann (1):
      nouveau: fix function cast warnings

Arunpravin Paneer Selvam (1):
      drm/buddy: Modify duplicate list_splice_tail call

Dan Carpenter (1):
      drm/nouveau/mmu/r535: uninitialized variable in r535_bar_new_()

Erik Kurzinger (2):
      drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag=
 is set
      drm/syncobj: handle NULL fence in syncobj_eventfd_entry_func

Javier Martinez Canillas (1):
      sparc: Fix undefined reference to fb_is_primary_device

Martin Blumenstingl (1):
      drm/meson: Don't remove bridges which are created by other drivers

Matthew Auld (1):
      drm/tests/drm_buddy: fix 32b build

Thomas Hellstr=F6m (1):
      drm/ttm: Fix an invalid freeing on already freed page in error path

 arch/sparc/Makefile                               |  2 +-
 arch/sparc/video/Makefile                         |  2 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c                 |  2 +-
 drivers/gpu/drm/drm_buddy.c                       |  4 ++--
 drivers/gpu/drm/drm_syncobj.c                     | 19 ++++++++++++++++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c        |  1 -
 drivers/gpu/drm/meson/meson_encoder_dsi.c         |  1 -
 drivers/gpu/drm/meson/meson_encoder_hdmi.c        |  1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  5 ++---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c |  8 +++++++-
 drivers/gpu/drm/tests/drm_buddy_test.c            | 16 ++++++++--------
 drivers/gpu/drm/ttm/ttm_pool.c                    |  2 +-
 12 files changed, 39 insertions(+), 24 deletions(-)

--5hhkflxukzuxfpx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdeJBgAKCRDj7w1vZxhR
xRbyAQCnYNCfqIbjHWMolyt0BYbCzpSWutK1vtBD/FsjqQY9XAEA32eKhN0BzJOP
Gq2TJ8zFcUD6FfaFtG79ZAscIZFXLw8=
=4w2f
-----END PGP SIGNATURE-----

--5hhkflxukzuxfpx5--

