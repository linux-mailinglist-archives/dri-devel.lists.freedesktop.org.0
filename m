Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9A893E4F2
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 13:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5137710E156;
	Sun, 28 Jul 2024 11:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="udsa8Jj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE00910E156
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722167367; x=1722772167; i=wahrenst@gmx.net;
 bh=OETJHmfg+IWvFND21ujMzZHxRiMCnLCfIId2t3sSrIg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=udsa8Jj+28VThN+3NYpI5mox1aOpLd3tOFq6vvErU+IKWg3eU4In3VWcGA39WD9q
 gobMZdgOT9XH2LL2Gd+6oFfOzTe+XhmvzINk93WmsGqsUstiKSpiS+N7ma61nReQg
 6X8cRyNdTNXkOmHdMyiAr/aE7DjChhLbOAYcrPs5pVthjPQPDOF+p1vqJwqoFs31A
 qPHPL8SWFeJUSDXdlNYQMerxcrXEu6S4QjCDG/wVKLRtzasKfR+RFVYfIvhwhhvNG
 h3M4D6Gko/+w1AzenSiV0qiXaqJ7NMqGEEXMebqbJ0DCRrv2sSnNRlcVg6msVEKZh
 gcSBtz4+pmeyaeiVzA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9XF-1sPTpX42Tp-005QPg; Sun, 28
 Jul 2024 13:49:27 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 07/16] drm/vc4: Get the rid of DRM_ERROR()
Date: Sun, 28 Jul 2024 13:41:51 +0200
Message-Id: <20240728114200.75559-8-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728114200.75559-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vlufmZmc7VbhfuNGl348AU8Y5F8QKWnubU+/zgbZggrclMUpJJc
 lOLT9OuPFYx3fn9O6TUrW99FN8igt25huLm5BtuQLdd1eLjw58eo2rl6tdQft+gqGIyq9yk
 MtLfTHLb2kMZD/9SPCGcLQ5BtnaNoLA8PEPLustqrU3gokx4W9GIHRdXUvCEZf3Wc80IXY8
 6cIodOdFU2E9UbWthKp6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BN5VOCnUPuw=;ITwlB/4noWGJ9ry9vRvmLfFqC1g
 UN8jhElyCzmYlYIOoMY3fbZcmkB0jipuuMDwhc4weUI7Obj7vED5ivUQUxhQl+MKxwBftveeL
 t4hfwcTBfCbjmiZfGKy/R+QVN4wvDmljvkiCLmDMqf86A0ZmVwzvt66OGeX0vqkFutXmyD/oL
 zuW3SXKMP+gCiJJJs7AYNKoM5r6OYv6oSpQn0xFQvnuhxjfz0rUftX01btSXUEhymq1/5WNT+
 ic7fUTLznbD6Jptg8AAk/zBkWdc0zt0pKTy3xkYsOWuZ1SGfMGIJLT72iLoE2jsu/JVRtGkG+
 iCTOuMvFyN9v0+XlsHJcLwG/d/eEqsQPEuwZ/lsWGUpgAZjScAEXg0+kPntgqAOCM0r0rqLdS
 9Xq2D3H487Zo6aOH0z7yvAA5f7JIw+opTf3sQvNtr7Tve6Kd6F1k2j8H2r5ANfPgbiV5/GECE
 kyNQGvvgjtFSe3yMv3iVpY8ktj2ucfQ2egaMSD5NW7VbLBNEiXumNnoyDCqR4La1lGse8m0SC
 ZIEA7ot+bPszEMRqrDYmdLguN22BFTV0js9sKOpQ7AX3hMAeeyPrZlT34k4pdLoF/0qktZpNe
 CBCjHftU45pSZVdoh8m8C/w6ERAy2dJA7GxW1VUqgqtC9MLLr3XUfvBU/1807eWTCwyaqydUk
 gljtudyLMaM7gL9Bl8p4rLRP2JXPhpJSImATJeybpPvoP145/Oi0dT5UQy7xt4GP24fzD+yfp
 LvgKsq4QUbYTh1H2GFy0/wJe1vPSUJt+SNYIlZsJOR4zETf6POCQ0z9a7D+oQJTlpn8iacSby
 WGKK9b3X8zY1hbKDvv4TOxaQ==
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

