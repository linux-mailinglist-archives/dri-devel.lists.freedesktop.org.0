Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC13EF31B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 22:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A50089B9E;
	Tue, 17 Aug 2021 20:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B3489B9E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 20:12:00 +0000 (UTC)
Received: from [192.168.0.209]
 (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net [80.193.200.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id CC65E3F09C; 
 Tue, 17 Aug 2021 20:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629231119;
 bh=vz7ZaNZ3isdK9UEz0Hc6tuR22YhsDAw8pDuj4sdetMs=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=HusAaAkdjP6MAVLWziUddQUHebS+CPTrklda/1m3aM+O95Vg2c/Js8hpQ6cm3iZEJ
 A58pumnzsgcbQR6MrJJYVivynS9lXK9I6Ql+tCfjui9AoknaFU3rffCQoCyLzHuszg
 426YZSfzyBJ8cuunvF8EHexB0SAUuUqW6+OKmrGo3ylT+j2ziAqyRJO8fzjbTZlaKE
 oJENkKNA44i8rzvRLqegXx9nyCyklRp1Ql7QZWSbKUMb+FkrznM+b3b+DT3Uee9elk
 MO9uvA8jR5sOqO6P8uyNBbdunt7kLvbA07XeWQfBks5KGSxFFnPyeQpgZuva7aRVQ+
 Iq5XOnnWIHAWQ==
Subject: Re: [PATCH][next] drm/mgag200: Fix uninitialized variable delta
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210817163204.494166-1-colin.king@canonical.com>
 <bc94e837-9b56-55ba-1e68-1cba79ac038a@suse.de>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <ff723637-fa21-6b58-c8f7-9c3567cd5234@canonical.com>
Date: Tue, 17 Aug 2021 21:11:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bc94e837-9b56-55ba-1e68-1cba79ac038a@suse.de>
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

On 17/08/2021 19:22, Thomas Zimmermann wrote:
> Hi
> 
> Am 17.08.21 um 18:32 schrieb Colin King:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The variable delta is not initialized and this will cause unexpected
>> behaviour with the comparison of tmpdelta < delta. Fix this by setting
>> it to 0xffffffff. This matches the behaviour as in the similar function
>> mgag200_pixpll_compute_g200se_04.
>>
>> Addresses-Coverity: ("Uninitialized scalar variable")
>> Fixes: 2545ac960364 ("drm/mgag200: Abstract pixel PLL via struct
>> mgag200_pll")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> But the commit message needs Fixes etc. I just sent out a patch for this
> issue myself. I'd like to merge both patches' tags and commit the result
> under your name. (You were first.) Is that ok for you?

Sure. Go ahead, Thanks

Colin

> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_pll.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_pll.c
>> b/drivers/gpu/drm/mgag200/mgag200_pll.c
>> index 7c903cf19c0d..18f1a6dd019a 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_pll.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_pll.c
>> @@ -125,6 +125,7 @@ static int mgag200_pixpll_compute_g200se_00(struct
>> mgag200_pll *pixpll, long clo
>>         m = n = p = s = 0;
>>       permitteddelta = clock * 5 / 1000;
>> +    delta = 0xffffffff;
>>         for (testp = 8; testp > 0; testp /= 2) {
>>           if (clock * testp > vcomax)
>>
> 

