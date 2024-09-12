Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C29764D7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601C310EB35;
	Thu, 12 Sep 2024 08:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SegrLumj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD1F10EB35
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726130971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Rn+r2sIwqBy2AmjyGIdoT/4prz9KocAo+fqHyKeYSgU=;
 b=SegrLumj4owrCAg3mX/BuKaFaEnAA3FYXjKJC7oICetl3NRKuT2q8x4D7I37bmJZQdfHGp
 TPWgytUFW8Q5XSqZk2vsokU7Fe29gDvqYlx7RQ8YjKCwTKtL41FR9W9rQFsyztNZ2PXt4x
 NB2f7U4179suGaBji7zTVna1vRD5kOw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-46WIz4LLOrubnPDhuFBx6g-1; Thu, 12 Sep 2024 04:49:30 -0400
X-MC-Unique: 46WIz4LLOrubnPDhuFBx6g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cbcf60722so5264765e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 01:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726130969; x=1726735769;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rn+r2sIwqBy2AmjyGIdoT/4prz9KocAo+fqHyKeYSgU=;
 b=n64CLLl3QNlQPjTiuXDmQbaGva0+4VoN2X1enO9axfp3KnkeZt9LVhGJ6MX2RfsqXT
 +gqkkEBmqDfUJe1tdnrVL3pGmT6yYHu24+0JQmJRL700AjK38wBILuq/1yiPWewMHib4
 yM0G8vlqSq0ypGZpzzomx0PDrJVgxDmiJM4mT7XzWmTc61DRkC7ZnrSob9GRdonnLwvI
 8mR4bpYk4Vt3lKfj8nSex1OgOApJLdqngQeJRcReHln6pHUTTVbd5JhBEb+jPSNl5qmo
 Tb5O2VhWjyZXZ8napujO0mSatZ0yo7T1E4aQ/Fq1zEcM+Am7zABWGTsc9+5xPIjAKQpe
 KivA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZqC2yn9uG7oERZ3s3d4ndBJkjy7BMnNEwrxOAAZplJNdeoMwSchfY4et/9JKFLNIC4Iyg1r6zpkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVriy1BX5nH+l9AwP7VwFuDBJvr0kkQR1dHm/AXx30XwbY1VBB
 QlZ0/SeV3T4W4acvuMThCO+54sE7U8jau8PoRt/aQ8LCSnrAs39eysybF+pL/IPOjWNzG2IgM6I
 mxlGk4aNkVSHJHLDIeaFDhLzmk7Ch9Fymi927Msp21Hg9IONMQf03aV1MPosDEx2pGA==
X-Received: by 2002:a05:600c:21d9:b0:42c:b1a4:c3ef with SMTP id
 5b1f17b1804b1-42cdfb15de5mr6909105e9.33.1726130969012; 
 Thu, 12 Sep 2024 01:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvPrEMPX7BX2I0Ut0bhG8vE1gjyKoSPx0Jzq627zj6SyO0Rc2bUvi9GFKpp4L/h2e+s+2ATA==
X-Received: by 2002:a05:600c:21d9:b0:42c:b1a4:c3ef with SMTP id
 5b1f17b1804b1-42cdfb15de5mr6908855e9.33.1726130968447; 
 Thu, 12 Sep 2024 01:49:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caf436998sm163664415e9.29.2024.09.12.01.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 01:49:28 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:49:27 +0200
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
Message-ID: <20240912-phenomenal-upbeat-grouse-a26781@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oby2p3uttw4dxroi"
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


--oby2p3uttw4dxroi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2024-09-12:
An off-by-one fix for the CMA DMA-buf heap, An init fix for nouveau, a
config dependency fix for stm, a syncobj leak fix, and two iommu fixes
for tegra and rockchip.
The following changes since commit 5a498d4d06d6d9bad76d8a50a7f8fe01670ad46f:

  drm/fbdev-dma: Only install deferred I/O if necessary (2024-09-05 11:05:10 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-09-12

for you to fetch changes up to 45c690aea8ee5b7d012cd593bd288540a4bfdbf0:

  drm/tegra: Use iommu_paging_domain_alloc() (2024-09-10 15:40:27 -0400)

----------------------------------------------------------------
An off-by-one fix for the CMA DMA-buf heap, An init fix for nouveau, a
config dependency fix for stm, a syncobj leak fix, and two iommu fixes
for tegra and rockchip.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/stm: add COMMON_CLK dependency

Ben Skeggs (1):
      drm/nouveau/fb: restore init() for ramgp102

Lu Baolu (2):
      drm/rockchip: Use iommu_paging_domain_alloc()
      drm/tegra: Use iommu_paging_domain_alloc()

T.J. Mercier (2):
      dma-buf: heaps: Fix off-by-one in CMA heap fault handler
      drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl

 drivers/dma-buf/heaps/cma_heap.c                  |  2 +-
 drivers/gpu/drm/drm_syncobj.c                     | 17 +++++++++++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h      |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c       | 10 +++++++---
 drivers/gpu/drm/stm/Kconfig                       |  1 +
 drivers/gpu/drm/tegra/drm.c                       |  5 +++--
 8 files changed, 29 insertions(+), 11 deletions(-)

--oby2p3uttw4dxroi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuKrFwAKCRAnX84Zoj2+
dmTsAX4hsPzuvlt8ZKqxlNCSAPeJMRudMslZ70aGRcjD8mQXt69eb7PEMJwM38hn
bZdv/1EBgIP0LZTBFxRjJi5YnhHtNsnGB8It2dXEzuUi2k+nS0BqdbV/GX6MQQYq
HTkgc+CGcg==
=i1WZ
-----END PGP SIGNATURE-----

--oby2p3uttw4dxroi--

