Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D6380C3C
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 16:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C249A6EEA6;
	Fri, 14 May 2021 14:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B44C6EEA6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 14:49:33 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lhZ87-0006J9-0E; Fri, 14 May 2021 14:49:31 +0000
From: Colin King <colin.king@canonical.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][V2][next] drm/vmwgfx: Fix memory allocation check and a leak
 of object fifo
Date: Fri, 14 May 2021 15:49:30 +0100
Message-Id: <20210514144930.89813-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The allocation of fifo is lacking an allocation failure check, so
fix this by adding one.

In the case where fifo->static_buffer fails to be allocated the
error return path neglects to kfree the fifo object. Fix this by
adding in the missing kfree.

Kudos to Dan Carpenter for spotting the missing kzalloc failure
check.

Addresses-Coverity: ("Resource leak")
Fixes: 2cd80dbd3551 ("drm/vmwgfx: Add basic support for SVGA3")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Add missing allocation failure check
    Update $SUBJECT to reflect this extra change

---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index 027d7d504e78..d9acd2f3f673 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -105,10 +105,14 @@ struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv)
 		return NULL;
 
 	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);
+	if (!fifo)
+		return ERR_PTR(-ENOMEM);
 	fifo->static_buffer_size = VMWGFX_FIFO_STATIC_SIZE;
 	fifo->static_buffer = vmalloc(fifo->static_buffer_size);
-	if (unlikely(fifo->static_buffer == NULL))
+	if (unlikely(fifo->static_buffer == NULL)) {
+		kfree(fifo);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	fifo->dynamic_buffer = NULL;
 	fifo->reserved_size = 0;
-- 
2.30.2

