Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4609EC346
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 04:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6151B10EA4F;
	Wed, 11 Dec 2024 03:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IuQZbhcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6C810EA4F;
 Wed, 11 Dec 2024 03:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+f1nfrUYcs1wSQhhCmsy52L607zRZwkgSeCEyoxcG8Q=; b=IuQZbhcY43mPZuHRZgEmA67lN5
 MjELu5RzmKigWNbWZApCcxPGdw6+D719bPVZ6fHk5y968JkEly+FI+0xEdrrzz+OIZ4d1FgDAuRyF
 vJf14zLsN/yglbIffz3qmVxDxxYtoc4XEOMFhEZ2PWZpzL+R5qFalD+M8dV1iMldg+kCepeAmYBXl
 OeZG23rhZAmm3bNW4z6Vz1KBrA4FsCA+W3VYjNPQCdvtCGeMxSDGfrJ4qo2/P7n0HqsVqL+MPoAXY
 212fOI+qbYO8AW4BxJT+wMe0Vm0AjdoWpd56IKjsyIsvGp9thM0HkkaGrLP09JOtNXLTwrBIzgrVd
 A5F1gVOA==;
Received: from [179.118.189.35] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tLDLq-001lyu-7z; Wed, 11 Dec 2024 04:25:26 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v10 0/2] drm/atomic: Ease async flip restrictions
Date: Wed, 11 Dec 2024 00:25:07 -0300
Message-Id: <20241211-tonyk-async_flip-v10-0-6b1ff04847c2@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABMGWWcC/3WNsQ7CIBiEX6VhFgO0WnDSuDg6uJnGAEL7xwoNN
 I1N03cXO7l0vO/y3U0omgAmokM2oWAGiOBdCpRsMqQb6WqD4ZkAYoQVlBCGe+/GF5ZxdPphW+g
 wZ1xbI7TNtURJ64Kx8Fk27+h6up0vqEq4gdj7MC5Pg1jK9c1BYIKLXa6o4qIs1fMItWxBbrV//
 z4WkxK6Yu455bQwVlll/s1qnucvQLo8EPMAAAA=
X-Change-ID: 20241002-tonyk-async_flip-828cfe9cf3ca
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es, 
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>, 
 ville.syrjala@linux.intel.com
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.14.2
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

Hi,

The goal of this work is to find a nice way to allow amdgpu to perform
async page flips in the overlay plane as well, not only on the primary
one. Currently, when using the atomic uAPI, this is the only type of
plane allowed to do async flips, and every driver accepts it.

This patchset re-uses the per-plane function atomic_async_check() to
this purpose, so drivers can allow different plane types. There's a
`bool flip` parameter so the atomic_async_check() can do different
decisions if it's a complete page flip or a plane update.

igt test: https://lore.kernel.org/igt-dev/20241211031820.115844-1-andrealmeid@igalia.com/

Changelog
 v9: https://lore.kernel.org/r/20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com
 - Add a 'flip' flag to indicate where the atomic_async_check() is being called from.

 v8: https://lore.kernel.org/lkml/20240806135300.114469-1-andrealmeid@igalia.com/
 - Rebased on top of 6.12-rc1 (drm/drm-next)

 v7: https://lore.kernel.org/dri-devel/20240618030024.500532-1-andrealmeid@igalia.com/
 - Complete rewrite

---
André Almeida (2):
      drm/atomic: Let drivers decide which planes to async flip
      drm/amdgpu: Enable async flip on overlay planes

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 11 ++++---
 drivers/gpu/drm/drm_atomic_helper.c                |  2 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  | 37 ++++++++++++++++------
 drivers/gpu/drm/loongson/lsdc_plane.c              |  3 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  2 +-
 drivers/gpu/drm/tegra/dc.c                         |  3 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  2 +-
 include/drm/drm_modeset_helper_vtables.h           |  7 +++-
 10 files changed, 49 insertions(+), 22 deletions(-)
---
base-commit: c40c32cf71b90d85386fcc066c19feb23eb42804
change-id: 20241002-tonyk-async_flip-828cfe9cf3ca

Best regards,
-- 
André Almeida <andrealmeid@igalia.com>

