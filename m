Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676498EC5A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 11:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B201210E7DC;
	Thu,  3 Oct 2024 09:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="DtRwP02r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6A710E7C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 09:37:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20241003092901euoutp0227889e968a5627c02c00f1ffe221a982~651DC5Iro3264832648euoutp02k
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 09:29:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20241003092901euoutp0227889e968a5627c02c00f1ffe221a982~651DC5Iro3264832648euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727947741;
 bh=51BHMcWfEge1OQoCPrt4FdlKAhUWgI/LQIBASekG+MA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DtRwP02rALlsiZbRPhU9GkbqB4k8qR9y5PqZ++AgHpuh6y1FB7/XZ/fvKBGVDEFzr
 eOq1q4RXLY234WrFycZOhB1uREgh76C1S1UnIoK/VtgzwAI69vII/JLQb9lYMhxd4n
 +kqZPwR043dP6z/rN/Xs0sepFDbiTgZ3EuiWHHpY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241003092900eucas1p1026e90c64d86804b160af507ef2259fb~651C0SQ1D2406024060eucas1p1k;
 Thu,  3 Oct 2024 09:29:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 2E.D2.09875.CD36EF66; Thu,  3
 Oct 2024 10:29:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241003092900eucas1p23bc93401d6803aa36c1b442b40bd6c15~651CbQ-tk1289512895eucas1p2R;
 Thu,  3 Oct 2024 09:29:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241003092900eusmtrp1121e5b125467f1ab56ece748eb257cbd~651Can7Re1370213702eusmtrp1e;
 Thu,  3 Oct 2024 09:29:00 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-9e-66fe63dc56b7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 29.57.19096.CD36EF66; Thu,  3
 Oct 2024 10:29:00 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241003092859eusmtip21772a927d7df8b2da94ddc169c169b12~651BzFhHk2013120131eusmtip2V;
 Thu,  3 Oct 2024 09:28:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas
 <javierm@redhat.com>
Subject: [PATCH 2/2] drm/vc4: Provides DRM_FBDEV_DMA_DRIVER_OPS also for
 vc5_drm_driver