DRM_ERROR() has been deprecated in favor of pr_err(). However, we
should prefer to use drm_err() whenever possible so we get device-
specific output with the error message. In error case of kcalloc,
we can simply drop DRM_ERROR(), because kcalloc already logs errors.

Suggested-by: Ma=C3=ADra Canal <mcanal@igalia.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/vc4/vc4_bo.c       | 14 ++++++------
 drivers/gpu/drm/vc4/vc4_dpi.c      | 14 ++++++------
 drivers/gpu/drm/vc4/vc4_dsi.c      | 32 ++++++++++++++------------
 drivers/gpu/drm/vc4/vc4_gem.c      | 11 +++++----
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 36 +++++++++++++++---------------
 drivers/gpu/drm/vc4/vc4_hvs.c      |  4 ++--
 drivers/gpu/drm/vc4/vc4_irq.c      |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c      |  6 ++---
 drivers/gpu/drm/vc4/vc4_validate.c |  8 +++----
 drivers/gpu/drm/vc4/vc4_vec.c      | 10 ++++-----
 10 files changed, 70 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 86d629e45307..952953b4cdf8 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -469,7 +469,7 @@ struct vc4_bo *vc4_bo_create(struct drm_device *dev, s=
ize_t unaligned_size,

 	if (IS_ERR(dma_obj)) {
 		struct drm_printer p =3D drm_info_printer(vc4->base.dev);
-		DRM_ERROR("Failed to allocate from GEM DMA helper:\n");
+		drm_err(dev, "Failed to allocate from GEM DMA helper:\n");
 		vc4_bo_stats_print(&p, vc4);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -702,7 +702,7 @@ static struct dma_buf *vc4_prime_export(struct drm_gem=
_object *obj, int flags)
 	 */
 	ret =3D vc4_bo_inc_usecnt(bo);
 	if (ret) {
-		DRM_ERROR("Failed to increment BO usecnt\n");
+		drm_err(obj->dev, "Failed to increment BO usecnt\n");
 		return ERR_PTR(ret);
 	}

@@ -1050,10 +1050,10 @@ static void vc4_bo_cache_destroy(struct drm_device=
 *dev, void *unused)

 	for (i =3D 0; i < vc4->num_labels; i++) {
 		if (vc4->bo_labels[i].num_allocated) {
-			DRM_ERROR("Destroying BO cache with %d %s "
-				  "BOs still allocated\n",
-				  vc4->bo_labels[i].num_allocated,
-				  vc4->bo_labels[i].name);
+			drm_err(dev, "Destroying BO cache with %d %s "
+				     "BOs still allocated\n",
+				     vc4->bo_labels[i].num_allocated,
+				     vc4->bo_labels[i].name);
 		}

 		if (is_user_label(i))
@@ -1083,7 +1083,7 @@ int vc4_label_bo_ioctl(struct drm_device *dev, void =
*data,

 	gem_obj =3D drm_gem_object_lookup(file_priv, args->handle);
 	if (!gem_obj) {
-		DRM_ERROR("Failed to look up GEM BO %d\n", args->handle);
+		drm_err(dev, "Failed to look up GEM BO %d\n", args->handle);
 		kfree(name);
 		return -ENOENT;
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 39152e755a13..688bfddbfb8f 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -199,8 +199,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder =
*encoder)
 						       DPI_FORMAT);
 				break;
 			default:
-				DRM_ERROR("Unknown media bus format %d\n",
-					  bus_format);
+				drm_err(dev, "Unknown media bus format %d\n",
+					     bus_format);
 				break;
 			}
 		}
@@ -236,11 +236,11 @@ static void vc4_dpi_encoder_enable(struct drm_encode=
r *encoder)

 	ret =3D clk_set_rate(dpi->pixel_clock, mode->clock * 1000);
 	if (ret)
-		DRM_ERROR("Failed to set clock rate: %d\n", ret);
+		drm_err(dev, "Failed to set clock rate: %d\n", ret);

 	ret =3D clk_prepare_enable(dpi->pixel_clock);
 	if (ret)
-		DRM_ERROR("Failed to set clock rate: %d\n", ret);
+		drm_err(dev, "Failed to set clock rate: %d\n", ret);

 	drm_dev_exit(idx);
 }
