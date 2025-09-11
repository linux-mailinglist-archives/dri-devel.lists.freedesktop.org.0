Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89781B538A7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 18:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075E810EB87;
	Thu, 11 Sep 2025 16:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PksTyhmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B75610EB77
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757606682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=jtZEVi1bBiJckYAxa3sEu/hHpNe6eKx7VTDTRhqbfkU=;
 b=PksTyhmTuDiuUj54mP5maSTTulk475kySj5gc0mi27BvtAxWOUW1ZMQ27VmVH4FMr1dx87
 PxQND6YmvAY3nTe6xDfefDsXWoo4ok3FLkI7yEPbpKdAAd6NDj02NxkKGxQRCxVabska71
 JNIol/WSS0KnWFBHWWynizqiXva9RK4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-TRDFANt0PRKhmnvOisyW-w-1; Thu, 11 Sep 2025 12:04:40 -0400
X-MC-Unique: TRDFANt0PRKhmnvOisyW-w-1
X-Mimecast-MFC-AGG-ID: TRDFANt0PRKhmnvOisyW-w_1757606679
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45dcfc6558cso6662085e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757606679; x=1758211479;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jtZEVi1bBiJckYAxa3sEu/hHpNe6eKx7VTDTRhqbfkU=;
 b=n5CPeJtzXpu6cR1/HNbeNlKtQC465tZiv/CTnIiXByYhu+qMKGsz6E4hVjbbqufSyD
 YxG5sB7uXpiDNWllZGPVtqddPe8aAakNkncTGE9wMBky0bfxdIywJdRKkofJb+O12ZXQ
 nwFOZzcZ7FjSvRVph9FymnK0HFXmyt25r53iyEPY39bElooPUvXvLvptnryGDTpK63hI
 6l+ALmpio6UzBAW7lZz0RECDO86ugCNmUAHJCPVesLH2qN3WmE84l6eQs6YXF3puFm+Q
 0uM3vKxiLJlKZvdapWvgbeeg2mSqBsixRcBScylWUobJJa+JC245PqtA8regpZ9BLDi9
 ejYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBiGLo69vpJG05B3SFOxPISwB9MGaGzRaSClm5c0FPjALo1D7b6AadbdGfYLe7Cfkl71h0uXnS4hU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmgfL2ttc/ZLBad2BF4QJNl+2nNR2FEHdYJPW4U88Av9/6FT30
 9cASUl/v9HjXED8BAzBwNl/627ydo1P8Cx5c9uI4bvUvdShW24Dq7yhy+fwZ+Y6vH1ti3BQ4m11
 +liJw+ianh+UTz7eYYK7B4aQqoKj54udHV2dgj2oGu8AxKU4S4O5OCqcTaERack+W9fZ6SQ==
X-Gm-Gg: ASbGncvDSXAXop3G/wrR+76dGOMz6nAkyG0bh1IFiTAyoTDHshbD39Qi2zYnAtwChCA
 mFF6uJlpMHLXOXXS4VMPpbYd9UyUxA7VaMUcAjgCcBD4GfDQ27J7LD4auWu7gBhYUjY7hFe27E+
 tNqs8HqIgsIMgPsB4uZY9FgwkYYb8yAM/XUaItDztYITET2iEZ9ueis4n1urqk9k0pFrwawHSZh
 l2OVRTKRtZ8WlBqfS9SoNfhQAtJuwEbL3h0wZg9QW1J2h7ONDb8t9nmS90tX6XJzUxmhCaWrqPX
 scMv4lRvPb6Ozk0=
X-Received: by 2002:a5d:588c:0:b0:3e2:9a5a:1f38 with SMTP id
 ffacd0b85a97d-3e64c692464mr14106108f8f.50.1757606678742; 
 Thu, 11 Sep 2025 09:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYGKzZTNFxaumU0lwQa1TM2uyRQUhmekKodD8ASxi5wTwWwSFpdAUhSe/UMfM4+ltbXkHQkA==
X-Received: by 2002:a5d:588c:0:b0:3e2:9a5a:1f38 with SMTP id
 ffacd0b85a97d-3e64c692464mr14106068f8f.50.1757606678233; 
 Thu, 11 Sep 2025 09:04:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037c3ee8sm30016945e9.18.2025.09.11.09.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:04:37 -0700 (PDT)
Date: Thu, 11 Sep 2025 18:04:37 +0200
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
Message-ID: <20250911-glistening-uakari-of-serendipity-06ceb1@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yzr6tslhgdx3cftq"
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


--yzr6tslhgdx3cftq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2025-09-11:
A maintainer update, an out-of-bound check for panthor and a revert for
nouveau to fix a race.
The following changes since commit bdd5a14e660062114bdebaef9ad52adf04970a89:

  drm/bridge: ti-sn65dsi86: fix REFCLK setting (2025-09-02 09:56:05 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-09-11

for you to fetch changes up to 87b90cee22d8658a69c0fbd43633839b75f8f05f:

  MAINTAINERS: drm-misc: fix X: entries for nova/nouveau (2025-09-10 15:52:25 +0200)

----------------------------------------------------------------
A maintainer update, an out-of-bound check for panthor and a revert for
nouveau to fix a race.

----------------------------------------------------------------
Chia-I Wu (1):
      drm/panthor: validate group queue count

Danilo Krummrich (1):
      MAINTAINERS: drm-misc: fix X: entries for nova/nouveau

Philipp Stanner (1):
      Revert "drm/nouveau: Remove waitque for sched teardown"

 MAINTAINERS                             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c | 15 --------------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  1 -
 drivers/gpu/drm/nouveau/nouveau_sched.c | 35 +++++++++++++--------------------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  9 ++++++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 ++++----
 drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
 7 files changed, 26 insertions(+), 46 deletions(-)

--yzr6tslhgdx3cftq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMLzFAAKCRAnX84Zoj2+
dunuAXwJbxHdjpqURM+YYUhZ8Y2JJ9gZVZ07Qpeptun8xjpUpCLOJ3pcOn+dK2zG
GHtRZXgBgPxDxn/QnaDW66mHK5uqRRcNCUHf7jq8pXDg4g9LIOJFqlp0CfZJ7iJu
WupqGIyy/Q==
=F5qC
-----END PGP SIGNATURE-----

--yzr6tslhgdx3cftq--

