Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0882689F1E6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2F611330C;
	Wed, 10 Apr 2024 12:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d8GYx8Bp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3B811330C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712751586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJ+kGoqQcKnOH48pUA5WHq2ughcDFPQeyQ1mCMN/RAA=;
 b=d8GYx8BpJb+k++abcHT4QhLK6fUjSxukfP49a+gdLixazguEu1Sf5SWu2Z1T2sWszx4S5r
 SNR24uqGq0eMCneDFJI57jrmIuvLIBmbiacFmvhXpSe+Q9T5K7EVNxmiULIu8rd4xUj4KK
 TtgeN/wPN4vlYZWe/R6oRWOtNP86d7w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-Xnvlr4mAMhKSF9BGj7LUQw-1; Wed, 10 Apr 2024 08:19:45 -0400
X-MC-Unique: Xnvlr4mAMhKSF9BGj7LUQw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-343d6732721so3014059f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 05:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712751583; x=1713356383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nJ+kGoqQcKnOH48pUA5WHq2ughcDFPQeyQ1mCMN/RAA=;
 b=a0ywMz8OSyFgcApRA552DtFeB/fYLDXJdmHHLND+jy9Hnsj4bBjsdSD2o70gQMn+5u
 0Q1PiaQStbtuQ4/uc7jXwRa/ARL2rGGxEuLuH6PVyt2xNfolRKB7Au28R2nKWPbqrJwc
 2usvBtvyxH+Gyobh7AeKvZFKfk8NlyrOK1MiY61E8hOCGTC00dIP6Aqb0+f6NL3EhB0V
 WSYb1UOpqIuFYXbvic8TIY3pZIrJLWyQeupLTBHNyi5OkA6ka8bBLNdiDzt+NB3I7WJ7
 +PnE3FtCqXXoLyq2Z6/L8UuKoUlGHjSZxPXt9cr7RqjQJmeZwkPNI55JlALXY209Cgxk
 hbjQ==
X-Gm-Message-State: AOJu0YwXoDTDG6XP8eJyKoUSLMKZgma1Ar3W/257rFkRCUrCNm56kyfl
 TngrB1HJirSZ75l22Dtxtenwx678r3k0T3uARJsgxa5qYZbQKWMoAEnHY6h92t+V6zqpbGFKKXm
 hQZ8diW+ZakiYyVYFWppipTpzh9oK6y+F8dyAFxTdHY24fv59rBQqQeQO4aGspOiEYfxLQxh1cw
 ==
X-Received: by 2002:adf:cc81:0:b0:341:c8c8:633a with SMTP id
 p1-20020adfcc81000000b00341c8c8633amr1751114wrj.9.1712751583575; 
 Wed, 10 Apr 2024 05:19:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+Abf274iWLLKrGVzm1Fb2pT1ozXwjZIuJrJB8APtmyKplomP95blnsekfu/buxEckXDI4SQ==
X-Received: by 2002:adf:cc81:0:b0:341:c8c8:633a with SMTP id
 p1-20020adfcc81000000b00341c8c8633amr1751102wrj.9.1712751583312; 
 Wed, 10 Apr 2024 05:19:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:f101:edd0:5929:7a40?
 ([2a01:e0a:d5:a000:f101:edd0:5929:7a40])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b00343300a4eb8sm13584588wro.49.2024.04.10.05.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 05:19:42 -0700 (PDT)
Message-ID: <f52cc0d5-e7ba-4c33-9965-e99e3ea295f0@redhat.com>
Date: Wed, 10 Apr 2024 14:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ast: Group DDC init code by data structure
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240403103325.30457-1-tzimmermann@suse.de>
 <20240403103325.30457-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240403103325.30457-3-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for the patch, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

On 03/04/2024 12:31, Thomas Zimmermann wrote:
> Reorder the code to set up the DDC channel by data structure, so
> that each data structure's init is in a separate block: first the
> bit algo then the i2c adapter. Makes the code more readable. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_ddc.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
> index 3e156a6b6831d..4df52aeba4f7e 100644
> --- a/drivers/gpu/drm/ast/ast_ddc.c
> +++ b/drivers/gpu/drm/ast/ast_ddc.c
> @@ -145,15 +145,7 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
>   		return ERR_PTR(-ENOMEM);
>   	ddc->ast = ast;
>   
> -	adapter = &ddc->adapter;
> -	adapter->owner = THIS_MODULE;
> -	adapter->dev.parent = dev->dev;
> -	i2c_set_adapdata(adapter, ddc);
> -	snprintf(adapter->name, sizeof(adapter->name), "AST DDC bus");
> -
>   	bit = &ddc->bit;
> -	bit->udelay = 20;
> -	bit->timeout = usecs_to_jiffies(2200);
>   	bit->data = ddc;
>   	bit->setsda = ast_ddc_algo_bit_data_setsda;
>   	bit->setscl = ast_ddc_algo_bit_data_setscl;
> @@ -161,8 +153,16 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
>   	bit->getscl = ast_ddc_algo_bit_data_getscl;
>   	bit->pre_xfer = ast_ddc_algo_bit_data_pre_xfer;
>   	bit->post_xfer = ast_ddc_algo_bit_data_post_xfer;
> +	bit->udelay = 20;
> +	bit->timeout = usecs_to_jiffies(2200);
>   
> +	adapter = &ddc->adapter;
> +	adapter->owner = THIS_MODULE;
>   	adapter->algo_data = bit;
> +	adapter->dev.parent = dev->dev;
> +	snprintf(adapter->name, sizeof(adapter->name), "AST DDC bus");
> +	i2c_set_adapdata(adapter, ddc);
> +
>   	ret = i2c_bit_add_bus(adapter);
>   	if (ret) {
>   		drm_err(dev, "Failed to register bit i2c\n");

