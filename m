Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011F880D2A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 09:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D041610F123;
	Wed, 20 Mar 2024 08:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E20IEiE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D12010F2E1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 08:37:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41466e01965so9947255e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710923833; x=1711528633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O0h9ShhKwKo94HpkMlCl4q0fJQvniE/fEbxFxlkuix8=;
 b=E20IEiE6n3TUo4FNuo7CYipuMr8k0/pZjP2wEqwgStLxKdLl8HUdlZDQAT9ZuVt/ak
 8tZACdIIizJgSXsByeljt6eQUAynBXTMorHxCL4sUr55Ckpy4WH1xlz4cUwR4e9H2+z3
 5JvW5QGJ67GZC6rSPrFPxWth/UDjV4f63VbTGy6jlKaC9Yd1nmTdwRQBATXJOMrbObQ/
 2FAHxGsExOW3gJm0faP832c+LPdUeLq+tXKWrv56QTsBUTOabS9XdrJwPSefqvwqAKkP
 Asgo2P/pQnf9jO9BYl54/ZiXD8MKRVoeFi27WQzQX66Gxw3qSCcgBIo3GX6Is3X8h7Xt
 2HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710923833; x=1711528633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O0h9ShhKwKo94HpkMlCl4q0fJQvniE/fEbxFxlkuix8=;
 b=aTue7HqLVd1OVoNJqFTPSnlaCapnPF9VGcmrAB3cQs/UV7N7ECVujHzqdRAtSkHxj3
 mD1WeuZ12KDXimkHy9hLU61P50NfgHFlHrg//DickSDis6O+omZhh14JomlP+wDH7qfN
 AHSKW3RWVfML7VTMxV01Tq7itkaJR79YQyN1kqyf29eOjlcDPUXtoPMMEfg9KTDi3Io0
 FhdUXYORDRoQkv/LjBs8jaUQ3i6R1zkxXMuxg3azruiPo+kWP+UWcjbZyWtYWzzV9KJd
 2ufsI+Lf837Yq1520y1tNVJJBihdpycLhMJoJybmR1jnAZrjsvWegp5p1RMaxtXsJhEY
 pzaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI5APsboYSuLKJWNsRE0J7J0Eb+RNEFaAJuuLkckEzpfwxqDtY2/N+/Pgvas21KCpdztyzSnknJaiURbE+ifg+j6lAj9j8fhaW4v1AEqkr
X-Gm-Message-State: AOJu0YxyASS12uQUofEsU8XV0U9jdEfmoacAnxYtS+Oe5T1aItIa3Qxj
 InhqXWdS+hqf8HTWkYFWpH4wu3c24Cr+crvNWo+TuHX7ikctlMti
X-Google-Smtp-Source: AGHT+IGa58nGCJKekIoS3MzHD3SUCd1Vz9UMMJhXb0mgycB8I8fgzPR69/0+gTJ7cpDNluNemiyHoA==
X-Received: by 2002:a5d:6450:0:b0:33d:a011:ae42 with SMTP id
 d16-20020a5d6450000000b0033da011ae42mr11461520wrw.38.1710923833161; 
 Wed, 20 Mar 2024 01:37:13 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 dd15-20020a0560001e8f00b0033ce727e728sm14168784wrb.94.2024.03.20.01.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 01:37:12 -0700 (PDT)
Message-ID: <57c49fd1-a55f-47d5-a057-54d360c77906@gmail.com>
Date: Wed, 20 Mar 2024 09:37:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: Fix NULL pointer dereference in
 sanitycheck()
Content-Language: en-US
To: Pavel Sakharov <p.sakharov@ispras.ru>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Arvind Yadav <Arvind.Yadav@amd.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 lvc-project@linuxtesting.org
References: <20240319231527.1821372-1-p.sakharov@ispras.ru>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240319231527.1821372-1-p.sakharov@ispras.ru>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.03.24 um 00:15 schrieb Pavel Sakharov:
> If due to a memory allocation failure mock_chain() returns NULL, it is
> passed to dma_fence_enable_sw_signaling() resulting in NULL pointer
> dereference there.
>
> Call dma_fence_enable_sw_signaling() only if mock_chain() succeeds.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d62c43a953ce ("dma-buf: Enable signaling on fence for selftests")
> Signed-off-by: Pavel Sakharov <p.sakharov@ispras.ru>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push it to drm-misc-fixes in a minute.

Thanks,
Christian.

>
> ---
>   drivers/dma-buf/st-dma-fence-chain.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index 9c2a0c082a76..ed4b323886e4 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -84,11 +84,11 @@ static int sanitycheck(void *arg)
>   		return -ENOMEM;
>
>   	chain = mock_chain(NULL, f, 1);
> -	if (!chain)
> +	if (chain)
> +		dma_fence_enable_sw_signaling(chain);
> +	else
>   		err = -ENOMEM;
>
> -	dma_fence_enable_sw_signaling(chain);
> -
>   	dma_fence_signal(f);
>   	dma_fence_put(f);
>
> --
> 2.44.0
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

