Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E4515DF1E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FE36FA65;
	Fri, 14 Feb 2020 16:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164536FA65
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:07:39 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 035832067D;
 Fri, 14 Feb 2020 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696458;
 bh=fnx7SJY0GVFCyYRf53hfDuerPrwVmGYhI3JvugVoLLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xLOwjpdfHF7/xpWJya84oDKURXrNR1RVpOUNVnnhSmhbE36Q1AisPvkA9XE9/MyiR
 5+laB7HTARYErJI064hu7uvDBUaHdSXCiMKY730qEgY5ABhyb6vtRzjVUFpPpc6gOt
 4or7blyzk3egUFwZwNnG6rGNypc3cxqrEumma05k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 270/459] drm/mediatek: Add gamma property
 according to hardware capability
Date: Fri, 14 Feb 2020 10:58:40 -0500
Message-Id: <20200214160149.11681-270-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

[ Upstream commit 4cebc1de506fa753301266a5a23bb21bca52ad3a ]

If there is no gamma function in the crtc
display path, don't add gamma property
for crtc

Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0b3d284d19569..e6c049f4f08bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -537,6 +537,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	int pipe = priv->num_pipes;
 	int ret;
 	int i;
+	uint gamma_lut_size = 0;
 
 	if (!path)
 		return 0;
@@ -587,6 +588,9 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		}
 
 		mtk_crtc->ddp_comp[i] = comp;
+
+		if (comp->funcs && comp->funcs->gamma_set)
+			gamma_lut_size = MTK_LUT_SIZE;
 	}
 
 	mtk_crtc->layer_nr = mtk_ddp_comp_layer_nr(mtk_crtc->ddp_comp[0]);
@@ -609,8 +613,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				NULL, pipe);
 	if (ret < 0)
 		return ret;
-	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
-	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
+
+	if (gamma_lut_size)
+		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
+	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, gamma_lut_size);
 	priv->num_pipes++;
 
 	return 0;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
