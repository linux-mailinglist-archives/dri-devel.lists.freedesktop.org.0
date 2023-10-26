Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22637D82AD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 14:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7708F10E7C1;
	Thu, 26 Oct 2023 12:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B62B10E7C1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 12:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698323489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKGG55xL4SkRDBs895+4jlnMzdUeltk87eHzYGIHc8A=;
 b=c5trH7wwnGhxlavKqu8NMYTXNbqauqzBKcZ8dBzIptDqUig/8OBezm/xI6ojLR2D0peK4G
 XYDAjGaNsd6DIa7hZ2ccZKco/Xd8SYns0acrXjq0yoVblVP5odhxWgvRhQ/z/KIbaeS49e
 2xjRgS3FcouT89AXVOgqBC84nFry5qI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-iH9SnxjbMtSEg1T_YtGQgw-1; Thu, 26 Oct 2023 08:31:27 -0400
X-MC-Unique: iH9SnxjbMtSEg1T_YtGQgw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-99bca0b9234so59039966b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 05:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698323486; x=1698928286;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CKGG55xL4SkRDBs895+4jlnMzdUeltk87eHzYGIHc8A=;
 b=QvqW5IVh7k/BAe7BkfNVrQBB6IXJ9EuF6vpi8Vqd2QDVreoY1fUEmjScrRBhiJeqtl
 fGoSvWVim7vONTzAQ+O9AmcyR0ZsI2wPaJ1l6OeOr4CNhSSXIAIQk7fWwmM72tcXCEoR
 42A+z9k5prjeUPhTEjWp2Mni4MdxB1obNwCmTJcbBvv2E9QW1Oy/dTv5P/8wKLEM7KAS
 8UOYwwMyOoHYhHrNagMF7ISSjkEKDkvIe799U8WZHSb+oL+EG0AXMT6aB2alVOBOWs5a
 A+mX2+e8B1d/NeHWRSeyps5S/yvT/pzQuoLgNDyPfoJyeaEMiM2zLzKUvYUx5IOMxylg
 czgA==
X-Gm-Message-State: AOJu0Yz1FyI4DrfeYDhbhyiI6a2tpyWrEg8MhFBxA3JAjD1BRmvFPc19
 GPUxYtTIYIm8uI440RRunh/AhTh0O43THl/lGb0i6VSsnoXQBSaQCsPSWG8xP+U4Cfp9ajIa2ZH
 gRtU9QsBxu48SeGNM1xWtLjFMJOOg
X-Received: by 2002:a17:907:a49:b0:9c7:4d51:af26 with SMTP id
 be9-20020a1709070a4900b009c74d51af26mr14251452ejc.65.1698323486454; 
 Thu, 26 Oct 2023 05:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG74k2bW7kjssIRfmyHXgcC62tpG5x+ewq7BEooUQ80AOkgwgb9uZY5+LiW28cpLsafJa48eA==
X-Received: by 2002:a17:907:a49:b0:9c7:4d51:af26 with SMTP id
 be9-20020a1709070a4900b009c74d51af26mr14251433ejc.65.1698323486165; 
 Thu, 26 Oct 2023 05:31:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029?
 (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a1709064f9800b0099cc3c7ace2sm11741225eju.140.2023.10.26.05.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 05:31:25 -0700 (PDT)
Message-ID: <3d0a70d6-f6d1-4687-8859-56ef3548fd0d@redhat.com>
Date: Thu, 26 Oct 2023 14:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev/simplefb: Support memory-region property
To: Thierry Reding <thierry.reding@gmail.com>, Helge Deller <deller@gmx.de>
References: <20231011143809.1108034-1-thierry.reding@gmail.com>
 <20231011143809.1108034-2-thierry.reding@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231011143809.1108034-2-thierry.reding@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/11/23 16:38, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The simple-framebuffer bindings specify that the "memory-region"
> property can be used as an alternative to the "reg" property to define
> the framebuffer memory used by the display hardware. Implement support
> for this in the simplefb driver.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/video/fbdev/simplefb.c | 35 +++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 62f99f6fccd3..18025f34fde7 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_clk.h>
>  #include <linux/of_platform.h>
>  #include <linux/parser.h>
> @@ -121,12 +122,13 @@ struct simplefb_params {
>  	u32 height;
>  	u32 stride;
>  	struct simplefb_format *format;
> +	struct resource memory;
>  };
>  
>  static int simplefb_parse_dt(struct platform_device *pdev,
>  			   struct simplefb_params *params)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *np = pdev->dev.of_node, *mem;
>  	int ret;
>  	const char *format;
>  	int i;
> @@ -166,6 +168,23 @@ static int simplefb_parse_dt(struct platform_device *pdev,
>  		return -EINVAL;
>  	}
>  
> +	mem = of_parse_phandle(np, "memory-region", 0);
> +	if (mem) {
> +		ret = of_address_to_resource(mem, 0, &params->memory);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to parse memory-region\n");
> +			of_node_put(mem);
> +			return ret;
> +		}
> +
> +		if (of_property_present(np, "reg"))
> +			dev_warn(&pdev->dev, "preferring \"memory-region\" over \"reg\" property\n");
> +
> +		of_node_put(mem);
> +	} else {
> +		memset(&params->memory, 0, sizeof(params->memory));
> +	}
> +
>  	return 0;
>  }
>  
> @@ -193,6 +212,8 @@ static int simplefb_parse_pd(struct platform_device *pdev,
>  		return -EINVAL;
>  	}
>  
> +	memset(&params->memory, 0, sizeof(params->memory));
> +
>  	return 0;
>  }
>  
> @@ -431,10 +452,14 @@ static int simplefb_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "No memory resource\n");
> -		return -EINVAL;
> +	if (params.memory.start == 0 && params.memory.end == 0) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if (!res) {
> +			dev_err(&pdev->dev, "No memory resource\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		res = &params.memory;
>  	}
>  
>  	mem = request_mem_region(res->start, resource_size(res), "simplefb");

