Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B55992E749
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 13:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A9A10EA2F;
	Thu, 11 Jul 2024 11:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fa8a+LOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E6410EA2A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720698206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MofSZeDyVzWkqGzbXdelFG68l2ucBKWV0CSSC6YMCJU=;
 b=fa8a+LOZAKIO0UNOqbyCtH36v8c6lu8llHALMn1lWv71aDOlLJWWrHI9+7DnzDj6mMMbUb
 hRxDY9jDNv9hLAaIAyS6NHqyly/Xhgi4MhcgrSB4PaYkuUsgCqThjesEw/L5rqfCHXJvXK
 Jb4tmcVJ8TQe9Teq2uquD8Z+L/QuF4Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-6VKevYY3Myu3b8MjNaMEcw-1; Thu, 11 Jul 2024 07:43:24 -0400
X-MC-Unique: 6VKevYY3Myu3b8MjNaMEcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-426724679f0so9611775e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 04:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720698202; x=1721303002;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MofSZeDyVzWkqGzbXdelFG68l2ucBKWV0CSSC6YMCJU=;
 b=NN6Uq6Dlxs9dMGW6J4hrhypzYpS0xYOs3HVhXxt/kk5IaERdMsBtNBin/+26dilc5O
 ROHwFKjd7zQ47x+nXo9PegZ2QCrg7A04ACELLb55R3MU564hYdBS7WYGMycett0xYTCZ
 0FLUkO13SXPiuQ0DZ45TQfjXjz3dVLF6AhizfTbWslrVYfSXEMHWPVzwH6AsUDEUg1DA
 jpwNrlvd0gdxS/iGugYqIpZiSTLFTIANjejinCWkUnZ+GqaGxUJGIivZHbcc2LqpiwTt
 7b521aOWdGW3+PVv8A3YdOq5KkO7cygmbvGFjR+gcWbdr5kzqtTNijS5VmDLMxoef3P4
 770Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa++5PkmWyQgTslD28G+LEeN4AVSfI8N+vRXi7lr7w8n1ANnBKqlhmFOH1Zgjr9rxtxSFsU/nHIRGqDikQJE0gWns94PRMHv3Of8Ckml9i
X-Gm-Message-State: AOJu0YyoRvnKqWmthOIOpXKznKaL2ETtcPxbWrzUOYnrpWp04UflrgrA
 cj2g6DN424m74dxg62JWUauYPgFzdA0NAoaqwLla4CBmHQeq2o8AU7Y223XzI8tHY/n5IM+W0A4
 ENnKHrn46P6Q3sOzWxy4tYxxyUfpCrZ2l2WucgJExs51JWqjJ/2bbIh2AeEsXyHMMRw==
X-Received: by 2002:a05:6000:e86:b0:367:8e63:4da4 with SMTP id
 ffacd0b85a97d-367f04ca2d7mr1970131f8f.14.1720698202613; 
 Thu, 11 Jul 2024 04:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKWwK9mQfjAxuy6d/Q76G5tEr15S1eUj7ecFAczGH+5nB4lofGO2HqY2Y+hF94BBlR5S5EPA==
X-Received: by 2002:a05:6000:e86:b0:367:8e63:4da4 with SMTP id
 ffacd0b85a97d-367f04ca2d7mr1970113f8f.14.1720698202132; 
 Thu, 11 Jul 2024 04:43:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f737b1bsm116663935e9.32.2024.07.11.04.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:43:21 -0700 (PDT)
Date: Thu, 11 Jul 2024 13:43:21 +0200
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
Message-ID: <20240711-benign-rich-mouflon-2eeafe@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dzmsejr4sz47r6mw"
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


--dzmsejr4sz47r6mw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-next-fixes PR

Thanks!
Maxime

drm-misc-next-fixes-2024-07-11:
A fix for fbdev on big endian systems, a condition fix for a sharp panel
at removal, and a fix for qxl to prevent unpinned buffer access under
certain conditions.
The following changes since commit 896868eded124059023be0af92d68cdaf9b4de70:

  drm/panthor: Record devfreq busy as soon as a job is started (2024-07-04 09:29:55 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2024-07-11

for you to fetch changes up to c537fb4e3d36e7cd1a0837dd577cd30d3d64f1bc:

  drm/qxl: Pin buffer objects for internal mappings (2024-07-10 09:12:42 +0200)

----------------------------------------------------------------
A fix for fbdev on big endian systems, a condition fix for a sharp panel
at removal, and a fix for qxl to prevent unpinned buffer access under
certain conditions.

----------------------------------------------------------------
Douglas Anderson (1):
      drm/panel: sharp-lq101r1sx01: Fixed reversed "if" in remove

Maxime Ripard (1):
      Merge drm-misc-next-2024-07-04 into drm-misc-next-fixes

Thomas Huth (1):
      drm/fbdev-dma: Fix framebuffer mode for big endian devices

Thomas Zimmermann (1):
      drm/qxl: Pin buffer objects for internal mappings

 drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c |  5 -----
 drivers/gpu/drm/drm_fbdev_dma.c                        |  3 ++-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c        |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c                      | 14 +++++++-------
 drivers/gpu/drm/qxl/qxl_object.c                       | 13 +++++++++++--
 drivers/gpu/drm/qxl/qxl_object.h                       |  4 ++--
 6 files changed, 23 insertions(+), 18 deletions(-)

--dzmsejr4sz47r6mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZo/FWAAKCRAnX84Zoj2+
ducuAYCQ2yxTQEAVBbW1pjLEqLM8ZqWbhUe30yZe+1K91x/U9fSYGnmsfeWpJYHh
VsiVNBgBgMVRP82CcCt7Cp2HFfHXl/enrvZaYvJUDetm3ZbnGwAT5TGqbefXGok6
phXB4NyL4Q==
=SiwA
-----END PGP SIGNATURE-----

--dzmsejr4sz47r6mw--

