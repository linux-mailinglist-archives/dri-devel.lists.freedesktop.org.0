Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4CCA24923
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 13:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD4710E219;
	Sat,  1 Feb 2025 12:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="IFyKnyiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0B510E219
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1738414255; x=1739019055; i=wahrenst@gmx.net;
 bh=ksc9LDzcVJ8NsfCRkNnZJ/sDE50pMagCoJkWLkY6T8E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IFyKnyiBWaaqX4tpOK5xVK88ihFGkdLUa4EOzOdCV+wlbqLxJEdE5GEJW3ANz7rn
 1yFXEPo3QM7vmtaOiZd3/kmydlnMfUcMuie6g9kF1qbAcMeaqueXcBRLU7lKj6W1d
 B1LYVDhiRY+4Z9y6MoJRiD6tvZh4beyBfxyTUB0uKc4vFvCx9SIDGQKIxVhsbhgyc
 mf71GlrKjZ9OslZISCfK/MTfDi/j8eCERNmCTHjfFm2iUOxrW6m2zKWk7ArKqvS1M
 9BeONdr7lIjsthsYycVqiCZciwbPf3NKOciPzjgmVmFtjG1Y0Anp0qm7v4NVsBFUw
 saEUNq7hQGWW/reeMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQe5u-1tpod71rhW-00SFBo; Sat, 01
 Feb 2025 13:50:55 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] drm/v3d: Add clock handling
Date: Sat,  1 Feb 2025 13:50:46 +0100
Message-Id: <20250201125046.33030-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:00mu1rAZBO2E0U+cFaN8ms2RfDsvH5u8rTv39vdVtbkwR/Xwwoi
 7wtJi2V6kz5XrHCDT4kQRVK7ABdBj+HERi+TNHA+pFkUkhpozcfeYDmwZt919GVHGDCoGvc
 9kNTLDB3Ot3fw8OUBZKlj77VUki7VBE6lAUKAVM7BEE6sgTY6oEv+FURuzyhj9ZnItQTc1i
 0DM9vI4+6jt0GZ+LiFnQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hW2sjhKH7m0=;vA3HeB4DhImYO5yfIz4VBvpcVc9
 2tlxeVpdyKAAzdy+3K3xOmelamXwergAjiqH8fuKXPpcBWTx/bNMklyebMcWH92YTBdqh1Z8u
 WTWbhJDGSnuV/ARTeD3MityQF72zKrlP7RsF3AgR5zOOqGyYNUefj/QClw1c9S9mtLq6RrwOU
 34KyrlL1GdfULCs2VaVToX5PbBNfNmTV6J3ENF7kC7yJQfVfrDH6JbtMf+Sx5zM1lJINOqH7h
 WUo45RQiotQ7ovotJlEgIYHt+4dB9iwZ5Nrxcu4UMk1Uqc1glhsPGfIryWpljwGfkxDpsHnAu
 SPBxmx307/JkpoAV/LBU4S0JelbO4LqqLych+8mqdZJYW2ooxR5Qimhk786yWudcSqHQViwaw
 fyMQIeDAkHvQvgwuPoqvxARwrsL28JtYkhV9douPaiXcG/M53I7wNqiN+wPlgJRwfN8/h8rTs
 nvYGJ8F1l9CSGp+5bL03LhR+0cc8JbHXN4KP62qVZ6FZakaCmZEd8O0Q4N/2W/ycWNGc20F/7
 SifuUGaFyy0nXNQ+el8HPAG8w4d4dExXppX27u3vKFabvPsvWh7yLPUWIsH9280zl9dt8bLsU
 NdpeJ9pc1U8e2UJevcMnIClQhVJwSll6Lp26omN//rm1YupUO2HkN7YL8zb9sxfxVkYulZxux
 Bzq797b/ExSj6zmLHI/AxqvsTaNi7h35ptSuf05fjeokPxEOn0U+/7ZAfJH9tS/MsTpL6/yqy
 4lHyjo4rk3LPW53EG0RCs1YDMQVSW7UX3YFnWewA5VnZMMQNxU6e6dAjT2XBbcny4ybhpdSVI
 GofCYJijUTvK/CvKipUymTbjJpVGKxTDv0Ov1kn655m5SP1KhV6DffCMXqDErJS+SK6R9Y+N6
 DYWInJltlQva1PrVVWRYtQLe2XpnniAQqpc0owZtxTIe/ZD9dLNpT0MNixBEXT9RKZxH80yow
 NokelVi+6stAZCNIFLX6sb9xCW4vHKifHl54InquHyNJxhD3ZhHwHUV5mV4awqt7aL52cS+6N
 V1ew/jpOsTU1J4oL+jtGRx6b3xfb9rTzdnro6KSsFMl8Uj+f6GQuOKxG43Sr3q/iql8PSOOcq
 OkHPBSt/x8XZU2mOApSNvlzPzz6sznfDHqVKyEOufZGiFemztvVtT1HSWZSSVQi4ZBXp+NJls
 H5yEbq4nWZds75y0v/MYgyXStVrQkoHB267YQqkdGSkIvy2SxLGQAClL3Cr5jMu0wiz5/nLr6
 XLVdQP2vf5mqs6J/3Oq7i/H5IOhba/mFzA33Cnt50hUTwH6Q2kS1+SU/89mM6C+IXZWVK/ox1
 csGFx1Q9jAin/2I068tAK37CzyxQ/xSOK/Ic/EubFGr1bA=
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

