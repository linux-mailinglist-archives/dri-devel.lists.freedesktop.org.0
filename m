Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B03569EF8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84AF14B256;
	Thu,  7 Jul 2022 10:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C413D14B252
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657188008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BlLzfOx3FLxzW29hP5Bj1ajkUHJeIlb1UbxuDrAMzo=;
 b=HbB+yy3ldQnYMphcDugzhQa92A0F/ioe5zH4qVEYA1hpsbGw0fKj7lsBzSvuhNWIX5oF6P
 +5dPCpXUwmUdDGQNnlCqXfRXqyOf5Y4dcHWS2dzpd6R4GwMh9+ovfyZCAnJPKsNJQJYJbC
 VoWIqQxPQsXxO0jLTEKVX8Ui8Y7W+oM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-kwVW_xWPNiqvoZKWV2c_jw-1; Thu, 07 Jul 2022 06:00:07 -0400
X-MC-Unique: kwVW_xWPNiqvoZKWV2c_jw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hp8-20020a1709073e0800b0072629757566so4513933ejc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 03:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5BlLzfOx3FLxzW29hP5Bj1ajkUHJeIlb1UbxuDrAMzo=;
 b=PJCihIRL6XoTVP465UU8xrIIkhn0HrkW/0V/vdW2sPP0D9LNKm0HgaP8b6PsPSd608
 JkC2ZwenAKC+FiBZzQMUIhOT/xhPBLIavhVt1n7ZI2p45eeb2bjGuMbu4sMHEcGIq7xN
 1Le+kRVHPgfBFHINY4Ihgzt0DUGsdwGZMR/EA7wXHptDTpfnROCDXEJ8tpgiOGNy8pxa
 FWguEGeWJCE1rt2SiFu1FGk+Q3e7dNoOxxMZBpbpba9FdiKfZCmcC+CLMkikFRBp08+r
 IdwtsjWEE4KET0X+bwg1Md24YP68nfIi3jKEJgP9jmkGD03JWD7x9fNjxIOwMOaB8jtr
 Bbsw==
X-Gm-Message-State: AJIora+Fkj229vUXcBhKagiVnsizJQNIvqx8Q36ajHDrvkLI5CS4ZUl6
 lfR11ACPSJgmzyOoijY+Y1PpFCuLnX1tBD8zhPAg0c/rzX/rGgn+K5oiK90ew/kl1z9vdf5LiSv
 PKkLDvhj95NtXjz8wZzBseGw/EdNW
X-Received: by 2002:a17:906:4ccc:b0:6fe:9155:47ae with SMTP id
 q12-20020a1709064ccc00b006fe915547aemr42781585ejt.246.1657188006735; 
 Thu, 07 Jul 2022 03:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vCcqxxR9iYFoEqi0TCN+XK4jUnidd2zGq8y1AASMZW6c4WUTTDCUQ6aEVHyqlMF/LQ2T/HNw==
X-Received: by 2002:a17:906:4ccc:b0:6fe:9155:47ae with SMTP id
 q12-20020a1709064ccc00b006fe915547aemr42781562ejt.246.1657188006501; 
 Thu, 07 Jul 2022 03:00:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 g17-20020aa7c591000000b0043a4a5813d8sm9613259edq.2.2022.07.07.03.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 03:00:06 -0700 (PDT)
Message-ID: <a063d7f3-cacf-c51a-a306-5acd85b680d8@redhat.com>
Date: Thu, 7 Jul 2022 12:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] drm/gem: rename struct drm_gem_dma_object.{paddr
 => dma_addr}
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220706124352.874528-1-dakr@redhat.com>
 <20220706124352.874528-4-dakr@redhat.com>
 <YsXGPfKYhPsayHpv@pendragon.ideasonboard.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <YsXGPfKYhPsayHpv@pendragon.ideasonboard.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 7/6/22 19:28, Laurent Pinchart wrote:
> Hi Danilo,
> 
> Thank you for the patch.
> 
> On Wed, Jul 06, 2022 at 02:43:51PM +0200, Danilo Krummrich wrote:
>> The field paddr of struct drm_gem_dma_object holds a DMA address, which
>> might actually be a physical address. However, depending on the platform,
>> it can also be a bus address or a virtual address managed by an IOMMU.
>>
>> Hence, rename the field to dma_addr, which is more applicable.
>>
>> Since 'paddr' is a very commonly used term and symbol name a simple regex
>> does not do the trick. Instead, users of the struct were fixed up
>> iteratively with a trial and error approach building with
>> `make allyesconfig && make drivers/gpu/drm`.
> 
> Not for this patch as you've already done the work manually, but can I
> recommend the excellent coccinelle tool ? Its semantic patches can very
> easily rename structure members.
Actually, I should have and I will. It seems like there are a few 
drivers I missed with that - the ones not using CONFIG_COMPILE_TEST.

Additionally, I will also test cross-compiling for ARM and ARM64.

- Danilo
> 
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   .../arm/display/komeda/komeda_framebuffer.c   |  4 ++--
>>   drivers/gpu/drm/arm/malidp_mw.c               |  2 +-
>>   drivers/gpu/drm/arm/malidp_planes.c           | 12 +++++-----
>>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |  2 +-
>>   drivers/gpu/drm/drm_fb_dma_helper.c           | 10 ++++----
>>   drivers/gpu/drm/drm_gem_dma_helper.c          | 23 +++++++++++--------
>>   drivers/gpu/drm/imx/ipuv3-plane.c             |  6 ++---
>>   drivers/gpu/drm/sprd/sprd_dpu.c               |  2 +-
>>   drivers/gpu/drm/sun4i/sun8i_ui_layer.c        | 14 +++++------
>>   drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 14 +++++------
>>   drivers/gpu/drm/tidss/tidss_dispc.c           | 16 ++++++-------
>>   drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>>   drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
>>   drivers/gpu/drm/vc4/vc4_gem.c                 |  8 +++----
>>   drivers/gpu/drm/vc4/vc4_irq.c                 |  2 +-
>>   drivers/gpu/drm/vc4/vc4_plane.c               |  4 ++--
>>   drivers/gpu/drm/vc4/vc4_render_cl.c           | 14 +++++------
>>   drivers/gpu/drm/vc4/vc4_txp.c                 |  2 +-
>>   drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 ++--
>>   drivers/gpu/drm/vc4/vc4_validate.c            | 12 +++++-----
>>   include/drm/drm_gem_dma_helper.h              |  4 ++--
>>   21 files changed, 81 insertions(+), 78 deletions(-)
> 
> [snip]
> 
>> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
>> index 56fc1a1e7f87..8851d294bb53 100644
>> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> 
> [snip]
> 
>> @@ -460,10 +461,11 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
>>   	if (IS_ERR(dma_obj))
>>   		return ERR_CAST(dma_obj);
>>   
>> -	dma_obj->paddr = sg_dma_address(sgt->sgl);
>> +	dma_obj->dma_addr = sg_dma_address(sgt->sgl);
>>   	dma_obj->sgt = sgt;
>>   
>> -	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &dma_obj->paddr, attach->dmabuf->size);
>> +	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &dma_obj->dma_addr,
>> +							 attach->dmabuf->size);
> 
> The second line should be aligned left, just right of the opening
> parenthesis.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>   
>>   	return &dma_obj->base;
>>   }
> 
> [snip]
> 

