Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CA9C1E9C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 14:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E946910E9B9;
	Fri,  8 Nov 2024 13:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="E1NppOfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECCC10E9B6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 13:54:04 +0000 (UTC)
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1731074043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuPtIml5wHuWo9YnYzUt6yEz+G9J8XSUCMyiea4JHFQ=;
 b=E1NppOfdtjNHmWn3BSZdNiwXNrn2ZORyh+K6PJpNwqt1Q1g2OsvBkXF3mmqg03vq0I663L
 pfRy9AzYmuKLIYmGcWMtYGAhS/onSQsEwoozQYaUs+lGce7JHPQ+XGEMrki1xfyJTa8sD9
 Adb4jHONBc3/aa8IOpS+ky15AHiuoZF/dWkInNEyPZp3XwX458lFyutgWgub/0faxCciiF
 Gebwlh+rJA6pdFCcStUGeBFNLnixRDiizHD+G0zAKqte0GMppPjKFlLQ445RARS5wOcm5p
 CqLJYZKB9JjOD783nKdZupfeVATRNROze6YWBml2LOCfCbsuNZrsSprS6iZDqQ==
To: linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 2/2] drm/rockchip: dsi: Don't log errors on deferred dphy
Date: Fri,  8 Nov 2024 14:53:58 +0100
Message-Id: <559094275c3e41cae7c89e904341f89a1240a51a.1731073565.git.dsimic@manjaro.org>
In-Reply-To: <cover.1731073565.git.dsimic@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Deferred driver probing shouldn't result in errors or warnings being logged,
because their presence in the kernel log provides no value and may actually
cause false impression that some issues exist.  Thus, let's no longer produce
error messages when getting the dphy results in deferred probing.

This prevents misleading error messages like the following one, which was
observed on a Pine64 PineTab2, from appearing in the kernel log.  To make
matters worse, the following error message was observed appearing multiple
times in the kernel log of a single PineTab2 boot:

  dw-mipi-dsi-rockchip fe060000.dsi: [drm:dw_mipi_dsi_rockchip_probe \
  [rockchipdrm]] *ERROR* failed to get mipi dphy: -517

At the same time, make the adjusted logged message a bit more consistent with
the other logged messages by capitalizing its first word.

Reported-by: Diederik de Haas <didi.debian@cknow.org>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index f451e70efbdd..ffa7f2bc640d 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1387,7 +1387,8 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	dsi->phy = devm_phy_optional_get(dev, "dphy");
 	if (IS_ERR(dsi->phy)) {
 		ret = PTR_ERR(dsi->phy);
-		DRM_DEV_ERROR(dev, "failed to get mipi dphy: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "Failed to get mipi dphy: %d\n", ret);
 		return ret;
 	}
 
