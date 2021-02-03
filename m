Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC730DC70
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 15:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0CD6EAC6;
	Wed,  3 Feb 2021 14:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114506EAC6;
 Wed,  3 Feb 2021 14:17:04 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l7Ixp-0003XD-MI; Wed, 03 Feb 2021 14:17:01 +0000
From: Colin King <colin.king@canonical.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH][next] drm/nouveau/fifo/tu102: Fix potential array out of
 bounds access error
Date: Wed,  3 Feb 2021 14:17:01 +0000
Message-Id: <20210203141701.23342-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Currently the for_each_set_bit loop is iterating index engn from 0..31 and
calls to tu102_fifo_recover_engn can potentiall access fifo->engine[engn]
where engn is larger than the array engine (which is currently hard coded
as 16 elements).  Avoid any potential array out of bounds accesses by
replacing the hard coded value 32 with the number of elements in the array.

Addresses-Coverity: ("Out-of-bounds access")
Fixes: 26a0cfc163ab ("drm/nouveau/fifo/tu102: FIFO interrupt fixes for Turing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index 14e5b70e0255..1f33f8c757bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -366,7 +366,7 @@ tu102_fifo_intr_ctxsw_timeout(struct gk104_fifo *fifo)
 	engm = nvkm_rd32(device, 0x2a30);
 	nvkm_wr32(device, 0x2a30, engm);
 
-	for_each_set_bit(engn, &engm, 32)
+	for_each_set_bit(engn, &engm, ARRAY_SIZE(fifo->engine))
 		tu102_fifo_recover_engn(fifo, engn);
 
 	spin_unlock_irqrestore(&fifo->base.lock, flags);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
