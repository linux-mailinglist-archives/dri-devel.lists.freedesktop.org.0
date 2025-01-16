Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581DA135B8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B36F10E901;
	Thu, 16 Jan 2025 08:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jMdPXHkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6725A10E901
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737017132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=mdrHmU1w955LF9SCvybW0+D/xuTZON1n9XZafOB9MoM=;
 b=jMdPXHkB1LR8HmWyIVtrQ/zFxRs5A1zmyD9PgVzpteCYBsbgA5WAh3WmgrkzBWuXZ4Da93
 eQtJBC2ZWq9t2Mp+fAB/V6b1HUGW+e3FC4wJEMa3NZTL18ULwYfQVtAW0doBJVPaWsLF28
 +tf9xt4sW+XJdsD2ikk1eiCvSu/4lE8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-f3wMg97oP1iN_dzftbjeNw-1; Thu, 16 Jan 2025 03:45:30 -0500
X-MC-Unique: f3wMg97oP1iN_dzftbjeNw-1
X-Mimecast-MFC-AGG-ID: f3wMg97oP1iN_dzftbjeNw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3860bc1d4f1so445845f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737017126; x=1737621926;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mdrHmU1w955LF9SCvybW0+D/xuTZON1n9XZafOB9MoM=;
 b=Hld0CSh0O9/6WsYN+fkOLR3Dlq3amXJry01PrOoRXiPR/DWy+2KAN46gIImA43bK5J
 gSN/8/EGEDmDSgh6q85QEihzCue7xXmgm1JotX5XvoSY4imyj0bsk9ZnLb4e/z08VprP
 bSCNpr6h6+Qepqao9Qls/W4BV1oUSEjOPr5VRaczRE/6wH4lVpD30XSDnF1jeeqG8t+f
 Z2YlrNVctNr65TsSQYQQNrYrxa+OArKIw8vATvsvy8iGogkFBcitD/zcqIKrK/OIhX98
 xBjnrPaa1AkuVqDZw2MQJ/rNTT7K9j0MTW3pr3o9JvLWIfFaUud1U8r5HvWLt2PyJWkA
 CGog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj1We+n/6jRtB+nYxdrd+mOprAYef0cpyHyg4GSW0uR5FlzrfiA+wpaBdLoXk+RxjluqkvWW+Yepg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFDvqEPw5dTVVETCuT21mTzDN5Jp1dKz6lkdBu0RvkMg4Me3VC
 hVMYZS+UNFUexxh5NHq2ZWBjOVQGX+u/iXjuADggVbHC9/25InKazGVbxyf2luXikzvH2yu9N9/
 fYFsYiuZ6SttwqHnFgJDytxCbFK4W4oVyWeGkq5vX27TLv2zTvNBtKriYWffUg2h2uw==
X-Gm-Gg: ASbGnctY0hqn0txJzMNQv0D+0fm+ZKvH3jd3hIqbZnCLIh873EgMPWJSqs8ajybFHsX
 tFtuIVX13YG93ugsf84DBE6xYdoSMrPiWD8L0g/zPD1X5EyHFW3LBTrsq2TfgoTuzUjcknCZEL6
 8kLSHk+ZcDeihCHDKTZTB0IhDvqG4Gppv3y17g2kNiFzqmSzbF8Y6vYmMwLZbd9VIF8M78jz4pz
 XW5e9XpwZJoZcO3vJAn5zoL/6ZH4T2e
X-Received: by 2002:a05:6000:1845:b0:38b:ed7b:f77d with SMTP id
 ffacd0b85a97d-38bed7bfb4amr946944f8f.52.1737017126010; 
 Thu, 16 Jan 2025 00:45:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHK+IJ1lIO7QX6ub/oEgAZRvZDd3XIWgd5Z+pcYXpKxXmnwgFHsiWHY11XBrNHSWnsCDkEgA==
X-Received: by 2002:a05:6000:1845:b0:38b:ed7b:f77d with SMTP id
 ffacd0b85a97d-38bed7bfb4amr946919f8f.52.1737017125595; 
 Thu, 16 Jan 2025 00:45:25 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38ef6asm20270415f8f.60.2025.01.16.00.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:45:25 -0800 (PST)
Date: Thu, 16 Jan 2025 09:45:24 +0100
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
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20250116-bold-furry-perch-b1ca0e@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xzp6s7t2j6i3nskj"
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


--xzp6s7t2j6i3nskj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next-fixes PR.

Thanks!
Maxime

drm-misc-next-fixes-2025-01-16:
Several fixes for the new dmem cgroup controller and the HDMI framework
audio support
The following changes since commit 24c61d553302ee49e9c21dd251275ba8c36dcfe4:

  Merge tag 'drm-msm-next-2025-01-07' of gitlab.freedesktop.org:drm/msm into drm-next (2025-01-13 11:14:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-01-16

for you to fetch changes up to f1359f46f1f1305340970b5073240126fe87254f:

  drm/bridge: fix documentation for the hdmi_audio_prepare() callback (2025-01-15 12:32:47 +0200)

----------------------------------------------------------------
Several fixes for the new dmem cgroup controller and the HDMI framework
audio support

----------------------------------------------------------------
Cristian Ciocaltea (1):
      drm/display: hdmi: Do not read EDID on disconnected connectors

Dmitry Baryshkov (2):
      drm/display: hdmi-state-helper: add drm_display_mode declaration
      drm/bridge: fix documentation for the hdmi_audio_prepare() callback

Jiapeng Chong (1):
      kernel/cgroup: Remove the unused variable climit

Liu Ying (2):
      drm/connector: hdmi: Do atomic check when necessary
      drm/tests: hdmi: Add connector disablement test

Maxime Ripard (5):
      Merge drm/drm-next into drm-misc-next-fixes
      cgroup/dmem: Select PAGE_COUNTER
      cgroup/dmem: Fix parameters documentation
      drm/doc: Include new drm-compute documentation
      doc/cgroup: Fix title underline length

 Documentation/core-api/cgroup.rst                  |  2 +-
 Documentation/gpu/index.rst                        |  1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  5 +++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 52 ++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h        |  1 +
 include/drm/drm_bridge.h                           |  2 +-
 init/Kconfig                                       |  1 +
 kernel/cgroup/dmem.c                               | 10 ++---
 8 files changed, 65 insertions(+), 9 deletions(-)

--xzp6s7t2j6i3nskj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4jHJAAKCRAnX84Zoj2+
dnTKAX9nbV6LIPLAOM3MDf5Svk0UVB6Tin5M33ea3nD7QRu46APQLTGjy52EeAF1
0PMmN1cBf1to1qZL4aZBOhQrAgjmnzDuZPXa7BL4HPQ7y8dqvrDC2SBkJO1mCJWb
aolxzqzytQ==
=eptm
-----END PGP SIGNATURE-----

--xzp6s7t2j6i3nskj--

