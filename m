Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF4993C5D1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 16:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7230410E83D;
	Thu, 25 Jul 2024 14:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aUUM6RDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303AC10E83B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721919544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=F5ZoSYsZGaDw2dOGbs0OwYpDKl56Fzks8qZErLXmwLY=;
 b=aUUM6RDa78YFLwKPqz8nox/EhAa71aW4CYbNdR7D0S7K6YYc6XQudNuQkLPNW67mPWx3Yl
 G5PDCDXxKB7v/QTbwVdB8VrVQYExb6nHhc16PVYX/4am5lfmxsLFAgu8Ye/w2qZRiH+CsG
 9IeqEoOM2GTlezRETVQ9+SK7a5Dh3To=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-cqqIxS3nPCKsAbtCZmpGRQ-1; Thu, 25 Jul 2024 10:59:02 -0400
X-MC-Unique: cqqIxS3nPCKsAbtCZmpGRQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3685e0df024so661508f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 07:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721919541; x=1722524341;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F5ZoSYsZGaDw2dOGbs0OwYpDKl56Fzks8qZErLXmwLY=;
 b=HiyYbRyT36juGfuDkQ3HMRDXhkaFXSq+hDqD/KDbWQBHFnlRp7EL+g6RQ5yv1mRVuC
 ouvDTTk+2rrU/QzTJVYBZfs+5LEM4d6POP7SkprviXpwIqwycxHr4Z8G2erVvZT29gGY
 I594QY+6CGsWixnToiqQzwiWiFxkd7U/x29vD/MQDDoS2xIf2RpPpoUgbUKd+IHTbfZ0
 brOGFCfNoFlFvlCDvttkE9B/Y30YAnZtj454PA5JaQ+aPZDyMKu4dW7Y0nU70cAqxQzC
 gR93wNf+LKlZCTgPAVWPtIAFrmgQ7mKZPogrp0K3rm6uKOVqm5rKrHYfeLv1hfU75wep
 gZPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu7MG1UlleYlVaNYMNgky4CwTI8E6ZPZ1hZpi4fTd6+8ndw34sw/oSg+rNudnbUW13FGXXi3NQeNGXSLzzhzY8HygDCaisk6uxEajpJTr8
X-Gm-Message-State: AOJu0YwekvRYeJ5hE6lo1wj+WGLNVmStsGl5vjN3+j+sR0uf9P+waN5v
 iXspCXkH81W00hw7UbTvnf4xAjzkuzaEpA/g0JfjABwnSU4y7yK9fhAKXt5ifvOcFZYxxQWDvjv
 E73N7JqkT1AsCDPoBB8LwFxb2LveKOERq7/iVUjudhpxEj7IbbqYUESAOByJJphSCVg==
X-Received: by 2002:adf:fc8d:0:b0:367:926a:7413 with SMTP id
 ffacd0b85a97d-36b3664af5cmr1550885f8f.63.1721919541183; 
 Thu, 25 Jul 2024 07:59:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+NVPsJdjWpOoZv9kl75pyyXyS6KI24cjaV3bYhAWPCMWcUU5fAEb2n3xEHhHtR6Unbf0Pjw==
X-Received: by 2002:adf:fc8d:0:b0:367:926a:7413 with SMTP id
 ffacd0b85a97d-36b3664af5cmr1550872f8f.63.1721919540858; 
 Thu, 25 Jul 2024 07:59:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36858229sm2511373f8f.82.2024.07.25.07.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 07:59:00 -0700 (PDT)
Date: Thu, 25 Jul 2024 16:59:00 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <20240725-frisky-wren-of-tact-f5f504@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="djddhsk7xnue6mdo"
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


--djddhsk7xnue6mdo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-next-fixes PR

Maxime

drm-misc-next-fixes-2024-07-25:
A single fix for a panel compatible
The following changes since commit 1fe1c66274fb80cc1ac42e0d38917d53adc7d7a3:

  drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later (2024-07-15 12:49:52 -0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2024-07-25

for you to fetch changes up to b6f7d984ebf826069d3dc6fa187b4d1cfb90f965:

  dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01 (2024-07-22 08:40:32 -0700)

----------------------------------------------------------------
A single fix for a panel compatible

----------------------------------------------------------------
Stephan Gerhold (1):
      dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01

 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--djddhsk7xnue6mdo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqJoMwAKCRAnX84Zoj2+
dv3wAX9uhXuJHQ99wQ/RUjs48BI39MRvUD2V8xthlvqYprxbUUb3kLaKYAkzaO0q
/0QTIfMBgIzD+UyFxrDtQgHD6C6XXvUe8D3T8PwK5N1czxywG3y//5cROWj35J+D
itUZryZOvg==
=oso5
-----END PGP SIGNATURE-----

--djddhsk7xnue6mdo--

