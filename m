Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA81427C40
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 19:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9D96E1D8;
	Sat,  9 Oct 2021 17:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B56E1D8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 17:07:50 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 65cfa7de-2923-11ec-ac3c-0050568cd888;
 Sat, 09 Oct 2021 17:07:35 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A83F0194B4A;
 Sat,  9 Oct 2021 19:07:35 +0200 (CEST)
Date: Sat, 9 Oct 2021 19:07:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Fix build [Was: [PATCH 2/2] drm/panel: Add support for Sharp
 LS060T1SX01 panel]
Message-ID: <YWHMYgL2o+uzdTUi@ravnborg.org>
References: <20210808035053.58074-1-dmitry.baryshkov@linaro.org>
 <20210808035053.58074-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210808035053.58074-2-dmitry.baryshkov@linaro.org>
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

Applied this but forgot to commit the build fix:

commit 1ae669fe083fda99e465ae6ab2c533658bdb846e
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Sat Oct 9 19:02:48 2021 +0200

    drm/panel: sharp-ls060t1sx01: fix build
    
    Update MIPI_DSI_MODE_EOT_PACKET to the new MIPI_DSI_MODE_NO_EOT_PACKET
    variant.
    This fixes the build - I had not committed the fix (blush).
    
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
    Fixes: 223cce88a926 ("drm/panel: Add support for Sharp LS060T1SX01 panel")
    Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
index 1049810d1f10..ed5f28c8c90b 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
@@ -275,7 +275,7 @@ static int sharp_ls060_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_EOT_PACKET |
+			  MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	drm_panel_init(&ctx->panel, dev, &sharp_ls060_panel_funcs,
