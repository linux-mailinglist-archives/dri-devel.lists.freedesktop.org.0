Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC681AD6A1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F0C6E3A8;
	Fri, 17 Apr 2020 06:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760D06E2E4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 21:33:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 768E62A1269
Subject: Re: [PATCH v2 7/7] drm/mediatek: mtk_dsi: Create connector for bridges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200416155720.2360443-1-enric.balletbo@collabora.com>
 <20200416155720.2360443-8-enric.balletbo@collabora.com>
 <20200416173525.GQ4796@pendragon.ideasonboard.com>
 <20200416173615.GR4796@pendragon.ideasonboard.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <cb5db1ad-c0c6-44aa-8a26-0c7731b973fd@collabora.com>
Date: Thu, 16 Apr 2020 23:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200416173615.GR4796@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 16/4/20 19:36, Laurent Pinchart wrote:
> Hi Enric,
> 
> On Thu, Apr 16, 2020 at 08:35:26PM +0300, Laurent Pinchart wrote:
>> On Thu, Apr 16, 2020 at 05:57:19PM +0200, Enric Balletbo i Serra wrote:
>>> Use the drm_bridge_connector helper to create a connector for pipelines
>>> that use drm_bridge. This allows splitting connector operations across
>>> multiple bridges when necessary, instead of having the last bridge in
>>> the chain creating the connector and handling all connector operations
>>> internally.
>>
>> That's the right direction, but this should be done in the mtk display
>> controller driver core, not in here. I'm OK with the code being here as
>> an interim measure if needed to move forward, but that should then be
>> temporary only.

It'd be nice if we can do this as an interim measure for now, so at least we
have the embedded display working. IIUC to move that to the display controller
driver core I should also convert/rework the mtk_dpi and mtk_hdmi drivers. This
is used for the external display on my device but to fully support this I'll
also need to rework the bridge chain logic to handle the multi-sink/multi-source
use case. This is something I plan to work on but I suspect won't be easy and
will trigger lots of discussions, and, of course, some time.

So, if is fine I won't move this for now.

Thanks,
 Enric


> 
> I forgot to mention that the drm_encoder should also move out of the
> bridge driver to the display controller driver.
> 
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> ---
>>>
>>> Changes in v2: None
>>>
>>>  drivers/gpu/drm/mediatek/mtk_dsi.c | 14 +++++++++++++-
>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> index 44718fa3d1ca..2f8876c32864 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> @@ -17,6 +17,7 @@
>>>  
>>>  #include <drm/drm_atomic_helper.h>
>>>  #include <drm/drm_bridge.h>
>>> +#include <drm/drm_bridge_connector.h>
>>>  #include <drm/drm_mipi_dsi.h>
>>>  #include <drm/drm_of.h>
>>>  #include <drm/drm_panel.h>
>>> @@ -184,6 +185,7 @@ struct mtk_dsi {
>>>  	struct drm_bridge bridge;
>>>  	struct drm_bridge *panel_bridge;
>>>  	struct drm_bridge *next_bridge;
>>> +	struct drm_connector *connector;
>>>  	struct phy *phy;
>>>  
>>>  	void __iomem *regs;
>>> @@ -983,10 +985,19 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>>>  	 */
>>>  	dsi->encoder.possible_crtcs = 1;
>>>  
>>> -	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
>>> +	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
>>> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>  	if (ret)
>>>  		goto err_cleanup_encoder;
>>>  
>>> +	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
>>> +	if (IS_ERR(dsi->connector)) {
>>> +		DRM_ERROR("Unable to create bridge connector\n");
>>> +		ret = PTR_ERR(dsi->connector);
>>> +		goto err_cleanup_encoder;
>>> +	}
>>> +	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>>> +
>>>  	return 0;
>>>  
>>>  err_cleanup_encoder:
>>> @@ -1144,6 +1155,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>>>  
>>>  	dsi->bridge.funcs = &mtk_dsi_bridge_funcs;
>>>  	dsi->bridge.of_node = dev->of_node;
>>> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>>
>> I think this line belongs to the patch that adds drm_bridge support to
>> this driver.
>>
>>>  
>>>  	drm_bridge_add(&dsi->bridge);
>>>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
