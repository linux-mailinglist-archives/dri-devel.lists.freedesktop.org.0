Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475B649E687
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 16:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F57B10E2F5;
	Thu, 27 Jan 2022 15:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17310E2FD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 15:46:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9A6CF1F45571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643298383;
 bh=xdhZ7mIuhmOUfIV4ejxquCa70EjGgsF4qZseOX7OsOg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AaggjM82DIDDw6s8SNUESEltqNgqnMvk9Q7S6N2ef9s8V4mNNtY0A2z0J6uilwY5Z
 DsB6XQ2WO0xkaRO5U/nCoC3qTh1OXFVV/I2rN/r4mINxbROY5mPccOW5oHwI30Gmr3
 lMoiPVpetdioicuOUHOXJqdfswGyEgxKHCo8DI2Mvu7Sz73mzKp/Tk2V/6yieMyWR5
 nLF9BeuBC5HozBrAozCYJH4zqQOQZwhYL4XLirgrqqCys/H+Rp/x1PZVLS/5Ldy483
 Whcdh6KMdaz5n1ZmLdwbcurco7Evm5nJwGfWgKnSxAn5xmlTq/jZ5NHeEWBcaMR9DP
 Z/DYnNH0JHL1A==
Subject: Re: [PATCH v3] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220127143623.123025-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__yO6Cq8qt8RSh9AX68mJEv+wWvuhY0_p-PTJ=eJD_7aA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b8911eab-1419-60ad-ef07-25a5de365a52@collabora.com>
Date: Thu, 27 Jan 2022 16:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY__yO6Cq8qt8RSh9AX68mJEv+wWvuhY0_p-PTJ=eJD_7aA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/01/22 16:21, Chun-Kuang Hu ha scritto:
> Hi, Angelo:
> 
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 於
> 2022年1月27日 週四 下午10:36寫道：
>>
>> DRM bridge drivers are now attaching their DSI device at probe time,
>> which requires us to register our DSI host in order to let the bridge
>> to probe: this recently started producing an endless -EPROBE_DEFER
>> loop on some machines that are using external bridges, like the
>> parade-ps8640, found on the ACER Chromebook R13.
>>
>> Now that the DSI hosts/devices probe sequence is documented, we can
>> do adjustments to the mtk_dsi driver as to both fix now and make sure
>> to avoid this situation in the future: for this, following what is
>> documented in drm_bridge.c, move the mtk_dsi component_add() to the
>> mtk_dsi_ops.attach callback and delete it in the detach callback;
>> keeping in mind that we are registering a drm_bridge for our DSI,
>> which is only used/attached if the DSI Host is bound, it wouldn't
>> make sense to keep adding our bridge at probe time (as it would
>> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
>> that one to the dsi host attach function (and remove it in detach).
>>
>> Fixes: 209264a85707 ("drm/bridge: Document the probe issue with MIPI-DSI bridges")
> 
> The fixed tag should indicate the patch which cause the bug, but why a
> patch just adding document would cause bug?
> So no any patch cause bug? This patch just want to prevent a possible bug?
> 

I think you've missed my previous message on v2, so I will paste it here:

unfortunately I couldn't find a valid commit for a Fixes tag. This
started being an issue at some point, when the DRM was changed to
adhere to the documented probe sequence: the MediaTek DSI driver was
not the only one that got broken/affected by these changes.

If you have any advice on which commit should be tagged, I'm open for
any kind of suggestion.


I tried to check on other drivers which got fixed for the same behavior,
for example drm/msm, but none of them had a Fixes tag.
When the DRM got changed to adhere to this sequence, some drm/bridge
drivers were also changed; this has created some incompatibilities with
some drm drivers, including drm/msm and drm/mediatek.

This commit is not fixing a latent bug that was introduced in drm/mediatek
but rather one that was induced by the new, fixed, probe flow that got
recently documented - and to which drivers should adhere; failing to adhere
to that will produce an endless -EPROBE_DEFER loop, due to other drivers
(as mentioned, for example drm/bridge drivers) having been changed to use
that probe sequence.


Regards,
Angelo

> Regards,
> Chun-Kuang.
> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
>>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++--------------
>>   1 file changed, 84 insertions(+), 83 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index 5d90d2eb0019..bced4c7d668e 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -786,18 +786,101 @@ void mtk_dsi_ddp_stop(struct device *dev)
>>          mtk_dsi_poweroff(dsi);
>>   }
>>
>> +static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>> +{
>> +       int ret;
>> +
>> +       ret = drm_simple_encoder_init(drm, &dsi->encoder,
>> +                                     DRM_MODE_ENCODER_DSI);
>> +       if (ret) {
>> +               DRM_ERROR("Failed to encoder init to drm\n");
>> +               return ret;
>> +       }
>> +
>> +       dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
>> +
>> +       ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
>> +                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +       if (ret)
>> +               goto err_cleanup_encoder;
>> +
>> +       dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
>> +       if (IS_ERR(dsi->connector)) {
>> +               DRM_ERROR("Unable to create bridge connector\n");
>> +               ret = PTR_ERR(dsi->connector);
>> +               goto err_cleanup_encoder;
>> +       }
>> +       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>> +
>> +       return 0;
>> +
>> +err_cleanup_encoder:
>> +       drm_encoder_cleanup(&dsi->encoder);
>> +       return ret;
>> +}
>> +
>> +static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +       int ret;
>> +       struct drm_device *drm = data;
>> +       struct mtk_dsi *dsi = dev_get_drvdata(dev);
>> +
>> +       ret = mtk_dsi_encoder_init(drm, dsi);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return device_reset_optional(dev);
>> +}
>> +
>> +static void mtk_dsi_unbind(struct device *dev, struct device *master,
>> +                          void *data)
>> +{
>> +       struct mtk_dsi *dsi = dev_get_drvdata(dev);
>> +
>> +       drm_encoder_cleanup(&dsi->encoder);
>> +}
>> +
>> +static const struct component_ops mtk_dsi_component_ops = {
>> +       .bind = mtk_dsi_bind,
>> +       .unbind = mtk_dsi_unbind,
>> +};
>> +
>>   static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>>                                 struct mipi_dsi_device *device)
>>   {
>>          struct mtk_dsi *dsi = host_to_dsi(host);
>> +       struct device *dev = host->dev;
>> +       int ret;
>>
>>          dsi->lanes = device->lanes;
>>          dsi->format = device->format;
>>          dsi->mode_flags = device->mode_flags;
>> +       dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>> +       if (IS_ERR(dsi->next_bridge))
>> +               return PTR_ERR(dsi->next_bridge);
>> +
>> +       drm_bridge_add(&dsi->bridge);
>> +
>> +       ret = component_add(host->dev, &mtk_dsi_component_ops);
>> +       if (ret) {
>> +               DRM_ERROR("failed to add dsi_host component: %d\n", ret);
>> +               drm_bridge_remove(&dsi->bridge);
>> +               return ret;
>> +       }
>>
>>          return 0;
>>   }
>>
>> +static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
>> +                              struct mipi_dsi_device *device)
>> +{
>> +       struct mtk_dsi *dsi = host_to_dsi(host);
>> +
>> +       component_del(host->dev, &mtk_dsi_component_ops);
>> +       drm_bridge_remove(&dsi->bridge);
>> +       return 0;
>> +}
>> +
>>   static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
>>   {
>>          int ret;
>> @@ -938,73 +1021,14 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>>
>>   static const struct mipi_dsi_host_ops mtk_dsi_ops = {
>>          .attach = mtk_dsi_host_attach,
>> +       .detach = mtk_dsi_host_detach,
>>          .transfer = mtk_dsi_host_transfer,
>>   };
>>
>> -static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>> -{
>> -       int ret;
>> -
>> -       ret = drm_simple_encoder_init(drm, &dsi->encoder,
>> -                                     DRM_MODE_ENCODER_DSI);
>> -       if (ret) {
>> -               DRM_ERROR("Failed to encoder init to drm\n");
>> -               return ret;
>> -       }
>> -
>> -       dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
>> -
>> -       ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
>> -                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> -       if (ret)
>> -               goto err_cleanup_encoder;
>> -
>> -       dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
>> -       if (IS_ERR(dsi->connector)) {
>> -               DRM_ERROR("Unable to create bridge connector\n");
>> -               ret = PTR_ERR(dsi->connector);
>> -               goto err_cleanup_encoder;
>> -       }
>> -       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>> -
>> -       return 0;
>> -
>> -err_cleanup_encoder:
>> -       drm_encoder_cleanup(&dsi->encoder);
>> -       return ret;
>> -}
>> -
>> -static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>> -{
>> -       int ret;
>> -       struct drm_device *drm = data;
>> -       struct mtk_dsi *dsi = dev_get_drvdata(dev);
>> -
>> -       ret = mtk_dsi_encoder_init(drm, dsi);
>> -       if (ret)
>> -               return ret;
>> -
>> -       return device_reset_optional(dev);
>> -}
>> -
>> -static void mtk_dsi_unbind(struct device *dev, struct device *master,
>> -                          void *data)
>> -{
>> -       struct mtk_dsi *dsi = dev_get_drvdata(dev);
>> -
>> -       drm_encoder_cleanup(&dsi->encoder);
>> -}
>> -
>> -static const struct component_ops mtk_dsi_component_ops = {
>> -       .bind = mtk_dsi_bind,
>> -       .unbind = mtk_dsi_unbind,
>> -};
>> -
>>   static int mtk_dsi_probe(struct platform_device *pdev)
>>   {
>>          struct mtk_dsi *dsi;
>>          struct device *dev = &pdev->dev;
>> -       struct drm_panel *panel;
>>          struct resource *regs;
>>          int irq_num;
>>          int ret;
>> @@ -1021,19 +1045,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>>                  return ret;
>>          }
>>
>> -       ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
>> -                                         &panel, &dsi->next_bridge);
>> -       if (ret)
>> -               goto err_unregister_host;
>> -
>> -       if (panel) {
>> -               dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
>> -               if (IS_ERR(dsi->next_bridge)) {
>> -                       ret = PTR_ERR(dsi->next_bridge);
>> -                       goto err_unregister_host;
>> -               }
>> -       }
>> -
>>          dsi->driver_data = of_device_get_match_data(dev);
>>
>>          dsi->engine_clk = devm_clk_get(dev, "engine");
>> @@ -1098,14 +1109,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>>          dsi->bridge.of_node = dev->of_node;
>>          dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>>
>> -       drm_bridge_add(&dsi->bridge);
>> -
>> -       ret = component_add(&pdev->dev, &mtk_dsi_component_ops);
>> -       if (ret) {
>> -               dev_err(&pdev->dev, "failed to add component: %d\n", ret);
>> -               goto err_unregister_host;
>> -       }
>> -
>>          return 0;
>>
>>   err_unregister_host:
>> @@ -1118,8 +1121,6 @@ static int mtk_dsi_remove(struct platform_device *pdev)
>>          struct mtk_dsi *dsi = platform_get_drvdata(pdev);
>>
>>          mtk_output_dsi_disable(dsi);
>> -       drm_bridge_remove(&dsi->bridge);
>> -       component_del(&pdev->dev, &mtk_dsi_component_ops);
>>          mipi_dsi_host_unregister(&dsi->host);
>>
>>          return 0;
>> --
>> 2.33.1
>>


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
