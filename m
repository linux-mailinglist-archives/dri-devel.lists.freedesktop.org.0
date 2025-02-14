Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E77A363D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DA410ED1B;
	Fri, 14 Feb 2025 17:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MxNrzmnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E6D10ED1B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:02:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 053021F764;
 Fri, 14 Feb 2025 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739552533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Jm0uZes8EZSwojK+r2xrbSvKNumw5jjp2yfr4rrKcm8=;
 b=MxNrzmnBwo9ULjdRrqCH1KabuQqNZMD/3spYeNZBjvnerpVNi311CxMFUNqdwFJZbj8rCN
 KDRIkLRaQpWdGZpNSVxP0ulTBZygFeen3Eiq0EiA2HTGi48SG7GBFhqtzL+HMRVSLhyxRx
 2OhFgzs4R/vzrntfaEKBoYphLxWagAL1SLF0xn7q/zHdFVVIOtcGQrg9f7dH6nYMZsHtGt
 poxfikl+5oIirs+/kpbtyzZdgA0jHlm9DS2k96yUmQ15hOfcmPDvSBm+pdSgfxzMdRPjjY
 26tFOjnwWrOM5oxiK0qPN5cGzrEZS4woR+IPHdg9Y+/Fx+rwbz5l1iZB1h4A+Q==
Message-ID: <df1a9d34-a552-4450-999f-a13bea6005b1@bootlin.com>
Date: Fri, 14 Feb 2025 18:02:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Fix use after free and double free on init error
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, hamohammed.sa@gmail.com,
 simona@ffwll.ch, melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, sylphrenadin@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250212084912.3196-1-jose.exposito89@gmail.com>
 <bfc71d72-2f23-4c8c-b278-7e9aad3bf72d@suse.de>
 <3af06a6e-adb9-4e72-ab4d-23dbf37258b4@bootlin.com>
 <Z64LmAJlf-B6wQkL@louis-chauvet-laptop> <Z69k0MLER7CYN5fx@fedora>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <Z69k0MLER7CYN5fx@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdegueetvefgudehfeffveehueffgeefkefhleffteffvdehleelhfdtgeekgeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehpdhhvghloheplgfkrfggieemvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehjohhsvgdrvgigphhos
 hhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 14/02/2025 à 16:44, José Expósito a écrit :
> On Thu, Feb 13, 2025 at 04:11:20PM +0100, Louis Chauvet wrote:
>> On 12/02/25 - 15:06, Louis Chauvet wrote:
>>>
>>>
>>> Le 12/02/2025 à 09:53, Thomas Zimmermann a écrit :
>>>>
>>>>
>>>> Am 12.02.25 um 09:49 schrieb José Expósito:
>>>>> If the driver initialization fails, the vkms_exit() function might
>>>>> access an uninitialized or freed default_config pointer and it might
>>>>> double free it.
>>>>>
>>>>> Fix both possible errors by initializing default_config only when the
>>>>> driver initialization succeeded.
>>>>>
>>>>> Reported-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>> Link: https://lore.kernel.org/all/Z5uDHcCmAwiTsGte@louis-chauvet-laptop/
>>>>> Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
>>>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>>>
>>>> Reviewed-by: Thomas Zimmermann <tzimmremann@suse.de>
>>>
>>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>
>>> lore.kernel.org is broken currently, to avoid doing mistakes, I will wait
>>> for it to be working again so I can apply your patch using dim+b4.
>>>
>>> (I removed danvet.vetter@ffwl.ch from CC, the mail server rejected the mail)
>>>
>>> Thanks!
>>> Louis Chauvet
>>
>> Hello,
>>
>> I tried to apply the commit, but I have a strange issue:
>>
>> 	$ dim push
>> 	Enumerating objects: 13, done.
>> 	Counting objects: 100% (13/13), done.
>> 	Delta compression using up to 20 threads
>> 	Compressing objects: 100% (7/7), done.
>> 	Writing objects: 100% (7/7), 1.67 KiB | 113.00 KiB/s, done.
>> 	Total 7 (delta 6), reused 0 (delta 0), pack-reused 0 (from 0)
>> 	remote:
>> 	remote: ========================================================================
>> 	remote:
>> 	remote:    Equinix is shutting down its operations with us on April 30, 2025.
>> 	remote:    They have graciously supported us for almost 5 years, but all good
>> 	remote:    things come to an end. Given the time frame, it's going to be hard
>> 	remote:       to make a smooth transition of the cluster to somewhere else
>> 	remote: ([TBD](https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/2011)).
>> 	remote:     Please expect in the next months some hiccups in the service and
>> 	remote:    probably at least a full week of downtime to transfer gitlab to a
>> 	remote:                different place. All help is appreciated.
>> 	remote:
>> 	remote: ========================================================================
>> 	remote:
>> 	To gitlab.freedesktop.org:drm/misc/kernel.git
>> 	   ff3881cc6a58..ed15511a773d  drm-misc-next -> drm-misc-next
>> 	Pushing drm-misc-fixes to for-linux-next-fixes... Everything up-to-date
>> 	Done.
>> 	Out of merge window. Pushing drm-misc-next to for-linux-next...
>> 	remote:
>> 	remote: ========================================================================
>> 	remote:
>> 	remote: ERROR: Internal API unreachable
>> 	
>> 	remote:
>> 	remote: ========================================================================
>> 	remote:
>> 	fatal: Could not read from remote repository.
>> 	
>> 	Please make sure you have the correct access rights
>> 	and the repository exists.
>>
>> Is this expected?
> 
> I guess you managed to fix the issue. I git pull-ed this morning and
> the patch was applied.

It is applied to drm-misc/drm-misc-next, but not on drm-misc/for-linux-next.

I don't know if this is important and how to fix the issue if yes.

Louis Chauvet

> Jose
>   
>> Thanks,
>> Louis Chauvet
>>
>>>> Thanks for posting this patch separately.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> ---
>>>>>     drivers/gpu/drm/vkms/vkms_drv.c | 15 +++++++++------
>>>>>     1 file changed, 9 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>>>>> index 7c142bfc3bd9..b6de91134a22 100644
>>>>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>>>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>>>>> @@ -235,17 +235,19 @@ static int __init vkms_init(void)
>>>>>     	if (!config)
>>>>>     		return -ENOMEM;
>>>>> -	default_config = config;
>>>>> -
>>>>>     	config->cursor = enable_cursor;
>>>>>     	config->writeback = enable_writeback;
>>>>>     	config->overlay = enable_overlay;
>>>>>     	ret = vkms_create(config);
>>>>> -	if (ret)
>>>>> +	if (ret) {
>>>>>     		kfree(config);
>>>>> +		return ret;
>>>>> +	}
>>>>> -	return ret;
>>>>> +	default_config = config;
>>>>> +
>>>>> +	return 0;
>>>>>     }
>>>>>     static void vkms_destroy(struct vkms_config *config)
>>>>> @@ -269,9 +271,10 @@ static void vkms_destroy(struct vkms_config *config)
>>>>>     static void __exit vkms_exit(void)
>>>>>     {
>>>>> -	if (default_config->dev)
>>>>> -		vkms_destroy(default_config);
>>>>> +	if (!default_config)
>>>>> +		return;
>>>>> +	vkms_destroy(default_config);
>>>>>     	kfree(default_config);
>>>>>     }
>>>>
>>>
>>> -- 
>>> Louis Chauvet, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>>

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

