Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B2A24E6A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 14:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F60310E327;
	Sun,  2 Feb 2025 13:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="Ji5IC4Py";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1989210E28A;
 Sun,  2 Feb 2025 13:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: sendonly@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 5B93B4269B;
 Sun,  2 Feb 2025 13:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1738503910;
 bh=3AvMwJ2jULJvu6H8cVIc1G7+NuSo81Y/MeyNFbPbV8I=;
 h=From:Subject:Date:To:Cc;
 b=Ji5IC4PydnxsZxDxaqzMBdWkRSyC74+bIxQs1UCGEKyTynR95nD7ygDHzTYpmsCBr
 jU51iUNuu3VzDWU+uLunEBdeXUlGs/20+/BaR96jKexDIhEO2WnfVB52HDbOKcOQqM
 MZXy687jmGWPiW+jrxj5f/tmnvbNsHiCo1J9uXic8mtMqao5kzj8lGogI7vqunzL+U
 lMMYpL3CB5y2t2eyegRjnOKZ+OSqA+7sw6s8oDBfXUwAHnJKJ6wOU24QP6oDAvJtd1
 bFASQDpb9uhDzNVc5nBzGsqLknGti8rQARaozoodEiZoVMnRzOB7AgW8ZrprbTRMv1
 qfOJcwaPLJnUg==
From: Asahi Lina <lina@asahilina.net>
Subject: [PATCH 0/4] drm/gpuvm: Add support for single-page-filled mappings
Date: Sun, 02 Feb 2025 22:34:49 +0900
Message-Id: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHl0n2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIKGbXlBalqtbnJmXnpOqW5AIVGBkamxsYpZobmJmbq4E1FdQlJqWWQE
 2Mzq2thYAixoWp2MAAAA=
X-Change-ID: 20250202-gpuvm-single-page-253346a74677
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738503908; l=2980;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=3AvMwJ2jULJvu6H8cVIc1G7+NuSo81Y/MeyNFbPbV8I=;
 b=N+BAOegpxo9UAn5W5vwEtkBj+YvWzILm1x1cmu8zmxtnc3lvtyTW+g9+kRg303d2e7RY12OKB
 fJ7OLEyFGHQDqA/Bf1+k/DzKPmhK2sTSI5HbJZj+/gUYsnzLVK2HZtn
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=
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

Some hardware requires dummy page mappings to efficiently implement
Vulkan sparse features. These mappings consist of the same physical
memory page, repeated for a large range of address space (e.g. 16GiB).

Add support for this to drm_gpuvm. Currently, drm_gpuvm expects BO
ranges to correspond 1:1 to virtual memory ranges that are mapped, and
does math on the BO offset accordingly. To make single page mappings
work, we need a way to turn off that math, keeping the BO offset always
constant and pointing to the same page (typically BO offset 0).

To make this work, we need to handle all the corner cases when these
mappings intersect with regular mappings. The rules are simply to never
mix or merge a "regular" mapping with a single page mapping.

drm_gpuvm has support for a flags field in drm_gpuva objects. This is
normally managed by drivers directly. We can introduce a
DRM_GPUVA_SINGLE_PAGE flag to handle this. However, to make it work,
sm_map and friends need to know ahead of time whether the new mapping is
a single page mapping or not. Therefore, we need to add an argument to
these functions so drivers can provide the flags to be filled into
drm_gpuva.flags.

These changes should not affect any existing drivers that use drm_gpuvm
other than the API change:

- imagination: Does not use flags at all
- nouveau: Only uses drm_gpuva_invalidate(), which is only called on
  existing drm_gpuva objects (after the map steps)
- panthor: Does not use flags at all
- xe: Does not use drm_gpuva_init_from_op() or
  drm_gpuva_remap()/drm_gpuva_map() (which call it). This means that the
flags field of the gpuva object is managed by the driver only, so these
changes cannot clobber it.

Note that the way this is implemented, drm_gpuvm does not need to know
the GPU page size. It only has to never do math on the BO offset to meet
the requirements.

I suspect that after this change there could be some cleanup possible in
the xe driver (which right now passes flags around in various
driver-specific ways from the map step through to drm_gpuva objects),
but I'll leave that to the Xe folks.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
Asahi Lina (4):
      drm/gpuvm: Add a flags argument to drm_gpuvm_sm_map[_*]
      drm/gpuvm: Plumb through flags into drm_gpuva_op_map
      drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
      drm/gpuvm: Plumb through flags into drm_gpuva_init

 drivers/gpu/drm/drm_gpuvm.c            | 72 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/imagination/pvr_vm.c   |  3 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  |  3 +-
 drivers/gpu/drm/xe/xe_vm.c             |  3 +-
 include/drm/drm_gpuvm.h                | 26 +++++++++---
 6 files changed, 84 insertions(+), 26 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250202-gpuvm-single-page-253346a74677

Cheers,
~~ Lina

