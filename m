Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6241AA452F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E17410E6FC;
	Wed, 30 Apr 2025 08:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J60Sv5eH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EDB10E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746001450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=hb6pTemUwrPvp+AseX4PlHV6IcQRgPX7swD6dyKnr5k=;
 b=J60Sv5eH5EqJm8e4Ar32mDuVQHlTLY0gVPi7vXopLmB7Pw732KJhtnQ3sVp7t7/KoTUSPD
 kdozeWtuonrmocxz8Xrqs1caJYiNMB7ZzqYidSlZpdSVjXAS9/lTpPMI2VqcG9OMsYlx2L
 qg6JbvgXoDdD7Rm3smA76SoRktvE1kM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-4ZL0cprjNOaFE2hIM8frWQ-1; Wed, 30 Apr 2025 04:24:06 -0400
X-MC-Unique: 4ZL0cprjNOaFE2hIM8frWQ-1
X-Mimecast-MFC-AGG-ID: 4ZL0cprjNOaFE2hIM8frWQ_1746001445
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a064c45f03so320378f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 01:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746001445; x=1746606245;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hb6pTemUwrPvp+AseX4PlHV6IcQRgPX7swD6dyKnr5k=;
 b=Bski0/4ZHHfd/GyClg+uyDEdg0bzfUbw4twxaMkA8ECl0ipMXMZj1vzZ+2at2c4qT2
 GjAba4akQIa9flq0ayPbSuz2F0A9Oo2b+pyD1ibdToGe9HdxVQDM7ke79XnOEwH74r28
 OPjE/OsiUM/nS1VZ/Sb36z/28nnzipzkUTC2jDtfc+JKhSUbabXUvcKm8s1Dc9O63nxt
 wS1TIEyIZsA/jE+SM702NgK6W0mXzOZKKJLLZuSomPMVxTJj0LEgd0OXHMT4qAQh4qWn
 0DWN1IQc4LmdZHinhCdReWLzdOuJ3h6seg4P+MyYb1fjmNg7lYJXxjcffeynUK75K/J3
 gm9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUonEL8vTDm58M8+z71kJCh8qEt3xGgNzJWKGkHbhO1dtuxfI4b8CSd5tkVu2hcpGwGn2Klcl7dMd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQYwd6pKz7bWThScd8CJDgTcphUJ8Cv7UnzJLOfCSCPRQtaHFe
 j481eFUTHyNhQct3NEXji31ST9x0Q+bmVGAvnpnA7oHioyCwHW5rg7+fyf0CX8PvjWQa7OBOrhT
 UAWPIElPQBWAkerU0o0+Mhju1vPm9S9n2Y/KKJPYeAycGN1O6S+3RTrvAQokjvXDXWQ==
X-Gm-Gg: ASbGncsjBkGWK4uaOd9uwKvzzt61ySe8WBc1yIOMefhQZeZb/vI5MjUSYjTwaIVKEPC
 +lvWK7+1BD5ORvWjLUDZIc+XvbXHwOFRwn8GRcdNnjcdoBwcWACSP4OqbgW1F2CQbOHV2+2h69v
 zyNAqEq1m+SvezwQ0/9cuomKSMIfX90kOvNoUaHTxIDdC1ObWvcx4gYMfM+rYEigDLdb+oK7x/D
 Px+2HkGf7hpHmyKduRft/Jmht1fp3F9ouhe/tYF70pC0+Ymfa7thqQhPCOBZuk=
X-Received: by 2002:a5d:64a5:0:b0:39e:cbca:74cf with SMTP id
 ffacd0b85a97d-3a08fb41409mr1343258f8f.6.1746001445462; 
 Wed, 30 Apr 2025 01:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHGemppamvwSCqHDIVa3HIbr+Tpnkq94FyJ5AaoxXCnEuJj4Qicu00zLHTRNlwRKDERNtL/w==
X-Received: by 2002:a5d:64a5:0:b0:39e:cbca:74cf with SMTP id
 ffacd0b85a97d-3a08fb41409mr1343231f8f.6.1746001444981; 
 Wed, 30 Apr 2025 01:24:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073cbdb78sm15988040f8f.41.2025.04.30.01.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 01:24:04 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:24:04 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <20250430-dark-eggplant-trout-c4ea6c@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="e5pn3vtrlnzatp6i"
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


--e5pn3vtrlnzatp6i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2025-04-30:
A spurious WARN fix for nouveau, an init and interrupt handling fixes
for ivpu, a warning fix for ttm, a hotplug fix for fdinfo, vblank fixes
for adp, a memory leak fix for the shmem kunit tests, and a timing fix
for mipi-dbi.
The following changes since commit 095c8e61f4c71cd4630ee11a82e82cc341b38464:

  drm: panel: jd9365da: fix reset signal polarity in unprepare (2025-04-22 09:42:04 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-04-30

for you to fetch changes up to 1a8bc0fe8039e1e57f68c4a588f0403d98bfeb1f:

  drm/mipi-dbi: Fix blanking for non-16 bit formats (2025-04-29 17:29:49 +0200)

----------------------------------------------------------------
A spurious WARN fix for nouveau, an init and interrupt handling fixes
for ivpu, a warning fix for ttm, a hotplug fix for fdinfo, vblank fixes
for adp, a memory leak fix for the shmem kunit tests, and a timing fix
for mipi-dbi.

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Fix the D0i2 disable test mode

Janne Grunau (5):
      drm: adp: Use spin_lock_irqsave for drm device event_lock
      drm: adp: Handle drm_crtc_vblank_get() errors
      drm: adp: Enable vblank interrupts in crtc's .atomic_enable
      drm: adp: Remove pointless irq_lock spin lock
      drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS

Karol Wachowski (1):
      accel/ivpu: Correct DCT interrupt handling

Maxime Ripard (1):
      drm/tests: shmem: Fix memleak

Philipp Stanner (1):
      drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()

Russell Cloran (1):
      drm/mipi-dbi: Fix blanking for non-16 bit formats

Sunil Khatri (1):
      drm/ttm: fix the warning for hit_low and evict_low

Tvrtko Ursulin (1):
      drm/fdinfo: Protect against driver unbind

 drivers/accel/ivpu/ivpu_fw.c               |  4 ++--
 drivers/accel/ivpu/ivpu_hw_btrs.h          |  2 +-
 drivers/accel/ivpu/ivpu_pm.c               | 18 ++++++++++--------
 drivers/gpu/drm/Kconfig                    |  2 +-
 drivers/gpu/drm/adp/adp_drv.c              | 27 ++++++++++++++-------------
 drivers/gpu/drm/drm_file.c                 |  6 ++++++
 drivers/gpu/drm/drm_mipi_dbi.c             |  6 +++++-
 drivers/gpu/drm/nouveau/nouveau_fence.c    |  2 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c |  3 +++
 drivers/gpu/drm/ttm/ttm_bo.c               |  3 ++-
 10 files changed, 45 insertions(+), 28 deletions(-)

--e5pn3vtrlnzatp6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBHeIwAKCRAnX84Zoj2+
dq9SAX49nDYR4pa5wfM1v9z/s/EI+SWCkFSGH+P885Bw5K7GOBKkDxPIYol9MvMT
+z9xB/kBewZp8AI9olqj4EOGWXbCLZcNA0Icvt5AjL84r3KmNOk34Z/Bmxr3bFm4
568Sr15FbA==
=UKKk
-----END PGP SIGNATURE-----

--e5pn3vtrlnzatp6i--

