Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E73B3F10
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 10:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2876ED9E;
	Fri, 25 Jun 2021 08:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2A96ED82;
 Fri, 25 Jun 2021 08:22:55 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43E321FE5B;
 Fri, 25 Jun 2021 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=lQxKazJFDK0uvgkuMHd4jF82EI3+AakwWUtD2iCarYXCj7wh/Xt8WIiYYh25AWL89OtwLp
 ENBeDe/MZXCQuYkJS3MphnMs0IDuHSZ0+CSbXNZrPfbCqSwYkQ+IBrFrd7pKpVvo7GSqgX
 YCXAvRDtcKLBW0m/AIouxakBhS2jFtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=BMk+XOiuF4U9c5cTx3kDp22DQBrWCO+Vbf3DFVeqsXfwnCaG+Ea5io3Rt537H6dm0hHGq3
 eqyqK0S9OMe3nCBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 22DF511C9B;
 Fri, 25 Jun 2021 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=lQxKazJFDK0uvgkuMHd4jF82EI3+AakwWUtD2iCarYXCj7wh/Xt8WIiYYh25AWL89OtwLp
 ENBeDe/MZXCQuYkJS3MphnMs0IDuHSZ0+CSbXNZrPfbCqSwYkQ+IBrFrd7pKpVvo7GSqgX
 YCXAvRDtcKLBW0m/AIouxakBhS2jFtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=BMk+XOiuF4U9c5cTx3kDp22DQBrWCO+Vbf3DFVeqsXfwnCaG+Ea5io3Rt537H6dm0hHGq3
 eqyqK0S9OMe3nCBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id iP2pB12S1WAISwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH v4 25/27] drm/vmwgfx: Don't set struct drm_device.irq_enabled
Date: Fri, 25 Jun 2021 10:22:20 +0200
Message-Id: <20210625082222.3845-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in vmxgfx. All usage of
the field within vmwgfx can safely be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index b9a9b7ddadbd..4b82f5995452 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -292,15 +292,11 @@ void vmw_irq_uninstall(struct drm_device *dev)
 	if (!(dev_priv->capabilities & SVGA_CAP_IRQMASK))
 		return;
 
-	if (!dev->irq_enabled)
-		return;
-
 	vmw_write(dev_priv, SVGA_REG_IRQMASK, 0);
 
 	status = vmw_irq_status_read(dev_priv);
 	vmw_irq_status_write(dev_priv, status);
 
-	dev->irq_enabled = false;
 	free_irq(dev->irq, dev);
 }
 
@@ -315,9 +311,6 @@ int vmw_irq_install(struct drm_device *dev, int irq)
 {
 	int ret;
 
-	if (dev->irq_enabled)
-		return -EBUSY;
-
 	vmw_irq_preinstall(dev);
 
 	ret = request_threaded_irq(irq, vmw_irq_handler, vmw_thread_fn,
@@ -325,7 +318,6 @@ int vmw_irq_install(struct drm_device *dev, int irq)
 	if (ret < 0)
 		return ret;
 
-	dev->irq_enabled = true;
 	dev->irq = irq;
 
 	return ret;
-- 
2.32.0

