Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC430A34B48
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D9C10E021;
	Thu, 13 Feb 2025 17:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="y0MOSX0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B2E10E021
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202412;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Fj9cPXNBzdjUMe00oNdIkZqBOoISrAcz9RO9oXC9vBs=; b=y
 0MOSX0NHaQu3BNw4/MIOQ5IZ9IVsCl9Xjl04n0YQa617awB+Dl8JfdEjYwzTApevlJu+yAbE4+mDk
 MVgzxaC1PVhUm5y3z7fs0p8gUOPIDWybc8rf6b+vCMRntcmqkQwlft3ZqTbjpOm4bdLiPR7A+inCg
 /eVb5UQSSIXCF/Kmm6ATxX9IuIcnkXRDr0reoTnGNIK1T92ip6gXWCb/vX6huj49xDO3H04MXTp2K
 NutoW7906oUcBuofabSvTSa5uKBa7ytjiEsTxolQqlUgu4NsaVld5jkI0bHZ/djhhT3XJSjZk9fj1
 QM6HD+F39/MD2iNT+tcKQcy0uImqOQf+Q==;
Received: from smtp by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 id 1tichY-0016gn-5f; Thu, 13 Feb 2025 18:08:36 +0100
Message-ID: <cac5924e-5653-4385-b18f-6c7f1f8d6e8b@tronnes.org>
Date: Thu, 13 Feb 2025 18:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Lanzano <lanzano.alex@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
 <d9e1c3a9-0a82-4908-b455-99227c5a2bd5@fintech.ru>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <d9e1c3a9-0a82-4908-b455-99227c5a2bd5@fintech.ru>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Alex who is now the driver maintainer.


On 13.02.2025 17:57, Nikita Zhandarovich wrote:
> Gentle ping :)
> 
> On 1/16/25 16:48, Nikita Zhandarovich wrote:
>> There are conditions, albeit somewhat unlikely, under which right hand
>> expressions, calculating the end of time period in functions like
>> repaper_frame_fixed_repeat(), may overflow.
>>
>> For instance, if 'factor10x' in repaper_get_temperature() is high
>> enough (170), as is 'epd->stage_time' in repaper_probe(), then the
>> resulting value of 'end' will not fit in unsigned int expression.
>>
>> Mitigate this by casting 'epd->factored_stage_time' to wider type before
>> any multiplication is done.
>>
>> Found by Linux Verification Center (linuxtesting.org) with static
>> analysis tool SVACE.
>>
>> Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>> ---
>>  drivers/gpu/drm/tiny/repaper.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
>> index 77944eb17b3c..d76c0e8e05f5 100644
>> --- a/drivers/gpu/drm/tiny/repaper.c
>> +++ b/drivers/gpu/drm/tiny/repaper.c
>> @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
>>  				       enum repaper_stage stage)
>>  {
>>  	u64 start = local_clock();
>> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
>> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>>  
>>  	do {
>>  		repaper_frame_fixed(epd, fixed_value, stage);
>> @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
>>  				      const u8 *mask, enum repaper_stage stage)
>>  {
>>  	u64 start = local_clock();
>> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
>> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>>  
>>  	do {
>>  		repaper_frame_data(epd, image, mask, stage);
> 

