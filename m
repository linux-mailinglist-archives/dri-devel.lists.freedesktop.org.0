Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEA90384F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 12:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621110E22A;
	Tue, 11 Jun 2024 10:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dWgrGqVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281C110E305
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718100134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybrwft53atk6SF7ZUqNAnkZ2feuXIglpHBR+lKADkBw=;
 b=dWgrGqVfGTGCZNrSuHM+469mU4tMVLsH1RG6dbDKgZOY8fs+67Pj6E/6N7Rg6/89nXmvy2
 kB8ezy825OmQ3cxY/pP+0DdKWj0FrZsTEP+3GaEwppiiNmrqDffS+MfjSIH99ovkwrbsNE
 JAjyAKFwc8tPw5ejiKYEcib1OX4Kqgk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-GSPuKNp5MI-TIysZGXZe6A-1; Tue, 11 Jun 2024 06:02:11 -0400
X-MC-Unique: GSPuKNp5MI-TIysZGXZe6A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35dc0949675so3846836f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 03:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718100130; x=1718704930;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybrwft53atk6SF7ZUqNAnkZ2feuXIglpHBR+lKADkBw=;
 b=OAwG550CvNVaUUzAdRJJa0xYMG/m4Au0AjPxx4Oz6Mw1s7o3THJ7+TkVY4xXhBuvuC
 ef4eqNa1CQh7f0IxLa/4gBHANWTs/bHHA7ViWc/eoCYyq1vk9JoO/8F0VqVbv+EbNWWK
 nGeIED+eYw0KQZxv55JD28VNMT1Q080FP+X5oLXavOPKO3nxvtgC9kdCa4fbLZVsgtV8
 RqZHpVvn2s4igpgHMQrCN9jYB+aFfL48zrT0Xv0OR61RgBH9gQIiwFtfY6/3veSowh5a
 E1JOqIvAXtjhwPjkMEE2Ae2CzlCV9aRBXEq0i+j38MCWXRlrg2c7xS5i+0O90cc0GMKc
 F+wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQEtTJ/k0Su2eBEZ0oqtAiGcsbjM0z/jfmCRW2RmzSjZdSsNb//wzVR7DBBOtjnL+yU72p1MUJwHNz3f3tt79jY4ZFesrAM5tl+nSrWCsz
X-Gm-Message-State: AOJu0Yz6Z2SFh56mTzm0rwDJBbwbUhgBaBsOKgRj6VJi/J0SrpB3bYx7
 cBtn/tF7vEzV76JIw3Da7iF9BotiyPTKZlx/FcwvacK4tHFPayGmN7b+uoaeyO7JDc0iDCSSmX+
 gCUZxLKjnrbbvZAGmTEZFRbzG8HA0OOBivoZo7eyjsfg1cDUhXWEt9aGsehPnqzTUWw==
X-Received: by 2002:adf:e3c5:0:b0:35f:1f06:3d9d with SMTP id
 ffacd0b85a97d-35f1f063df7mr5752580f8f.70.1718100130588; 
 Tue, 11 Jun 2024 03:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKZL98uEunjHgV1dVr0GvsBw6dhzSAWM/mji33SSRAXlWoRbiGLGcShOXcwnVxfeWG9h8t4g==
X-Received: by 2002:adf:e3c5:0:b0:35f:1f06:3d9d with SMTP id
 ffacd0b85a97d-35f1f063df7mr5752550f8f.70.1718100130173; 
 Tue, 11 Jun 2024 03:02:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e991c9sm13431003f8f.70.2024.06.11.03.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 03:02:09 -0700 (PDT)
Message-ID: <de79f41d-3a9b-4f15-b270-246af8b4c5b0@redhat.com>
Date: Tue, 11 Jun 2024 12:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/nouveau: remove unused struct 'init_exec'
To: linux@treblig.org
Cc: daniel@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kherbst@redhat.com, lyude@redhat.com
References: <20240517232617.230767-1-linux@treblig.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240517232617.230767-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/24 01:26, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'init_exec' is unused since
> commit cb75d97e9c77 ("drm/nouveau: implement devinit subdev, and new
> init table parser")
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Danilo Krummrich <dakr@redhat.com>

To which series does this patch belong? Need me to apply it?

- Danilo

> ---
>   drivers/gpu/drm/nouveau/nouveau_bios.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 79cfab53f80e..8c3c1f1e01c5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -43,11 +43,6 @@
>   #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
>   #define LOG_OLD_VALUE(x)
>   
> -struct init_exec {
> -	bool execute;
> -	bool repeat;
> -};
> -
>   static bool nv_cksum(const uint8_t *data, unsigned int length)
>   {
>   	/*

