Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190582402AC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A6889C53;
	Mon, 10 Aug 2020 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41EF6E2B2
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 20:34:20 +0000 (UTC)
Received: from localhost.localdomain ([93.22.38.137]) by mwinf5d52 with ME
 id DYa8230082xYfe503Ya9Dl; Sun, 09 Aug 2020 22:34:17 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Aug 2020 22:34:17 +0200
X-ME-IP: 93.22.38.137
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, sumit.semwal@linaro.org, colton.w.lewis@protonmail.com,
 Ori.Messinger@amd.com, m.szyprowski@samsung.com, bernard@vivo.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: amdgpu: Use the correct size when allocating memory
Date: Sun,  9 Aug 2020 22:34:06 +0200
Message-Id: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When '*sgt' is allocated, we must allocated 'sizeof(**sgt)' bytes instead
of 'sizeof(*sg)'. 'sg' (i.e. struct scatterlist) is smaller than
'sgt' (i.e struct sg_table), so this could lead to memory corruption.

Fixes: f44ffd677fb3 ("drm/amdgpu: add support for exporting VRAM using DMA-buf v3")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 134cc36e30c5..0739e259bf91 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -462,7 +462,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 	unsigned int pages;
 	int i, r;
 
-	*sgt = kmalloc(sizeof(*sg), GFP_KERNEL);
+	*sgt = kmalloc(sizeof(**sgt), GFP_KERNEL);
 	if (!*sgt)
 		return -ENOMEM;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
