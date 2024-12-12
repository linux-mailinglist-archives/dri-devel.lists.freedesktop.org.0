Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B89EFC37
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 20:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE8A10E301;
	Thu, 12 Dec 2024 19:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F+hrtu0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870210E301;
 Thu, 12 Dec 2024 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ThDleRXc8ca+wLmuV0H//xGtHzIz1jauUjmXogggRF4=; b=F+hrtu0O8hFchKWLt6bVBRE/MH
 Yi71z+Z20Da584RzdvE+QIxGBhw7Uxw7tOio3kWsqSaYV0YUwTSuj8tbtdQAe+PhanOsjjbh7IHif
 CP6Bm4JalavO6NjF9eFH1Y4bxvPKafq6ybgU0PD2g2MBB+YlQmoCgxkW5VuGi7oHK+Zhly27D4+Ql
 UucG4IM5P3FnSkfw6d82Ya5lPgvRjKNd21M2aTsPh4yfKWIDrddfoAYCVvsobzL9+YSVx1X2QDxJI
 ynGRa2gortA2HxySB4M8UhFnnx4hVYYUWmENyN/yY9PVKSRWb8uh7LwIhvxyU14bVBYdy8MxJZ62y
 hyRfy3jA==;
Received: from [179.193.1.214] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tLojI-002MsO-I3; Thu, 12 Dec 2024 20:20:08 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v11 0/2] drm/atomic: Ease async flip restrictions
Date: Thu, 12 Dec 2024 16:19:32 -0300
Message-Id: <20241212-tonyk-async_flip-v11-0-14379434be70@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEQ3W2cC/3WOsQ6CMBRFf4V0tqavVClOGhdHBzdjTFtaeBGBU
 EIkhH8XWNRExndvzrmvJ97WaD3ZBT2pbYsey2I8AFYBMZkqUksxGQPCGRfAGKdNWXQPqnxXmLv
 LsaKSS+NsbFxoFBmxqrYOX7PzSs6Hy/FEbmOcoW/KupuX2ngul51tTBkVm1CDlnEU6WSPqcpRr
 U35nDZmEhgskFsJEoR12mn7TU5/tMA+4xz+KYBNDg3OMSFFZPiPYxiGN+0g6us3AQAA
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
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Christopher Snowhill <chris@kode54.net>
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
 v11:
  - Fix changelog
  - Add R-b and T-b tags

 v10: https://lore.kernel.org/all/20241211-tonyk-async_flip-v10-0-6b1ff04847c2@igalia.com/
 - Add a 'flip' flag to indicate where the atomic_async_check() is being called from.

 v9: https://lore.kernel.org/all/20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com/
 - Rebased on top of 6.12-rc1 (drm/drm-next)

 v8: https://lore.kernel.org/lkml/20240806135300.114469-1-andrealmeid@igalia.com/
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

