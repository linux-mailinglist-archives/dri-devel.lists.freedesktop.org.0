Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702784E040
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 13:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412E510E3B6;
	Thu,  8 Feb 2024 12:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AakqLwe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5C310E3B6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 12:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707393765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=qt0xTWZTGxMel02Jx+enJDas7HHcyXht473odqIDNEE=;
 b=AakqLwe781g1vHJNzl4RLjFDocfx7lg8u6gDzuUEhiP8xvVZSAEc59qKVds7xBWZe9QQKC
 uENF2KbmE8vGjThALd9tDfsfA91bk7nXVzko3UpYAcZVhEKGcARzCwqeATDAfuumlXlROS
 MwbtKuoGPdmKgbHdEGB2PHzaXfrhWIc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-UrQ24wY-PBW1admPVhLfdg-1; Thu, 08 Feb 2024 07:02:43 -0500
X-MC-Unique: UrQ24wY-PBW1admPVhLfdg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40f00a86728so9541445e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 04:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707393762; x=1707998562;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qt0xTWZTGxMel02Jx+enJDas7HHcyXht473odqIDNEE=;
 b=pY+EpYOxGL8WssggHGZuE/2TDsXi7T5Db8fmeHg+9dHb+LCnS1zGj2DGQoikuhl+xK
 QNn2efTw4HERRBeB1x6akUPxP/lHeSWHFD0jMuu+giHt7HnREnZy9KYSkxRtGpKRVm6j
 fY+gwalsN0Z0YYyqlWsJYkWpVCnxwLKLCahk3t+M3htVPNh87x/QL1o1jT/aYVFt2bAR
 FgznYohOopV69fgDL7nHE/EFr7jZBQim66xUorm2KbF9H9xaV1N++hg7km/WvQiqXS6O
 bSC1ZcS9TYc/rtMc2t7iQ3MnoOgEn0sL6HmCyzY2oSyRQLl3KNVFz9C5jjq8IEzt+DXC
 HBiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgAXJit+96aaxjgRCt7bqnPdWWnnvTpXbOVvqILjxAAKCNM/TxGEElM3m4JBj4XpPJTWjZ4Hv4dH5UEFN3otc9G/k8fiWRIL4CmmQcgIwU
X-Gm-Message-State: AOJu0YwNFQygPlBdc4JBFefbctUCS/qkv6nim/Xn7MAljcbWNnY6LR0j
 Cl0FFMbBHdROHbyiatTDe5KZY0lWVRpB9qB83rdf/KkzQoW2jn6WvZI9M6pjzFDK31tVje24pzQ
 sFRUTrUhEQp8GFLQL00KTRXN5X53dpZo19KOngIpvXzy+SpweRiid6NXsDlNetEX6nA==
X-Received: by 2002:a05:600c:5612:b0:40f:d3b3:b6d2 with SMTP id
 jr18-20020a05600c561200b0040fd3b3b6d2mr6683780wmb.14.1707393762179; 
 Thu, 08 Feb 2024 04:02:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+IG92maavjEnM2WGQ4VZKc2moJ7Le5ftZz1XagH4i+r126dROY8wfezRF+LdNQceq4I0G0g==
