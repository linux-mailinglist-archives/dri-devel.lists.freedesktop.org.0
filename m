Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0734D73A1
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 08:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5123610E4A9;
	Sun, 13 Mar 2022 07:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Sun, 13 Mar 2022 04:16:54 UTC
Received: from steinadler.informatik.uni-kiel.de
 (steinadler.informatik.uni-kiel.de [134.245.248.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA7C10E587
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 04:16:54 +0000 (UTC)
Received: from turmfalke.informatik.uni-kiel.de
 (turmfalke.informatik.uni-kiel.de [134.245.248.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by steinadler.informatik.uni-kiel.de (Postfix) with ESMTPS id 1BA294F21D;
 Sun, 13 Mar 2022 05:10:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=informatik.uni-kiel.de; s=ifi-20210612; t=1647144647;
 bh=W9HDHcEzEpFvzza8dvi7X2bCCyAQ1Mva7vq2q/p8tMU=;
 h=From:To:Cc:Subject:Date:From;
 b=TAraovuX8thxFemrbJf6cPKTdEqEatREk3waIgh8dW1mC+VEtQZkdZ0iLoPstof/P
 k8Ywk4dX0OEtO7eOvlDuo0i016ykaMkxw1DfO6dHJaXP4eHe4h2Fxyp4pxKo0/vV42
 vVE5YliJQChck0fy255rcRJXP7tduf1sf99KHRo/2/6OBInnV5AWBRvih/MyIPqZYJ
 o9hahjfCWO+WRpnE5BPBexHHN+jI26mbnDvjEb3LBlT4U+3XncdJgcd+CgodU4LD2g
 bmcD9l7u3Lnx4JRV1Gi3kY2nGDn7gQiN9peCym5sVh0xkrS6d1cvgC+VhozEJZFRKJ
 wYj7CkZ3riYtA==
Received: from localhost (p54ad5b1d.dip0.t-ipconnect.de [84.173.91.29])
 (authenticated bits=0)
 by turmfalke.informatik.uni-kiel.de (8.17.1/8.16.1) with ESMTPSA id
 22D4AiLO057300
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 13 Mar 2022 05:10:46 +0100 (CET)
 (envelope-from psi@informatik.uni-kiel.de)
X-Authentication-Warning: turmfalke.informatik.uni-kiel.de: Host
 p54ad5b1d.dip0.t-ipconnect.de [84.173.91.29] claimed to be localhost
From: Philipp Sieweck <psi@informatik.uni-kiel.de>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Propagate error on failed ioctl
Date: Sun, 13 Mar 2022 06:06:55 +0100
Message-Id: <20220313050655.52199-1-psi@informatik.uni-kiel.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 13 Mar 2022 07:34:51 +0000
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
Cc: Philipp Sieweck <psi@informatik.uni-kiel.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cases of vmw_user_bo_synccpu_grab failing with -ERESTARTSYS or -EBUSY
are handled in vmw_user_bo_synccpu_ioctl by not printing an error message.
However, the error value gets discarded, indicating success. This leads
to rendering glitches and a reported drm error on the next ioctl call to
release the handle.

This patch propagates the error value from vmw_user_synccpu_grab.

Signed-off-by: Philipp Sieweck <psi@informatik.uni-kiel.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 31aecc46624b..81fe4dc5e6ab 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -621,6 +621,8 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
 				  (unsigned int) arg->handle);
 			return ret;
 		}
+		if (unlikely(ret != 0))
+			return ret;
 		break;
 	case drm_vmw_synccpu_release:
 		ret = vmw_user_bo_synccpu_release(file_priv,
-- 
2.35.1

