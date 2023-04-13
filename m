Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004D6E08F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7942B10EA6C;
	Thu, 13 Apr 2023 08:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E745410E0C0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 04:19:22 +0000 (UTC)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.trvn.ru (Postfix) with ESMTPSA id 82FD14137A;
 Thu, 13 Apr 2023 09:19:18 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
 t=1681359558; bh=EACh0p8x8TBQcC+xIl40sDZ9sHJ0nPKMt/fNm93r6ts=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0esRjPOG+1XrN5sgTC+MdhEiL05H1pBvZD0Z2aG20oXfW/RYRR9HMYxn1BhrGY8ql
 U335OCrrHdVfczRMXLEtduafK/pirEXfDmDUkRzsIWkK5/9u1DEsHnvpl9DmsZysSr
 UzFS5LNa6iL+L4+a7EHMk9eZC2wu7pZaJpW/PaNzAulULzxKcGap14Q9vW4uAO22FS
 YN9kRbI8CY9TxZKwApu8mLGuu6VWzn/ubXyiPnrsFNGBeBm9ZbDxFMoyqLraFeT9LV
 bGfh0w+TzRSTNk6W+zSFGCEsgHW7C0VqY1fxEJv5C9jm4NquY/3KlpWqhVM0D1ffWW
 dOg/PfjGvyjDA==
MIME-Version: 1.0
Date: Thu, 13 Apr 2023 09:19:17 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement wait_hpd_asserted
In-Reply-To: <CAD=FV=XEQS9MB4e52B4yLjiP8ksYmeos_emiH4=-adCOwzfGUA@mail.gmail.com>
References: <20230408082014.235425-1-nikita@trvn.ru>
 <CAD=FV=XEQS9MB4e52B4yLjiP8ksYmeos_emiH4=-adCOwzfGUA@mail.gmail.com>
Message-ID: <905403377ec62914a2fbe21a6b4a6c8e@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Apr 2023 08:33:23 +0000
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 jonas@kwiboo.se, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doug Anderson писал(а) 13.04.2023 01:22:
> Hi,
> 
> On Sat, Apr 8, 2023 at 1:20 AM Nikita Travkin <nikita@trvn.ru> wrote:
>>
>> This bridge doesn't actually implement HPD due to it being way too slow
>> but instead expects the panel driver to wait enough to assume HPD is
>> asserted. However some panels (such as the generic 'edp-panel') expect
>> the bridge to deal with the delay and pass maximum delay to the aux
>> instead.
>>
>> In order to support such panels, add a dummy implementation of wait
>> that would just sleep the maximum delay and assume no failure has
>> happened.
>>
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> ---
>> This was suggested in [1] to make sure DT users can be semantically
>> correct (not adding no-hpd when the line is actually there) while
>> still using a hard delay to be faster than waiting the long debounce
>> time.
>>
>> [1] - https://lore.kernel.org/all/CAD=FV=VR7sKsquE25eF7joc7gPApu-vqwduZzjE=wFCoXjMYnQ@mail.gmail.com/
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index 7a748785c545..260cad1fd1da 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -618,6 +618,24 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>>         return len;
>>  }
>>
>> +static int ti_sn_aux_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_us)
>> +{
>> +       /*
>> +        * The HPD in this chip is a bit useless (See comment in
>> +        * ti_sn65dsi86_enable_comms) so if our driver is expected to wait
>> +        * for HPD, we just assume it's asserted after the wait_us delay.
>> +        *
>> +        * In case we are asked to wait forever (wait_us=0) take conservative
>> +        * 500ms delay.
>> +        */
>> +       if (wait_us == 0)
>> +               wait_us = 500000;
>> +
>> +       usleep_range(wait_us, wait_us + 1000);
>> +
>> +       return 0;
>> +}
>> +
>>  static int ti_sn_aux_probe(struct auxiliary_device *adev,
>>                            const struct auxiliary_device_id *id)
>>  {
>> @@ -627,6 +645,7 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
>>         pdata->aux.name = "ti-sn65dsi86-aux";
>>         pdata->aux.dev = &adev->dev;
>>         pdata->aux.transfer = ti_sn_aux_transfer;
>> +       pdata->aux.wait_hpd_asserted = ti_sn_aux_wait_hpd_asserted;
> 
> This looks reasonable to me, but I think you only want this
> implementation if the "no-hpd" property _isn't_ present. In other
> words:
> 
> if (!of_property_read_bool(np, "no-hpd"))
>   pdata->aux.wait_hpd_asserted = ti_sn_aux_wait_hpd_asserted;
> 
> Essentially:
> 
> * If "no-hpd" is present in ti-sn65dsi86 then we'll assume that HPD is
> handled by the panel driver via a GPIO or a "no-hpd" there (which will
> cause the panel driver to wait the maximum duration).
> 
> * If "no-hpd" isn't present in ti-sn65dsi86 then HPD is actually
> hooked up and thus the panel driver _won't_ handle it.
> 
> Does that seem right? Presumably this should be explained by comments.
> 

This does sound reasonable indeed, I didn't think to add it
conditionally because, looking at the current users of
wait_hpd_asserted, they will first try the "no-hpd" paths
and will only call the bridge when they think it's on the
bridge to wait.

Thus, if DT is modeled properly - Panel has no-hpd or a gpio,
wait_hpd_asserted will never be called anyway. Other bridges
seem to also unconditionally enable the method.

For this to be a trouble, a panel driver has to be "broken"
with some form of calling wait_hpd_asserted despite knowing
the HPD line is not hooked up...

So I feel like guarding the wait_hpd_asserted for no-hpd
users should not actually change much, but if you think
I should add the check anyway, please let me know.

Thanks for taking a look!
Nikita

> -Doug
