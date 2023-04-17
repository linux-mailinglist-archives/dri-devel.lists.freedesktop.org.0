Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C386E40A8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B42810E38D;
	Mon, 17 Apr 2023 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 626 seconds by postgrey-1.36 at gabe;
 Mon, 17 Apr 2023 06:12:54 UTC
Received: from hust.edu.cn (unknown [202.114.0.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A17C10E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 06:12:54 +0000 (UTC)
Received: from dd-virtual-machine.localdomain ([60.247.94.10])
 (user=U202112190@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 33H618GE027391-33H618GF027391
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 17 Apr 2023 14:01:10 +0800
From: Hongqi Chen <U202112190@hust.edu.cn>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>
Subject: [PATCH] gpu: gma500: psb_drv: add missing unwind goto 
Date: Mon, 17 Apr 2023 14:01:05 +0800
Message-Id: <20230417060105.16411-1-U202112190@hust.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: U202112190@hust.edu.cn
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: Hongqi Chen <U202112190@hust.edu.cn>,
 hust-os-kernel-patches@googlegroups.com, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports that missing unwind goto in psb_driver_load().
drivers/gpu/drm/gma500/psb_drv.c:350 psb_driver_load() warn: missing
unwind goto?

psb_driver_unload() and psb_driver_load() exist in correspondence, 
and psb_driver_unload() should be executed when the psb_do_init() 
fails to initialize.

Fixes: 5c49fd3aa0ab ("gma500: Add the core DRM files and headers")
Signed-off-by: Hongqi Chen <U202112190@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index cd9c73f5a64a..b5a276342129 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -347,7 +347,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 
 	ret = psb_do_init(dev);
 	if (ret)
-		return ret;
+		goto out_err;
 
 	/* Add stolen memory to SGX MMU */
 	ret = psb_mmu_insert_pfn_sequence(psb_mmu_get_default_pd(dev_priv->mmu),
-- 
2.25.1

