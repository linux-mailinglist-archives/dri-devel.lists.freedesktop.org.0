Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C9B2F2F7C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 13:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9206E20F;
	Tue, 12 Jan 2021 12:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2CE6E20E;
 Tue, 12 Jan 2021 12:56:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DFAE23357;
 Tue, 12 Jan 2021 12:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456200;
 bh=j95pEarjfZy0tnTagImw8sNicWtXpt4JszqSf45d5DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rDs0GvFeIDH81f6qKJb7s+zZLxe2l3/MWAV0BdKlSGMg+UVpspZdn6ZXJctN1Qi06
 tYJaZVQePGKjzOl0cosYla9ASSTG8355c8vPAwVtFgF+uzrejj+OQqrkXa/RwaCWxo
 hnMP+AtyaiIpjinAXQA8fmGaOyvOsZBIXHR3pTzobUZvv9ZbLbwSdzjVSn00fhtoRP
 oEkyQuUnHk8zTyV8lNjGfDxjGXK2E9kVJz3cRZKzLu4q4Vc2CoE06/pcmDiYHuhW9G
 hKXeOlgpSRJUhC9LfnIHwq4nGeSNmIoO095OFPinmkzNOn9j5mjikKlRSESMhukLr/
 4VTEXbebZEdyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 49/51] drm/msm: Call msm_init_vram before binding
 the gpu
Date: Tue, 12 Jan 2021 07:55:31 -0500
Message-Id: <20210112125534.70280-49-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125534.70280-1-sashal@kernel.org>
References: <20210112125534.70280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 Craig Tatlor <ctatlor97@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 freedreno@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Craig Tatlor <ctatlor97@gmail.com>

[ Upstream commit d863f0c7b536288e2bd40cbc01c10465dd226b11 ]

vram.size is needed when binding a gpu without an iommu and is defined
in msm_init_vram(), so run that before binding it.

Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
Reviewed-by: Brian Masney <masneyb@onstation.org>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 49685571dc0ee..d556c353e5aea 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -444,14 +444,14 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 
 	drm_mode_config_init(ddev);
 
-	/* Bind all our sub-components: */
-	ret = component_bind_all(dev, ddev);
+	ret = msm_init_vram(ddev);
 	if (ret)
 		goto err_destroy_mdss;
 
-	ret = msm_init_vram(ddev);
+	/* Bind all our sub-components: */
+	ret = component_bind_all(dev, ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_destroy_mdss;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
