Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD9832967
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 13:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12A210E9E8;
	Fri, 19 Jan 2024 12:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DE610E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705666420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dIO0rD6PS4UE9ckN+UAWPedn16BH9n7ueoi4cHbrUuo=;
 b=IuB6TLhjKfJHah5SACWyrW9l3Zsk72oB0BAdLpGBtK5fI0C17qjbvt8/5lm4dGdJUINXnN
 uUAZsf1Vb3loMRKb/7TL2Z4ArcMEcfWB456rm/qITuBvWvsNE7mktNu5a1g93LV/TIaCeq
 mFsjwiwZJEUBYT0Prd5fjJO21O1efCY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-fbv0WGqHPDCWmK_mWJMWFw-1; Fri, 19 Jan 2024 07:13:37 -0500
X-MC-Unique: fbv0WGqHPDCWmK_mWJMWFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e5ebf58fbso5341115e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 04:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705666417; x=1706271217;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dIO0rD6PS4UE9ckN+UAWPedn16BH9n7ueoi4cHbrUuo=;
 b=WZWvEK888eVjaAtVo4eADckPu+RNoGtpdoxxRqZyiJ6yke2TIqmrgSnw0z7Zvj3uCM
 zpbqmWfNmJ7gp2qhn3CgLiHAt3TE7A/N5pHP+FEKa8mCq7SPJDwgaOinv3JxxjqfjwK2
 TsvyZLMMoRc2IUlBeiJkUP9jI5JwXo6RjzGjOK11Xs0z9kPRbtooSvHoFD178tLA74O1
 MeC0XEXBof9BwwIyskNICW+JT7LdDMROo8EPtpkWQKul52GepTHM/DZr7mfZKxvMm9ED
 yKYT6KmNyAP/wMNBFihESzRT42zYWknSdqEKBW0JP/J0MCa4twPBKqbVq7xDWYM7dhWa
 DSww==
X-Gm-Message-State: AOJu0YxD/veo/bQg+OWaMUZsAgH6UvQDHxQlfx6wSE7k5lnTsOT1VfmG
 r7fWoTfcY9TVnUpWrSUq1DMDGmy2NmLjNrcg0aBr6wPMM4m0qv/rIsQ5TXwAzJ2ZkKNuadEJC0M
 Kkrw4WqoHmFlZuwgUK0aFXImMWwQmWxbJDFdsmiJFXNTAlgarWE4gEZynP53R0IfRhw==
X-Received: by 2002:a7b:c001:0:b0:40e:6963:e768 with SMTP id
 c1-20020a7bc001000000b0040e6963e768mr1409534wmb.9.1705666416812; 
 Fri, 19 Jan 2024 04:13:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz/TODPOt9VSdW4tJ6SV/9THtNYVE5H3mIGGP1OmwL2nXNbniufXqMoC2W6mFTEjnyJ4JAUA==
X-Received: by 2002:a7b:c001:0:b0:40e:6963:e768 with SMTP id
 c1-20020a7bc001000000b0040e6963e768mr1409514wmb.9.1705666416438; 
 Fri, 19 Jan 2024 04:13:36 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b0040e9e03160bsm1793776wmb.16.2024.01.19.04.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 04:13:36 -0800 (PST)
Date: Fri, 19 Jan 2024 13:13:35 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <5zrphn2nhxnwillxlmo6ap3zh7qjt3jgydlm5sntuc4fzvwhpo@hznprx2bjyi7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xbj63rarri2vcask"
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


--xbj63rarri2vcask
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week (and last (maybe)) drm-misc-next-fixes PR.

Thanks!
Maxime

drm-misc-next-fixes-2024-01-19:
A null pointer dereference fix for v3d and a protection fault fix for
ttm.
The following changes since commit 89fe46019a62bc1d0cb49c9615cb3520096c4bc1:

  drm/v3d: Fix support for register debugging on the RPi 4 (2024-01-09 14:2=
1:47 -0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2024-=
01-19

for you to fetch changes up to 1f1626ac0428820f998245478610f452650bcab5:

  drm/ttm: fix ttm pool initialization for no-dma-device drivers (2024-01-1=
5 13:56:08 +0100)

----------------------------------------------------------------
A null pointer dereference fix for v3d and a protection fault fix for
ttm.

----------------------------------------------------------------
Fedor Pchelkin (1):
      drm/ttm: fix ttm pool initialization for no-dma-device drivers

Ma=EDra Canal (1):
      drm/v3d: Free the job and assign it to NULL if initialization fails

 drivers/gpu/drm/ttm/ttm_device.c |  9 +++++++--
 drivers/gpu/drm/v3d/v3d_submit.c | 35 ++++++++++++++++++++++++++++-------
 2 files changed, 35 insertions(+), 9 deletions(-)

--xbj63rarri2vcask
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZapnbwAKCRDj7w1vZxhR
xTRKAP9vfdzVmMPUjnbqCGNewwNxSaybJKs4z+btMurzFwLcDQEAw6SLyMUdBvdL
nZUTVLuuCnHigwglZL7pDVEZdWvtiQo=
=Zeuz
-----END PGP SIGNATURE-----

--xbj63rarri2vcask--

