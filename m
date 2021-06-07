Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BFA39DA80
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 13:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55636E29D;
	Mon,  7 Jun 2021 11:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4E36E29D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 11:01:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so4888851wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=nx741EqL47SzihpLb+BBjs+UIxrPRBlT2mb6Cb6uQ20=;
 b=ChCIMTknIKUKw4zFzcH2yfV1D9iMzg9rx4hFCt7GvD7ieOSJY+2XLan3D49CEBU1WH
 6xEbmIhLvkAy3bRcZcUUOx9SHGvQpbbnezt3C6TA37zU8kvnTFkBJD9YxZdrjdXpKw6N
 k2IfJulcFf8wuiFKI9FHMfXi8l6bZnDnQFUBpL/NakHyGyhvnqsxDs7JxUthql5xsrGO
 2V7EcQSiyU+z+d198lr7tTCnwm7rFFhIU3EoDHOs3cvgy3swhLOsCpSSqBffgYQuCgle
 2m0xM8GHm+KYN8hAY3Le3vjlVyl+T1EOXfn88XRX3c3XSrFgf3pgcimTp7tH2S9lnDxU
 erPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nx741EqL47SzihpLb+BBjs+UIxrPRBlT2mb6Cb6uQ20=;
 b=UJPQ4FelBjVzaV6vsiIlzuV3ZfMoRA8poeVjCAzoCHkv0O2bVq95ZSMgngwAyiwlzT
 sIfA6uFjsYhtCmcVXjDdXSC7xHoxB3ckkpoFdQziGb5qGTUA0GO7NE7cCkbUav3FeNuu
 Mix2uMWEnMzbngl78xxPi3btJklW29jf6JNQ0wo51kuXlFEsqm5kQlTYAbaNSeNTAltX
 2FdsqOAWiSWqpXtwQTzKngD9nU2d5/GiqBIEE/6gdlwuiDxHW9bxryRjHJ5/XtmDFjt6
 UP+B2s1iJJBci7Zc1luDfm6ybVVsM/n0ztiHKFy3m5TfEk8ngWYHh/6eWe7lJt1F/1fP
 qrwg==
X-Gm-Message-State: AOAM532l3PYiifuNrQDkIij9IQxgFXqdIBo+WWn23amKVEcCckssMHdB
 GCKn/Z2CHMGv+I8dhceyu9//haanMUY=
X-Google-Smtp-Source: ABdhPJzXYCMfXLkiS81AiUpdN3tD84haVqqmqvhIZGEqP6u3t6XTnpzLdTLf8+YKRPiMFU1dZpoTOg==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr16412403wms.150.1623063673659; 
 Mon, 07 Jun 2021 04:01:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id q20sm15268353wmq.2.2021.06.07.04.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 04:01:13 -0700 (PDT)
Subject: Re: [PATCH] RDMA/umem: fix missing automated rename
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <20210607070658.11586-1-christian.koenig@amd.com>
Message-ID: <b9d6384d-bbc4-001c-68b1-5137218c9846@gmail.com>
Date: Mon, 7 Jun 2021 13:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607070658.11586-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping. Can anybody give me a quick rb or ack-by?

The driver currently doesn't compile without this on the drm-misc-next 
branch.

Thanks,
Christian.

Am 07.06.21 um 09:06 schrieb Christian König:
> This occasions was missed during the recent rename of the function.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/infiniband/core/umem_dmabuf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index 0d65ce146fc4..c6e875619fac 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -66,7 +66,7 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>   	 * may be not up-to-date. Wait for the exporter to finish
>   	 * the migration.
>   	 */
> -	fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
> +	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
>   	if (fence)
>   		return dma_fence_wait(fence, false);
>   

