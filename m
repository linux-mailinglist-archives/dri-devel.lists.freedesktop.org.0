Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2FBB393CC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 08:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD5B10E199;
	Thu, 28 Aug 2025 06:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YpfCMnF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E6910E199
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756362759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7AoG9YHih5iXChLTsxRiuXwiWs4qQNPsTE1cJiG9KLo=;
 b=YpfCMnF2O09i2b8Yb2ekQiUQmSitm9Sh0/yRn1zS/xGPJrwlxCR9U3X8lg44zzf0uQ6ilV
 CppAVjnFwBHR8CFj0E9JkD8HQCHfwG7oUelv8awDZpE2A9thPwu4E14uuXEjyro+/9G7KG
 3xObdLFasWd4bJH0nCd7deFhsYFRoaM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-_3_3dgVIMbqpqzHUwv_Pig-1; Thu, 28 Aug 2025 02:32:36 -0400
X-MC-Unique: _3_3dgVIMbqpqzHUwv_Pig-1
X-Mimecast-MFC-AGG-ID: _3_3dgVIMbqpqzHUwv_Pig_1756362755
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b7bb85e90so1159145e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 23:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756362755; x=1756967555;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7AoG9YHih5iXChLTsxRiuXwiWs4qQNPsTE1cJiG9KLo=;
 b=kt/eerj6lY7Cz7B3PdYuuv2da9RKKtiSjQJMqXTFZgB1pUlxcO8b8uQU6UoaKvKvxd
 PEjb19DfzIdmXyY+Z74rjHw8bWI2Whw1O4qn1tupBiq+Ny4sRx9/D8AdHL647pFU9ljR
 MKql/5SHNTpU24t80nbRs6OU1RWi9WaIkR2EN8zdDRHJ1NR3ORcDumP7/d/LI5fsAA2y
 jZvXIRoYzcfAMNAPdBlCqopDem3zbWINebYvt6SSKxl6B6fXvu1aRza6JFPtgneqd/m8
 GH0hIjSvvdmZ6dMQBTY+bDPhzT7j/M6ageqrHhgqVhKRydo3HiOGQ9dYN5IJq9hvP1bh
 Zitg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiQ88gWr/VyGYoz9/qlJvRvozAukeNHF2aG7LjG5bwWfPb7itYtdqyujfBH54My/EzjB4XyXNdwv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPKj5Iwe8JQcQQXiYdaFuNCf3ueXOceev49VdweAcHjVyQT3/4
 xGOcQpqMPVudfBgNRixqUDRM5+Of4BSe6z6VxKRcPZPmiZk5PJjfgy9tu8GBpqAt/IHHQslTXc8
 GnNdnPy/JM3rYi+YSvqj+vMRmz3FRtdXVcF3BMIhG4PFUQ0s9HBQUbh1yGRLSXNVG84Ztgg==
X-Gm-Gg: ASbGncsJ9TW/Po77mZKILUe72oy4sDu69Us331kj3RFEZuOcIviuUTN3+N9H5Oc2f8+
 hGJtG5leMW5YMNVyu+84E4pBDbNM2XQ8h4OX9E2Uopda9aBzaPk3xiMPKnHsqBsOlOPO0S8SuUu
 xxUkCFsF+tI9l6RBoycrorgBoB3hzsOzVzHzvt5DN+URWsngnsMEK0w+kSuCLARD/EMY/6wDCMB
 Xkkvd2qXcUV0HlkmxYf0mO+BCrYtnO3z05VTVugthy4ZiBBm5lydEbbRm7QYKG0ZUSHLgC3ZqvD
 3T5QMoC+/se9deI=
X-Received: by 2002:a05:600c:c493:b0:45b:7bba:c79f with SMTP id
 5b1f17b1804b1-45b7bbaca16mr4471395e9.13.1756362754979; 
 Wed, 27 Aug 2025 23:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfmgTsZg/VX13PXkOipuoNoPe3imAyCZvKudh2VGqkUeTRG4jj92qcBhtntnqYiRsxLL3FQg==
X-Received: by 2002:a05:600c:c493:b0:45b:7bba:c79f with SMTP id
 5b1f17b1804b1-45b7bbaca16mr4471145e9.13.1756362754535; 
 Wed, 27 Aug 2025 23:32:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70e4ba046sm25390318f8f.1.2025.08.27.23.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 23:32:33 -0700 (PDT)
Date: Thu, 28 Aug 2025 08:32:33 +0200
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
Message-ID: <20250828-hypersonic-colorful-squirrel-64f04b@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xhzf22kj3z7coqpl"
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


--xhzf22kj3z7coqpl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-08-28:
Several nouveau fixes to remove unused code, fix an error path and be
less restrictive with the formats it accepts. A fix for amdgpu to pin
vmapped dma-buf, and a revert for tegra for a regression in the dma-buf
/ GEM code.
The following changes since commit 1a2cf179e2973f6801c67397ecc987391b084bcf:

  Merge drm/drm-fixes into drm-misc-fixes (2025-08-20 16:08:49 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-08-28

for you to fetch changes up to 16fdb3cc6af8460f23a706512c6f5e7dfdd4f338:

  Revert "drm/tegra: Use dma_buf from GEM object instance" (2025-08-26 10:41:27 +0200)

----------------------------------------------------------------
Several nouveau fixes to remove unused code, fix an error path and be
less restrictive with the formats it accepts. A fix for amdgpu to pin
vmapped dma-buf, and a revert for tegra for a regression in the dma-buf
/ GEM code.

----------------------------------------------------------------
Alice Ryhl (1):
      drm/gpuvm: fix various typos in .c and .h gpuvm file

James Jones (1):
      drm/nouveau/disp: Always accept linear modifier

Thomas Zimmermann (2):
      drm/amdgpu: Pin buffers while vmap'ing exported dma-buf objects
      Revert "drm/tegra: Use dma_buf from GEM object instance"

Timur Tabi (3):
      drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
      drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
      drm/nouveau: remove unused memory target test

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c     | 34 ++++++++++-
 drivers/gpu/drm/drm_gpuvm.c                     | 78 ++++++++++++-------------
 drivers/gpu/drm/nouveau/dispnv50/wndw.c         |  4 ++
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c     | 15 ++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c |  5 +-
 drivers/gpu/drm/tegra/gem.c                     |  2 +-
 include/drm/drm_gpuvm.h                         | 10 ++--
 7 files changed, 88 insertions(+), 60 deletions(-)

--xhzf22kj3z7coqpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK/4AQAKCRAnX84Zoj2+
dkEEAYDpd0YqFdGm9BGLBX+ExSDguR4FXLpIfdqxzG6EJoktzNXweJcV9HXhC2AT
waiATMUBfR2v2dsmPYo2/ACCLvLsmbz+Suzjg42Wau45mht7nnKgJaNO+SsDm0AL
2rWgo3t/4A==
=TtXz
-----END PGP SIGNATURE-----

--xhzf22kj3z7coqpl--

