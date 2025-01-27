Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B0A1DD18
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B07410E0D4;
	Mon, 27 Jan 2025 20:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OkLqru/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C20510E5B0;
 Mon, 27 Jan 2025 20:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SIv9eitYtKk6DglAMuyDvKB0qt2bNETkXx7WCK99Xg4=; b=OkLqru/COSce1kpBZFPE4a7bVq
 mLJ/c3LcViOJ3iI95sCu6cepCQbTeKjsZL0KvDgVt+vjq/PlNWZbaJek85fc7OByvwPLrdo+3DneR
 GoYFzAxRfxUzDhlcAQn0WdERIN7F8bRxmvJdYQeUkqJIce/QUY/exrXCy0dzdeIfCOqFop0QWtvha
 beKy4IpGgFhHk56ACD8l+C822LZYL2aEd6tMOEAJiIswWp8ZyoMwsSpp8e2QqwgXP+XQoEYYvvbQr
 ROAUL61MTIBc52Fmd6mFsQz1Z04EjaFbIElbCYRSoSX/cR5BUYmnCIU/og75zfZg3RZn9uOZFP9Bs
 Y2BuJEVQ==;
Received: from 189-68-33-219.dsl.telesp.net.br ([189.68.33.219]
 helo=[192.168.15.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tcVHA-003NsK-S4; Mon, 27 Jan 2025 21:00:04 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v12 0/2] drm/atomic: Ease async flip restrictions
Date: Mon, 27 Jan 2025 16:59:38 -0300
Message-Id: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKrll2cC/3WPwW7CMAyGXwXlvEx2mi0JJxAXjhx2m6YpCQ5YQ
 IsaVFGhvvvSXsY0OPq3vu+3byJTy5TFfHYTLXWcuanLgOplJuLe1zuSvC2BUKA0Aih5aer+IH3
 u6/idjnyWVtmYyMVURS8Kdm4p8XVyforN8mO1Fl8l3nO+NG0/NXVuWj53dk6C1G9VwGCdMWG74
 J0/sn+NzWnsmEgEfEK+W7SoKYUU6J4c7+gQfssVPlIgjI6AKYG22kT134H3jkcPFDFI1JVxutK
 BDPxxDMPwAw5Z2957AQAA
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

igt test: https://lore.kernel.org/igt-dev/20241216202427.76168-1-andrealmeid@igalia.com/

Changelog
 v12:
  - Rebased on top of drm-next (for 6.14)

 v11: https://lore.kernel.org/r/20241212-tonyk-async_flip-v11-0-14379434be70@igalia.com
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

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 10 +++---
 drivers/gpu/drm/drm_atomic_helper.c                |  2 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  | 37 ++++++++++++++++------
 drivers/gpu/drm/loongson/lsdc_plane.c              |  3 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  2 +-
 drivers/gpu/drm/tegra/dc.c                         |  3 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  2 +-
 include/drm/drm_modeset_helper_vtables.h           |  7 +++-
 10 files changed, 48 insertions(+), 22 deletions(-)
---
base-commit: 64179a1416e1420a34226ab3beb5f84710953d16
change-id: 20241002-tonyk-async_flip-828cfe9cf3ca

Best regards,
-- 
André Almeida <andrealmeid@igalia.com>