@@ -339,7 +339,7 @@ static int vc4_dpi_bind(struct device *dev, struct dev=
ice *master, void *data)
 	if (IS_ERR(dpi->core_clock)) {
 		ret =3D PTR_ERR(dpi->core_clock);
 		if (ret !=3D -EPROBE_DEFER)
-			DRM_ERROR("Failed to get core clock: %d\n", ret);
+			drm_err(drm, "Failed to get core clock: %d\n", ret);
 		return ret;
 	}

@@ -347,13 +347,13 @@ static int vc4_dpi_bind(struct device *dev, struct d=
evice *master, void *data)
 	if (IS_ERR(dpi->pixel_clock)) {
 		ret =3D PTR_ERR(dpi->pixel_clock);
 		if (ret !=3D -EPROBE_DEFER)
-			DRM_ERROR("Failed to get pixel clock: %d\n", ret);
+			drm_err(drm, "Failed to get pixel clock: %d\n", ret);
 		return ret;
 	}

 	ret =3D clk_prepare_enable(dpi->core_clock);
 	if (ret) {
-		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
+		drm_err(drm, "Failed to turn on core clock: %d\n", ret);
 		return ret;
 	}

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 46f6c4ce61c5..b5f61da199c9 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -613,6 +613,7 @@ struct vc4_dsi {
 static inline void
 dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 {
+	struct drm_device *drm =3D dsi->bridge.dev;
 	struct dma_chan *chan =3D dsi->reg_dma_chan;
 	struct dma_async_tx_descriptor *tx;
 	dma_cookie_t cookie;
@@ -633,19 +634,19 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 of=
fset, u32 val)
 						  dsi->reg_dma_paddr,
 						  4, 0);
 	if (!tx) {
-		DRM_ERROR("Failed to set up DMA register write\n");
+		drm_err(drm, "Failed to set up DMA register write\n");
 		return;
 	}

 	cookie =3D tx->tx_submit(tx);
 	ret =3D dma_submit_error(cookie);
 	if (ret) {
-		DRM_ERROR("Failed to submit DMA: %d\n", ret);
+		drm_err(drm, "Failed to submit DMA: %d\n", ret);
 		return;
 	}
 	ret =3D dma_sync_wait(chan, cookie);
 	if (ret)
-		DRM_ERROR("Failed to wait for DMA: %d\n", ret);
+		drm_err(drm, "Failed to wait for DMA: %d\n", ret);
 }

 #define DSI_READ(offset)								\
@@ -893,7 +894,7 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridg=
e *bridge,

 	ret =3D pm_runtime_resume_and_get(dev);
 	if (ret) {
-		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->variant->port)=
;
+		drm_err(bridge->dev, "Failed to runtime PM enable on DSI%d\n", dsi->var=
iant->port);
 		return;
 	}

@@ -986,13 +987,14 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bri=
dge *bridge,

 	ret =3D clk_prepare_enable(dsi->escape_clock);
 	if (ret) {
-		DRM_ERROR("Failed to turn on DSI escape clock: %d\n", ret);
+		drm_err(bridge->dev, "Failed to turn on DSI escape clock: %d\n",
+				     ret);
 		return;
 	}

 	ret =3D clk_prepare_enable(dsi->pll_phy_clock);
 	if (ret) {
-		DRM_ERROR("Failed to turn on DSI PLL: %d\n", ret);
+		drm_err(bridge->dev, "Failed to turn on DSI PLL: %d\n", ret);
 		return;
 	}