Date: Thu,  3 Oct 2024 11:28:26 +0200
Message-Id: <20241003092826.1942901-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003092826.1942901-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7p3kv+lGXQ907Y4cX0Rk8XbuYtZ
 LK58fc9msXDackaL9zMnMFtc3jWHzWLtkbvsFgs/bmWxaOtcxmox+91+dostbyayOnB77P22
 gMVj56y77B6bVnWyecw7Gehxv/s4k0fr0V8sHu/3XWXz6NuyitFj8+lqj8+b5AK4orhsUlJz
 MstSi/TtErgypj5+zlQwgb3ixuzCBsYWti5GTg4JAROJWbd7mLsYuTiEBFYwSvROPswO4Xxh
 lHj/YwsrhPOZUeLWxxPsMC2vvrexQSSWM0rMXb+MCa7l7LFrzCBVbAKGEl1vu8CqRASagBIr
 m8FmMQs8YJJ4MvUhI0iVsECkxLyjb1lBbBYBVYnWw1OYQGxeAXuJviXLmSH2yUvsP3gWzOYU
 cJDYfOMVK0SNoMTJmU9YQGxmoJrmrbPB3pAQ+MAhsf3dFqhjXSQO374PNUhY4tVxmLiMxOnJ
 PSwQDe2MEgt+32eCcCYwSjQ8v8UIUWUtcefcL6AnOIBWaEqs36UPEXaUeHoD5GkOIJtP4sZb
 QYgj+CQmbZvODBHmlehoE4KoVpOYdXwd3NqDFy5BneMh8ezGTMYJjIqzkLwzC8k7sxD2LmBk
 XsUonlpanJueWmyUl1quV5yYW1yal66XnJ+7iRGYxk7/O/5lB+PyVx/1DjEycTAeYpTgYFYS
 4Z23/W+aEG9KYmVValF+fFFpTmrxIUZpDhYlcV7VFPlUIYH0xJLU7NTUgtQimCwTB6dUA9PW
 FIG76+O59Z42Mi2akDTZQTVnY6WXUG7M5nVnnnE/qayR0Ju+1yd/xTuGHdmhv+es+JUV52w8
 ZXPrmcU35cJrD38XcPGKuuax48osMVbpBI4gsfgik83vUibIm9/5ddaL37Vkc9/2LJW2pyt2
 nV116fy+i9VfD33/WZmf3xTBUfGnsy7rvsDuTL/7G7wF83c2SfZNPl0dPdlaPl3riGvIu28d
 Szaqt/+otDHiiqk5blkVF3uVZbKlzSkP9U4VC94Kts36XfUPl918/ibodLiBhMiOq25b0k5F
 pbouijwtfLHm2eMP21dvLajgbNY5vO5ll439BuX7EkpvjPknTzCdE1BjfftAyZ1ijbt9Ykos
 xRmJhlrMRcWJAIrGR3DSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xe7p3kv+lGSz4LWJx4voiJou3cxez
 WFz5+p7NYuG05YwW72dOYLa4vGsOm8XaI3fZLRZ+3Mpi0da5jNVi9rv97BZb3kxkdeD22Ptt
 AYvHzll32T02repk85h3MtDjfvdxJo/Wo79YPN7vu8rm0bdlFaPH5tPVHp83yQVwRenZFOWX
 lqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlTH38nKlgAnvF
 jdmFDYwtbF2MnBwSAiYSr763AdlcHEICSxkl3rw/xAyRkJE4Oa2BFcIWlvhzrQuq6BOjxK4L
 t8CK2AQMJbreQiREBFoYJY5u/M0I4jALPGGSWPptKyNIlbBAuMTrxhVMIDaLgKpE6+EpYDav
 gL1E35LlUOvkJfYfPAtmcwo4SGy+8QpstRBQzeFNfxkh6gUlTs58wgJiMwPVN2+dzTyBUWAW
 ktQsJKkFjEyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAqNt27GfW3Ywrnz1Ue8QIxMH4yFG
 CQ5mJRHeedv/pgnxpiRWVqUW5ccXleakFh9iNAW6eyKzlGhyPjDe80riDc0MTA1NzCwNTC3N
 jJXEedmunE8TEkhPLEnNTk0tSC2C6WPi4JRqYJI8+21bZll5OOOzQrO/RcIdDML6Ev//BD/c
 JvNlcc/5mgcXBOuUf9YsMlgr7VgyR+pFvMDvjA/Z+RbhN7wVmVqEpzDc+m2m+HrRqq8cDh4F
 kikLzzZatS0qZnli/vGx5bXTnid2X1sXyxRgIjNrl0nUmZ8/+SUdtsr+mXFQ8qHSuYNdYeZO
 Ntm2xjvWP9Z73OWTt/hqQcFGdxePNR8N2XUmsB2Xnr+CR/vwFn7LrDJJro/TFE9Kmk3a9m6G
 4ulzf+sKbWancbOvXD33TSGPq8L0BTOKJs7mat2h/TlWLnJRu6y2uPqKG6b6sU0qJj9uXGbm
 ruB5fd+3PYn7fMyCc0e2xsV9Mmcu+e+jISPuocRSnJFoqMVcVJwIAPjRwPk/AwAA
X-CMS-MailID: 20241003092900eucas1p23bc93401d6803aa36c1b442b40bd6c15
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241003092900eucas1p23bc93401d6803aa36c1b442b40bd6c15
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241003092900eucas1p23bc93401d6803aa36c1b442b40bd6c15
References: <20241003092826.1942901-1-m.szyprowski@samsung.com>
 <CGME20241003092900eucas1p23bc93401d6803aa36c1b442b40bd6c15@eucas1p2.samsung.com>
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

The VC4 DRM driver contains 2 'struct drm_driver' objects, used for
different hardware versions. Commit 45903624e9fc ("drm/vc4: Run DRM
default client setup") added the DRM_FBDEV_DMA_DRIVER_OPS entry only to
the first one, causing the kernel oops if the second 'drm_driver' object
is used. Fix this.

Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 13a1ecddbca3..a238f76a6073 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -238,6 +238,7 @@ const struct drm_driver vc5_drm_driver = {
 #endif
 
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vc5_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.fops = &vc4_drm_fops,
 
-- 
2.34.1

