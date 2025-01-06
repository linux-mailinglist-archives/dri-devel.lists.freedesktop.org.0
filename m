Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2CAA02E33
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 17:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C8B10E20B;
	Mon,  6 Jan 2025 16:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bikjy1EL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0480A10E20B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736182165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=wc+S5am7KzrFLfEBnVdPYV5YpHUWiDElU/++lQC/xPE=;
 b=Bikjy1ELSBSjPkB0o8hsyo6Bd1jdcnJTA4hROkdjbpk9PBeF/fvSAQkEybafGr5Cf+zhbM
 NzJ0GwjHSnOkro8MH3FwqY2KkLDHDWo4k7BtcqY9t//jSx5nFd++TR3gADc06HzLbBXbat
 pBsgQh0/jwGg4GEWhaDh9IM91zSq+xE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-j0UkprwtNmmcxRz1heCIDQ-1; Mon, 06 Jan 2025 11:49:22 -0500
X-MC-Unique: j0UkprwtNmmcxRz1heCIDQ-1
X-Mimecast-MFC-AGG-ID: j0UkprwtNmmcxRz1heCIDQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361fc2b2d6so42739155e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 08:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736182161; x=1736786961;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wc+S5am7KzrFLfEBnVdPYV5YpHUWiDElU/++lQC/xPE=;
 b=HtwXljqyw5dLyI8frrkhawo/PztJjt4TWCVMv1Wug6yX0bBmIUo9X7vrGiDgpcpkBq
 WEZfI7V4wJyyzlP2zcfgWQgtNdvW1QLrzdoLgkt4B3VwiT2K66TjIbJiFSCGIf7lH6fA
 V+HxhIhqgffS2rFGHOytAUAm/QohhZBS0G1UNW/QHmzXZ3+2doXI/gmQlyjmUyZ3bBNG
 0WrzMRnAv2sJ4xc84ajRhWeujfUxueC/A9Aqnm3Tj2QndfXHSiVuBW2Ym0yXWSEmOwxh
 4ywoT5MSUjVc2kx8x13z71YF3RmvTEBQNltH78Vus2iXz2MVC5fYY/LGGrj0BHhCiMC2
 GHhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIk7sZfo+jq/GOgAqdDKJV5rvrZeGnVW2ZSBqQ446FtFU7a11Q2rzBKJ5lSkP1uV4JjDpJBtQ7H84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL1z5ZR1MdiYNPbKOc20BwxhpIpqT9j+yjlgz5WoUfmSzNJwd9
 DVY9aKIDLPHWys/foL0cBsCSuOMXfzbK9a7C/94H1lRS86CXsmIGB2Bt6JL9wo5Xa51cScgfy7P
 s2n0wfp3hq1EPj49uXjkG5E6I/a1gcWpGzvcuGvPYUr9M6pyIKVgv5Fht9IRsH5OSYg==
X-Gm-Gg: ASbGncuvHTouHGmDl+AFFcQSnEA5jDK8TUMVASvooREEX8W3X7I0/cg9E/orY/mYIXx
 zX7j2CfyreBjxdD2fSNrftnKa0HSOjnbrKRCoienQz0lrV1uBib563hOn6yGwgC8H1ZU78MNVSv
 NBXaE6VHdcZvm0754PlYDfvz0QaanzFtCayLZCJLQr42o3uI9Jey+BGnkWxtchKPqXCkXdIEFfy
 LYDHStOjurYQZ3uKLZAy6cPtlnwxcgV
X-Received: by 2002:a05:600c:35c9:b0:434:f5c0:328d with SMTP id
 5b1f17b1804b1-43668b4999fmr442374265e9.23.1736182161130; 
 Mon, 06 Jan 2025 08:49:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRcVmympLgSyeUS/JQoWsfW/886KWuwB6W1I7v6jo2dza+QtA+NFpor8TnqCp06dzsM2FbrQ==
X-Received: by 2002:a05:600c:35c9:b0:434:f5c0:328d with SMTP id
 5b1f17b1804b1-43668b4999fmr442374055e9.23.1736182160665; 
 Mon, 06 Jan 2025 08:49:20 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b013a1sm610927275e9.11.2025.01.06.08.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 08:49:20 -0800 (PST)
Date: Mon, 6 Jan 2025 17:49:19 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, 
 Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, cgroups@vger.kernel.org
Subject: [PULL] dmem cgroup
Message-ID: <20250106-shaggy-solid-dogfish-e88ebc@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yhsrcqc5j7lsvcd3"
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


--yhsrcqc5j7lsvcd3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] dmem cgroup
MIME-Version: 1.0

Hi,

Here's a drm-next PR for the new "dmem" cgroup Maarten and I worked on.
Given that it's only user for now is DRM, Tejun agreed to merge it
through DRM.

This is based on the series sent by Maarten here:
https://lore.kernel.org/all/20241204134410.1161769-1-dev@lankhorst.se/

The three last patches are not part of it, for different reasons:

  - patch 5: we haven't had the acks from the amdgpu maintainers
  - patch 6: I didn't feel comfortable merging a patch defined as a "hack"
  - patch 7: it's not clear yet how GEM is going to be supported, so we
    need to have further discussion on this one.

Thanks!
Maxime

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git cgroup-dmem-drm

for you to fetch changes up to aa4f9d7f77836d5a48daaa99479c2603e9a548ed:

  drm/xe: Implement cgroup for vram (2025-01-06 17:25:36 +0100)

----------------------------------------------------------------
Maarten Lankhorst (3):
      kernel/cgroup: Add "dmem" memory accounting cgroup
      drm/ttm: Handle cgroup based eviction in TTM
      drm/xe: Implement cgroup for vram

Maxime Ripard (1):
      drm/drv: Add drmm managed registration helper for dmem cgroups.

 Documentation/admin-guide/cgroup-v2.rst          |  58 +-
 Documentation/core-api/cgroup.rst                |   9 +
 Documentation/core-api/index.rst                 |   1 +
 Documentation/gpu/drm-compute.rst                |  54 ++
 drivers/gpu/drm/drm_drv.c                        |  32 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c          |  18 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c |   4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c    |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                     |  54 +-
 drivers/gpu/drm/ttm/ttm_resource.c               |  23 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c             |   8 +
 include/drm/drm_drv.h                            |   5 +
 include/drm/ttm/ttm_resource.h                   |  12 +-
 include/linux/cgroup_dmem.h                      |  66 ++
 include/linux/cgroup_subsys.h                    |   4 +
 include/linux/page_counter.h                     |   2 +-
 init/Kconfig                                     |  10 +
 kernel/cgroup/Makefile                           |   1 +
 kernel/cgroup/dmem.c                             | 861 +++++++++++++++++++++++
 mm/page_counter.c                                |   4 +-
 20 files changed, 1195 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/core-api/cgroup.rst
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 include/linux/cgroup_dmem.h
 create mode 100644 kernel/cgroup/dmem.c

--yhsrcqc5j7lsvcd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3wJjwAKCRAnX84Zoj2+
djBtAX9PBF98qdb1juGmXkvROcKeUvdTHoMwDdk7JvbEv1xL2gS7fA1WI2BRKjN+
IlMoQlsBgJ1LyOIweLBzhnuTyzDfekwIC+kFFSAAKZsPI1VY8KgD85K9ep8dMhsn
WSHsq+Qlcw==
=ey+d
-----END PGP SIGNATURE-----

--yhsrcqc5j7lsvcd3--

