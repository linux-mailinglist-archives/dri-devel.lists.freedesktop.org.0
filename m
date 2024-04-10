Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A221B89F1E1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D12810F005;
	Wed, 10 Apr 2024 12:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U3+tJcnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6864C10F005
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712751537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46LrrPp64WiWPNLe7QqFP1tIPhMl34xsYWDYBYEnKuA=;
 b=U3+tJcnx82cVcNyW4xesOF+84vLBw+d5dqcO6vDomK5WQXvbDSdF08HhoXsElSFK9zUwrX
 OsnIoGdm7KBj2RHuhjnsGyGxGki7tXJvxGmoxmb/Wx7+dqjtH4B5UmSsBF04aiq8iQXeGO
 YmLS8lCKEDmHo9A75H3P9k7mBWymcyU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-PmBbNAWTMSW2sfVSpDHr-Q-1; Wed, 10 Apr 2024 08:18:56 -0400
X-MC-Unique: PmBbNAWTMSW2sfVSpDHr-Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-343cfa7a9ebso3447665f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 05:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712751534; x=1713356334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=46LrrPp64WiWPNLe7QqFP1tIPhMl34xsYWDYBYEnKuA=;
 b=pojvP0VxvK4+qRsFq/V/joDCKL+fkR+4UPqdYbH9AQ9XdPdjvWJmmMwiytLY3T63ap
 +d28oo274klpV0sRNjLrmWS9rFH2E9JE7fDyJ4qIiJg+xSjlLG2A8WogiohlPGa4h+Sb
 3thobAJlLDo1Wb5nMrwq9s1QTGn9NOaIK2m6GLWFEOBKr7xUDEYZaLKx2ctxGQE1mu43
 ZTGFDiYBUUH/YM9/0ad96/N/usmHZdVaZ6+hzI43UykDeb2L2S7NP+KmO3Q6z8+8T1VU
 aH9eDmjJzaRrrGtrICzJq+n+y4qNpmhlCTOdrwANyFHioztvDI02H5DW3Ebevev+vYnL
 wV3w==
X-Gm-Message-State: AOJu0YwRkaRrF6G7tFYiAjcgsYnRXgHQ/GAi5DY/a4Ce6uV4AgwvVOnf
 LO45znIJjpi8oZlXBtbCD5IC6Ri+BlTtJAQQ1yeL31wU94HkuvGfjmwPK2zIxf1Nuq1ZhMG959l
 PzVixHw9HPd+k9VAFEcqU8775JH5ATjdPh4FN0rX+ode6qugV145GCWikW/J9xozrLQ==
X-Received: by 2002:adf:a38d:0:b0:33e:363b:a7dd with SMTP id
 l13-20020adfa38d000000b0033e363ba7ddmr1549965wrb.20.1712751534709; 
 Wed, 10 Apr 2024 05:18:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECpl1L/oL4mnI82GvOzKPu/U7OJYDEiQinWbtlDFweKbfzg1DEEsIWDiBj0EEBB5P9zTRBxw==
X-Received: by 2002:adf:a38d:0:b0:33e:363b:a7dd with SMTP id
 l13-20020adfa38d000000b0033e363ba7ddmr1549950wrb.20.1712751534349; 
 Wed, 10 Apr 2024 05:18:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:f101:edd0:5929:7a40?
 ([2a01:e0a:d5:a000:f101:edd0:5929:7a40])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b00343300a4eb8sm13584588wro.49.2024.04.10.05.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 05:18:53 -0700 (PDT)
Message-ID: <ea86e546-c804-4384-9cd1-82739fc6205f@redhat.com>
Date: Wed, 10 Apr 2024 14:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/ast: Set DDC timeout in milliseconds
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org
References: <20240403103325.30457-1-tzimmermann@suse.de>
 <20240403103325.30457-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240403103325.30457-2-tzimmermann@suse.de>
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
> Compute the i2c timeout in jiffies from a value in milliseconds. The
> original values of 2 jiffies equals 2 milliseconds if HZ has been
> configured to a value of 1000. This corresponds to 2.2 milliseconds
> used by most other DRM drivers. Update ast accordingly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 312fec1405dd ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.5+
> ---
>   drivers/gpu/drm/ast/ast_ddc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
> index b7718084422f3..3e156a6b6831d 100644
> --- a/drivers/gpu/drm/ast/ast_ddc.c
> +++ b/drivers/gpu/drm/ast/ast_ddc.c
> @@ -153,7 +153,7 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
>   
>   	bit = &ddc->bit;
>   	bit->udelay = 20;
> -	bit->timeout = 2;
> +	bit->timeout = usecs_to_jiffies(2200);
>   	bit->data = ddc;
>   	bit->setsda = ast_ddc_algo_bit_data_setsda;
>   	bit->setscl = ast_ddc_algo_bit_data_setscl;

