Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D65AE977E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 10:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF85110E83A;
	Thu, 26 Jun 2025 08:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gsaIhEYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273D510E839
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 08:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750925179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Un7u/oigN2lAcR1eqnwk5UCeHFwE7wCa9VlsCrBoRy4=;
 b=gsaIhEYfVAm2EQVNZ4LW5jqfx2P1pOh88vYTHqw+12BRseb5LQd2BytseoWGl9Y2CZJEPe
 gqGZQTqyBd5nYqIYoLGwJr2hpNmpmJXRqrgFWP9MzeOT8CW1cZSjiWvQYCuxxfusnk/b/G
 cN12HiRby+po/hvdwFSJlr5B7pjYUqw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-_OLYvJuLO5aTMbdIf1A24w-1; Thu, 26 Jun 2025 04:06:16 -0400
X-MC-Unique: _OLYvJuLO5aTMbdIf1A24w-1
X-Mimecast-MFC-AGG-ID: _OLYvJuLO5aTMbdIf1A24w_1750925176
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f6ff23ccso395090f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 01:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750925176; x=1751529976;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Un7u/oigN2lAcR1eqnwk5UCeHFwE7wCa9VlsCrBoRy4=;
 b=RqTTNYtCQozESB9g3WAwXJGf0spMpgaG074Fv6kU/4WtaA3Ay47JDSXFKUhNEVPp+G
 FyHcuiueDeG419z/QKBYzpancRLQrvvH9LUoEybQQUKYC76mfUq7jLAv5v8SxJgjp5FW
 Mx7zmiB+K8bKi4/WeHAJISRVbM18pVLTpT5wPBz9VG/X5zXoVqAfs1x4SPbTZ2XjgMb8
 cDc4VAuaiHLKnmhhIAKJscsWG/3KVNWoQlj+31sTZulv5GLWdcUVpH2wxSZ3maWVOPBI
 AKZabnPh6zTQqpxviPUx+zok5f/IE5Q9gSFuNLNxUkXJlOqqNF227Z9ns3YLikzFik31
 TQBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoWUHszKnu+hnd8y9xz8ptZEGNO+CbaTPrWbs0844LVJULkiJgL1qE9BTIPqivI5/506vfUtXh5No=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRi2Ir9384boJ7dTAEn5q/YH164cuRJlR/HQETKFValQjSFhau
 Vn9NW9/V2LCoUpHljUNXYGazQLkoB6m6QarHLmKPBM1E6GfyKopONgPEAEtz2tU7QxG+AfBwE3c
 x6NxwcLVj78pWIueWtBLZDhA/SOp0EjJjOdA84KJUoA3lNn/R/LkZfl+clO90IhFQqMmfkQ==
X-Gm-Gg: ASbGncuvd1jgbqVQCOfgqYiSI7xMVyWsNR+NZeqrj1/A8iOiS7jPDbzVoHIcrUR8K/x
 JMjeBY6d411XO6zjG/LAqGpZ24KXx1CO41H3sHTG5eq+GnYkE+RbcZ+JD4An5kqBeklMkUvoyD1
 fETmZjqFX+BhK9b0iSCID/2Adb2VTMUmyy/LBYTTTbPYPPtc0/YvKUKhyeD1UiEjsq0OMSpu22t
 Ue/9SrcRrAof4OuO0SgNe6hCruRlyOXuB5FHGlOfKlEQB4fojd9JzdQCPfjhxAneY5m3g6vrg==
X-Received: by 2002:a05:6000:98e:b0:3a4:d953:74a1 with SMTP id
 ffacd0b85a97d-3a6ed5f2660mr4904886f8f.23.1750925175656; 
 Thu, 26 Jun 2025 01:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl+Et2fQCJMFtk7w65nFxPJgBsxzoM5kJmWZLpdhngsi7SOfXyOTEHOy5GgaRKAMwMVgqNNg==
