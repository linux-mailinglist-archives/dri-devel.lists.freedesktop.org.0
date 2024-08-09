Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE394D2F3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE9D10E948;
	Fri,  9 Aug 2024 15:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OuT1iyRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175C710E94B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:09:31 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id cRFBsyKbPIDadcRFBsE0us; Fri, 09 Aug 2024 17:09:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1723216170;
 bh=Za0QZIRDiSzOXQG6QHcalUfH/TEPCTSjMejkNNfjFls=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=OuT1iyRvtWRj5GvKLCgK2vzSaKajOO0qmnMYjqU89Rcu0pwJP6moSu5o5FB4zUVEM
 2FbbAa8lt856bu765fHwjRLxld8QT6w5aoPpBmK/325GjdGeYj3r8E23kHiBDML7d2
 k8esYkbADuxng1/OrnaWmu1eDDLqUBndXOorbZvhvOrwBmGzaTffRuHSaC87aygliH
 iq6RYYBRdwifsk9Iw08bmturP0gMVU8pRXh2sVJSczSTB6yOwflmttcJNVJi3QKGxn
 BamA5rjxdh7jHv/JExkYiq4oeYYCwJSoV0avzWGFDq4QCbCA6sPgWeyEy0smkPzlvY
 8xmReqbkEL8Dg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 09 Aug 2024 17:09:30 +0200
X-ME-IP: 90.11.132.44
Message-ID: <7b65dbd8-1129-4fcc-97ba-43400fc98e31@wanadoo.fr>
Date: Fri, 9 Aug 2024 17:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
 <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Le 09/08/2024 à 16:42, Dan Carpenter a écrit :
> On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
>> Use sysfs_emit_at() instead of snprintf() + custom logic.
>> Using sysfs_emit_at() is much more simple.
>>
>> Also, sysfs_emit() is already used in this function, so using
>> sysfs_emit_at() is more consistent.
>>
>> Also simplify the logic:
>>    - always add a space after an entry
>>    - change the last space into a '\n'
>>
>> Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
>> can not be reached.
>> So better keep everything simple (and correct).
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
>> index 71d2e015960c..fc975615d5c9 100644
>> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
>> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
>> @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
>>   		char *buf)
>>   {
>>   	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>> -	int len;
>> +	int len = 0;
>>   	int i;
>>   
>>   	if (!ddata->has_cabc)
>>   		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
>>   
>> -	for (i = 0, len = 0;
>> -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
>> -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
>> -			i ? " " : "", cabc_modes[i],
>> -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
>> +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
>> +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
>> +
>> +	/* Remove the trailing space */
>> +	if (len)
>> +		buf[len - 1] = '\n';
> 
> I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
> the original code was careful about checking.  Probably easiest to do what the
> original code did and say:
> 

Hi Dan,

I don't follow you. AFAIK, it does not assume anything.

Thanks to sysfs_emit_at(), len can only be in [0..PAGE_SIZE-1] because 
the trailing \0 is not counted.

So, as len != 0, len-1 is in [0..PAGE_SIZE-2].

How do you think an overflow could happen?


Also, all this code does is buildind:
	"off, ui, still-image, moving-image\n"

So in any case, an overflow is impossible, and really unlikely in the 
future as well.


 From my PoV, my proposed patch is both much more readable and still 
correct in all cases.

CJ

> 	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> 		len += sysfs_emit_at(buf, len, "%s%s", cabc_modes[i],
> 				     i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> 
> regards,
> dan carpenter
> 
> 
> 
> 

