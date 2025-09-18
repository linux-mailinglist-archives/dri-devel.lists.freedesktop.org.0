Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24BEB83827
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 10:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E5210E670;
	Thu, 18 Sep 2025 08:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="in5MAObJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3310E679
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758183875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=m4QsnAy0CzPIurKifptNo9f10B6Yy9sbvMq/EE+hd9g=;
 b=in5MAObJqviSMD35gAAgBXklh6kLkhC2u/RXIFlxcyylzhdzlnyq6DjxKQM1JoIyrXd+YW
 5Gt/rdd8Mq5eQqlNIYIuZXo75bm6Aqe8ixTbiSeFM0HtfKoMtyOrqe/e+To0n2vYObGU0l
 BtBzlvq5llWGXXunC0pbRkFAomJuZmE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-LOJ1Tah7Piy_TBG2L51hxw-1; Thu, 18 Sep 2025 04:24:28 -0400
X-MC-Unique: LOJ1Tah7Piy_TBG2L51hxw-1
X-Mimecast-MFC-AGG-ID: LOJ1Tah7Piy_TBG2L51hxw_1758183867
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3e40057d90aso329596f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 01:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758183867; x=1758788667;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m4QsnAy0CzPIurKifptNo9f10B6Yy9sbvMq/EE+hd9g=;
 b=hWNLcJGp9G4X8WwgIH13E1MJ3s2TtkpBT7rtxmec2UvA6lKZeeMCtrVFrhJ62tck2T
 b2wp6HW44bML5Zrqz7Vaqvh53ILQ+PW9608akvqlpWsXx9CBFlVpz27CNVuZxML0Rp4f
 Ed3s121so8xvG3sguSYh3ybziFYbTNDRmI8jUsPvewuDuZKx6o7ZH4Oe3RvE+kQOUBIh
 pFr8wARin+ks3XeG2M8WUBPSGZBMMFlc3gLmP02hAtDh1UIY4qrANBgObp3y96TgOX19
 QzDSNUfD7r5GudTkrf3oM4pBNGal3UoL8NXfJX1M6wfqLgqiaT5+TEs5FQOfYfkUeHEJ
 ojvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNbDJCjrbxcoJ+dq0rVSheRNuo6iIdC1YUTAPB+xUYRU+o+Dwag8CWZl+nFYs2/s3+Gz16IQhxtdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy93PQ2zT29V4pyNaZXdhBjp1WaORWU5uiKrevQ6EY/g39lkyqk
 /AaceSj3cukEUn83ed4eWmygMPbRmTDoR+vNQlbfA8UN6qe24Q5Ot2OuvlG+CNCP1fWnxr6CVgs
 eKEc8ZglCm7xHPVRutaF1ulGMsa4U8c45pmmFww9SMrOPx+qaoyEG22337WzbR0g/Wk/FOQ==
X-Gm-Gg: ASbGncuDqQQuH4InjJw+bvLWCvFft8/gE/CsLQYiTN0P6AF8DIV1xUWRNdplB1qSjoC
 aCGjWkG8K73d3Q39T5okRjjmYHgONOC59vLy/0T31dq/+80svGX7rJNmTyzcNxCnF6yfY49M71S
 AxBMpEitAauTOH97eqccp8bioFCsAX7LsAHYoZiGEetU0M4vbljNue6iuXWn+u1zvKQ5+cbNJmI
 toflm8VNUH0HVUwwsNMHxuyYjrARO1EeK1BUO6u45Oz1yzh9ymwB+2z4EGgdL4rGs86TyP1XW5S
 PHmLP0mBkr9EbKU=
X-Received: by 2002:a05:6000:2082:b0:3e7:492f:72b4 with SMTP id
 ffacd0b85a97d-3ecdfa32db4mr4244280f8f.42.1758183867148; 
 Thu, 18 Sep 2025 01:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYe2Jq3iqw8F9GXKxw65z82I8UIpwQPICcX60KJ6ApCZS9tT/esEJmwGmUgclQPs2SSFJotw==
X-Received: by 2002:a05:6000:2082:b0:3e7:492f:72b4 with SMTP id
 ffacd0b85a97d-3ecdfa32db4mr4244253f8f.42.1758183866726; 
 Thu, 18 Sep 2025 01:24:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf0a4fsm2508947f8f.52.2025.09.18.01.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 01:24:26 -0700 (PDT)
Date: Thu, 18 Sep 2025 10:24:25 +0200
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
Message-ID: <20250918-orthodox-pretty-puma-1ddeea@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wdhgzu7qjyuhxmnh"
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


--wdhgzu7qjyuhxmnh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2025-09-18:
One fix for a documentation warning, a null pointer dereference fix for
anx7625, and a mutex unlock fix for cdns-mhdp8546
The following changes since commit 87b90cee22d8658a69c0fbd43633839b75f8f05f:

  MAINTAINERS: drm-misc: fix X: entries for nova/nouveau (2025-09-10 15:52:25 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-09-18

for you to fetch changes up to 288dac9fb6084330d968459c750c838fd06e10e6:

  drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path (2025-09-16 15:42:35 +0200)

----------------------------------------------------------------
One fix for a documentation warning, a null pointer dereference fix for
anx7625, and a mutex unlock fix for cdns-mhdp8546

----------------------------------------------------------------
Bagas Sanjaya (1):
      Revert "drm: Add directive to format code in comment"

Loic Poulain (1):
      drm: bridge: anx7625: Fix NULL pointer dereference with early IRQ

Qi Xi (1):
      drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path

 drivers/gpu/drm/bridge/analogix/anx7625.c           | 6 ++++--
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
 drivers/gpu/drm/drm_gpuvm.c                         | 2 --
 3 files changed, 8 insertions(+), 6 deletions(-)

--wdhgzu7qjyuhxmnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMvBuQAKCRAnX84Zoj2+
dl7eAXsHsMz9cZz0PGMyw6QlgzVO7Yax29AChzX2IlpQFbnleD08azc4XzRpHJGN
G96LxRwBf3Qq2QQ5ALZIKO6rrrUtUIDNihWGQGPLxGScCZbsr0WSXS55Btu/7yHq
32HKoYFHkQ==
=0j7j
-----END PGP SIGNATURE-----

--wdhgzu7qjyuhxmnh--

