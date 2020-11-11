Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A22B00FF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152DF6E188;
	Thu, 12 Nov 2020 08:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176115.mail.qiye.163.com (m176115.mail.qiye.163.com
 [59.111.176.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA2389FE8;
 Wed, 11 Nov 2020 08:32:18 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by m176115.mail.qiye.163.com (Hmail) with ESMTPA id 369C2666DDA;
 Wed, 11 Nov 2020 16:32:15 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>, Bernard Zhao <bernard@vivo.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Brian Masney <masneyb@onstation.org>, Shawn Guo <shawn.guo@linaro.org>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@redhat.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] adreno/a3xx_gpu.c: add KERN_LEVEL to printk
Date: Wed, 11 Nov 2020 00:31:19 -0800
Message-Id: <20201111083131.39817-3-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201111083131.39817-1-bernard@vivo.com>
References: <20201111083131.39817-1-bernard@vivo.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQhhNSkxPHk0YQk9LVkpNS05LQ0hOSE5OTk9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQg6FDo6PT8pPxcrFghCCB5O
 NBUaCRlVSlVKTUtOS0NITkhNS0tOVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSEpOQjcG
X-HM-Tid: 0a75b66f188a9373kuws369c2666dda
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add KERN_LEVEL to printk.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index f29c77d9cd42..64c9a9448f53 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -356,7 +356,7 @@ static void a3xx_recover(struct msm_gpu *gpu)
 	adreno_dump_info(gpu);
 
 	for (i = 0; i < 8; i++) {
-		printk("CP_SCRATCH_REG%d: %u\n", i,
+		printk(KERN_DEBUG "CP_SCRATCH_REG%d: %u\n", i,
 			gpu_read(gpu, REG_AXXX_CP_SCRATCH_REG0 + i));
 	}
 
@@ -459,7 +459,7 @@ static const unsigned int a3xx_registers[] = {
 /* would be nice to not have to duplicate the _show() stuff with printk(): */
 static void a3xx_dump(struct msm_gpu *gpu)
 {
-	printk("status:   %08x\n",
+	printk(KERN_DEBUG "status:   %08x\n",
 			gpu_read(gpu, REG_A3XX_RBBM_STATUS));
 	adreno_dump(gpu);
 }
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
