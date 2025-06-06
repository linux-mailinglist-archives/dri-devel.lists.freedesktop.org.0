Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B9AD0042
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 12:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BC410EA31;
	Fri,  6 Jun 2025 10:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VP62uLUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4831A10E029
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749205118;
 bh=JoLmlchgqzRbuvnYoN4mB4181K1fAN2PzhJvcNwiH2I=;
 h=From:To:Cc:Subject:Date:From;
 b=VP62uLUmHlcnDK+eeckZfaeiKeVmY3t0s4awAky7oUud7g0U2ACY/9gtQwM3fsAaz
 a443ojdCkcfdKquZ9Ch/Y1FCtSHYrhvITLKCHcsCKX74IfMFC0vT06lO+kN12qVQoZ
 oZoWkb9bHMPBrOsnRwKpVo8dnTIzCwKIsB4ydsV39CqOku6mObpqNOMsz27qT3Vlq7
 78I+eMQmhHNXExKMf7WFPLT6h3UXtXfgIFmGziAVyMkGlwkjgfqjNJ4RCmcY//Mt4j
 62djUHiQ/CMWMjuF4FSWfXiFy2ZFLvLFlhuYD+bMQxPLv/iT2dERqgymsDXjEOvPFn
 e521KYm862L+A==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A8AC17E0C99;
 Fri,  6 Jun 2025 12:18:38 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v5 0/2] drm/panthor: Add 64-bit register accessors
Date: Fri,  6 Jun 2025 12:18:33 +0200
Message-ID: <20250606101835.41840-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all,

This patch series adds support for 64-bit and poll register accessors in
the Panthor DRM driver and performs a cleanup of the 64-bit register
definitions.

The first patch introduces new accessor functions to simplify and
standardize 64-bit and polling register operations. The second patch
refactors the existing 64-bit register definitions for improved clarity
and consistency.

v5:
- Rebased so I can apply cleanly with dim b4-shazam

v4:
- [PATCH 1/2]:
  - Fixed missing check against mask value in PWRTRANS register polling.
  - Removed panthor_gpu_read_timestamp() and
    panthor_gpu_read_timestamp_offset() in favour of direct register
    access as they currently only serve as wrapper functions.
- [PATCH 2/2]:
  - Updated the register names inline with the removal of the two
    timestamp functions.
- Picked up Rb tags from Liviu and Steven
- Link to v3: https://lore.kernel.org/dri-devel/20250411164805.2015088-1-karunika.choo@arm.com/
v3:
- Picked up Rb tags from Boris.
- Link to v2: https://lore.kernel.org/dri-devel/20250411151140.1815435-1-karunika.choo@arm.com/
v2:
- Updated padding of the poll functions as requested
- Removed *_HI register definitions and renamed *_LO registers
- Link to v1: https://lore.kernel.org/dri-devel/20250410163546.919749-1-karunika.choo@arm.com/

Regards,

Boris

Karunika Choo (2):
  drm/panthor: Add 64-bit and poll register accessors
  drm/panthor: Clean up 64-bit register definitions

 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    |   4 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 159 +++++------------------
 drivers/gpu/drm/panthor/panthor_gpu.h    |  12 +-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++---
 drivers/gpu/drm/panthor/panthor_regs.h   |  90 ++++---------
 7 files changed, 157 insertions(+), 222 deletions(-)

-- 
2.49.0

