Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F09D07F9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 03:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C7C10E219;
	Mon, 18 Nov 2024 02:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="ORU40ias";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7053810E219
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 02:52:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A8094893BD;
 Mon, 18 Nov 2024 03:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1731898332;
 bh=qXpFVzslBhgmbkPqqdI34WI41Ltddd/thUDh8NFsQPg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ORU40iasZsZiBFz2dndFi39EDTaCscNGpFnXkQ577wuUOMrO6Dx+fC2AqqQW8BxMg
 eD4I4tV/UKYmwuy6DWGe7AYabZOOl4d1XdIMinUcf1xroHgkebE500I6iEP59oXUB4
 /Y+FLjDKE+Hc0rFD32RIlGxDiIis0P/2xfBmTdlysLy3eHqlXkR7z1pZepPVliwJE9
 FueDj+Z6pTpXiny9q5BrzM2Un6H5UvqNFulvkX62LTN4xBpKx/lIouDkORHHyTR+8i
 kusQIYsPDZ/H/lGuIplmtp3/m9dsgCpqwNsrRQF0qX84l44+JIdQfkPkq9hbsKche3
 muF1O1BSNRzbw==
Message-ID: <88166e7b-17a9-4533-b3ee-bff914dc00f5@denx.de>
Date: Mon, 18 Nov 2024 02:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/bridge: tc358767: Fix use of unadjusted mode in the driver
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20241026041057.247640-1-marex@denx.de>
 <2351528.ElGaqSPkdT@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2351528.ElGaqSPkdT@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 11/14/24 10:27 AM, Alexander Stein wrote:
> Hi Marek,

Hi,

> Am Samstag, 26. Oktober 2024, 06:10:42 CET schrieb Marek Vasut:
>> The driver configures mostly Pixel PLL from the clock cached in
>> local copy of the mode. Make sure the driver uses adjusted mode
>> which contains the updated Pixel PLL settings negotiated in
>> tc_dpi_atomic_check()/tc_edp_atomic_check().
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/bridge/tc358767.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>> index 7968183510e63..0d523322fdd8e 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -1764,7 +1764,7 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
>>   {
>>   	struct tc_data *tc = bridge_to_tc(bridge);
>>   
>> -	drm_mode_copy(&tc->mode, mode);
>> +	drm_mode_copy(&tc->mode, adj);
>>   }
>>   
>>   static const struct drm_edid *tc_edid_read(struct drm_bridge *bridge,
>>
> 
> This unfortunately breaks my DSI->DP setup on TQMa8MPxL/MBa8MPxL.
> 
> When I revert it, DP works again. I'm currently running on next-20241114
> with patches regarding DSI initialization.
> 
> before:
> tc358767 1-000f: PLL: requested 148500000 pixelclock, ref 26000000
> tc358767 1-000f: PLL: got 147333333, delta -1166667
> tc358767 1-000f: PLL: 26000000 / 1 / 1 * 17 / 3
> tc358767 1-000f: set mode 1920x1080
> tc358767 1-000f: H margin 148,88 sync 44
> tc358767 1-000f: V margin 36,4 sync 5
> tc358767 1-000f: total: 2200x1125
> 
> after:
> tc358767 1-000f: PLL: requested 147333000 pixelclock, ref 26000000
> tc358767 1-000f: PLL: got 146250000, delta -1083000
> tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
> tc358767 1-000f: set mode 1920x1080
> tc358767 1-000f: H margin 148,88 sync 44
> tc358767 1-000f: V margin 36,4 sync 5
> tc358767 1-000f: total: 2200x1125
> 
> The reason this breaks is that the adjusted clock frequency is slightly off
> to the previously calculated one: 147333333 <-> 147333000
> This is because mode clock is only specyfied in KHz. With this incorrect
> input the new result is even lower than requested, thus failing to setup
> correctly.
> 
> As I don't see a quick fix, I propose a revert meanwhile. Any comments?
Sigh, the TC358767 is really a gift that keeps on giving.

Either revert it for now, or give me a week or three until I get back to 
digging in the TC358767. Whichever you prefer. Sorry for the slowness.
