Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B493D460
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 15:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D02F10E992;
	Fri, 26 Jul 2024 13:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="FJpwCDjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDEC10E992;
 Fri, 26 Jul 2024 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1722001252;
 bh=Wu8RMhQzPlOleoJZKdKLHfVe34k7QEtY0utXoWZH0iI=;
 h=From:Subject:Date:To:Cc:From;
 b=FJpwCDjmCBc5L2ACBCDMmHOy/nu9Hz1+c1Ue5EuoIWxUDGHC/IAVfTSKf/aZdSyc2
 +AhiFXPnENw6gJby9w0YXOoAv1+0B0bVL/d3rWxk0uleTBzjkctJip4z/4Ouy1DNTt
 d9yY+lyqiBW8RWl+vfsdgu1C7x51MfGz6x3XY1Zg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/2] drm/{amdgpu,radeon}: convert bios_hardcoded_edid to
 drm_edid
Date: Fri, 26 Jul 2024 15:40:14 +0200
Message-Id: <20240726-amdgpu-edid-bios-v2-0-8a0326654253@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD6no2YC/32NQQ6CMBBFr0K6dgwzYDWuuIdhUehAZyGQDqCGc
 HcrB3D5XvLf34xyFFZzzzYTeRWVcUhAp8y0wQ09g/jEhnIqc4sW3NP30wLsxUMjo4Ir0Dm0TV4
 QmjSbInfyPpKPOnEQncf4OR5W/Nk/sRUBgW7XsiOkprCX6sWiqm1Ywnng2dT7vn8BCXBZz7UAA
 AA=
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722001252; l=1843;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Wu8RMhQzPlOleoJZKdKLHfVe34k7QEtY0utXoWZH0iI=;
 b=NV0rHjFiycXVUHxW+gzFkBfJvhmxtFqKbwHYjrC4/phN2yODvj6QnhsBlIMMaL6vw4jQ2fR+P
 SJX559XylH/CAe51vuGxL4q0qa9O6b3vzlvt//yN5tSWps7cncwxPw4
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

Instead of manually passing around 'struct edid *' and its size,
use 'struct drm_edid', which encapsulates a validated combination of
both.

While this series introduces new users for drm_edid_raw(),
these can be removed when the drivers get converted to 'struct drm_edid'
completely for which this series provides the foundation.

Only compile-tested.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Rebase onto current amdgpu/drm-next and
  recent changes to hardcoded bios handling
- Add patch for drm/radeon
- Link to v1: https://lore.kernel.org/r/20240616-amdgpu-edid-bios-v1-1-2874f212b365@weissschuh.net

---
Thomas Weißschuh (2):
      drm/amdgpu: convert bios_hardcoded_edid to drm_edid
      drm/radeon: convert bios_hardcoded_edid to drm_edid

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c |  6 +-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h       |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 17 ++++++-----------
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c       | 17 ++++++-----------
 drivers/gpu/drm/radeon/radeon_combios.c        | 26 +++++---------------------
 drivers/gpu/drm/radeon/radeon_connectors.c     |  4 ++--
 drivers/gpu/drm/radeon/radeon_display.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_mode.h           |  4 ++--
 13 files changed, 30 insertions(+), 60 deletions(-)
---
base-commit: 644e49d582fd53d4d218d27e404043f56f2c286f
change-id: 20240616-amdgpu-edid-bios-a31aa16b0321

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

