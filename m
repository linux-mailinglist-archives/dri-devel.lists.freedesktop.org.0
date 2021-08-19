Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E53F1AF7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C825B6E96C;
	Thu, 19 Aug 2021 13:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5548B6E96C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:54:42 +0000 (UTC)
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 887473F047; 
 Thu, 19 Aug 2021 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629381280;
 bh=qyVfAD70OnSmTL6T7q8M2kzukbFXgV7pw1ZsTuvCXvs=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=wWEiWs+2aX1SyglCKtylm23g+9P2rxsF9XgIkRI3Ourd3b0qQKSrkO4ltWyqoEdRe
 1JnX7dXu6j+Ctid2QwajdijkHBDok0orq+B+vTx99m6KEjxlQko8WdJPbyTZBLEmp2
 DUTEuOrLaxRKltOPW+IHwqzXu00bwBcPtABBn/Ou5j5cnvQ6x+B5G/+r8kVde9KRrG
 AEurGqItIBuoNkK/CSSO1XyflExM+iS/FeCwnmuGRgvj6tbNtnA1ZPF/qZ5ONKumnA
 MXx9auJcSe/E2UR7j2tPHUfXmbdx8XowwBy2UYMAJ1jT/TI0j7Xtqape/pNr6gF+xb
 NRIv4pQMEEV3Q==
Subject: Re: [PATCH] drm/bridge/tc358767: make the array ext_div static const, 
 makes object smaller
To: Joe Perches <joe@perches.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210819133839.10745-1-colin.king@canonical.com>
 <0a2ea4e54d7bfd61b45cc070eee6b62e8da82190.camel@perches.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <913b96bc-f5c4-1a26-c5f7-70a9d0ab3f53@canonical.com>
Date: Thu, 19 Aug 2021 14:54:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0a2ea4e54d7bfd61b45cc070eee6b62e8da82190.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 19/08/2021 14:51, Joe Perches wrote:
> On Thu, 2021-08-19 at 14:38 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Don't populate the array ext_div on the stack but instead it
>> static const. Makes the object code smaller by 118 bytes:
>>
>> Before:
>>    text    data    bss     dec    hex filename
>>   39449   17500    128   57077   def5 ./drivers/gpu/drm/bridge/tc358767.o
>>
>> After:
>>    text    data    bss     dec    hex filename
>>   39235   17596    128   56959   de7f ./drivers/gpu/drm/bridge/tc358767.o
> 
> Why is text smaller and data larger with this change?

There are less instructions being used with the change since it's not
shoving the array data onto the stack at run time. Instead the array is
being stored in the data section and there is less object code required
to access the data.

Colin

> 
>>
>> (gcc version 10.3.0)
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/bridge/tc358767.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>> index 23a6f90b694b..599c23759400 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -468,7 +468,7 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
>>  	int div, best_div = 1;
>>  	int mul, best_mul = 1;
>>  	int delta, best_delta;
>> -	int ext_div[] = {1, 2, 3, 5, 7};
>> +	static const int ext_div[] = {1, 2, 3, 5, 7};
>>  	int best_pixelclock = 0;
>>  	int vco_hi = 0;
>>  	u32 pxl_pllparam;
> 
> 

