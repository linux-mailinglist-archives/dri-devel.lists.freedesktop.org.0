Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EA8A34AFC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AA110EB3F;
	Thu, 13 Feb 2025 16:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3578D10EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:57:31 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 13 Feb
 2025 19:57:25 +0300
Received: from [192.168.211.132] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 13 Feb
 2025 19:57:25 +0300
Message-ID: <d9e1c3a9-0a82-4908-b455-99227c5a2bd5@fintech.ru>
Date: Thu, 13 Feb 2025 19:57:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US
In-Reply-To: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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

Gentle ping :)

On 1/16/25 16:48, Nikita Zhandarovich wrote:
> There are conditions, albeit somewhat unlikely, under which right hand
> expressions, calculating the end of time period in functions like
> repaper_frame_fixed_repeat(), may overflow.
> 
> For instance, if 'factor10x' in repaper_get_temperature() is high
> enough (170), as is 'epd->stage_time' in repaper_probe(), then the
> resulting value of 'end' will not fit in unsigned int expression.
> 
> Mitigate this by casting 'epd->factored_stage_time' to wider type before
> any multiplication is done.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 77944eb17b3c..d76c0e8e05f5 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
>  				       enum repaper_stage stage)
>  {
>  	u64 start = local_clock();
> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>  
>  	do {
>  		repaper_frame_fixed(epd, fixed_value, stage);
> @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
>  				      const u8 *mask, enum repaper_stage stage)
>  {
>  	u64 start = local_clock();
> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>  
>  	do {
>  		repaper_frame_data(epd, image, mask, stage);

