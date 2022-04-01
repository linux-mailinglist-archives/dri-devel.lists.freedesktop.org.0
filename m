Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860D4EF78F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737F110F5EB;
	Fri,  1 Apr 2022 16:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1833710F5EB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:11:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 733A4842E3;
 Fri,  1 Apr 2022 18:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648829489;
 bh=XJDj+LTWI9jRlvZ1Dyqva3EIKyzR9BjFxd0vmUVG0+8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lKxT/VR/R83U+SouzX0I34uwC8ss2u9DBcf5FhX16AvINYaXLjAbuEbL6cAHaPlHH
 m55Lhc16hVYDoOL6Bd2vNBSpNvITuNxdTujnS6Hzq9LRoLMY7tHj27RcMjxWQ2JSK5
 2cbMulOrubQ3m2KrAiihd30mNni+w67aV40pw0ZwSogMFiuAWCpDOVFySdv1AFFPon
 DI9XtpFCemaAS2nHhHQtz5ZugQuzlLc8shj+9jpmrY4Kr61ENUX2JUrbalcOlhLr5W
 ewZ+D2WMNNMOBRJchZM4Dwr/G/WTss9uYY1zTHghTxK+2acgfKV2A1Zqy04AJeRfEn
 OziChvFN12/LA==
Message-ID: <66182d46-9270-1096-97b1-1cd635e0795e@denx.de>
Date: Fri, 1 Apr 2022 18:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/panel: lvds: Simplify mode parsing
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220331192347.103299-1-marex@denx.de>
 <Ykce0oywZTR5NnsF@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Ykce0oywZTR5NnsF@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/22 17:48, Laurent Pinchart wrote:

Hi,

[...]

>> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
>> index 27a1c9923b09..65c6a6e9e223 100644
>> --- a/drivers/gpu/drm/panel/panel-lvds.c
>> +++ b/drivers/gpu/drm/panel/panel-lvds.c
>> @@ -30,7 +30,8 @@ struct panel_lvds {
>>   	const char *label;
>>   	unsigned int width;
>>   	unsigned int height;
>> -	struct videomode video_mode;
>> +	struct drm_display_mode dmode;
> 
> "dmode" sounds a bit weird, I would have gone for just "mode", or
> "display_mode", but I don't mind much.

That's how the of_get_drm_panel_display_mode() parameter is called in 
drivers/gpu/drm/drm_modes.c , so I'll just keep it for consistency.

[...]

>> -	videomode_from_timing(&timing, &lvds->video_mode);
>> -
>> -	ret = of_property_read_u32(np, "width-mm", &lvds->width);
>> -	if (ret < 0) {
>> -		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
>> -			np, "width-mm");
>> -		return -ENODEV;
>> -	}
>> -	ret = of_property_read_u32(np, "height-mm", &lvds->height);
>> -	if (ret < 0) {
>> -		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
>> -			np, "height-mm");
>> -		return -ENODEV;
>> -	}
> 
> of_get_drm_panel_display_mode() doesn't consider missing width-mm or
> height-mm properties as an error. Should we check here that ->width_mm
> and ->height_mm are not 0 ?

I wonder whether we should always require valid width-mm and height-mm 
DT property in of_get_drm_panel_display_mode() instead.

[...]
