Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904C6ABEC7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336AF10E26E;
	Mon,  6 Mar 2023 11:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEC710E26E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 11:53:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZ9Os-0007KQ-PC; Mon, 06 Mar 2023 12:53:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZ9Or-002EWp-JP; Mon, 06 Mar 2023 12:53:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZ9Oq-002fPD-PC; Mon, 06 Mar 2023 12:53:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>,
 Danilo Krummrich <dakr@redhat.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v6 0/2] drm/imx/lcdc: Implement DRM driver for imx25
Date: Mon,  6 Mar 2023 12:52:47 +0100
Message-Id: <20230306115249.2223042-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZQafLqCvrOyZY9GT64lmcJ9KbCJ2Ja9qncvaOCm+puA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBdQGEdUD2U+Xyvo7WylhH+eF+hQLUlq7f/ur2
 LM+59tTkmCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAXUBgAKCRDB/BR4rcrs
 Cd3uB/0dLeqthuy9cKdU311vR1haAD7mxhjdjiV4Nb3bnOVuAOLMqo6e6w5uB+MLBLeuHrHK7Ad
 IVKxegVb1/E5Iad9FL6fxMfsd3jtAd870F0g2I3w42MOb5UC0YEjrttr9MydxHHGjrR5j9K4PmN
 LhJfgySBl/0Q1YE1hLHLumH5Sm169X4fM9n3YHSpt9BmcmKGLKlzuYZYMyzCflu/M93AudcTPxx
 5tN8FJJCMvVvrv5CCLEtRUGWh/4b8YQKVWQi2EfCB/8pXqai0avu3cvdG4uP0cMZkt7sc2aS1gf
 ZopBZRt+POG+ak+EQmXPbHxmWEuzciPWaLjKCPTAKHRIOpLe
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

in response to Philipp's reply to v5 here comes a v6. The code changes are:

| diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
| index c2197fc50306..24bc7b310367 100644
| --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
| +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
| @@ -7,7 +7,6 @@
|  #include <drm/drm_fbdev_generic.h>
|  #include <drm/drm_fb_dma_helper.h>
|  #include <drm/drm_fourcc.h>
| -#include <drm/drm_fourcc.h>
|  #include <drm/drm_framebuffer.h>
|  #include <drm/drm_gem_atomic_helper.h>
|  #include <drm/drm_gem_dma_helper.h>
| @@ -101,8 +100,6 @@
|  struct imx_lcdc {
|  	struct drm_device drm;
|  	struct drm_simple_display_pipe pipe;
| -	const struct drm_display_mode *mode;
| -	struct drm_bridge *bridge;
|  	struct drm_connector *connector;
|  	void __iomem *base;
|  
| @@ -122,23 +119,17 @@ static inline struct imx_lcdc *imx_lcdc_from_drmdev(struct drm_device *drm)
|  
|  static unsigned int imx_lcdc_get_format(unsigned int drm_format)
|  {
| -	unsigned int bpp;
| -
|  	switch (drm_format) {
|  	default:
|  		DRM_WARN("Format not supported - fallback to XRGB8888\n");
|  		fallthrough;
|  
|  	case DRM_FORMAT_XRGB8888:
| -		bpp = BPP_XRGB8888;
| -		break;
| +		return BPP_XRGB8888;
|  
|  	case DRM_FORMAT_RGB565:
| -		bpp = BPP_RGB565;
| -		break;
| +		return BPP_RGB565;
|  	}
| -
| -	return bpp;
|  }
|  
|  static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
| @@ -401,6 +392,7 @@ static int imx_lcdc_probe(struct platform_device *pdev)
|  {
|  	struct imx_lcdc *lcdc;
|  	struct drm_device *drm;
| +	struct drm_bridge *bridge;
|  	int irq;
|  	int ret;
|  	struct device *dev = &pdev->dev;
| @@ -416,9 +408,9 @@ static int imx_lcdc_probe(struct platform_device *pdev)
|  	if (IS_ERR(lcdc->base))
|  		return dev_err_probe(dev, PTR_ERR(lcdc->base), "Cannot get IO memory\n");
|  
| -	lcdc->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
| -	if (IS_ERR(lcdc->bridge))
| -		return dev_err_probe(dev, PTR_ERR(lcdc->bridge), "Failed to find bridge\n");
| +	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
| +	if (IS_ERR(bridge))
| +		return dev_err_probe(dev, PTR_ERR(bridge), "Failed to find bridge\n");
|  
|  	/* Get Clocks */
|  	lcdc->clk_ipg = devm_clk_get(dev, "ipg");
| @@ -454,7 +446,7 @@ static int imx_lcdc_probe(struct platform_device *pdev)
|  	if (ret < 0)
|  		return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
|  
| -	ret = drm_bridge_attach(&lcdc->pipe.encoder, lcdc->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
| +	ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
|  	if (ret)
|  		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");

(I quoted the patch in the hope that this way it won't interfere with b4
am or whatever is used to pickup this series.)

Other than that I rebased the series to v6.3-rc1 and added the tags by
Rob and Phillip that I got for v5.
 
Marian Cichy (1):
  drm/imx/lcdc: Implement DRM driver for imx25

Uwe Kleine-König (1):
  dt-bindings: display: imx: Describe drm binding for fsl,imx-lcdc

 .../bindings/display/imx/fsl,imx-lcdc.yaml    |  46 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/lcdc/Kconfig              |   7 +
 drivers/gpu/drm/imx/lcdc/Makefile             |   1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           | 545 ++++++++++++++++++
 6 files changed, 600 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/lcdc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/lcdc/Makefile
 create mode 100644 drivers/gpu/drm/imx/lcdc/imx-lcdc.c

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.1

