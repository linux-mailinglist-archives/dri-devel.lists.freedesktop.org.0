Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB446249A76
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 12:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC3F6E213;
	Wed, 19 Aug 2020 10:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF48A6E213
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:36:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r15so11073250wrp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gqSQwu4Ak76ivz5DMvC1qM1RY6caUZn/vouX4UHQw3I=;
 b=CjTCQsyG1PMArt9IepD1AZqckRAk1VWAupEx7JQzkjyj4JJtTiWuflR0Sq2kWOlrIf
 AaWwWJUo9s790go1/kOWmsg3VfSuAnCqhaYqnGEB6NvqzaiMeVKL89+mPVfkyKYPRlBv
 F3ln4glh1kKamDQItyNdbbUd7KHQSe8bFfn4AizOyXRJqpf+aUiB9OfBMIVowmmj2Dkh
 32sW2AQHtksXyyfuS9GtW7tEBbufEqgBBuEtIhHGMLcPJifWSr5hNYlXBV2WgAPKdYLb
 OaXZiEsEgE4phiiHO9APtrdwmO5dgImWpr7tt84CkOXUGcvVgNU47iRONft3akrqJZK5
 hGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gqSQwu4Ak76ivz5DMvC1qM1RY6caUZn/vouX4UHQw3I=;
 b=n+d1PLmJs3JlfQDp1JH+k358aVxnZKQMtJzwQdsXmn/pOT/G+HArQq8IrfO7aKE0l3
 RjVfpcYnTmPhjlKSdjB16w2WdYKdWx46Dtbfx1vq6hJQd/jk1v+AMrXG6+/P1CuHS5UE
 UNE31wjiqzlFBCObJzE2YWkaWXocTleGHumhrOE/7CqAej8BoWQY3G5PeoeX+LNnls7f
 KNWlkWFc2VE/x9JrXpXssvuaxr2qHDsFI5H4bZAImOCDYj15TKiqFY19aP0pwHVqnJTK
 06cMATSnXNgYSFx9pKCh9tgAjuw2eLoySXOU6ZKo3Itn8/DEUlVnxjCPu0NmwniPWo3F
 /laA==
X-Gm-Message-State: AOAM533mPAQyk/kV7y+Dw9gCniYBOwOCoMteJumDCRm90KZoiMlKH+/k
 YXVIqqd8sgoQJnxhkd6/6t/fjA==
X-Google-Smtp-Source: ABdhPJzE34UTUHjY+WGW7nyIcaHkOe0CiQFL3LKWYRMXnifP8QvLNy0lyjk41fn9cLNJWf7pqvvz6Q==
X-Received: by 2002:a5d:60cb:: with SMTP id x11mr23007048wrt.281.1597833393382; 
 Wed, 19 Aug 2020 03:36:33 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b203sm5105222wmc.22.2020.08.19.03.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 03:36:32 -0700 (PDT)
Date: Wed, 19 Aug 2020 11:36:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix refcount
 imbalance on error
Message-ID: <20200819103631.bptd34ij3fid4ych@holly.lan>
References: <20200819030456.7054-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819030456.7054-1-dinghao.liu@zju.edu.cn>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, kjlu@umn.edu,
 Bryan Wu <cooloney@gmail.com>, Gyungoh Yoo <jack.yoo@skyworksinc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 11:04:56AM +0800, Dinghao Liu wrote:
> When of_property_read_u32_array() returns an error code, a
> pairing refcount decrement is needed to keep np's refcount
> balanced.
> 
> Fixes: f705806c9f355 ("backlight: Add support Skyworks SKY81452 backlight driver")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/sky81452-backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> index 0ce181585008..8268ac43d54f 100644
> --- a/drivers/video/backlight/sky81452-backlight.c
> +++ b/drivers/video/backlight/sky81452-backlight.c
> @@ -217,6 +217,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
>  					num_entry);
>  		if (ret < 0) {
>  			dev_err(dev, "led-sources node is invalid.\n");
> +			of_node_put(np);
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
