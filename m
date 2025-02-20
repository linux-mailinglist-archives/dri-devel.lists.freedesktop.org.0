Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5801EA3D332
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 09:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027FB10E4A8;
	Thu, 20 Feb 2025 08:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jLzj6cau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB0E10E8DE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740040209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=FkLw1vmgQ7dtdgPJ1UHXPdMfhD6ZeaEzB3pGWQTdiPI=;
 b=jLzj6cauumzalxR75ukZAuKBXQiKEpfLl71HmgnszL6df5e4m9kHpBYgEAAgLkyMVvDjVo
 xTnMSoJ6iUoWgK6+FQaqTLk3lvkS/pDg6tM3YAv8uqojcK5si5Fp7kqsNhkpc1kho0Ud7i
 a+bolskYN9WYV+thaQpfMIvvyMgmH1E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-8AX-qgM9Ney6mh5CUkFvAA-1; Thu, 20 Feb 2025 03:30:07 -0500
X-MC-Unique: 8AX-qgM9Ney6mh5CUkFvAA-1
X-Mimecast-MFC-AGG-ID: 8AX-qgM9Ney6mh5CUkFvAA_1740040206
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f29b4d4adso281673f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 00:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740040206; x=1740645006;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FkLw1vmgQ7dtdgPJ1UHXPdMfhD6ZeaEzB3pGWQTdiPI=;
 b=a+Qy7b1SCHbZuxSYobiwLw4/h7WvhdOxkWtkr/c1mjM3Heo6/t4nGGl4dZ8eZEmnin
 UPzU8cdRfolZrZR3zDkyODDRJHRpaLTMq2zJH6ray9hckX9vCxggOhXysqtnB8jlcQt4
 /O8zIWJnKS/dJOvYn+Aiq7CqhmZobf4Y0RBt8lXQsREC64NTuTziVit5ofXmbbz1r8RM
 YxB4tcXFAIuDXnTRU5gQucw6rbggVB7D1HRktZw12YyuZyBHtbeyeSLaQyMf/4qgXv1f
 qUj030BuUlTZQC1DYlZPsNHKDXKkxyglNGF8izIGeprUs5+Zv/m4x9eNvtZssjmcmdVo
 M2Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0Ek3F7ggsxojAyMiu28lueHEq+i9VcSxW0Ct2MDRlIv1CBaHEkycvn+SYkVpYrU0dPlPu/Gb6ki0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbq+jENVr9AxfelpG3L4DNyl5uBNxMzKUl8R1rLPypycVWcEc6
 fq9HgK7wO7mpu67EluzcZmdpzqE8shqJFlbNFiVHLYnGEDj3Twcv5vhDIKA8Nk8PM8RVGpGgr+D
 SFzW7r0C0JShH5E5e4ccHg0I9eBgPu22ZXRafqnygWWqAQEsJWaOUp3RyZMepuCLNAg==
X-Gm-Gg: ASbGncs8fxfr0Dj+XIlWpHSDxdpOckD3wSGUZ2R5r7DNBER5HMFvWjrF0Mgw2KteozE
 jh+kk4AytEXDhEzgu5BR3K33S8g/h8kypZLmVSNZxMG/bH13J8LvLwgCIeqBsTvlybfD1uIEX/C
 GW6x4QY6WR0H3Ex7Bos8zJNGgnsiuUYmPzH6Bx06iKHcVQOE+2luuBozU6L/7s82BFcqU5vOx3x
 +tHZIR0b62CLoxaCToC69BFmCIphd31B+Ru4BthRhuYOf988lc+NV0Z
X-Received: by 2002:a05:6000:1f88:b0:38f:31fe:6d23 with SMTP id
 ffacd0b85a97d-38f650f1026mr1102935f8f.23.1740040206386; 
 Thu, 20 Feb 2025 00:30:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWe4dn/vMvUAlPK6coZSzvXwdBlz74zEXtytT7szYDy88V3WgwxDv+rQTmR53uaULnwnf4Aw==
X-Received: by 2002:a05:6000:1f88:b0:38f:31fe:6d23 with SMTP id
 ffacd0b85a97d-38f650f1026mr1102876f8f.23.1740040205927; 
 Thu, 20 Feb 2025 00:30:05 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f64b0f565sm1082572f8f.51.2025.02.20.00.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 00:30:05 -0800 (PST)
Date: Thu, 20 Feb 2025 09:30:04 +0100
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
Message-ID: <20250220-glorious-cockle-of-might-5b35f7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ej76au2ish3ar7gs"
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


--ej76au2ish3ar7gs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-02-20:
An reset signal polarity fix for the jd9365da-h3 panel, a folio handling
fix and config fix in nouveau, a dmem cgroup descendant pool handling
fix, and a missing header for amdxdna.
The following changes since commit e00a2e5d485faf53c7a24b9d1b575a642227947f:

  drm: Fix DSC BPP increment decoding (2025-02-13 10:20:30 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-02-20

for you to fetch changes up to 838c17fd077e611b12c78feb0feee1b30ed09b63:

  accel/amdxdna: Add missing include linux/slab.h (2025-02-19 09:42:17 -0800)

----------------------------------------------------------------
An reset signal polarity fix for the jd9365da-h3 panel, a folio handling
fix and config fix in nouveau, a dmem cgroup descendant pool handling
fix, and a missing header for amdxdna.

----------------------------------------------------------------
Aaron Kling (1):
      drm/nouveau/pmu: Fix gp10b firmware guard

David Hildenbrand (1):
      nouveau/svm: fix missing folio unlock + put after make_device_exclusive_range()

Friedrich Vock (1):
      cgroup/dmem: Don't open-code css_for_each_descendant_pre

Hugo Villeneuve (1):
      drm: panel: jd9365da-h3: fix reset signal polarity

Karol Herbst (1):
      MAINTAINERS: Remove myself

Su Hui (1):
      accel/amdxdna: Add missing include linux/slab.h

 MAINTAINERS                                      |  2 -
 drivers/accel/amdxdna/amdxdna_mailbox.c          |  1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c            |  9 ++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c  |  2 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c |  8 ++--
 kernel/cgroup/dmem.c                             | 50 ++++++------------------
 6 files changed, 24 insertions(+), 48 deletions(-)

--ej76au2ish3ar7gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7boDAAKCRAnX84Zoj2+
djlZAYDRWB/eU3jG1AGXcUwRjWNjXcdBLXybwk5Iln3U8cxwsE9vCR8cE0Iy4wWh
Wktc2T8BgLD8z8DWsOo4V72o6jSQdZXQl8uO4MxpEjctfXILwPUDLvIhEn6d6Emg
k+Pb72oimA==
=AiuH
-----END PGP SIGNATURE-----

--ej76au2ish3ar7gs--

