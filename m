Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F192F249C3A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F796E25A;
	Wed, 19 Aug 2020 11:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DC66E23F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81A1A22D08;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=x1jF4ONUI3WvdhnDAvjBBDqTSRAPdOHh78APakRS7W0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TIsx9hgRPqwUt4i61QKXWJfm8XMR7IbUOrgog+qwyT6heCONf4T4S5VsPuwZlt0AJ
 4Bmhg4+b1ubLcJLo2z8GeR4QDOMKNeY/dN86Kq2TndErlRdNM0w3xzv0ilI6OowPlA
 NI4rlLhsFV4cCIAjSHsXYq3HwiyO9bfWNLeugR+M=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Eub7-EJ; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 27/49] staging: hikey9xx/gpu: place vblank enable/disable at
 the right place
Date: Wed, 19 Aug 2020 13:45:55 +0200
Message-Id: <64118ff9b67f151e72518d6b32694727a18ce30c.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Wanchun Zheng <zhengwanchun@hisilicon.com>,
 linuxarm@huawei.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Those methods belong to crtc fops

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin9xx_drm_dss.c   | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index e7907a0b511c..e1f2557a6be1 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -391,24 +391,26 @@ static void dss_power_down(struct dss_crtc *acrtc)
 	ctx->power_on = false;
 }
 
-static int dss_enable_vblank(struct drm_device *dev, unsigned int pipe)
+static int dss_enable_vblank(struct drm_crtc *crtc)
 {
-	struct kirin_drm_private *priv = dev->dev_private;
-	struct dss_crtc *acrtc = to_dss_crtc(priv->crtc[pipe]);
+	struct dss_crtc *acrtc = to_dss_crtc(crtc);
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
-	if (!ctx->power_on)
+	DRM_INFO("%s\n", __func__);
+	if (!ctx->power_on) {
+		DRM_INFO("Enabling vblank\n");
 		(void)dss_power_up(acrtc);
+	}
 
 	return 0;
 }
 
-static void dss_disable_vblank(struct drm_device *dev, unsigned int pipe)
+static void dss_disable_vblank(struct drm_crtc *crtc)
 {
-	struct kirin_drm_private *priv = dev->dev_private;
-	struct dss_crtc *acrtc = to_dss_crtc(priv->crtc[pipe]);
+	struct dss_crtc *acrtc = to_dss_crtc(crtc);
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
+	DRM_INFO("%s\n", __func__);
 	if (!ctx->power_on) {
 		DRM_ERROR("power is down! vblank disable fail\n");
 		return;
@@ -545,6 +547,8 @@ static const struct drm_crtc_funcs dss_crtc_funcs = {
 	.reset		= drm_atomic_helper_crtc_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank = dss_enable_vblank,
+	.disable_vblank = dss_disable_vblank,
 };
 
 static int dss_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
@@ -928,9 +932,6 @@ static int dss_drm_init(struct drm_device *dev)
 
 	disable_irq(ctx->irq);
 
-	dev->driver->enable_vblank = dss_enable_vblank;
-	dev->driver->disable_vblank = dss_disable_vblank;
-
 	return 0;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
