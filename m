Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F61AEB39
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F406EC6D;
	Sat, 18 Apr 2020 09:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E07E6E40F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:53:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2BC642A2ABC
Subject: Re: [PATCH v2 3/7] drm/mediatek: mtk_dsi: Rename bridge to next_bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200416155720.2360443-1-enric.balletbo@collabora.com>
 <20200416155720.2360443-4-enric.balletbo@collabora.com>
 <20200416172435.GM4796@pendragon.ideasonboard.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <c1319dc1-5fdf-7e7d-1410-a23ed1d87d67@collabora.com>
Date: Fri, 17 Apr 2020 16:53:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200416172435.GM4796@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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

On 16/4/20 19:24, Laurent Pinchart wrote:
> Hi Enric,
> 
> Thank you for the patch.
> 
> On Thu, Apr 16, 2020 at 05:57:15PM +0200, Enric Balletbo i Serra wrote:
>> This is really a cosmetic change just to make a bit more readable the
>> code after convert the driver to drm_bridge. The bridge variable name
>> will be used by the encoder drm_bridge, and the chained bridge will be
>> named next_bridge.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v2: None
>>
>>  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index cfa45d6abd74..44ee884cc31c 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -182,7 +182,7 @@ struct mtk_dsi {
>>  	struct drm_encoder encoder;
>>  	struct drm_connector conn;
>>  	struct drm_panel *panel;
>> -	struct drm_bridge *bridge;
>> +	struct drm_bridge *next_bridge;
>>  	struct phy *phy;
>>  
>>  	void __iomem *regs;
>> @@ -903,8 +903,9 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
>>  	dsi->encoder.possible_crtcs = 1;
>>  
>>  	/* If there's a bridge, attach to it and let it create the connector */
> 
> Maybe s/bridge/next bridge/ here ? I expect this comment to go away
> though, as there will always be a next bridge when the driver switches
> to the DRM panel bridge helper.
> 

I'll rename it to next bridge for coherency, however, as you point this message
is removed later.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> -	if (dsi->bridge) {
>> -		ret = drm_bridge_attach(&dsi->encoder, dsi->bridge, NULL, 0);
>> +	if (dsi->next_bridge) {
>> +		ret = drm_bridge_attach(&dsi->encoder, dsi->next_bridge, NULL,
>> +					0);
>>  		if (ret) {
>>  			DRM_ERROR("Failed to attach bridge to drm\n");
>>  			goto err_encoder_cleanup;
>> @@ -1185,7 +1186,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
>> -					  &dsi->panel, &dsi->bridge);
>> +					  &dsi->panel, &dsi->next_bridge);
>>  	if (ret)
>>  		goto err_unregister_host;
>>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
