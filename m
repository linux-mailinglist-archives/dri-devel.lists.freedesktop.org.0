Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AABB636568
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 17:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D8110E5A5;
	Wed, 23 Nov 2022 16:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A0310E5A5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XRs7Eo096On4c/4Oz/ClSn98QmdXnkdHlJL88qVUywU=; b=lublJ4G+YOaSO4GKn+FY1Gsv5v
 1L7pPPVliITpE1GCpwKtxBHosi7VWd8rnS3bkUyrXQYg1MGM/ZAy/KYRC/6KP3PUSPF86uB8K1xc5
 pxcHZvTqmB90pJ1aH7GoUmItFpoLNFVbswx7DvuS+Yf9ma/KGiT5M/fBzserpFbr7Yc97w86cP7iD
 MG/ag+xNDgVQQ2PjobXgQev4pYb2bVwgikmChXgCwqos080dOKrrq1jO98WZdkDg6zxV66vx3FO3J
 PJgg5mVZR14NM+sS01lNyFjAFfNcRy52rzKltE4KPLpJMbtFwUaEcz9MNyLFI/z0SJ+d5irha7srw
 r8Hb+GVQ==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=49481)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oxsIp-0000gb-E4; Wed, 23 Nov 2022 17:08:47 +0100
Message-ID: <ad77be8b-e867-81df-c703-8afb1e6d473d@tronnes.org>
Date: Wed, 23 Nov 2022 17:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] drm/gem: shadow_fb_access: Prepare imported buffers
 for CPU access
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-1-9de3afa3383e@tronnes.org>
 <79b39092-7f0d-5651-ac4f-f10d72411e34@redhat.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <79b39092-7f0d-5651-ac4f-f10d72411e34@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 23.11.2022 09.22, skrev Javier Martinez Canillas:
> Hello Noralf,
> 
> On 11/22/22 21:58, Noralf Trønnes via B4 Submission Endpoint wrote:
>> From: Noralf Trønnes <noralf@tronnes.org>
>>
>> Complete the shadow fb access functions by also preparing imported buffers
>> for CPU access. Update the affected drivers that currently use
>> drm_gem_fb_begin_cpu_access().
>>
>> Through this change the following SHMEM drivers will now also make sure
>> their imported buffers are prepared for CPU access: cirrus, hyperv,
>> mgag200, vkms
>>
> 
> [...]
> 
>> @@ -378,11 +379,20 @@ int drm_gem_begin_shadow_fb_access(struct drm_plane *plane, struct drm_plane_sta
>>  {
>>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>>  	struct drm_framebuffer *fb = plane_state->fb;
>> +	int ret;
>>  
>>  	if (!fb)
>>  		return 0;
>>  
>> -	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
>> +	ret = drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>> +	if (ret)
>> +		drm_gem_fb_vunmap(fb, shadow_plane_state->map);
>> +
>> +	return ret;
> 
> Makes sense to me to have the CPU access prepare here too.
> 
>> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>> index 53464afc2b9a..58a2f0113f24 100644
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -544,7 +544,6 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>>  	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
>>  	struct iosys_map dst;
>>  	unsigned int dst_pitch;
>> -	int ret = 0;
>>  	u8 *buf = NULL;
>>  
>>  	/* Align y to display page boundaries */
>> @@ -556,21 +555,14 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>>  	if (!buf)
>>  		return -ENOMEM;
>>  
>> -	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>> -	if (ret)
>> -		goto out_free;
>> -
>>  	iosys_map_set_vaddr(&dst, buf);
>>  	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
>>  
>> -	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>> -
> 
> The only thing I'm not sure about is that drivers used to call the begin/end
> CPU access only during the window while the BO data was accessed but now the
> windows will be slightly bigger if that happens in .{begin,end}_fb_access.
> 

I didn't think that could be an issue since userspace isn't touching the
buffer while the commit is ongoing anyways, but it's a complicated
machinery. We'll see what Daniel has to say.

Noralf.

> If that's not an issue then, I agree with your patch since it simplifies the
> logic in the drivers and gets rid of duplicated code.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