Since the initial commit 57692c94dcbe ("drm/v3d: Introduce a new DRM drive=
r
for Broadcom V3D V3.x+") the struct v3d_dev reserved a pointer for
an optional V3D clock. But there wasn't any code, which fetched it.
So add the missing clock handling before accessing any V3D registers.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/v3d/v3d_drv.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 930737a9347b..852015214e97 100644
=2D-- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -295,11 +295,21 @@ static int v3d_platform_drm_probe(struct platform_de=
vice *pdev)
 	if (ret)
 		return ret;

+	v3d->clk =3D devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(v3d->clk))
+		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n=
");
+
+	ret =3D clk_prepare_enable(v3d->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
+		return ret;
+	}
+
 	mmu_debug =3D V3D_READ(V3D_MMU_DEBUG_INFO);
 	mask =3D DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH));
 	ret =3D dma_set_mask_and_coherent(dev, mask);
 	if (ret)
-		return ret;
+		goto clk_disable;

 	v3d->va_width =3D 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);

@@ -319,28 +329,29 @@ static int v3d_platform_drm_probe(struct platform_de=
vice *pdev)
 		ret =3D PTR_ERR(v3d->reset);

 		if (ret =3D=3D -EPROBE_DEFER)
-			return ret;
+			goto clk_disable;

 		v3d->reset =3D NULL;
 		ret =3D map_regs(v3d, &v3d->bridge_regs, "bridge");
 		if (ret) {
 			dev_err(dev,
 				"Failed to get reset control or bridge regs\n");
-			return ret;
+			goto clk_disable;
 		}
 	}

 	if (v3d->ver < 41) {
 		ret =3D map_regs(v3d, &v3d->gca_regs, "gca");
 		if (ret)
-			return ret;
+			goto clk_disable;
 	}

 	v3d->mmu_scratch =3D dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
 					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
 	if (!v3d->mmu_scratch) {
 		dev_err(dev, "Failed to allocate MMU scratch page\n");
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto clk_disable;
 	}

 	ret =3D v3d_gem_init(drm);
@@ -369,6 +380,8 @@ static int v3d_platform_drm_probe(struct platform_devi=
ce *pdev)
 	v3d_gem_destroy(drm);
 dma_free:
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
+clk_disable:
+	clk_disable_unprepare(v3d->clk);
 	return ret;
 }

@@ -386,6 +399,8 @@ static void v3d_platform_drm_remove(struct platform_de=
vice *pdev)

 	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
 		    v3d->mmu_scratch_paddr);
+
+	clk_disable_unprepare(v3d->clk);
 }

 static struct platform_driver v3d_platform_driver =3D {
=2D-
2.34.1

