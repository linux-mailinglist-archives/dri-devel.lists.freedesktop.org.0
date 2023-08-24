Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0C786A4C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A82310E4E9;
	Thu, 24 Aug 2023 08:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1486E10E4BC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692866487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5mtjeMY9E3m0WJdC5E0q7o++ntGobTiHpLVFQcZVRcg=;
 b=VmDLgXnUZ+/WJ843pz/HoMAN+44EKSDAT8GJ8nr8BQTNYbF/DilOUAo11kgbwLkifoJRbA
 94rt2VIJugKg337QJEE4plHTuRqQ3kyAqVwXWZM8ymPBlQ//UgLKBzQenoD53ikWEa2Xbc
 TG6iIiL2+WQRhijbwYIyfFyR4MlPBlQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-haOokUHNMROeJBWhayfgnA-1; Thu, 24 Aug 2023 04:41:23 -0400
X-MC-Unique: haOokUHNMROeJBWhayfgnA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65fa35so44870845e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 01:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692866482; x=1693471282;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5mtjeMY9E3m0WJdC5E0q7o++ntGobTiHpLVFQcZVRcg=;
 b=bibmLw85o6b9fVVdsAVvwGxH7lNXgouH7n3CS4wHpzdL+hZIRQjUFfHDOHPT5ZUrZK
 tbKzg8ob/X+d6A4fm/nFMWGpTY9umruoGJt3Rt/zXzQ5QYhzRdQDhAskAfcYeSOKp/TE
 J5ibP8g3jrfsd4asLGrT0Q/w0b4amVWNZfYtBuC/9eCc+EbMPzzAyrOKu+gRmGv2D0h6
 cffUwtPUoqbeaEZbEcLrp/fIqibdc2r4Ora0T+HzhRLaK/D8Tu2OuS81/JevPidtWVRF
 4EzrndCSf8l3blYiTTDOc+uoEFLxZsUswykkzTERS3Mf1XYTQ8nMUY54qVbEEKmyOI0z
 lLkw==
X-Gm-Message-State: AOJu0Yyk0qRyaVybo5QoWySMWUKH8c2uZH659UoOABtB56PZ7g7IrTTM
 n9qnYQvPKJUypCAbk3GUPMmcNF9hmFyecBdHj+opHoLCZ8TodBhYQrsF0QGdGyA8crlzIl1vruG
 xlsQEZJ4Hx5P8Zk+lYzvhPlwQhn3y
X-Received: by 2002:a5d:574d:0:b0:319:6ec3:79c7 with SMTP id
 q13-20020a5d574d000000b003196ec379c7mr11131607wrw.36.1692866481927; 
 Thu, 24 Aug 2023 01:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKxlXLllNtHsIyDSgL0ciTV3wk7YxGaX6bIOc6LHqgUywc38hmcA9yUBmpzmwfQdsmxCmnYg==
X-Received: by 2002:a5d:574d:0:b0:319:6ec3:79c7 with SMTP id
 q13-20020a5d574d000000b003196ec379c7mr11131597wrw.36.1692866481549; 
 Thu, 24 Aug 2023 01:41:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a0560001b0c00b0031c5d74ecd8sm9638680wrz.84.2023.08.24.01.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 01:41:21 -0700 (PDT)
Date: Thu, 24 Aug 2023 10:41:20 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <amy26vu5xbeeikswpx7nt6rddwfocdidshrtt2qovipihx5poj@y45p3dtzrloc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pg2nwcx6lmpfnz7x"
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


--pg2nwcx6lmpfnz7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-08-24:
A samsung-dsim initialization fix, a devfreq fix for panfrost, a DP DSC
define fix, a recursive lock fix for dma-buf, a shader validation fix
and a reference counting fix for vmwgfx
The following changes since commit 50b6f2c8297793f7f3315623db78dcff85158e96:

  Revert "drm/edid: Fix csync detailed mode parsing" (2023-08-17 14:39:12 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-08-24

for you to fetch changes up to f9e96bf1905479f18e83a3a4c314a8dfa56ede2c:

  drm/vmwgfx: Fix possible invalid drm gem put calls (2023-08-23 13:20:04 -0400)

----------------------------------------------------------------
A samsung-dsim initialization fix, a devfreq fix for panfrost, a DP DSC
define fix, a recursive lock fix for dma-buf, a shader validation fix
and a reference counting fix for vmwgfx

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/display/dp: Fix the DP DSC Receiver cap size

David Michael (1):
      drm/panfrost: Skip speed binning on EOPNOTSUPP

Frieder Schrempf (1):
      drm: bridge: samsung-dsim: Fix init during host transfer

Rob Clark (1):
      dma-buf/sw_sync: Avoid recursive lock during fence signal

Zack Rusin (2):
      drm/vmwgfx: Fix shader stage validation
      drm/vmwgfx: Fix possible invalid drm gem put calls

 drivers/dma-buf/sw_sync.c                   | 18 +++++++--------
 drivers/gpu/drm/bridge/samsung-dsim.c       | 27 +++++++++++++---------
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  6 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h          |  8 +++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h         | 12 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c     | 35 +++++++++++------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         |  6 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c     |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c      |  3 +--
 include/drm/display/drm_dp.h                |  2 +-
 11 files changed, 67 insertions(+), 55 deletions(-)

--pg2nwcx6lmpfnz7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOcXsAAKCRDj7w1vZxhR
xb+UAQDmuE1fhpzh7uXoLbxwmZJsE8lqF59s1i45U7A9dr+eJwEA4JE7CF2ho4YX
YG7n0H/hN/kJJ0CyPMmtCBzrKd+/KQI=
=CCEM
-----END PGP SIGNATURE-----

--pg2nwcx6lmpfnz7x--

