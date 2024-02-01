Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259DF845491
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 10:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA7C10EBFB;
	Thu,  1 Feb 2024 09:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D0A10EBFB
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706781154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=/nslsHUxo4VfqrwQKm/jmwvkngfXt/wv7xqYrlV92MA=;
 b=EyckjWwa4cPs1eYGxut27RXpci3AT23n6uGcCCSlgv65vsfsKktJjzyO3lVvX+9QhdaomK
 +K6T031pEKNAwOwKxUj1e/femDSqLwQpQsYTMzT59i3MFL2N95TBKhVcmSuQH3rWMMnYA8
 HiDO6XTeLvT12hKedfpwEO0+NXukbLM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-OE2bB-bLNWWjyA6rNAOEhg-1; Thu, 01 Feb 2024 04:52:32 -0500
X-MC-Unique: OE2bB-bLNWWjyA6rNAOEhg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40efad468a5so3847995e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 01:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706781151; x=1707385951;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/nslsHUxo4VfqrwQKm/jmwvkngfXt/wv7xqYrlV92MA=;
 b=UBQj+SJNyRCZ1gPSR+qz+MJTpvhY17aPLrs50sNd5dQrdvwjwDIX9U3EosrCSVJtNm
 hk0bfenwi8c10SFvIvca+9v18aAsZPtkzNPL3RzGRAUzQvkcxhef4JXbwRYudvkZAaWx
 eKt3FI/QUsrVqCRdXn1i+v61e611YA54SQepXJw5s98H5jMszKhBJ780VEcFh8rHafrT
 AZc5Hvv1kDFFQ6dwT/wOST9h2qBi1tPemdLRVpoEG/k/of2EQNElswRxNkl8vVOZVnJy
 vVSzJ33oRlhb5VjtETqzx6bNJAVRtAf7bmXXQl4dLgxd7Iht5AzyNP2NSbD20TRl9kcW
 os8g==
X-Gm-Message-State: AOJu0YwJiwmv6r7DZfi6AASanO5hvEZfo9xWTuFbOEDqbH5u4O002bD5
 Gs5qs5MCFTcy4+IQV+PFnM5Vsd8FM3w5kj1WW0y6OsI0Nf9r5d/ASxQRM4GDa06m0G6Wljdj2jx
 e0tUuG09EUwrN9dmcgT4/BX5Kziv4qpkcInJkXNlu7gWWakOEy/eNaPB1FSMiG6ikMg==
X-Received: by 2002:a05:600c:470f:b0:40e:cdff:8d10 with SMTP id
 v15-20020a05600c470f00b0040ecdff8d10mr3153308wmo.6.1706781151688; 
 Thu, 01 Feb 2024 01:52:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIkBwhkOczLlPUtfjqjB1cBcFJsdjJOGJt/Mz5cQo3s6fACgPPrCAinNdyq5wPWIWvOQhBgw==
X-Received: by 2002:a05:600c:470f:b0:40e:cdff:8d10 with SMTP id
 v15-20020a05600c470f00b0040ecdff8d10mr3153283wmo.6.1706781151365; 
 Thu, 01 Feb 2024 01:52:31 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b0040f22171921sm3921797wmq.3.2024.02.01.01.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 01:52:31 -0800 (PST)
Date: Thu, 1 Feb 2024 10:52:30 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <obnofpccz73c3uiqfyipxmjta5fgm4cle55dmtnissgtgxfgv7@22o7kb62efri>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sxck4skgjc3bo7nu"
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


--sxck4skgjc3bo7nu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2024-02-01:
A quiet week: one fix for CMA dma-buf pages accounting, and one to
virtio to set the segment size of the virtio_gpu device.
The following changes since commit 27d19268cf394f2c78db732be0cb31852eeadb0a:

  accel/ivpu: Improve recovery and reset support (2024-01-25 10:17:37 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2024-02-01

for you to fetch changes up to 1c1914d6e8c6edbf5b45047419ff51abdb1dce96:

  dma-buf: heaps: Don't track CMA dma-buf pages under RssFile (2024-01-31 19:54:58 +0530)

----------------------------------------------------------------
A quiet week: one fix for CMA dma-buf pages accounting, and one to
virtio to set the segment size of the virtio_gpu device.

----------------------------------------------------------------
Sebastian Ott (1):
      drm/virtio: Set segment size for virtio_gpu device

T.J. Mercier (1):
      dma-buf: heaps: Don't track CMA dma-buf pages under RssFile

 drivers/dma-buf/heaps/cma_heap.c     | 7 +++----
 drivers/gpu/drm/virtio/virtgpu_drv.c | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

--sxck4skgjc3bo7nu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbtp3gAKCRDj7w1vZxhR
xQ0HAP4sZ+ttqAb4J6lJwVIvgDDtIEMYGYyeWHPzlnuA3Bu/6AD+KeArsfOFt8mI
A5ibCjPkvznlfVJhqgsIQ0rijE4Oow4=
=IMIn
-----END PGP SIGNATURE-----

--sxck4skgjc3bo7nu--