X-Received: by 2002:a05:6000:98e:b0:3a4:d953:74a1 with SMTP id
 ffacd0b85a97d-3a6ed5f2660mr4904857f8f.23.1750925175169; 
 Thu, 26 Jun 2025 01:06:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80f26ebsm6691042f8f.51.2025.06.26.01.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 01:06:14 -0700 (PDT)
Date: Thu, 26 Jun 2025 10:06:14 +0200
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
Subject: [PULL] drm-misc-next
Message-ID: <20250626-sincere-loon-of-effort-6dbdf9@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="o64ig7trmkikf3gy"
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


--o64ig7trmkikf3gy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi,

It looks like it's been a slow week, but here's this week drm-misc-next PR

Maxime

drm-misc-next-2025-06-26:
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- ci: Add Device tree validation and kunit
- connector: Move HDR sink metadat to drm_display_info

Driver Changes:
- bochs: drm_panic Support
- panfrost: MT8370 Support

- bridge:
  - tc358767: Convert to devm_drm_bridge_alloc()
The following changes since commit 1a45ef022f0364186d4fb2f4e5255dcae1ff638a:

  drm/format-helper: Move drm_fb_build_fourcc_list() to sysfb helpers (2025-06-18 10:46:03 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-06-26

for you to fetch changes up to d6b93bfa5d1eba452e494d3a05d6bef65bc569b7:

  drm/nouveau/disp: Use dev->dev to get the device (2025-06-25 20:07:03 +0200)

----------------------------------------------------------------
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- ci: Add Device tree validation and kunit
- connector: Move HDR sink metadat to drm_display_info

Driver Changes:
- bochs: drm_panic Support
- panfrost: MT8370 Support

- bridge:
  - tc358767: Convert to devm_drm_bridge_alloc()

----------------------------------------------------------------
Jani Nikula (1):
      drm/connector: move HDR sink metadata to display info

Louis-Alexis Eyraud (5):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
      drm/panfrost: Drop duplicated Mediatek supplies arrays
      drm/panfrost: Commonize Mediatek power domain array definitions
      drm/panfrost: Add support for Mali on the MT8370 SoC
      arm64: dts: mediatek: mt8370: Enable gpu support

Luca Ceresoli (1):
      drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API

Ryosuke Yasuoka (1):
      drm/bochs: Add support for drm_panic

Sakari Ailus (1):
      drm/nouveau/disp: Use dev->dev to get the device

Vignesh Raman (2):
      drm/ci: Add jobs to validate devicetrees
      drm/ci: Add jobs to run KUnit tests

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi           | 16 ++++++
 drivers/gpu/drm/bridge/tc358767.c                  | 56 ++++++++++++++------
 drivers/gpu/drm/ci/check-devicetrees.yml           | 50 ++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh             | 19 +++++++
 drivers/gpu/drm/ci/dtbs-check.sh                   | 22 ++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml                   |  4 ++
 drivers/gpu/drm/ci/kunit.sh                        | 16 ++++++
 drivers/gpu/drm/ci/kunit.yml                       | 37 +++++++++++++
 drivers/gpu/drm/ci/setup-llvm-links.sh             | 13 +++++
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  2 +-
 drivers/gpu/drm/drm_connector.c                    |  2 +-
 drivers/gpu/drm/drm_edid.c                         | 19 +++----
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            | 61 ++++++++++++----------
 drivers/gpu/drm/tiny/bochs.c                       | 19 +++++++
 include/drm/drm_connector.h                        |  8 +--
 18 files changed, 292 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml
 create mode 100755 drivers/gpu/drm/ci/setup-llvm-links.sh

--o64ig7trmkikf3gy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFz/dQAKCRAnX84Zoj2+
dpQrAYD5yJ8ZYbrX4N8fGExKTQewOb+1Opt6nglHHG2SmlPBjDlOTabB0dPy2Ynu
NcMVDKQBgL3Hq1/V/W7f3n6PltrFi+k7FH+tUqsY9zZZPT3pq12Io/j56B3x4h+3
3sErNO+vRw==
=Tv+w
-----END PGP SIGNATURE-----

--o64ig7trmkikf3gy--

