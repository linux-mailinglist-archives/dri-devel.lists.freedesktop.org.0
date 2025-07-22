Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161DB0D8A9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 13:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FAC10E682;
	Tue, 22 Jul 2025 11:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nIAbi65q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EC710E671;
 Tue, 22 Jul 2025 11:58:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A5C1A55EE3;
 Tue, 22 Jul 2025 11:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9C2C4CEEB;
 Tue, 22 Jul 2025 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753185517;
 bh=VRNKdOARxyNPiIG9RaGx/LmFv7pgt5os0GiM6h2e3U0=;
 h=From:To:Cc:Subject:Date:From;
 b=nIAbi65qjf9cnS+TorEe2+9FEwihDkYar+X0ybyntOh810E7zZqNCJnMvdCm2uYEC
 V9MXrMaDiq7oRRQ8uyfJ6YPbs3gEqbBy6yNUssRPSA0aOzxsIrt3QVTfs9CIZVa0rl
 7YtlvIoyur0fa4ysyZr9zYREVF5ncTADJEBL72VH+U4WxqHU/mfD5vK3R4e3H8EplL
 7DyWa5GsNYETBrWPOudp/VYzusJSNscayVR8MrasRCW0YcQPJuFKvLKDaK6wPLQDhH
 3GzghzRyhtVPdIDXvaKgTy23vLYlQD8K1UyU6p+07sZCloU1I/9Z2pGoYA7824TnU9
 55Oi5zob3ytzw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Satadru Pramanik <satadru@gmail.com>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "drm/nouveau: check ioctl command codes better"
Date: Tue, 22 Jul 2025 13:58:18 +0200
Message-Id: <20250722115830.2587297-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

My previous patch ended up causing a regression for the
DRM_IOCTL_NOUVEAU_NVIF ioctl. The intention of my patch was to only
pass ioctl commands that have the correct dir/type/nr bits into the
nouveau_abi16_ioctl() function.

This turned out to be too strict, as userspace does use at least
write-only and write-read direction settings. Checking for both of these
still did not fix the issue, so the best we can do for the 6.16 release
is to revert back to what we've had since linux-3.16.

This version is still fragile, but at least it is known to work with
existing userspace. Fixing this properly requires a better understanding
of what commands are being passed from userspace in practice, and how
that relies on the undocumented (mis)behavior in nouveau_drm_ioctl().

Fixes: e5478166dffb ("drm/nouveau: check ioctl command codes better")
Link: https://lore.kernel.org/dri-devel/CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com/
Reported-by: Satadru Pramanik <satadru@gmail.com>
Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 7bb64fcdd497..1527b801f013 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1284,9 +1284,6 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_exec_ioctl_exec, DRM_RENDER_ALLOW),
 };
 
-#define DRM_IOCTL_NOUVEAU_NVIF _IOC(_IOC_READ | _IOC_WRITE, DRM_IOCTL_BASE, \
-				    DRM_COMMAND_BASE + DRM_NOUVEAU_NVIF, 0)
-
 long
 nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
@@ -1300,10 +1297,14 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return ret;
 	}
 
-	if ((cmd & ~IOCSIZE_MASK) == DRM_IOCTL_NOUVEAU_NVIF)
+	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
+	case DRM_NOUVEAU_NVIF:
 		ret = nouveau_abi16_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
-	else
+		break;
+	default:
 		ret = drm_ioctl(file, cmd, arg);
+		break;
+	}
 
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
-- 
2.39.5

