Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E13C7E060A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 17:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818FA10EA1F;
	Fri,  3 Nov 2023 16:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFABF10EA1A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699027311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNpgW1axgTExanwZBBl4ibhW7ZnHlhg8ffeeA74FZzA=;
 b=S70WbeTtpxUh+s4eiPy1RiKpjGNBpR67rrsdVM7qN7O7fAaimyIT8XFUwuJrK/KdQVJtsA
 CxkYbty9GcPZNQ7r/VqUA3K3EVRi4YkafpEtM3uzJBP8WVSTf5dPcTV2pMbXZM8E5ELDC6
 O2eILN1mdI/PItKoGPqeQXtk0+mnYks=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-oU07uMwPM1ekh1EZqxRh5g-1; Fri, 03 Nov 2023 12:01:50 -0400
X-MC-Unique: oU07uMwPM1ekh1EZqxRh5g-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9a62adedadbso161303566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 09:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699027309; x=1699632109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vNpgW1axgTExanwZBBl4ibhW7ZnHlhg8ffeeA74FZzA=;
 b=CCULhljplaZnTqasRNXw3KOblYJleotTRtZ1LHsePx4Q+6WmmAGdYR938S32eFK1ED
 sL1JdJuQfHDXxuo8xY73/2MH8HMRqeZLT/JAeVGY47lx6IamlAqwHL3uAU6dHYzbTeuE
 0+sJ0Fp0dSGURKr3vsf1HGEtCEnd575VswB4lFd7piSQCInwx/qxDEH13i6RvCN+x5Oe
 9xYeWhawqXVTn3y6YWmHj+zo1NtKAnklqcuhTl8OihnUIx2bKsOZyoP3nUAE2+EU/quq
 jHI/ArXKho+wLDXW5kDU7F8UhFxqpatlnMX0607L5Skwi/bHHjw07/ljswat0GfAl+fX
 ATyA==
X-Gm-Message-State: AOJu0YyGaX7afgK6IgSIsdZ1cTvVI4Ne4jbCbzuYZGJSg7af+FIAIlQK
 tRarzVtE2UMa68/4avdbXv4bzpjKjOj0GjI7Pd/4qo3IfPISuIvswXFYxoWUI+YYDpP8Mg7UMrh
 rTcV4yde1eCptFm3xV6Ywy8TYxeKG
X-Received: by 2002:a17:906:eb17:b0:9b8:7709:6360 with SMTP id
 mb23-20020a170906eb1700b009b877096360mr5437658ejb.40.1699027308928; 
 Fri, 03 Nov 2023 09:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx/IhBD/hQZyEwN8TJvC8b7uAYs7jgE2myCR2Q+slLZM/SFLE1u+WHImEzut1xDOramJ6Whw==
X-Received: by 2002:a17:906:eb17:b0:9b8:7709:6360 with SMTP id
 mb23-20020a170906eb1700b009b877096360mr5437643ejb.40.1699027308317; 
 Fri, 03 Nov 2023 09:01:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4c9400b004065e235417sm2802699wmp.21.2023.11.03.09.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 09:01:47 -0700 (PDT)
Message-ID: <31383bcd-9e9b-46ca-9217-7c011bb664fd@redhat.com>
Date: Fri, 3 Nov 2023 17:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: use managed devres functions
To: Philipp Stanner <pstanner@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20231030095024.9808-2-pstanner@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20231030095024.9808-2-pstanner@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/10/2023 10:50, Philipp Stanner wrote:
> Currently, tha ast-driver just maps the PCI-dev's regions with
> pcim_iomap(). It does not actually reserve the regions exclusively
> with, e.g., pci_request_regions().
> 
> Replace the calls to pcim_iomap() with ones to pcim_iomap_regions() to
> reserve and map the regions simultaneously.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> ¡Hola!
> I picked up the memory-region-request-task from the DRM-TODO-List [1]
> and began with this driver.
> 
> Please have a first look. I wasn't entirely sure about -ENOMEM... for
> example, as far as my understanding goes, it should not be able to fail
> anyways in the second call.

Yes, you can remove these checks, other drivers don't do it:
https://elixir.bootlin.com/linux/latest/source/arch/x86/platform/intel-mid/pwr.c#L372

> 
> I don't have the server-hardware, thus, can't test it on a physical
> machine.

I've done a quick check on an AST2600, and it works.
> 
> Please tell me what you think.

That's a good patch, thanks for your contribution.

I'll wait for Thomas review, and with the checks removed, I can help 
push it to drm-misc-next.

> 
> P.
> 
> [1] https://dri.freedesktop.org/docs/drm/gpu/todo.html#request-memory-regions-in-all-drivers
> ---
>   drivers/gpu/drm/ast/ast_main.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index dae365ed3969..1004c6628938 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -444,9 +444,13 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	ast->regs = pcim_iomap(pdev, 1, 0);
> +	ret = pcim_iomap_regions(pdev, BIT(1), 0);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ast->regs = pcim_iomap_table(pdev)[1];
>   	if (!ast->regs)
> -		return ERR_PTR(-EIO);
> +		return ERR_PTR(-ENOMEM);
You can remove this check.


>   
>   	/*
>   	 * After AST2500, MMIO is enabled by default, and it should be adopted
> @@ -461,9 +465,12 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   
>   	/* "map" IO regs if the above hasn't done so already */
>   	if (!ast->ioregs) {
> -		ast->ioregs = pcim_iomap(pdev, 2, 0);
> +		ret = pcim_iomap_regions(pdev, BIT(2), 0);
> +		if (ret)
> +			return ERR_PTR(ret);
> +		ast->ioregs = pcim_iomap_table(pdev)[2];
>   		if (!ast->ioregs)
> -			return ERR_PTR(-EIO);
> +			return ERR_PTR(-ENOMEM);
you can remove this check too.
>   	}
>   
>   	if (!ast_is_vga_enabled(dev)) {

-- 

Jocelyn

