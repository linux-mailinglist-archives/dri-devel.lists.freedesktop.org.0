Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197BCA34708
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40F910EB13;
	Thu, 13 Feb 2025 15:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GK7QDCMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1910EB13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739460652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=PN7ur676Xsis/n7iRGBe+pGaLllpLZp2f/gL1bpC1ek=;
 b=GK7QDCMpLdW6zUE40Sjt1Cvn3myxGPgVixw6djJYkPOXNzYzWSMwkYq977ltMKm3ZGarH+
 N9yjKjt9BZigydl+r1xZHfM9ZK1fSTo92dHCzSaUaC8DUZc5xa7JejtVmWym4xHTH8ByhB
 nuEeUgsr5I+342CffTfhYgAg7RjPONU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-PFTmNXuuNFms9cJSMt8GPA-1; Thu, 13 Feb 2025 10:30:48 -0500
X-MC-Unique: PFTmNXuuNFms9cJSMt8GPA-1
X-Mimecast-MFC-AGG-ID: PFTmNXuuNFms9cJSMt8GPA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43961fb0bafso4383695e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739460647; x=1740065447;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PN7ur676Xsis/n7iRGBe+pGaLllpLZp2f/gL1bpC1ek=;
 b=tZ9KBIPJ0STltOREiSDBDh4CrL8LCLiwuH3f8WlAOj7uXutHtQcG1ZLycVcgRHwgPh
 8oSiVFp2oNA6jA+xh0649QuYMn+x0YgqS1mfJXg9wxS6Fkv5o3K5XIA5t+wqjmeLCebh
 sTJb0kcZKS0gqLAutRIrGDJbOfL3fD0/NJ6EqiAsG8HVKo1YOgeDa4SRzbonZ7YDEMGL
 ZYMYIJZ0Bvwk9+wiyQklvdxdaP1IZWX3MTaj7vCpeoHH4nrvUVwAadUaI1gvON6CsJgQ
 o9u1sVRYQS5tLPIrhjVsE9Q/tcJTqoYD0SZ7RKm854f+UeHa+sdQj39Dkr7FQyI5Nxkh
 e3mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh6rsaPEFEdvkdExbUZbnulLfTegCVFxR1GYazJfir10/7dKzgr1YbwKxENmOdhmg9SYzaB3fZvQY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyuEO2aC6Zqn5dgGlmnzDm4TgW7iQ2ZqWXzRWSq64owLXT1OH6
 MSCyuk8f6k6p7yCwSiC8rjaZWFn2YSzjHHIiNhAaWSJ+FGwcxhdMvfy2Dt5P5vwneudbk+nr+Uu
 obz3hioKe5R9+3ADcMImpBFvmwBEW0fC0XswKFRVBWPPm8VLQ+qe8ZiIW2VJq3fYV9g==
X-Gm-Gg: ASbGncukOTTD12EFIi4jA2fD0zefx1ucY8fxVuPQerDY+XoZxRL0lOVpfRo9OE82Tdp
 wv8F7/7pzDAFtsX1JkKaY71yov4c/Nr1BGjeHRpGQ5nryWShXPhZGcJQo/HM6sFIniV4QfdFWKV
 EgE1cpPRdB53PBBvzRUyzMCaW/GJ2vNg5dcVEhTF0KalXcPqNJKY43/6Y2d9SVnwdTpsxkZ0UvP
 ecSqiFiaW2I5E4lmnsHp0Kw65ppAAK2wPuRKyMcaTsKFtHvwWbhNkW5
X-Received: by 2002:a05:600c:501f:b0:439:44eb:2d84 with SMTP id
 5b1f17b1804b1-43960179d20mr45018255e9.9.1739460647198; 
 Thu, 13 Feb 2025 07:30:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzxkEhvlPaDgSESYGojc4LYVD88oudIxFtzoghwjeJ38UrU8/0LhZlqsS+gmxL2ETvb3yf2w==
X-Received: by 2002:a05:600c:501f:b0:439:44eb:2d84 with SMTP id
 5b1f17b1804b1-43960179d20mr45017575e9.9.1739460646637; 
 Thu, 13 Feb 2025 07:30:46 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b824dsm51629645e9.34.2025.02.13.07.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 07:30:45 -0800 (PST)
Date: Thu, 13 Feb 2025 16:30:45 +0100
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
Message-ID: <20250213-brilliant-terrier-from-hell-d06dd5@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rb564bdblb4zsmee"
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


--rb564bdblb4zsmee
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-02-13:
Some locking fixes for the HDMI infrastructure tests, an unitialized
mutex fix for host1x, an unitialized variable fix for panthor, and a
config selection fix for hibmc.
The following changes since commit 2c1ed907520c50326b8f604907a8478b27881a2e:

  Merge remote-tracking branch 'drm-misc/drm-misc-next-fixes' into drm-misc-fixes (2025-02-06 09:59:35 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-02-13

for you to fetch changes up to e00a2e5d485faf53c7a24b9d1b575a642227947f:

  drm: Fix DSC BPP increment decoding (2025-02-13 10:20:30 +0200)

----------------------------------------------------------------
Some locking fixes for the HDMI infrastructure tests, an unitialized
mutex fix for host1x, an unitialized variable fix for panthor, and a
config selection fix for hibmc.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER

Imre Deak (1):
      drm: Fix DSC BPP increment decoding

Maxime Ripard (4):
      drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
      drm/tests: hdmi: Remove redundant assignments
      drm/tests: hdmi: Reorder DRM entities variables assignment
      drm/tests: hdmi: Fix recursive locking

Rupinderjit Singh (1):
      gpu: host1x: Fix a use of uninitialized mutex

Su Hui (1):
      drm/panthor: avoid garbage value in panthor_ioctl_dev_query()

 drivers/gpu/drm/display/drm_dp_helper.c            |   2 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |   2 +
 drivers/gpu/drm/panthor/panthor_drv.c              |   1 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 200 +++++++++++----------
 drivers/gpu/host1x/dev.c                           |   2 +
 drivers/gpu/host1x/intr.c                          |   2 -
 include/drm/display/drm_dp.h                       |   1 +
 7 files changed, 110 insertions(+), 100 deletions(-)

--rb564bdblb4zsmee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ64QJQAKCRAnX84Zoj2+
dqebAX9+gpZ3VggZ+34y9hZSe/WKr/CvyqoEBSXOt/1zOfyRstawesDt4ysf/rox
L3Au1QkBgLFVqMkwNxVxUUs2AHMSWevzlyELgJas34o15aDSV6Im1rBF7dNHnaBQ
GILZJXzVwQ==
=0FBJ
-----END PGP SIGNATURE-----

--rb564bdblb4zsmee--

