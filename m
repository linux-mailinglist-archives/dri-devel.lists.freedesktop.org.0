Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFC82762D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 18:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCA610E283;
	Mon,  8 Jan 2024 17:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC0C10E27F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704734339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4n0GXMevIXNEHu349Rlctj8rXBEsAzbKnDlggCcCpro=;
 b=TPiFBAFSzfnEEXpZ3pd05NwdwS7oiNBu4mFLvTzYrtsw4ogSZcpPSqBKethWDBlJUq6prp
 +NcWxhFHR1DGMYHYJqm+j2Vp5O8gIwPZRNAjvM/Hii2e++IzQqXyiksIlZGLmDCpbxDIvv
 +9+TnC9YKj+ibLvooc2Bz4FvDAl51XI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-PQiVCMjlNW6zZTNgDA4L4A-1; Mon, 08 Jan 2024 12:18:57 -0500
X-MC-Unique: PQiVCMjlNW6zZTNgDA4L4A-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78319f5d6edso253896385a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 09:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704734337; x=1705339137;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4n0GXMevIXNEHu349Rlctj8rXBEsAzbKnDlggCcCpro=;
 b=xOWNWSFgDLhzIiNeCesBx1DIXxmo2tJ4JpyEuxjU71U1D/E24xXNimttRLteQ8+XRX
 E/f9We6xgVVs8HoquJFEFfyNF7NPjyE4aVAS2523cwCJ1WIgM9FNELxIzd54kRxLVqLZ
 pocrJDQdUHLwPkgmviQfNOHqL1Rq1WNO0kTGhkXWqA0yPeh0/cjccH3s3boUlMcMppyd
 f2+hoG9rnaprRLdAnNf1w8saWjTjlwtbCsPQHzPu+fZlKnRYw9fCZNaUUnvW1O6N/dzm
 VElt7ksZADghxgJVdl7pf8RFmtwHJ9/wJi5MDpY08ZB0E30+FKVKquh1dFuGZ/QmHVnN
 uCVQ==
X-Gm-Message-State: AOJu0Yw2O5y0yomvl9WxhjsaFbAwXMFBNk5zpugIrmpBL86JLENzU35k
 qM1SRDQkPbgseIohQ03Rvc4MfQ6UfAgZyWnU8VqwsuFRmwaUsYqj1e1SOjkW1CZGlt6eqklqKPd
 YIHox0d5IHJkL/PjYI/K0WBrHpbbqcEXnQtMa
X-Received: by 2002:a05:620a:470a:b0:783:2607:13f5 with SMTP id
 bs10-20020a05620a470a00b00783260713f5mr1285287qkb.20.1704734337497; 
 Mon, 08 Jan 2024 09:18:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbsXsbxoXlECp8+ORoJitLSD8fGeGAumNZ2yTKrmI2VxodrvKisab55OD1FQr1IN7iJllKVQ==
X-Received: by 2002:a05:620a:470a:b0:783:2607:13f5 with SMTP id
 bs10-20020a05620a470a00b00783260713f5mr1285278qkb.20.1704734337276; 
 Mon, 08 Jan 2024 09:18:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a25cb00b007830ce180basm43109qko.120.2024.01.08.09.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 09:18:56 -0800 (PST)
Message-ID: <9413ee17-70d6-4c27-ad8c-2cd4e0f7bb0b@redhat.com>
Date: Mon, 8 Jan 2024 18:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next] drm/nouveau/disp: switch to use kmemdup()
 helper
To: yang.guang5@zte.com.cn
References: <202312142003220684160@zte.com.cn>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <202312142003220684160@zte.com.cn>
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
Cc: jiang.xuexin@zte.com.cn, kherbst@redhat.com, cgel.zte@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chen.haonan2@zte.com.cn, bskeggs@redhat.com, nouveau@lists.freedesktop.org,
 keescook@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yang,

On 12/14/23 13:03, yang.guang5@zte.com.cn wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>
> 
> Use kmemdup() helper instead of open-coding to
> simplify the code.
> 
> Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>

Please add your "Signed-off-by" tag to this patch. If the above is intended to indicate
that Chan was involved in creating this patch (e.g. as co-author, reporter, etc.) please
use the corresponding tag instead. See also [1].

Once this is fixed, I'll apply the patch.

- Danilo

[1] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> ---
>   drivers/gpu/drm/nouveau/nvif/outp.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
> index 5d3190c05250..6daeb7f0b09b 100644
> --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> @@ -452,13 +452,12 @@ nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
>   	if (ret)
>   		goto done;
> 
> -	*pedid = kmalloc(args->size, GFP_KERNEL);
> +	*pedid = kmemdup(args->data, args->size, GFP_KERNEL);
>   	if (!*pedid) {
>   		ret = -ENOMEM;
>   		goto done;
>   	}
> 
> -	memcpy(*pedid, args->data, args->size);
>   	ret = args->size;
>   done:
>   	kfree(args);

