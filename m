Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03601460FEF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 09:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3C16E182;
	Mon, 29 Nov 2021 08:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A586E1BD;
 Mon, 29 Nov 2021 08:22:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j3so34889720wrp.1;
 Mon, 29 Nov 2021 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Hq1bgqxxCdegLBVOo7l4Q7H1Xie6p+wm7vH0Y40mkwo=;
 b=CtNwvmW+uiYnu8xy64dsZh+j2/65YctzX6oqs2wOYwbMozt8JZF1cV5+4Y7H4uNO8h
 QCH7gI6Q72FTybeCnLQWb14URcpKiR7AndKkYpXOkC8Q9n7MUr+8wws4u3GY1irCXSD3
 vvmaAef8eAGIpyf5lsxsUWtqdVOo19QpajKqE8rOWNBwJYVukHD4HPX9lHgtTkFOc+Bj
 kp2PBi3Ox3w9cjOe46WQuh27R/m9Ya+lVOXzciZa0FsQ65iq4SRqzGYf25SSzOhvBjEZ
 VPCQJ0aSSAgZrfu8cgT0JsRs/Bpj9RKIWkh3GJoV+MufxqZdmQKVJkDzH3UoohTJRzHN
 TF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Hq1bgqxxCdegLBVOo7l4Q7H1Xie6p+wm7vH0Y40mkwo=;
 b=suFezEQyw5sZNtSb3Blv3Rk/+yrXktdgnnZaZ5AwGSClKyIgT+HKWFPhNYH5pPyajp
 FsuMSsHssM1BBhe6DdzGSj+6F/2qQyCSVe8CHH96GS+r9zqputywegZhNA3VdZRcaDqQ
 zqY/1l0JSE7c7b3YoSsTJMOVKjinTTySTo2glDSj+j8G9d3fsKUsKXfXrkY51IcaUloU
 UNSVyLApewUZaSws/7CRx6Iq9gdedoRzI2KLMf3a0Se3erXUquTzbGmJkJLL1sT0Q2LX
 x4K4o5c5V4jIkj0EXdpYYKYeO+82xtNSFm2iSH+nz/mSugvXjkfsYf7AhntatTtZ1X2g
 FrfQ==
X-Gm-Message-State: AOAM533kZgXx4GER/1lIj7LvDNIQ4UCVXUPR2cEQVBUYw250TOvlrc1S
 qCNaDOxiQx0T8DyNtHRakKk=
X-Google-Smtp-Source: ABdhPJzM2sppvC4WxGqvhpvtbRdPMWvSKAbROEghlA2ucohzHDqrxrVpH61SK17Yl6Nfbz7PsOLtuA==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr34606968wrs.291.1638174120446; 
 Mon, 29 Nov 2021 00:22:00 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de.
 [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id az15sm13456982wmb.0.2021.11.29.00.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 00:22:00 -0800 (PST)
Subject: Re: [PATCH] dma_fence_array: Fix PENDING_ERROR leak in
 dma_fence_array_signaled()
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211129073533.414008-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4fd0eee6-342f-fb31-717c-901440f38c35@gmail.com>
Date: Mon, 29 Nov 2021 09:21:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129073533.414008-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linaro-mm-sig@lists.linaro.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.11.21 um 08:35 schrieb Thomas Hellström:
> If a dma_fence_array is reported signaled by a call to
> dma_fence_is_signaled(), it may leak the PENDING_ERROR status.
>
> Fix this by clearing the PENDING_ERROR status if we return true in
> dma_fence_array_signaled().
>
> Fixes: 1f70b8b812f3 ("dma-fence: Propagate errors to dma-fence-array container")
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-fence-array.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index d3fbd950be94..3e07f961e2f3 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -104,7 +104,11 @@ static bool dma_fence_array_signaled(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
>   
> -	return atomic_read(&array->num_pending) <= 0;
> +	if (atomic_read(&array->num_pending) > 0)
> +		return false;
> +
> +	dma_fence_array_clear_pending_error(array);
> +	return true;
>   }
>   
>   static void dma_fence_array_release(struct dma_fence *fence)

