Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB674621AF7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439D810E4D0;
	Tue,  8 Nov 2022 17:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A5610E4D0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:46:02 +0000 (UTC)
Received: from [192.168.2.116] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4640066016AE;
 Tue,  8 Nov 2022 17:46:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667929560;
 bh=0e7etuHrC3dxkdbl3iZ4O0Am+6tKlvXjASN3i9zoYQs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qfwbk28l/dntGrL6EtVyK5lJTAbvsM2IiFdTHcesDRQjza9kwO/vBxxpU0ROZ0Gei
 bpvdxMFNr0bafKslkfXg2aEUxWQe1zxB5dSrx2bGAtWCC8APZmMToyXz8p1f3+JS13
 oSE5jiK2VaiHv+VTwzcNd+qF9jM6PKOJWFPskJjDyD+Q6OsGfWtrM1wbTLLPVFjcid
 Jrc9VH1jWs4LwVt14l388Fld9Y0m9JG1tbct2XcLyD5TlnbSusvvHVqfoomLKotoHD
 vDkAd1agkuvChj0HfQSi4QtYccVdh5F48FI+XtDuiJfhi4IJYX6Oz5Cbh5SV4uE/2q
 Lxyvo1H0hRNAQ==
Message-ID: <e27ac287-e04f-7a13-a483-1fc7e496345d@collabora.com>
Date: Tue, 8 Nov 2022 20:45:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/panfrost: Split io-pgtable requests properly
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com
References: <49e54bb4019cd06e01549b106d7ac37c3d182cd3.1667927179.git.robin.murphy@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <49e54bb4019cd06e01549b106d7ac37c3d182cd3.1667927179.git.robin.murphy@arm.com>
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
Cc: linux-arm-kernel@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/22 20:06, Robin Murphy wrote:
> Although we don't use 1GB block mappings, we still need to split
> map/unmap requests at 1GB boundaries to match what io-pgtable expects.
> Fix that, and add some explanation to make sense of it all.
> 
> Fixes: 3740b081795a ("drm/panfrost: Update io-pgtable API")
> Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> The previous diff turned out to be not quite right, so I've not
> included Dmitry's Tested-by given for that.
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index e246d914e7f6..4e83a1891f3e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -250,13 +250,22 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
>  
>  static size_t get_pgsize(u64 addr, size_t size, size_t *count)
>  {
> +	/*
> +	 * io-pgtable only operates on multiple pages within a single table
> +	 * entry, so we need to split at boundaries of the table size, i.e.
> +	 * the next block size up. The distance from address A to the next
> +	 * boundary of block size B is logically B - A % B, but in unsigned
> +	 * two's complement where B is a power of two we get the equivalence
> +	 * B - A % B == (B - A) % B == (n * B - A) % B, and choose n = 0 :)
> +	 */
>  	size_t blk_offset = -addr % SZ_2M;
>  
>  	if (blk_offset || size < SZ_2M) {
>  		*count = min_not_zero(blk_offset, size) / SZ_4K;
>  		return SZ_4K;
>  	}
> -	*count = size / SZ_2M;
> +	blk_offset = -addr % SZ_1G ?: SZ_1G;
> +	*count = min(blk_offset, size) / SZ_2M;
>  	return SZ_2M;
>  }
>  

This variant also works fine, thanks!

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