X-Received: by 2002:a05:600c:5612:b0:40f:d3b3:b6d2 with SMTP id
 jr18-20020a05600c561200b0040fd3b3b6d2mr6683755wmb.14.1707393761809; 
 Thu, 08 Feb 2024 04:02:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWjdQ5CRsXvR2Gwis5Tx3VMjDeZ3YcldUtz5jj/XrfnAK7cgG0IGHOrc/tFCtqLz4lZ+EL8pTOCs5qb3YYfTO/DLtqsBrMeWe5Vet7DxrQNQVvRqjNDyk9K9CNGPXie4gvrQUuHipgY/zkHXBt+yvtnj4BKSRGhI7Xcva4cDKR/Jx1mPRbH0mmLO4v6evVS7esoiAsGK7Gk9T662UlDyrterJL7H7L+E7P8GZRZDXp/+HPYeLKObl0OOUmPQCofaNkDIT1d9qq0jh0inRYNMIeB4mhY//SnQ9Q7LZZvUNerpudaezJT+YYLYERFwC7b2h2RriahZh455FZnGIEVTR9qCDvB52vpPByptaUcbSeVoEUQTnRtqr4Y6GT1In38tgQ0gHFX1/8YwEEa3/2cY6nhw3xsq7IqTWL6LqpnfPMx3Zv/kg8tC0/IfIhTNQpStGnNi2lFZHjbAe28mnY161+ZKPJUH9cCyFLcKcD48OCgshnPpTRX2zGAg01EhqsoYA+XmsHp7trTY+sWbij3+Gmnz9SoG2MvGYAQJKwsBZM=
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 je3-20020a05600c1f8300b004101bdae3a0sm1427711wmb.38.2024.02.08.04.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 04:02:41 -0800 (PST)
Date: Thu, 8 Feb 2024 13:02:40 +0100
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
Message-ID: <4wsi2i6kgkqdu7nzp4g7hxasbswnrmc5cakgf5zzvnix53u7lr@4rmp7hwblow3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hlshk4u374335pug"
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


--hlshk4u374335pug
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2024-02-08:
A null pointer dereference fix for v3d, a TTM pool initialization fix,
several fixes for nouveau around register size, DMA buffer leaks and API
consistency, a multiple fixes for ivpu around MMU setup, initialization
and firmware interactions.
The following changes since commit 1c1914d6e8c6edbf5b45047419ff51abdb1dce96:

  dma-buf: heaps: Don't track CMA dma-buf pages under RssFile (2024-01-31 19:54:58 +0530)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2024-02-08

for you to fetch changes up to 5f8408aca66772d3aa9b4831577b2ac5ec41bcd9:

  accel/ivpu: Add job status for jobs aborted by the driver (2024-02-06 13:37:34 +0100)

----------------------------------------------------------------
A null pointer dereference fix for v3d, a TTM pool initialization fix,
several fixes for nouveau around register size, DMA buffer leaks and API
consistency, a multiple fixes for ivpu around MMU setup, initialization
and firmware interactions.

----------------------------------------------------------------
Dave Airlie (1):
      nouveau/gsp: use correct size for registry rpc.

Grzegorz Trzebiatowski (1):
      accel/ivpu: Add job status for jobs aborted by the driver

Jacek Lawrynowicz (1):
      accel/ivpu: Disable d3hot_delay on all NPU generations

Krystian Pradzynski (2):
      accel/ivpu/40xx: Enable D0i3 message
      accel/ivpu/40xx: Stop passing SKU boot parameters to FW

Maxime Ripard (1):
      Merge drm-misc-next-fixes-2024-01-19 into drm-misc-fixes

Timur Tabi (2):
      drm/nouveau: fix several DMA buffer leaks
      drm/nouveau: nvkm_gsp_radix3_sg() should use nvkm_gsp_mem_ctor()

Wachowski, Karol (2):
      accel/ivpu: Force snooping for MMU writes
      accel/ivpu: Correct MMU queue size checking functions

 drivers/accel/ivpu/ivpu_drv.c                     |  5 +-
 drivers/accel/ivpu/ivpu_fw.c                      |  1 -
 drivers/accel/ivpu/ivpu_hw_37xx.c                 |  2 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c                 |  7 +-
 drivers/accel/ivpu/ivpu_job.c                     |  4 +-
 drivers/accel/ivpu/ivpu_mmu.c                     | 36 +++++++----
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 79 ++++++++++++++---------
 drivers/gpu/drm/ttm/ttm_device.c                  |  9 ++-
 drivers/gpu/drm/v3d/v3d_submit.c                  | 35 ++++++++--
 include/uapi/drm/ivpu_accel.h                     |  1 +
 11 files changed, 113 insertions(+), 68 deletions(-)

--hlshk4u374335pug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcTC4AAKCRDj7w1vZxhR
xd6uAQCxKfe7H2ZTGOrDjFMKjgVp63c4z5qdcc6ZLNlE/VUYdAD/UEpiZwNo4AoH
c7JM3wHx51RXLI1Ily9gR9upYBnEwgs=
=hwHj
-----END PGP SIGNATURE-----

--hlshk4u374335pug--

