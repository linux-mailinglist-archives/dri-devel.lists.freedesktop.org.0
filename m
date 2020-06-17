Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD741FD7F1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 23:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEF289DC9;
	Wed, 17 Jun 2020 21:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B9F89DC9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 21:53:08 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id h22so1711656pjf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 14:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r6CQm/Gvl2E9Y9XLYredqIxkuJkgBfuxENDumBGlDHU=;
 b=loY5r5i3CnxrLFb8cKOpwy5AJgmdumNclazFC00e40JF1P6E7ijjA6tzo+LaC0L84t
 AiUfdwKHVRxRgBQkDgAswlcMR3Ri8Os3IrY4NZiDk8bPD3JAJvVuUbZgX9cMV3FmjERm
 YV/+Z9Er5vbIus55uElNIswqbrWZaObrpv6TIt4YcKZChCAMjxlvEjvCGn+mStW0UPAo
 o0wPTWilPVxOeAIX+HFSsvLIoLJtDoUJwPtyMx+E9SMgNvxGVS09SAFUfpgPrsnxDp7q
 S8ffeZBw29M5GSvsgdBj6xiCnWRA/7YAuYjP8Meau/HHpF/UBYOMovFIMsGlixhld/im
 9RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=r6CQm/Gvl2E9Y9XLYredqIxkuJkgBfuxENDumBGlDHU=;
 b=mu6VEs4Sea/IN1N25n8ePZH8+yPdbx+CE62ffvxNUYFOoe5uKsBgLtxmeuBKfhEkm7
 uCsbf5pqT4HSs1Xj9eye1YumYqwvCQ1BDlOMByy+dWv6tkpgBxlJ6hd/ZmudbGrMmk9n
 cRHPNwxbx44Lrx3G66KZtF/swY2q0KT+BWRjbboD0usjqmb34aS/gu8JrP/pA4jFdDhY
 pQXvgvbnAe7LLgMYG4XMOFcyQDWReVIF6AsElrfr3lmIlhYlPLnIwC3Cpt3KMEbOpnb2
 wyJYlpjNu7Xb87pnBgWsmQI3kH1kOhtP25YL8IblnemFHJWLsoryo1sPM3PKsVUVeMHu
 3tDA==
X-Gm-Message-State: AOAM530R9fxJCevVJuZUY7OabcVqlBqublZjO8Gq126hNVQzNiIH1Tnd
 WWVky35myYBa++IlFBm2fiYHztTz
X-Google-Smtp-Source: ABdhPJzt/1kE+wIzwFmuLSPvNnCjPP0sBF3nQT4F3rkU5QwmVsyVEN7pzZ0V9TjHpflx0EI24Yg0Sw==
X-Received: by 2002:a17:90a:b949:: with SMTP id f9mr977182pjw.79.1592430788059; 
 Wed, 17 Jun 2020 14:53:08 -0700 (PDT)
Received: from [172.30.90.59] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
 by smtp.gmail.com with ESMTPSA id g19sm723808pfo.209.2020.06.17.14.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 14:53:07 -0700 (PDT)
Subject: Re: [PATCH] gpu: ipu-v3: image-convert: Wait for channels before
 disabling
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <20200610005110.18096-1-slongerbeam@gmail.com>
From: Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <ce5bb93c-04a9-9b67-c545-773c61b219b9@gmail.com>
Date: Wed, 17 Jun 2020 14:53:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610005110.18096-1-slongerbeam@gmail.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philpp,

Please disregard this patch. A better solution to a busy wait with a 
spin lock held is to wait for all required EOF interrupts before doing 
tile completion processing. I will submit a new patch series.

Steve


On 6/9/20 5:51 PM, Steve Longerbeam wrote:
> Call ipu_idmac_wait_busy() on each idmac channel to busy wait for the
> channel to be idle before disabling. Otherwise it was found that a
> conversion would stall after the completion of a tile and the start
> of the next tile.
>
> Fixes: 0537db801bb01 ("gpu: ipu-v3: image-convert: reconfigure IC per tile")
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>   drivers/gpu/ipu-v3/ipu-image-convert.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
> index eeca50d9a1ee..f0938015d2fd 100644
> --- a/drivers/gpu/ipu-v3/ipu-image-convert.c
> +++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
> @@ -1251,6 +1251,19 @@ static int get_run_count(struct ipu_image_convert_ctx *ctx,
>   	return count;
>   }
>   
> +static void stop_channel(struct ipu_image_convert_chan *chan,
> +			 struct ipuv3_channel *channel)
> +{
> +	struct ipu_image_convert_priv *priv = chan->priv;
> +	int ret;
> +
> +	ret = ipu_idmac_wait_busy(channel, 1);
> +	if (ret == -ETIMEDOUT)
> +		dev_warn(priv->ipu->dev, "IDMAC timeout\n");
> +
> +	ipu_idmac_disable_channel(channel);
> +}
> +
>   static void convert_stop(struct ipu_image_convert_run *run)
>   {
>   	struct ipu_image_convert_ctx *ctx = run->ctx;
> @@ -1262,12 +1275,12 @@ static void convert_stop(struct ipu_image_convert_run *run)
>   
>   	/* disable IC tasks and the channels */
>   	ipu_ic_task_disable(chan->ic);
> -	ipu_idmac_disable_channel(chan->in_chan);
> -	ipu_idmac_disable_channel(chan->out_chan);
> +	stop_channel(chan, chan->in_chan);
> +	stop_channel(chan, chan->out_chan);
>   
>   	if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
> -		ipu_idmac_disable_channel(chan->rotation_in_chan);
> -		ipu_idmac_disable_channel(chan->rotation_out_chan);
> +		stop_channel(chan, chan->rotation_in_chan);
> +		stop_channel(chan, chan->rotation_out_chan);
>   		ipu_idmac_unlink(chan->out_chan, chan->rotation_in_chan);
>   	}
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