@@ -1014,7 +1016,7 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bri=
dge *bridge,

 	ret =3D clk_prepare_enable(dsi->pixel_clock);
 	if (ret) {
-		DRM_ERROR("Failed to turn on DSI pixel clock: %d\n", ret);
+		drm_err(bridge->dev, "Failed to turn on DSI pixel clock: %d\n", ret);
 		return;
 	}

@@ -1172,6 +1174,7 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi=
_host *host,
 				     const struct mipi_dsi_msg *msg)
 {
 	struct vc4_dsi *dsi =3D host_to_dsi(host);
+	struct drm_device *drm =3D dsi->bridge.dev;
 	struct mipi_dsi_packet packet;
 	u32 pkth =3D 0, pktc =3D 0;
 	int i, ret;
@@ -1303,8 +1306,8 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi=
_host *host,
 						  DSI_RXPKT1H_BC_PARAM);

 			if (rxlen !=3D msg->rx_len) {
-				DRM_ERROR("DSI returned %db, expecting %db\n",
-					  rxlen, (int)msg->rx_len);
+				drm_err(drm, "DSI returned %db, expecting %db\n",
+					     rxlen, (int)msg->rx_len);
 				ret =3D -ENXIO;
 				goto reset_fifo_and_return;
 			}
@@ -1326,7 +1329,7 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi=
_host *host,
 	return ret;

 reset_fifo_and_return:
-	DRM_ERROR("DSI transfer failed, resetting: %d\n", ret);
+	drm_err(drm, "DSI transfer failed, resetting: %d\n", ret);

 	DSI_PORT_WRITE(TXPKT1C, DSI_PORT_READ(TXPKT1C) & ~DSI_TXPKT1C_CMD_EN);
 	udelay(1);
@@ -1468,7 +1471,8 @@ static void dsi_handle_error(struct vc4_dsi *dsi,
 	if (!(stat & bit))
 		return;

-	DRM_ERROR("DSI%d: %s error\n", dsi->variant->port, type);
+	drm_err(dsi->bridge.dev, "DSI%d: %s error\n", dsi->variant->port,
+		type);
 	*ret =3D IRQ_HANDLED;
 }

@@ -1687,7 +1691,7 @@ static int vc4_dsi_bind(struct device *dev, struct d=
evice *master, void *data)
 						      &dsi->reg_dma_paddr,
 						      GFP_KERNEL);
 		if (!dsi->reg_dma_mem) {
-			DRM_ERROR("Failed to get DMA memory\n");
+			drm_err(drm, "Failed to get DMA memory\n");
 			return -ENOMEM;
 		}

@@ -1702,8 +1706,8 @@ static int vc4_dsi_bind(struct device *dev, struct d=
evice *master, void *data)
 		if (IS_ERR(dsi->reg_dma_chan)) {
 			ret =3D PTR_ERR(dsi->reg_dma_chan);
 			if (ret !=3D -EPROBE_DEFER)
-				DRM_ERROR("Failed to get DMA channel: %d\n",
-					  ret);
+				drm_err(drm, "Failed to get DMA channel: %d\n",
+					     ret);
 			return ret;
 		}

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 03648f954985..f12d572287f0 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -832,8 +832,8 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_in=
fo *exec)
 	 */
 	temp =3D kvmalloc_array(temp_size, 1, GFP_KERNEL);
 	if (!temp) {
-		DRM_ERROR("Failed to allocate storage for copying "
-			  "in bin/render CLs.\n");
+		drm_err(dev, "Failed to allocate storage for copying "
+			     "in bin/render CLs.\n");
 		ret =3D -ENOMEM;
 		goto fail;
 	}
@@ -866,7 +866,7 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_in=
fo *exec)

 	bo =3D vc4_bo_create(dev, exec_size, true, VC4_BO_TYPE_BCL);
 	if (IS_ERR(bo)) {
-		DRM_ERROR("Couldn't allocate BO for binning\n");
+		drm_err(dev, "Couldn't allocate BO for binning\n");
 		ret =3D PTR_ERR(bo);
 		goto fail;
 	}
