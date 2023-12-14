Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A9B8133DA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 16:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A9D10E955;
	Thu, 14 Dec 2023 15:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C2310E955
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702566190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rGq70Ie6ea8vHqZUnQKFgCSo0wigcO/uLSBacGGYF8=;
 b=MM6t7GiASzaW3f0uZQX/GNERn5RSvhu9kN1AGyzACzz4h0N40Mhgu4D3GQ/bkd3eQJuptA
 r2OkqRGUW4dUYCTBmRRoL1Co4FMNebQ6l6x6hABOyr6iSpRCXXnnobC7Hv/VP+56aP+5+D
 bFdowFnvAftAcIekr1uZvDYhi1Sqy8Q=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-vnFB9RdMNGu85NMxzeHOJA-1; Thu, 14 Dec 2023 10:03:08 -0500
X-MC-Unique: vnFB9RdMNGu85NMxzeHOJA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2cb21a8a383so57850361fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 07:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702566187; x=1703170987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9rGq70Ie6ea8vHqZUnQKFgCSo0wigcO/uLSBacGGYF8=;
 b=M9pnfj2brC9tvLDrK/NQ7gpb4zwliRKFTLWK0bdelSbV1U1zC4oBou1W85IQO6H5tq
 dGm1sXtmE78me9fC4arrjyp8TbYxuquuLHAkiXXhO4to59gNhfkmUUhSpHLrX3bbj8GZ
 qPdTbxfbDOdob9ilC7Ka4AW2IAfi6gfMX+3dygteAatynN+YeGyG4+H3Of8nn48mpsNT
 p7sa6nNoRiIbLEmhGwuqHQvgnaCfZPnIm9wG+nJjEcUncMiGCk+3rrhIG096WvPs1K2i
 XHEg7tbHBOS1aHqtdpaxo9/JzFxkAr5akSknpDFuIoVV+TqWi24rnr9iOWv+F0Aq4HMB
 LvDQ==
X-Gm-Message-State: AOJu0Yy4NbPoixW30tynYi0haao4ej06cS6nghgu77D4luArXrGiB8I1
 H0xpdbKY0vlPB0VTRYobLKvgIkijuRvxC2jGM5C+7oRCiyHz9Ca/uQE/qqRcShagV+LhfRgmrEH
 zDGCt4wrO88tnw4BBawmGaOe5ugT7
X-Received: by 2002:a2e:be91:0:b0:2cc:2b93:d888 with SMTP id
 a17-20020a2ebe91000000b002cc2b93d888mr2731514ljr.64.1702566186614; 
 Thu, 14 Dec 2023 07:03:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRMgDXDU2GmrJA+zgoWtiCCtZFNlditA23vg7m5LIWyQ15EDJH+WSUk2kDu0W3zl3AkQ3aEw==
X-Received: by 2002:a2e:be91:0:b0:2cc:2b93:d888 with SMTP id
 a17-20020a2ebe91000000b002cc2b93d888mr2731498ljr.64.1702566186232; 
 Thu, 14 Dec 2023 07:03:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b0040c34e763ecsm24223994wmb.44.2023.12.14.07.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 07:03:05 -0800 (PST)
Message-ID: <3081e418-275c-4069-b22c-c3e9770fc641@redhat.com>
Date: Thu, 14 Dec 2023 16:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/imx: Add drm_panic support
To: Maxime Ripard <mripard@kernel.org>
References: <20231103145526.628138-1-jfalempe@redhat.com>
 <20231103145526.628138-7-jfalempe@redhat.com>
 <4rmhvbb7kli4dm7swqhmjgbh5at6e4mwh73krloxanxgsd3bkv@zxz7mx4e5ft4>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4rmhvbb7kli4dm7swqhmjgbh5at6e4mwh73krloxanxgsd3bkv@zxz7mx4e5ft4>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, noralf@tronnes.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/12/2023 14:48, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Nov 03, 2023 at 03:53:30PM +0100, Jocelyn Falempe wrote:
>> Proof of concept to add drm_panic support on an arm based GPU.
>> I've tested it with X11/llvmpipe, because I wasn't able to have
>> 3d rendering with etnaviv on my imx6 board.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Like I said in the v6, this shouldn't be dropped because it also kind of
> documents and shows what we are expecting from a "real" driver.

Ok, I can bring it back in v7.

> 
>> ---
>>   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 30 ++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> index 4a866ac60fff..db24b4976c61 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/dma-buf.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/iosys-map.h>
>>   
>>   #include <video/imx-ipu-v3.h>
>>   
>> @@ -17,9 +18,12 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fbdev_dma.h>
>> +#include <drm/drm_fb_dma_helper.h>
>> +#include <drm/drm_framebuffer.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_vblank.h>
>> @@ -160,6 +164,31 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
>>   	return ret;
>>   }
>>   
>> +static int imx_drm_get_scanout_buffer(struct drm_device *dev,
>> +				      struct drm_scanout_buffer *sb)
>> +{
>> +	struct drm_plane *plane;
>> +	struct drm_gem_dma_object *dma_obj;
>> +
>> +	drm_for_each_plane(plane, dev) {
>> +		if (!plane->state || !plane->state->fb || !plane->state->visible ||
>> +		    plane->type != DRM_PLANE_TYPE_PRIMARY)
>> +			continue;
>> +
>> +		dma_obj = drm_fb_dma_get_gem_obj(plane->state->fb, 0);
>> +		if (!dma_obj->vaddr)
>> +			continue;
>> +
>> +		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
>> +		sb->format = plane->state->fb->format;
> 
> Planes can be using a framebuffer in one of the numerous YUV format the
> driver advertises.
> 
>> +		sb->height = plane->state->fb->height;
>> +		sb->width = plane->state->fb->width;
>> +		sb->pitch = plane->state->fb->pitches[0];
> 
> And your code assumes that the buffer will be large enough for an RGB
> buffer, which probably isn't the case for a single-planar YUV format,
> and certainly not the case for a multi-planar one.

Yes, this code is a bit hacky, and on my test setup the framebuffer was 
in RGB, so I didn't handle other formats.
Also it should be possible to add YUV format later, but I would like to 
have a minimal drm_panic merged, before adding more features.
> 
> When the driver gives back its current framebuffer, the code should check:
> 
>    * If the buffer backed by an actual buffer (and not a dma-buf handle)

Regarding the struct drm_framebuffer, I'm not sure how do you 
differentiate an actual buffer from a dma-buf handle ?

>    * If the buffer is mappable by the CPU

If "dma_obj->vaddr" is not null, then it's already mapped by the CPU right ?
>    * If the buffer is in a format that the panic code can handle
>    * If the buffer uses a linear modifier

Yes, that must be checked too.

> 
> Failing that, your code cannot work at the moment. We need to be clear
> about that and "gracefully" handle things instead of going forward and
> writing pixels to places we might not be able to write to.
> 
> Which kind of makes me think, why do we need to involve the driver at
> all there?
> 
> If in the panic code, we're going over all enabled CRTCs, finding the
> primary plane currently setup for them and getting the drm_framebuffer
> assigned to them, it should be enough to get us all the informations we
> need, right?

Yes, I think I can do a generic implementation for the drivers using the 
drm_gem_dma helper like imx6.
But for simpledrm, ast, or mgag200, I need to retrieve the VRAM address, 
because it's not in the drm_framebuffer struct, so they won't be able to 
use this generic implementation.

> 
> Maxime

Thanks for the review,

-- 

Jocelyn

