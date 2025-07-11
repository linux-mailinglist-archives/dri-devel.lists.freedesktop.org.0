Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8117B0147E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A20D10E9B7;
	Fri, 11 Jul 2025 07:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pgZ8WbA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F6510E9B7;
 Fri, 11 Jul 2025 07:25:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09A785C6E21;
 Fri, 11 Jul 2025 07:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040BFC4CEED;
 Fri, 11 Jul 2025 07:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752218705;
 bh=qPMlPEUHasRhfrBOHDDaZo3TRKfCZ37IbFpQ9rOiGe4=;
 h=From:To:Cc:Subject:Date:From;
 b=pgZ8WbA7/Bq9U0ukiV55otfOvwZgPBBioQ/G4y/je8S7gI/QTQMyn12CuONYrXHFb
 dhNhNAQGZnTAb95KRgD3qLrM01lSP3tDKZ0e+7ibD8yFUS37R6JLFrKK64HmLcRMS4
 w3e7EwgWe6///Ileli0cZLLKqmbtSoZ+/ZuGMlc20GjT8wtLZqDkY2HdT1SU+eijLT
 JMYjODCPXuM0rtz276g+sklH2QmgH80GYswN/K2wJSXiSHId0lciNHN1463ICdP3zM
 DvekFp1Y/l36hLkVPMEQRa92xGrbLwapoPXHLCs05kgSToleA/oQjEWJo3fw+tPpUO
 YydSDXgpha74g==
From: Arnd Bergmann <arnd@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: check ioctl command codes better
Date: Fri, 11 Jul 2025 09:24:53 +0200
Message-Id: <20250711072458.2665325-1-arnd@kernel.org>
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

nouveau_drm_ioctl() only checks the _IOC_NR() bits in the DRM_NOUVEAU_NVIF
command, but ignores the type and direction bits, so any command with
'7' in the low eight bits gets passed into nouveau_abi16_ioctl() instead
of drm_ioctl().

Check for all the bits except the size that is handled inside of the handler.

Fixes: 27111a23d01c ("drm/nouveau: expose the full object/event interfaces to userspace")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..506eeb44f0d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1284,6 +1284,9 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_exec_ioctl_exec, DRM_RENDER_ALLOW),
 };
 
+#define DRM_IOCTL_NOUVEAU_NVIV _IOC(_IOC_READ|_IOC_WRITE, DRM_IOCTL_BASE, \
+				    DRM_COMMAND_BASE + DRM_NOUVEAU_NVIF, 0)
+
 long
 nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
@@ -1297,14 +1300,10 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return ret;
 	}
 
-	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
-	case DRM_NOUVEAU_NVIF:
+	if ((cmd & ~IOCSIZE_MASK) == DRM_IOCTL_NOUVEAU_NVIV)
 		ret = nouveau_abi16_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
-		break;
-	default:
+	else
 		ret = drm_ioctl(file, cmd, arg);
-		break;
-	}
 
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
-- 
2.39.5

