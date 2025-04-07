Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F95A7E03E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACB710E47A;
	Mon,  7 Apr 2025 13:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xt8I/fbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FBB10E47A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744034389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkBUryrYGqNax4W+f2mWTvO7GffLzVqBmO2p7TnNzxA=;
 b=Xt8I/fbtIJ5MsqCe99gcz00O1WebIoat6CpRA7aXGbQ8kCAsYuXkjTMgbvbwZJ4h0xGmJQ
 FrJIccPAF+dH0wuYreyuCXGTGJguS8uEGk0NkA4EXLZIqJqRM9Aeo05u4UauDNhjtzYmFP
 1g2AFUboeWa12ZLcJdveRuHsdVfBby8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-VKmtm1sJMHKrcPIBOF_aiQ-1; Mon, 07 Apr 2025 09:59:48 -0400
X-MC-Unique: VKmtm1sJMHKrcPIBOF_aiQ-1
X-Mimecast-MFC-AGG-ID: VKmtm1sJMHKrcPIBOF_aiQ_1744034387
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso32791495e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 06:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744034387; x=1744639187;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vkBUryrYGqNax4W+f2mWTvO7GffLzVqBmO2p7TnNzxA=;
 b=dkcC6zpqhivuQDB9iInPoTSIYZXtPbhI722XqlkSviuEJWgjBZu/1ChH0DGkSREgNU
 KUnSigejvWYrKwj+9WLL1r2vbhSO/ONhSmNaZ4DKAER0swNMX5cM+Ztu5uyUU8v6ztm7
 rwd9M/NB550dZCrvopK4MjFqe7WBUx/ldJXUJ84VA45OsHdHprVS2NYYWuwQcCFkoBpf
 Mf3Mcje/ivgM1PLmYz3wTPbCSz56cgFF9R6584Puze2d7tMGMbE5gUxyMrYcv+m6UqV9
 CgDKJfan1xF0LUl4KTFnVmEx4Z3itmuRR93cZ7iEhCGpwCJsdvU8UswqnM3J/5cvXsLK
 Alzw==
X-Gm-Message-State: AOJu0Yzi7eJLJlkfIzjESCX7BpKR1JR6uMI4K7nrAD28DKYg/W2pgYyV
 hY/ls9xFsRQvawyyfxCkffFnfNDIEzaMl796N6/6KcNi0Ch/2tw0qab/dQ9EOVhUdUHSdxq+6lq
 Yg4KvCKbRpga20iIpuKp5QPYgGJbC8ZAcolo3qlhbIzQ/RDuG42h9AYk0LDBjToj8jg==
X-Gm-Gg: ASbGncv86lgRisRz/AU3qHLm0xwupS9sEsZZb1dUpV/xPgQd/9+5wYSPLcE34LtIVVO
 06ACDdT2T5zDdqAlt3w5LFnOhuim+9/2m7s/qzzREDLBMVeVdZ/jFnFF0V+6nRzKYZ39Dz4Re6H
 zxNPZwxGTgQKe4KSTXPD9FZEhN1LGAxEnO/SVF9PSmpnJ/2xB13a8WmxNvWJBW7Hx5azawwyZHC
 V+zUQqBeYeJFKtWtW55LpU4IVmdlhb56Y2k9mjyjyY75mQxrUGdTNTcA/LLUZdtEjOYANBdJFjL
 97xTnJGhy8bZiqIz4ERWR45tsYQGzcp8Cdjn39mvA10p9icnqH6ZjVw=
X-Received: by 2002:a05:600c:5814:b0:43d:cc9:b09d with SMTP id
 5b1f17b1804b1-43ee0b1a288mr49851195e9.20.1744034386520; 
 Mon, 07 Apr 2025 06:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbs6wQ3VmzdkUzTe0tX5LkGpSa/q/u1hORXDxiCHbxj6XpMJjnva5luW4sTV9zO/ptKQo0Rw==
X-Received: by 2002:a05:600c:5814:b0:43d:cc9:b09d with SMTP id
 5b1f17b1804b1-43ee0b1a288mr49850985e9.20.1744034385897; 
 Mon, 07 Apr 2025 06:59:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec17b1352sm132558025e9.37.2025.04.07.06.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 06:59:45 -0700 (PDT)
Message-ID: <2bb836b8-693a-43cf-81ca-e75bd5d9f5e9@redhat.com>
Date: Mon, 7 Apr 2025 15:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/sysfb: simpledrm: Remove unused helper
 simpledrm_device_of_dev()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250407134753.985925-1-tzimmermann@suse.de>
 <20250407134753.985925-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250407134753.985925-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sfi5Fc1GlNv4rRPRne0T2f_wNDNYeC_8rqrlaJNhbzg_1744034387
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

On 07/04/2025 15:47, Thomas Zimmermann wrote:
> After moving most of the mode-setting pipeline into drm_sysfb_helper.c,
> simpledrm_device_of_dev() is no longer being used. Remove it.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Jocelyn Falempe <jfalempe@redhat.com>
> Closes: https://lore.kernel.org/dri-devel/20250407131344.139878-1-jfalempe@redhat.com/
> Fixes: 177dfbdb7e67 ("drm/sysfb: Merge primary-plane functions")
> ---
>   drivers/gpu/drm/sysfb/simpledrm.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
> index 78672422bcada..f37b1994de71f 100644
> --- a/drivers/gpu/drm/sysfb/simpledrm.c
> +++ b/drivers/gpu/drm/sysfb/simpledrm.c
> @@ -244,11 +244,6 @@ struct simpledrm_device {
>   	struct drm_connector connector;
>   };
>   
> -static struct simpledrm_device *simpledrm_device_of_dev(struct drm_device *dev)
> -{
> -	return container_of(to_drm_sysfb_device(dev), struct simpledrm_device, sysfb);
> -}
> -
>   /*
>    * Hardware
>    */

