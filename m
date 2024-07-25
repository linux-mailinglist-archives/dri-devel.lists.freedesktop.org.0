Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4463393BCC5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 08:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBABA10E71C;
	Thu, 25 Jul 2024 06:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fgKBZ2JZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D190310E16F;
 Thu, 25 Jul 2024 06:55:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so3156285e9.0; 
 Wed, 24 Jul 2024 23:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721890503; x=1722495303; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DuTN+kDGENu6xXBj1NgEgyRLozzKhv55rcnYOX8KmhY=;
 b=fgKBZ2JZrFj/U6dpeLbKmYRDW4y3x1u6Nz9CJFIHcewbpbcP+wSfVU36kN9ATjvoNx
 ALQTZnTNrLRzlSL6DREIQNKfUp5htRALQBruwD+OJ9jVbVmddEDTmL4pQorQAgg0FTA2
 Efhzm9AglI94KglwFw3r59IPuWj4KJ/eBx2qnkPib8lz3zzkxtPYyVE6ifMTVAL46XwY
 0QpsnzJbS0sgJWHoo+VeYXV/eDG9gujUD+sOAvuT/65KN+O94amf0KK2Bmuc0+eXh5ji
 Z8P0ukBTl6PsqT007gK514Cg/dWBmdvGHVqTOz/uMVMId6v4mDGwlKt13ZL/1xv0/S6y
 HrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721890503; x=1722495303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DuTN+kDGENu6xXBj1NgEgyRLozzKhv55rcnYOX8KmhY=;
 b=UfY96vvVVRx18auhmM5nN+yg1/oIPIsuCcOrCz3K+qXsMWrSeYKDSyKjYa4Xzfbf+2
 uuFQjsg8/aReIpYswJJcC4k+mymDDSAVmLaWgmuhw8MlA1SmiBdWn0Z+ZuQpP7brW5UI
 iypcWnIJm/C0PqmnXgJlaHPtyowtf9YXS3OpfVvuGgDtvI9Jc26tiYr8GRBdi+rZAdyy
 TslJEUldU7vnARKeypzGj3ddkzS+tXvnDg+AeHhoyTVdihaLshfUkuDq0m0sLjKf8ynb
 WlqQ5hlrQ8QeZZhR9VQsj6gYEV9deXUX1oFCWXhat/FNtedjMvbXcJCH7MT7hV1ivKlu
 QgLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhSIwq5o6Wav/OCDDWjbBr2aO+HxKhEzAmJXJ5HGZn7z7oyQzIeBvqkoQVI9WOcLioqtf1cJ0XhBMLhohi7lvWoov9c+wq5I50oW3hGAhlfvh+1KYQtwMvTk07xdogGTGogZoCUqqZ2/qFn+/ypg==
X-Gm-Message-State: AOJu0Ywlazrz81/mTXKufR44sJBmMq75pyeTke/veSNcDFwX6+jetqnn
 lc0/hPIrBipStEe51bQZTQsZw0vaBT0D59W3URR6E9ajaJQspIqo
X-Google-Smtp-Source: AGHT+IFDb4sD3pOsedkk0/LWcAY+LieYVY8mqTFh3+iKOmjF2aCcPCDJSzJfeDUWQWKsLRFm3/Y0fw==
X-Received: by 2002:a05:600c:3147:b0:426:64c1:8388 with SMTP id
 5b1f17b1804b1-42803b5b18fmr10801735e9.17.1721890502686; 
 Wed, 24 Jul 2024 23:55:02 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f92c7cb3sm61764035e9.0.2024.07.24.23.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 23:55:02 -0700 (PDT)
Message-ID: <d384eb76-502c-4a46-9aa9-44671440b417@gmail.com>
Date: Thu, 25 Jul 2024 08:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/amd/display: use swap() in sort()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20240724073749.14338-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240724073749.14338-1-jiapeng.chong@linux.alibaba.com>
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

Am 24.07.24 um 09:37 schrieb Jiapeng Chong:
> Use existing swap() function rather than duplicating its implementation.
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c:17:29-30: WARNING opportunity for swap().
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9573
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   .../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c    | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> index 717536d7bb30..8e68a8094658 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> @@ -7,16 +7,12 @@
>   
>   static void sort(double *list_a, int list_a_size)
>   {
> -	double temp;
>   	// For all elements b[i] in list_b[]
>   	for (int i = 0; i < list_a_size - 1; i++) {
>   		// Find the first element of list_a that's larger than b[i]

While at it please also replace all // comments by using /* */.

Apart from that looks good to me.

Regards,
Christian.

>   		for (int j = i; j < list_a_size - 1; j++) {
> -			if (list_a[j] > list_a[j + 1]) {
> -				temp = list_a[j];
> -				list_a[j] = list_a[j + 1];
> -				list_a[j + 1] = temp;
> -			}
> +			if (list_a[j] > list_a[j + 1])
> +				swap(list_a[j], list_a[j + 1]);
>   		}
>   	}
>   }

