Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD6788583
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334F610E64F;
	Fri, 25 Aug 2023 11:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAF910E64E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4fORvnyTFCcal4ymvAabYEtTRuLBNmZwVaPYVJ/waps=; b=YX19gxmUnhAih3uS8NAfVxGvqT
 0gHk7yZ2cTk0lgp0AGQ+dlUe0foHmlJqB2Jj9Q9GsuCls/3DbLlvCZjlyjeRPH3EytJ0ezzyhN5/y
 ePflMfmO3gSHoWOfuGevkkLqyplMw5K1c6sog4ziX6vUo95/tjGWe2mXrb/CecRfizi7OVp/49bFn
 /1QJFzxCs6lG4iais7dEl60vL5bJm5XYgDMv5Wgr/T2F9DOYxExhC2jK29nKeAtNAYt+FHE+ACcE2
 FJFRddZVd91B3/bVyP27SmZIHn77oQZKFlBb5zKM1uerNqm0TCU5EfAAt9oOCUTsIjQ+UR7p0WEwl
 TBRYaVjw==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=48232)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qZUrO-0023Ou-Lw;
 Fri, 25 Aug 2023 13:20:14 +0200
Message-ID: <0187d72b-e8d6-db6d-ef66-1dde1faf128f@tronnes.org>
Date: Fri, 25 Aug 2023 13:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/repaper: fix -Wvoid-pointer-to-enum-cast warning
Content-Language: en-US
To: Justin Stitt <justinstitt@google.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 noralf@tronnes.org
References: <20230816-void-drivers-gpu-drm-tiny-repaper-v1-1-9d8d10f0d52f@google.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20230816-void-drivers-gpu-drm-tiny-repaper-v1-1-9d8d10f0d52f@google.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/16/23 21:55, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/gpu/drm/tiny/repaper.c:952:11: warning: cast to smaller integer
> |       type 'enum repaper_model' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         952 |                 model = (enum repaper_model)match;
> |
> 
> This is due to the fact that `match` is a void* while `enum repaper_model`
> has the size of an int.
> 
> Add uintptr_t cast to silence clang warning while also keeping enum cast
> for readability and consistency with other `model` assignment just a
> few lines below:
> |       model = (enum repaper_model)spi_id->driver_data;
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---

Thanks, applied to drm-misc-next.

Noralf.

>  drivers/gpu/drm/tiny/repaper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index c2677d081a7b..165f2099e7d8 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -949,7 +949,7 @@ static int repaper_probe(struct spi_device *spi)
>  
>  	match = device_get_match_data(dev);
>  	if (match) {
> -		model = (enum repaper_model)match;
> +		model = (enum repaper_model)(uintptr_t)match;
>  	} else {
>  		spi_id = spi_get_device_id(spi);
>  		model = (enum repaper_model)spi_id->driver_data;
> 
> ---
> base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
> change-id: 20230816-void-drivers-gpu-drm-tiny-repaper-a08321cd99d7
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 
