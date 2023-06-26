Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B542E73E07B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D1D10E1FD;
	Mon, 26 Jun 2023 13:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647DE10E1FE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 13:20:57 +0000 (UTC)
Received: from [192.168.2.254] (109-252-154-132.dynamic.spd-mgts.ru
 [109.252.154.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A3B86607134;
 Mon, 26 Jun 2023 14:20:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687785656;
 bh=rhp4zEhI3pFi2vNX2zs+L2Vdw6QHH/dBNRQvSpHUpzw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A+/FG6maqIC2yM1tswFgCqch7PrLRYDvjpfz6fHKAtrvNauNss+NaeLEKW5z9Wgtm
 7Rj/c857nrxjeT0lKjggL6cXUAr/Sfxaq/bQ4tANXXG/q1+diGqs4g0JGNLrnnfaE3
 amctE0YSCWMjC410FOOypwoT3Ia0JzqxARqARMqfLmHSH/ZF4ArP7MkoJHcltHDygO
 hyWfedyiJW/AxMFMz2QXvNnweNR2lzK/47ID6vStbZIT0g1dQ0GuhwWjkOkrbrcYPq
 aqdGCQBkVGkWY09zXvjB9n7tyQVRvpPZOcyZUR95eKGuMdBSxon107WTKqW6kUqVNN
 9JGUMHHhx5hNg==
Message-ID: <2182355e-2412-fd60-fb0d-5359b43d4e0c@collabora.com>
Date: Mon, 26 Jun 2023 16:20:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH 1/5] drm/panfrost: Stop using drm_gem_shmem_put_pages()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
 <20230626120247.1337962-2-boris.brezillon@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230626120247.1337962-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/23 15:02, Boris Brezillon wrote:
> -err_pages:
> -	drm_gem_shmem_put_pages(&bo->base);
>  err_unlock:
>  	dma_resv_unlock(obj->resv);
> +
> +	if (ret && pinned)
> +		drm_gem_shmem_unpin(&bo->base);

The drm_gem_shmem_unpin() was supposed to be used only in conjunction
with drm_gem_shmem_pin(). I've a pending patch to enable the pin/unpin
refcounting needed by drm-shmem shrinker, it will prohibit invocation of
unpin without a previous pin.

I'm wondering whether it will be okay to simply remove
drm_gem_shmem_put_pages() from the Panfrost code, letting pages to be
kept allocated in a error case. They will be freed once BO is destroyed.

-- 
Best regards,
Dmitry

