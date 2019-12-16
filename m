Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740F91208FF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 15:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A8E6E5BB;
	Mon, 16 Dec 2019 14:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 20908 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 14:55:56 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D62F6E5BB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 14:55:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 397FB29173E;
 Mon, 16 Dec 2019 14:55:54 +0000 (GMT)
Date: Mon, 16 Dec 2019 15:55:51 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
Message-ID: <20191216155551.083dcbaf@collabora.com>
In-Reply-To: <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
 <20191203141515.3597631-5-boris.brezillon@collabora.com>
 <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Marek,

On Mon, 16 Dec 2019 14:54:25 +0100
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Hi All,
> 
> On 03.12.2019 15:15, Boris Brezillon wrote:
> > So that each element in the chain can easily access its predecessor.
> > This will be needed to support bus format negotiation between elements
> > of the bridge chain.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>  
> 
> I've noticed that this patch got merged to linux-next as commit 
> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of 
> Samsung Exynos5250-based Arndale board. Booting stops after following 
> messages:
> 
> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [drm] No driver support for vblank timestamp query.
> [drm] Cannot find any crtc or sizes
> [drm] Cannot find any crtc or sizes
> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
> 
> I will try to debug this and provide more information soon.
> 

Can you try with this diff applied?

--->8---
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 3955f84dc893..118ecedc7621 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1523,7 +1523,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
        if (out_bridge) {
                drm_bridge_attach(encoder, out_bridge, NULL);
                dsi->out_bridge = out_bridge;
-               list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
+               list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
        } else {
                int ret = exynos_dsi_create_connector(encoder);
 
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 6c5b80ad6154..e1378d48210f 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1613,7 +1613,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
         * from our driver, since we need to sequence them within the
         * encoder's enable/disable paths.
         */
-       list_splice(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
+       list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
 
        if (dsi->port == 0)
                vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
@@ -1639,7 +1639,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
         * Restore the bridge_chain so the bridge detach procedure can happen
         * normally.
         */
-       list_splice(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
+       list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
        vc4_dsi_encoder_destroy(dsi->encoder);
 
        if (dsi->port == 1)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