@@ -1153,10 +1153,9 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *d=
ata,
 	}

 	exec =3D kcalloc(1, sizeof(*exec), GFP_KERNEL);
-	if (!exec) {
-		DRM_ERROR("malloc failure on exec struct\n");
+	if (!exec)
 		return -ENOMEM;
-	}
+
 	exec->dev =3D vc4;

 	ret =3D vc4_v3d_pm_get(vc4);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi=
.c
index cb424604484f..6611ab7c26a6 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -704,7 +704,7 @@ static int vc4_hdmi_write_infoframe(struct drm_connect=
or *connector,

 	ret =3D vc4_hdmi_stop_packet(vc4_hdmi, type, true);
 	if (ret) {
-		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
+		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
 		goto out;
 	}

@@ -740,7 +740,7 @@ static int vc4_hdmi_write_infoframe(struct drm_connect=
or *connector,
 	ret =3D wait_for((HDMI_READ(HDMI_RAM_PACKET_STATUS) &
 			BIT(packet_id)), 100);
 	if (ret)
-		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
+		drm_err(drm, "Failed to wait for infoframe to start: %d\n", ret);

 out:
 	drm_dev_exit(idx);
@@ -901,7 +901,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struc=
t drm_encoder *encoder,

 	ret =3D pm_runtime_put(&vc4_hdmi->pdev->dev);
 	if (ret < 0)
-		DRM_ERROR("Failed to release power domain: %d\n", ret);
+		drm_err(drm, "Failed to release power domain: %d\n", ret);

 	drm_dev_exit(idx);

@@ -1443,7 +1443,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(stru=
ct drm_encoder *encoder,

 	ret =3D pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
 	if (ret < 0) {
-		DRM_ERROR("Failed to retain power domain: %d\n", ret);
+		drm_err(drm, "Failed to retain power domain: %d\n", ret);
 		goto err_dev_exit;
 	}

@@ -1468,19 +1468,19 @@ static void vc4_hdmi_encoder_pre_crtc_configure(st=
ruct drm_encoder *encoder,
 			 div_u64(tmds_char_rate, 100) * 101);
 	ret =3D clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
-		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
+		drm_err(drm, "Failed to set HSM clock rate: %d\n", ret);
 		goto err_put_runtime_pm;
 	}

 	ret =3D clk_set_rate(vc4_hdmi->pixel_clock, tmds_char_rate);
 	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
+		drm_err(drm, "Failed to set pixel clock rate: %d\n", ret);
 		goto err_put_runtime_pm;
 	}

 	ret =3D clk_prepare_enable(vc4_hdmi->pixel_clock);
 	if (ret) {
-		DRM_ERROR("Failed to turn on pixel clock: %d\n", ret);
+		drm_err(drm, "Failed to turn on pixel clock: %d\n", ret);
 		goto err_put_runtime_pm;
 	}

@@ -1496,13 +1496,13 @@ static void vc4_hdmi_encoder_pre_crtc_configure(st=
ruct drm_encoder *encoder,

 	ret =3D clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
 	if (ret) {
-		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
+		drm_err(drm, "Failed to set pixel bvb clock rate: %d\n", ret);
 		goto err_disable_pixel_clock;
 	}

 	ret =3D clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	if (ret) {
-		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
+		drm_err(drm, "Failed to turn on pixel bvb clock: %d\n", ret);
 		goto err_disable_pixel_clock;
 	}

@@ -2951,13 +2951,13 @@ static int vc4_hdmi_init_resources(struct drm_devi=
ce *drm,
 	if (IS_ERR(vc4_hdmi->pixel_clock)) {
 		ret =3D PTR_ERR(vc4_hdmi->pixel_clock);
 		if (ret !=3D -EPROBE_DEFER)
-			DRM_ERROR("Failed to get pixel clock\n");
+			drm_err(drm, "Failed to get pixel clock\n");
 		return ret;
 	}

 	vc4_hdmi->hsm_clock =3D devm_clk_get(dev, "hdmi");
 	if (IS_ERR(vc4_hdmi->hsm_clock)) {
-		DRM_ERROR("Failed to get HDMI state machine clock\n");
+		drm_err(drm, "Failed to get HDMI state machine clock\n");
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
 	vc4_hdmi->audio_clock =3D vc4_hdmi->hsm_clock;
@@ -3041,31 +3041,31 @@ static int vc5_hdmi_init_resources(struct drm_devi=
ce *drm,

 	vc4_hdmi->hsm_clock =3D devm_clk_get(dev, "hdmi");
 	if (IS_ERR(vc4_hdmi->hsm_clock)) {
-		DRM_ERROR("Failed to get HDMI state machine clock\n");
+		drm_err(drm, "Failed to get HDMI state machine clock\n");
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}

 	vc4_hdmi->pixel_bvb_clock =3D devm_clk_get(dev, "bvb");
 	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
-		DRM_ERROR("Failed to get pixel bvb clock\n");
+		drm_err(drm, "Failed to get pixel bvb clock\n");
 		return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
 	}

 	vc4_hdmi->audio_clock =3D devm_clk_get(dev, "audio");
 	if (IS_ERR(vc4_hdmi->audio_clock)) {
-		DRM_ERROR("Failed to get audio clock\n");
+		drm_err(drm, "Failed to get audio clock\n");
 		return PTR_ERR(vc4_hdmi->audio_clock);
 	}

 	vc4_hdmi->cec_clock =3D devm_clk_get(dev, "cec");
 	if (IS_ERR(vc4_hdmi->cec_clock)) {
-		DRM_ERROR("Failed to get CEC clock\n");
+		drm_err(drm, "Failed to get CEC clock\n");
 		return PTR_ERR(vc4_hdmi->cec_clock);
 	}

 	vc4_hdmi->reset =3D devm_reset_control_get(dev, NULL);
 	if (IS_ERR(vc4_hdmi->reset)) {
-		DRM_ERROR("Failed to get HDMI reset line\n");
+		drm_err(drm, "Failed to get HDMI reset line\n");
 		return PTR_ERR(vc4_hdmi->reset);
 	}

@@ -3221,14 +3221,14 @@ static int vc4_hdmi_bind(struct device *dev, struc=
t device *master, void *data)

 	ddc_node =3D of_parse_phandle(dev->of_node, "ddc", 0);
 	if (!ddc_node) {
-		DRM_ERROR("Failed to find ddc node in device tree\n");
+		drm_err(drm, "Failed to find ddc node in device tree\n");
 		return -ENODEV;
 	}

 	vc4_hdmi->ddc =3D of_find_i2c_adapter_by_node(ddc_node);
 	of_node_put(ddc_node);
 	if (!vc4_hdmi->ddc) {
-		DRM_DEBUG("Failed to get ddc i2c adapter by node\n");
+		drm_err(drm, "Failed to get ddc i2c adapter by node\n");
 		return -EPROBE_DEFER;
 	}

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 04af672caacb..3f13ff692c28 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -191,8 +191,8 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs=
 *hvs,

 	ret =3D drm_mm_insert_node(&hvs->dlist_mm, space, VC4_KERNEL_DWORDS);
 	if (ret) {
-		DRM_ERROR("Failed to allocate space for filter kernel: %d\n",
-			  ret);
+		drm_err(&hvs->vc4->base, "Failed to allocate space for filter kernel: %=
d\n",
+					 ret);
 		return ret;
 	}

diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 563b3dfeb9b9..ef93d8e22a35 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -76,7 +76,7 @@ vc4_overflow_mem_work(struct work_struct *work)

 	bin_bo_slot =3D vc4_v3d_get_bin_slot(vc4);
 	if (bin_bo_slot < 0) {
-		DRM_ERROR("Couldn't allocate binner overflow mem\n");
+		drm_err(&vc4->base, "Couldn't allocate binner overflow mem\n");
 		goto complete;
 	}

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 04ac7805e6d5..1ede508a67d3 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -471,8 +471,8 @@ static int vc4_v3d_bind(struct device *dev, struct dev=
ice *master, void *data)
 		return ret;

 	if (V3D_READ(V3D_IDENT0) !=3D V3D_EXPECTED_IDENT0) {
-		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
-			  V3D_READ(V3D_IDENT0), V3D_EXPECTED_IDENT0);
+		drm_err(drm, "V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
+			     V3D_READ(V3D_IDENT0), V3D_EXPECTED_IDENT0);
 		ret =3D -EINVAL;
 		goto err_put_runtime_pm;
 	}
@@ -485,7 +485,7 @@ static int vc4_v3d_bind(struct device *dev, struct dev=
ice *master, void *data)

 	ret =3D vc4_irq_install(drm, vc4->irq);
 	if (ret) {
-		DRM_ERROR("Failed to install IRQ handler\n");
+		drm_err(drm, "Failed to install IRQ handler\n");
 		goto err_put_runtime_pm;
 	}

diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_=
validate.c
index 7dff3ca5af6b..5474a36c5c9d 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -65,7 +65,7 @@ utile_width(int cpp)
 	case 8:
 		return 2;
 	default:
-		DRM_ERROR("unknown cpp: %d\n", cpp);
+		pr_err("unknown cpp: %d\n", cpp);
 		return 1;
 	}
 }
@@ -82,7 +82,7 @@ utile_height(int cpp)
 	case 8:
 		return 4;
 	default:
-		DRM_ERROR("unknown cpp: %d\n", cpp);
+		pr_err("unknown cpp: %d\n", cpp);
 		return 1;
 	}
 }
