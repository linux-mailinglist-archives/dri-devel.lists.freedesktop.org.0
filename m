Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D7A08ADA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE5710F022;
	Fri, 10 Jan 2025 09:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VGzneozC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF6610F022
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736499769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=4WOJ3w75jtY5Q6TYGw/iqmA+q/AkMXTEBxiFCrQsJ1M=;
 b=VGzneozC4FQjFL9ZLZr9hF8Ub/+Dy1MTfIrZmJtS2WCW4y1QQW98hDQ4UOsjTzpvRBCENN
 7Qrf438Xbm2ElRK3i5MvwF+fzqiWSARfIt2WcD2g9JJD2vFZjGmh/PMQqqz++16tXfxWqf
 aSqIffoWjSL53+pjlla1D1cx0zaLu20=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-AM5LvpxWPWiFXajRqXQ3iA-1; Fri, 10 Jan 2025 04:02:47 -0500
X-MC-Unique: AM5LvpxWPWiFXajRqXQ3iA-1
X-Mimecast-MFC-AGG-ID: AM5LvpxWPWiFXajRqXQ3iA
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4359eb032c9so14517325e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 01:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736499766; x=1737104566;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4WOJ3w75jtY5Q6TYGw/iqmA+q/AkMXTEBxiFCrQsJ1M=;
 b=M/NG1ESarrMaP6myYUugXYdHiUOzPRRLboTy0zrhtrfR3+p1BWh7h8N/43oZcQh3vj
 A2vWyY9xlBaQcBVAzSJEJZPkbfU4dxxOLm8k/96Aj6MbyQXs/LF/IcuAnec38+dSxcwE
 OpeM00v5VApKlipi+1sOdTbcbtoaSU8JVSHfeAeAZdOEIzA2HvZNZxAvrKE7YowtQ7Pe
 y4HG90VSvy00MWwrhoXg8w9oot8JwDEw9fJ/37NGpS+r2YBhgXxCd6sMcfE6n/DQ6bik
 UVCddszI99683f3p9FtBr2EOe9/1BxLFSyzcK9ufm4PzCTQcWj1jlNqpws8G4vY60sPS
 pdqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHNVm+LSP0b+S1ZsuVHMwe+XLtm8qwl3ORxpBpCwalzIgMUKISvjuXDGpFxxmA3YdhICljWL9c0DI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc0sMHpC5fS1rWiwYqowpeI92w7R7PhsychKB+FqQq2KVynhZQ
 eg0/km2KugGluC+6a4Fb7C4GT2XcITXKhD0q65viHndHb1JIjfUNkCoWUuKUlmVMSavPKmUijbN
 Ir1TrVLvRAb4WLUw9KmY5u+8c3GgipI49rPP3TAEli7j+m3Vb/SaqyVWbVyf9j+vSTA==
X-Gm-Gg: ASbGncuuFZ5wPdg5ycz8gjvf5EpwoO+z/WGI7ypcZWUqibmte9Ph6VBkqTEKPkS8D2/
 +j3R1MaTIi6+v33+k1iQ+jp+euan9Pwf2qqd1yOVtT2zAV4WQhkMVz82XJF/4k7pQp2vhRyh8aH
 PbWm+GX97pee0SmWgDTKuXbaXglaQxHtmLuY78OBZ3y+OoW17PzH012zdxYnJ/I0KYD8Zn3Poen
 8Aky6bHITshqva+olPmdPXqwtE6NmtG
X-Received: by 2002:a05:600c:a07:b0:434:a815:2b57 with SMTP id
 5b1f17b1804b1-436e27082e1mr87034585e9.20.1736499766382; 
 Fri, 10 Jan 2025 01:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2FpLNTlrXyxku0NvMBalD8uzV6r0w5RKPxtBo9lxq1ygqDJg58aVsONODuy+3Q6te4eRsmw==
X-Received: by 2002:a05:600c:a07:b0:434:a815:2b57 with SMTP id
 5b1f17b1804b1-436e27082e1mr87034195e9.20.1736499765925; 
 Fri, 10 Jan 2025 01:02:45 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddd013sm81245515e9.24.2025.01.10.01.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:02:45 -0800 (PST)
Date: Fri, 10 Jan 2025 10:02:44 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, 
 Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, cgroups@vger.kernel.org
Subject: [PULL] dmem cgroup, v2
Message-ID: <20250110-cryptic-warm-mandrill-b71f5d@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3fa2kwnpd5jjbtlo"
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


--3fa2kwnpd5jjbtlo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] dmem cgroup, v2
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

This new version was asked by Dave to fix a warning introduced by an
uninitialized variable, which has been addressed.

Thanks!
Maxime

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/cgroup-dmem-drm-v2

for you to fetch changes up to dfe6aa163c3b3780add4392d93b686b399ceb591:

  drm/xe: Implement cgroup for vram (2025-01-10 09:54:50 +0100)

----------------------------------------------------------------
DMEM cgroup pull request

This introduces a new cgroup controller to limit the device memory.
Notable users would be DRM, dma-buf heaps, or v4l2.

This pull request is based on the series developped by Maarten
Lankhorst, Friedrich Vock, and I:
https://lore.kernel.org/all/20241204134410.1161769-1-dev@lankhorst.se/

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
 drivers/gpu/drm/ttm/ttm_bo.c                     |  52 +-
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
 20 files changed, 1194 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/core-api/cgroup.rst
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 include/linux/cgroup_dmem.h
 create mode 100644 kernel/cgroup/dmem.c

--3fa2kwnpd5jjbtlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4DiNAAKCRAnX84Zoj2+
dtsTAYDPJhsY75AuDCrZSIfvGZ1VCyYlrWWSmdkoVatZwPxh47MzdmvoR9Pq7Gvd
F2w4MToBfitymaCigHlfK7D/5lDvKdgkb/4MZIMmxNut7zKY5CszyBfKcC2+sTVR
mdDOn/BldQ==
=wX7Z
-----END PGP SIGNATURE-----

--3fa2kwnpd5jjbtlo--

