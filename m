Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3424B9EEAC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0278810E8DA;
	Thu, 25 Sep 2025 11:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c6+H2knA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530C210E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758799962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kFv74pBfRMr2qCPt0l0SB2V204hWIgxWND1WkuVXrJU=;
 b=c6+H2knAa4E+oMPcoaLtJsMBlz8G26Hfc174PQ/OOng0maxGPLfHx9JrlpEOru5dMerlre
 6OlzLZBiC/KXMkYH1U43BoNnifKtqOn5B4ytL86c377oOYp3uCmnAmQ8UGGeNAppW0AOvQ
 rvsCKrIDVs7CimeYZDpAZs52iChc1a0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-MPGfwGgHNM2gAiUMQdKp6w-1; Thu, 25 Sep 2025 07:32:40 -0400
X-MC-Unique: MPGfwGgHNM2gAiUMQdKp6w-1
X-Mimecast-MFC-AGG-ID: MPGfwGgHNM2gAiUMQdKp6w_1758799959
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b35543aad5cso68345166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758799959; x=1759404759;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFv74pBfRMr2qCPt0l0SB2V204hWIgxWND1WkuVXrJU=;
 b=v7OPfIwjCVF++qIA2Fnk2it9Mbt3CQQV4HkMXQYJPqRsPvzi+wMYhOOSsOLTIDX1s5
 39bjCXyCFk7lzOCVIY4AN/YO7aywrZ+1x07p9tQBuoLXeirr5nLJdiKVkjxY25gaua2w
 ANmwtNLJy2++hVauE3l22NRtDr2SHk5c3qo68IE8s18AqdDpdW9+wwgIVAeCXIo8Lgas
 DJNcIpAgUcSiMkl0vNYViN7LcQix1145TMRhtfCd/LE3apA0KK2S/3Vc+SdpVVO1m/qB
 FLtYiCuV5lPNFZacbrqofyHxQQaVUGpKs0XNFzYLg9uEfgOhvc3R8PLNChg1SYN5t46h
 RQkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1lHpTXIWzXRVVq5nip8y/X29yrhPzhIAosHTRNjhjFNNxg/qXaKgw4awm0kgu0Tbv8ax4kCyd/Lo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOaxgTpk1vZJzyKR6oTHCmT0gvj1rInEkDwKWM0JYj039SIXIO
 sxz4STn04K/F34gKoY4ry95ihPUGlRJwWPGTUaO3A1z1Q4H+qbqamgn8k0jymCLtgd5L4jxh/6C
 y02K/CPtBwUoNokmTzSqVGwMdNG7KqRb3TF0thF60jTZQBJbKZisehkbqb23P/nB1V10IIg==
X-Gm-Gg: ASbGncvuGdgoNqrFXMNTA26nMiIGTSe4wAmq2d1abKOSbqm76i6tZ4Nk0Ej0CdsdKfk
 iIzmZGa6W6+rd3FVQJZSqrCfUa/CuYBV8OmvCxcya51eUautMxOtYPxSa4rqhTcVPlgxridTyCp
 sT4YQc5WnXwM8iS6ILvvlGI0fdptRnF4r0HsKWmuj3u+gAkNAhxp70UaiFFk9AnwIpy8qHEemUt
 Dmuo3iM3fuoBjzzkkf5KK7+ks8UH/x/uk65bf5Nc1akOZ5UVYP3uEtYt+KKK1ixjwpgSzVg47ar
 3osdTWlUj5azPdb/kavHeTZXvBTXd8Xf6Q==
X-Received: by 2002:a17:906:d551:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-b34b79c4ae3mr386841366b.20.1758799959471; 
 Thu, 25 Sep 2025 04:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZgWMmzy6juhvrotqBZlm+9jnOTs4oG8dGNxI5H/X2CKmcxlyf+PhKOIk8QUuIAXoQrwrY9Q==
X-Received: by 2002:a17:906:d551:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-b34b79c4ae3mr386837866b.20.1758799958975; 
 Thu, 25 Sep 2025 04:32:38 -0700 (PDT)
Received: from localhost ([212.133.41.95]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d2f92sm145962966b.18.2025.09.25.04.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 04:32:38 -0700 (PDT)
Date: Thu, 25 Sep 2025 13:32:37 +0200
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
Message-ID: <20250925-smilodon-of-luxurious-genius-4ebee7@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sxaqkjm62xtemvdl"
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


--sxaqkjm62xtemvdl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-09-25:
A CPU stall fix for ast, a NULL pointer dereference fix for gma500, an
OOB and overflow fixes for fbcon, and a race condition fix for panthor.
The following changes since commit 288dac9fb6084330d968459c750c838fd06e10e6:

  drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path (2025-=
09-16 15:42:35 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-20=
25-09-25

for you to fetch changes up to 7d9c3442b02ab7dd3c44e20095a178fd57d2eccb:

  drm/panthor: Defer scheduler entitiy destruction to queue release (2025-0=
9-25 09:52:03 +0100)

----------------------------------------------------------------
A CPU stall fix for ast, a NULL pointer dereference fix for gma500, an
OOB and overflow fixes for fbcon, and a race condition fix for panthor.

----------------------------------------------------------------
Adri=E1n Larumbe (1):
      drm/panthor: Defer scheduler entitiy destruction to queue release

Nirmoy Das (1):
      drm/ast: Use msleep instead of mdelay for edid read

Samasth Norway Ananda (1):
      fbcon: fix integer overflow in fbcon_do_set_font

Thomas Zimmermann (1):
      fbcon: Fix OOB access in font allocation

Zabelin Nikita (1):
      drm/gma500: Fix null dereference in hdmi teardown

 drivers/gpu/drm/ast/ast_dp.c            |  2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c  |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c |  8 +-------
 drivers/video/fbdev/core/fbcon.c        | 13 ++++++++++---
 4 files changed, 13 insertions(+), 12 deletions(-)

--sxaqkjm62xtemvdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNUoVAAKCRAnX84Zoj2+
dumUAX9lV0ZT9PhBCt/7HbuFDGWz1GjdcASrjCUA7dFCAYXuwg4xGMx2T7156qRU
5iaFvpgBgJ5QP8EjpZ6dm4gdwF8s/WFxmoPw4QAeua/rrkYQi394ZqAs72kVLYc0
RKUq27yqMg==
=N1yG
-----END PGP SIGNATURE-----

--sxaqkjm62xtemvdl--

