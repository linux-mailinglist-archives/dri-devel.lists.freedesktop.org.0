Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319A67CBF44
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 11:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EC310E29B;
	Tue, 17 Oct 2023 09:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D3F10E29D;
 Tue, 17 Oct 2023 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pGPjSKr2a9z7nzL6c7jF87Bvkljw/AE2v5i+DT9TSmg=; b=FxWDDSb7qxfhnVPWa412vPWnzv
 o1ACT8VbTXEn/L6aD13DJR4hlAvJvky7i0NK8H5c3/Se3T4zzlIw+wcvPykLH5ELXzg9KHRVUgqFD
 ktozi8vwbGAPu2dNPiTS9VO6kY6AbSnNaFKmBBS8RrwNf2K1r0T8fqswQkNT2X/JPJSLBDSPv95wZ
 0BWVnDpOVnXAYmidKRJkqPl3gMilgTrpnMeVTv7sDdiuLdR9Lfo6T4pco9jlmSKvPWTHiRm5rDOiG
 tg8XN0LQHhJRdgwvUUYRvr3u+m9xRkyjXkn1wPEsrvla+jTcxzcBPy/fn1/PVoG0lQL9FSGEY9JC1
 HC9KCwwA==;
Received: from 167.red-81-39-185.dynamicip.rima-tde.net ([81.39.185.167]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qsgNb-001ODF-AA; Tue, 17 Oct 2023 11:28:47 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] drm: Add support for atomic async page-flip
Date: Tue, 17 Oct 2023 11:28:31 +0200
Message-ID: <20231017092837.32428-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, hwentlan@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This work from me and Simon adds support for DRM_MODE_PAGE_FLIP_ASYNC through
the atomic API. This feature is already available via the legacy API. The use
case is to be able to present a new frame immediately (or as soon as
possible), even if after missing a vblank. This might result in tearing, but
it's useful when a high framerate is desired, such as for gaming.

Differently from earlier versions, this one refuses to flip if any prop changes
for async flips. The idea is that the fast path of immediate page flips doesn't
play well with modeset changes, so only the fb_id can be changed.
Thanks,
	André

- User-space patch: https://github.com/Plagman/gamescope/pull/595
- IGT tests: https://gitlab.freedesktop.org/andrealmeid/igt-gpu-tools/-/tree/atomic_async_page_flip

Changes from v6:
- Dropped the exception to allow MODE_ID changes (Simon)
- Clarify what happens when flipping with the same FB_ID (Pekka)

v6: https://lore.kernel.org/dri-devel/20230815185710.159779-1-andrealmeid@igalia.com/

Changes from v5:
- Add note in the docs that not every redundant attribute will result in no-op,
  some might cause oversynchronization issues.

v5: https://lore.kernel.org/dri-devel/20230707224059.305474-1-andrealmeid@igalia.com/

Changes from v4:
 - Documentation rewrote by Pekka Paalanen

v4: https://lore.kernel.org/dri-devel/20230701020917.143394-1-andrealmeid@igalia.com/

Changes from v3:
 - Add new patch to reject prop changes
 - Add a documentation clarifying the KMS atomic state set

v3: https://lore.kernel.org/dri-devel/20220929184307.258331-1-contact@emersion.fr/

André Almeida (1):
  drm: Refuse to async flip with atomic prop changes

Pekka Paalanen (1):
  drm/doc: Define KMS atomic state set

Simon Ser (4):
  drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
  drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
  drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
  amd/display: indicate support for atomic async page-flips on DC

 Documentation/gpu/drm-uapi.rst                | 47 ++++++++++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 75 +++++++++++++++++--
 drivers/gpu/drm/drm_crtc_internal.h           |  2 +-
 drivers/gpu/drm/drm_ioctl.c                   |  5 ++
 drivers/gpu/drm/drm_mode_object.c             |  2 +-
 .../drm/i915/display/intel_display_driver.c   |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
 include/drm/drm_mode_config.h                 | 11 +++
 include/uapi/drm/drm.h                        | 10 ++-
 include/uapi/drm/drm_mode.h                   |  9 +++
 11 files changed, 155 insertions(+), 9 deletions(-)

-- 
2.42.0

