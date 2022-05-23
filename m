Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCFA530758
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 03:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F9610E22C;
	Mon, 23 May 2022 01:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E729310E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 01:57:55 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y199so12386492pfb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 18:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/FTTj1NCDuWlD3xBvsaMWUk8OJZgm6jQNAj/ji3CrYw=;
 b=ULbMxk+D5gUlKqXBT8EAAfV14LeGwJZXVgVIto+ijwXo5r3J2DmTZPzhqXWTK8ZWoC
 oa5nvyEwXwEVOWnPI6WVrfqKaZwlBOihsqID8ZMvp2KOr6SyHwKJXICwN30fELpQxYvy
 zPOFlcLLYt1+Lcp73F2W8lHvu5Dd6v8VrC7Vsxw/vQ/yjMXOuRIjYuml3yd2vPny3xQY
 suigjPKyQUIQmKJODzR4pOkmvuah15OcfsIe5gtj7kHO6atTbMVNXYgb4esHV0wsrFdf
 /0h8W6seoY8ZDVdlzLXLxrVGhImhi5IMfy+J1I9Lcy4lw4nbyuQCBb00lr3mByRnKEv0
 COVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/FTTj1NCDuWlD3xBvsaMWUk8OJZgm6jQNAj/ji3CrYw=;
 b=DwUil6ozK4yWMh42kipo/LBgp1PhJPFx6VtVl+Mckdo0VBpjzzSUg5mhDkWtTqTfx3
 oBmmzFfVJQWx1euAbtRT/UW0HFhe+1ArPz6D0xpkIFt51fMGItD4YJkfyjljiAAJhkHH
 Mahs7n6N4KpQEJ8mB5rq7Fr30ITbV6Qt/NvonLJBW192Y2xA1NVPCfA2jQOFpTkzHfP+
 VM0l1Rl5MFJsYfGa+vH3jHCsIfnGiIKsoA81te7iyJyh0EALBKQaCFgqInD+qNXc1lAM
 piovX9Yx6edOeFHCoAb/a5TAlWnk69v/AE0nP5BDm4SjnAgpAqMEK4e5o9WmVv3Id72Y
 nVWg==
X-Gm-Message-State: AOAM531lRu8G1D86kDDn2lVEcMvbMbXOiJDcNbTrp8ZAOyjHMSQ526iG
 b8zhCxjQ+hRBRm+C9nOPRw4=
X-Google-Smtp-Source: ABdhPJwPdopwEMr1sDFEcvl434H1/gGWo6/3BGHR4lVExvgZxKtdj4S7KnUGIvSL6f+EzLDCHmqhHw==
X-Received: by 2002:a05:6a00:1488:b0:510:4e64:fb80 with SMTP id
 v8-20020a056a00148800b005104e64fb80mr21461166pfu.58.1653271075440; 
 Sun, 22 May 2022 18:57:55 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a62d44e000000b0050dc7628153sm5824491pfl.45.2022.05.22.18.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 18:57:55 -0700 (PDT)
Message-ID: <ea67fa6b-0fcd-4b59-861f-360e74a4d70a@gmail.com>
Date: Mon, 23 May 2022 09:57:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] gpu: drm: fix possible memory leak in drm_addmap_core()
Content-Language: en-US
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
References: <20220509054441.17282-1-hbh25y@gmail.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <20220509054441.17282-1-hbh25y@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/5/9 13:44, Hangyu Hua wrote:
> map->handle need to be handled correctly when map->type is _DRM_SHM or
> _DRM_CONSISTENT just like map->type is _DRM_REGISTERS.
> 
> Fixes: 8d153f7107ff ("drm: update user token hashing and map handles")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>   drivers/gpu/drm/drm_bufs.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index fcca21e8efac..2b3f504c5f9c 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -344,6 +344,15 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>   	if (!list) {
>   		if (map->type == _DRM_REGISTERS)
>   			iounmap(map->handle);
> +		else if (map->type == _DRM_SHM) {
> +			dev->sigdata.lock = dev->master->lock.hw_lock = NULL;
> +			vfree(map->handle);
> +		} else if (map->type == _DRM_CONSISTENT) {
> +			dma_free_coherent(dev->dev,
> +					  map->size,
> +					  map->handle,
> +					  map->offset);
> +		}
>   		kfree(map);
>   		return -EINVAL;
>   	}
> @@ -361,6 +370,15 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>   	if (ret) {
>   		if (map->type == _DRM_REGISTERS)
>   			iounmap(map->handle);
> +		else if (map->type == _DRM_SHM) {
> +			dev->sigdata.lock = dev->master->lock.hw_lock = NULL;
> +			vfree(map->handle);
> +		} else if (map->type == _DRM_CONSISTENT) {
> +			dma_free_coherent(dev->dev,
> +					  map->size,
> +					  map->handle,
> +					  map->offset);
> +		}
>   		kfree(map);
>   		kfree(list);
>   		mutex_unlock(&dev->struct_mutex);

Gentel ping.
