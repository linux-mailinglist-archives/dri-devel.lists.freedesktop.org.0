Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79F21B09F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B546EBA6;
	Fri, 10 Jul 2020 07:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181D96E04B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 10:47:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 72D912A3CAC
Subject: Re: [RESEND PATCH 3/3] drm/mediatek: mtk_dpi: Use simple encoder
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
 <20200518173909.2259259-4-enric.balletbo@collabora.com>
 <20200701134128.6a967a89@collabora.com>
 <3f7338ad-b83d-da1d-2b07-f5225c56d7f9@collabora.com>
Message-ID: <dba9e359-6f58-e283-d39a-82bfbec15d5a@collabora.com>
Date: Thu, 9 Jul 2020 12:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3f7338ad-b83d-da1d-2b07-f5225c56d7f9@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
 narmstrong@baylibre.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, linux-mediatek@lists.infradead.org,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi again,

On 8/7/20 17:12, Enric Balletbo i Serra wrote:
> Hi Boris,
> 
> Thank you to spend some time to review the patches.
> 
> On 1/7/20 13:41, Boris Brezillon wrote:
>> On Mon, 18 May 2020 19:39:09 +0200
>> Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:
>>
>>> The mtk_dpi driver uses an empty implementation for its encoder. Replace
>>> the code with the generic simple encoder.
>>>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> ---
>>>
>>>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++-----------
>>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> index baad198c69eb..80778b2aac2a 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>>> @@ -20,6 +20,7 @@
>>>  #include <drm/drm_bridge.h>
>>>  #include <drm/drm_crtc.h>
>>>  #include <drm/drm_of.h>
>>> +#include <drm/drm_simple_kms_helper.h>
>>>  
>>>  #include "mtk_dpi_regs.h"
>>>  #include "mtk_drm_ddp_comp.h"
>>> @@ -510,15 +511,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>>  	return 0;
>>>  }
>>>  
>>> -static void mtk_dpi_encoder_destroy(struct drm_encoder *encoder)
>>> -{
>>> -	drm_encoder_cleanup(encoder);
>>> -}
>>> -
>>> -static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
>>> -	.destroy = mtk_dpi_encoder_destroy,
>>> -};
>>> -
>>>  static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>>>  				 enum drm_bridge_attach_flags flags)
>>>  {
>>> @@ -591,8 +583,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>>>  		return ret;
>>>  	}
>>>  
>>> -	ret = drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder_funcs,
>>> -			       DRM_MODE_ENCODER_TMDS, NULL);
>>> +	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
>>> +				      DRM_MODE_ENCODER_TMDS);
>>
>> Not related to this change, but shouldn't we have DRM_MODE_ENCODER_DPI
>> here?
>>
> 

Thinking a bit more about this and this patchset in general, I think I'll drop
this patch from the series, at the end, all the encoder creation stuff should be
moved to mtk_drm_drv.


> Right, I'll add a patch to fix this.
> 
>>>  	if (ret) {
>>>  		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>>>  		goto err_unregister;
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
