Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B713B06C0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 16:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDCD6E50E;
	Tue, 22 Jun 2021 14:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DC36E506;
 Tue, 22 Jun 2021 14:10:08 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A157D2198B;
 Tue, 22 Jun 2021 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRAIM2b9hcMZtpj1XmOCRlAOXVW+Cbn/WAr682hqNSs=;
 b=vqm9dI3V0nrHSjy2CtFLenVHqjz8WsHqZyyjhgNtOINrIavnieIQ310rzLkEAPtHq7VzGS
 VHLPNnQEc6k693CAl2rM+uYgXq+OrJd5hMG3WynS3vDPiEhJD54dTYSd3GXskP1jP4nEyp
 dxj1jZ3xfQ7o4TdmLLfQxD9AbLw4GdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRAIM2b9hcMZtpj1XmOCRlAOXVW+Cbn/WAr682hqNSs=;
 b=xBXa4bW1nD4K8968XQUo8pVHbPuTILpO3mWKrxajgAUVry/PxbHgWYOtNoK22If5d4UBBj
 w+UCYzGFnlkmd6Aw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9B8C8118DD;
 Tue, 22 Jun 2021 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRAIM2b9hcMZtpj1XmOCRlAOXVW+Cbn/WAr682hqNSs=;
 b=vqm9dI3V0nrHSjy2CtFLenVHqjz8WsHqZyyjhgNtOINrIavnieIQ310rzLkEAPtHq7VzGS
 VHLPNnQEc6k693CAl2rM+uYgXq+OrJd5hMG3WynS3vDPiEhJD54dTYSd3GXskP1jP4nEyp
 dxj1jZ3xfQ7o4TdmLLfQxD9AbLw4GdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRAIM2b9hcMZtpj1XmOCRlAOXVW+Cbn/WAr682hqNSs=;
 b=xBXa4bW1nD4K8968XQUo8pVHbPuTILpO3mWKrxajgAUVry/PxbHgWYOtNoK22If5d4UBBj
 w+UCYzGFnlkmd6Aw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id AKIBJT3v0WD3UAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:05 +0000
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
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com
Subject: [PATCH v2 02/22] drm/hibmc: Call drm_irq_uninstall() unconditionally
Date: Tue, 22 Jun 2021 16:09:42 +0200
Message-Id: <20210622141002.11590-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the check around drm_irq_uninstall(). The same test is
done by the function internally. The tested state in irq_enabled
is considered obsolete and should not be used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index f4bc5386574a..f8ef711bbe5d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -253,8 +253,7 @@ static int hibmc_unload(struct drm_device *dev)
 {
 	drm_atomic_helper_shutdown(dev);
 
-	if (dev->irq_enabled)
-		drm_irq_uninstall(dev);
+	drm_irq_uninstall(dev);
 
 	pci_disable_msi(to_pci_dev(dev->dev));
 
-- 
2.32.0

