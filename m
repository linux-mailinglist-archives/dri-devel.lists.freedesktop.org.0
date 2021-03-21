Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FED3431E0
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 10:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482316E1A3;
	Sun, 21 Mar 2021 09:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2472 seconds by postgrey-1.36 at gabe;
 Sun, 21 Mar 2021 06:38:38 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463E16E128
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 06:38:38 +0000 (UTC)
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 12L5v7ne047785;
 Sun, 21 Mar 2021 14:57:07 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Sun, 21 Mar 2021 14:57:07 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp
 [106.72.142.33]) (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 12L5us1h047146
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 21 Mar 2021 14:57:07 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Zack Rusin <zackr@vmware.com>, Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: [PATCH] drm/vmwgfx: fix spinlock initialization in vmw_driver_load()
Date: Sun, 21 Mar 2021 23:56:49 +0900
Message-Id: <20210321145649.2948-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
X-Mailman-Approved-At: Sun, 21 Mar 2021 09:33:14 +0000
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since vmw_write() from vmw_detect_version() from vmw_driver_load() calls
spin_lock(&dev_priv->hw_lock), spin_lock_init(&dev_priv->hw_lock) has to
be called before vmw_detect_version() is called, or lockdep gets disabled.

  INFO: trying to register non-static key.
  the code is fine but needs lockdep annotation.
  turning off the locking correctness validator.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 8772c0bb58bbf98a ("drm/vmwgfx: Cleanup pci resource allocation")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index dd69b51c40e4..a8049092fb32 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -715,6 +715,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	ret = vmw_setup_pci_resources(dev_priv, pci_id);
 	if (ret)
 		return ret;
+	spin_lock_init(&dev_priv->hw_lock);
 	ret = vmw_detect_version(dev_priv);
 	if (ret)
 		goto out_no_pci_or_version;
@@ -725,7 +726,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	mutex_init(&dev_priv->global_kms_state_mutex);
 	ttm_lock_init(&dev_priv->reservation_sem);
 	spin_lock_init(&dev_priv->resource_lock);
-	spin_lock_init(&dev_priv->hw_lock);
 	spin_lock_init(&dev_priv->waiter_lock);
 	spin_lock_init(&dev_priv->cap_lock);
 	spin_lock_init(&dev_priv->cursor_lock);
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