@@ -390,8 +390,8 @@ validate_tile_binning_config(VALIDATE_ARGS)
 	bin_slot =3D vc4_v3d_get_bin_slot(vc4);
 	if (bin_slot < 0) {
 		if (bin_slot !=3D -EINTR && bin_slot !=3D -ERESTARTSYS) {
-			DRM_ERROR("Failed to allocate binner memory: %d\n",
-				  bin_slot);
+			drm_err(dev, "Failed to allocate binner memory: %d\n",
+				     bin_slot);
 		}
 		return bin_slot;
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 070813b8aff8..eb64e881051e 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -557,7 +557,7 @@ static void vc4_vec_encoder_disable(struct drm_encoder=
 *encoder,

 	ret =3D pm_runtime_put(&vec->pdev->dev);
 	if (ret < 0) {
-		DRM_ERROR("Failed to release power domain: %d\n", ret);
+		drm_err(drm, "Failed to release power domain: %d\n", ret);
 		goto err_dev_exit;
 	}

@@ -591,7 +591,7 @@ static void vc4_vec_encoder_enable(struct drm_encoder =
*encoder,

 	ret =3D pm_runtime_resume_and_get(&vec->pdev->dev);
 	if (ret < 0) {
-		DRM_ERROR("Failed to retain power domain: %d\n", ret);
+		drm_err(drm, "Failed to retain power domain: %d\n", ret);
 		goto err_dev_exit;
 	}

@@ -604,13 +604,13 @@ static void vc4_vec_encoder_enable(struct drm_encode=
r *encoder,
 	 */
 	ret =3D clk_set_rate(vec->clock, 108000000);
 	if (ret) {
-		DRM_ERROR("Failed to set clock rate: %d\n", ret);
+		drm_err(drm, "Failed to set clock rate: %d\n", ret);
 		goto err_put_runtime_pm;
 	}

 	ret =3D clk_prepare_enable(vec->clock);
 	if (ret) {
-		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
+		drm_err(drm, "Failed to turn on core clock: %d\n", ret);
 		goto err_put_runtime_pm;
 	}

@@ -806,7 +806,7 @@ static int vc4_vec_bind(struct device *dev, struct dev=
ice *master, void *data)
 	if (IS_ERR(vec->clock)) {
 		ret =3D PTR_ERR(vec->clock);
 		if (ret !=3D -EPROBE_DEFER)
-			DRM_ERROR("Failed to get clock: %d\n", ret);
+			drm_err(drm, "Failed to get clock: %d\n", ret);
 		return ret;
 	}

=2D-
2.34.1

