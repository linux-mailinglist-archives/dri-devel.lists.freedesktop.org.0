Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE6E5065AB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8603510EE7E;
	Tue, 19 Apr 2022 07:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E075F10EE7E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 07:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650352950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XE7bs+vMucrnxP7rX6KAEFBKjoWlCkL1ofuWPanz4ws=;
 b=SFFrbTIix/vcyTcp9/1wj07gz7HCkbTkX2DUU5vZBKl+6/KmYO9x9ePDGVwPR9iTDW9hjF
 XYzfwZmhWC/CQ0W3enat8717+6mrxGGm5X6CKHXk28QzIZReYVrvtEE6OIV1Sd6pdEJHVe
 mv4nZDGB3gHDxSbdW208QuzAda4iJLw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-PvGyrDZAOIKBgCJryBpP5w-1; Tue, 19 Apr 2022 03:22:27 -0400
X-MC-Unique: PvGyrDZAOIKBgCJryBpP5w-1
Received: by mail-wm1-f69.google.com with SMTP id
 b12-20020a05600c4e0c00b003914432b970so797108wmq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 00:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XE7bs+vMucrnxP7rX6KAEFBKjoWlCkL1ofuWPanz4ws=;
 b=3wsuBZtSCqi8fRAqqAOsAgJq1+5nL9U6GkdVwPbze3TrXvt6GTtpaTQySGdNsjwukb
 W6X8+D6loamDGzYWkI4hXZnCzFd8XS6GuCbTHWRQu7KrBRila6lhH1Y3ebY/tQOLoeaN
 A/GXVdeHEEsoWsyUugJn7TwhhAt585bftkTSt1RR4RclZS56YZl8VARUM/pGnfvG2CS+
 PBJJ4cBWfvnAjdccXXr0IK8+zRwWICX9oGoCBW+YeDMjc6DA1t2sVBUFNZNd6KUljKCs
 MRj4Vlgy67Sj0la758fa3v8FJMI3xZXggRRdexjEiOx4XHO6HwZS2cNqDDPAw4yx/XYP
 f93Q==
X-Gm-Message-State: AOAM530csI3OD2oAK83n487mh4p7nzGErM2SYvNrHydw8YqAEPC623Zv
 wOaML4Fo4dZqSBKhtKuNmUnVlJ7pR4VnOMhno1TFw/nBqOBX3Fw4Hqf1KqRkdBWNqDCm9xrALn9
 K9jypNotzaSAI09AEC8RsEC+MU83q
X-Received: by 2002:a05:6000:1b08:b0:207:ad5b:83a0 with SMTP id
 f8-20020a0560001b0800b00207ad5b83a0mr10619557wrz.564.1650352946330; 
 Tue, 19 Apr 2022 00:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPE0Lfb8036FFd0ol7Vvhr6xWQ3rGpwS+oyiFhkfgu+5MXMGjFNhcWkb9aY1gomEOacxFDLg==
X-Received: by 2002:a05:6000:1b08:b0:207:ad5b:83a0 with SMTP id
 f8-20020a0560001b0800b00207ad5b83a0mr10619538wrz.564.1650352946065; 
 Tue, 19 Apr 2022 00:22:26 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm15128816wmr.13.2022.04.19.00.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 00:22:25 -0700 (PDT)
Message-ID: <fb7b8ca6-a252-c021-fe74-4e7ffbb3eb7e@redhat.com>
Date: Tue, 19 Apr 2022 09:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
 <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
 <Ylb0316ABOhOe1Rb@phenom.ffwll.local>
 <9d4599d9-e094-e7dd-5b91-282c2679aae4@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9d4599d9-e094-e7dd-5b91-282c2679aae4@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, sam@ravnborg.org,
 frowand.list@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, paulus@samba.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 4/13/22 20:09, Thomas Zimmermann wrote:

[snip]

>>>> index bc6ed750e915..bdd00d381bbc 100644
>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>> @@ -1579,14 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
>>>>   			 * If it's not a platform device, at least print a warning. A
>>>>   			 * fix would add code to remove the device from the system.
>>>>   			 */
>>>> -			if (!device) {
>>>> -				/* TODO: Represent each OF framebuffer as its own
>>>> -				 * device in the device hierarchy. For now, offb
>>>> -				 * doesn't have such a device, so unregister the
>>>> -				 * framebuffer as before without warning.
>>>> -				 */
>>>> -				do_unregister_framebuffer(registered_fb[i]);
>>>
>>> Maybe we could still keep this for a couple of releases but with a big
>>> warning that's not supported in case there are out-of-tree drivers out
>>> there that still do this ?
>>>
>>> Or at least a warning if the do_unregister_framebuffer() call is removed.
>>
>> Yeah dying while holding console_lock isn't fun, and not having a WARN_ON
>> + bail-out code pretty much forces bug reporters to do a bisect here to
>> give us something more than "machine dies at boot with no messages".
>>
>> I'd just outright keep the WARN_ON here for 1-2 years even to really make
>> sure we got all the bug reports, since often these older machines only
>> update onto LTS releases.
> 
> If that's what the consent is, I'll go with it.
> 
> I'm just not sure if we talk about the same problem. offb didn't have a 
> platform device, so we recently added this workaround with 'if 
> (!device)'.  All the other fbdev drivers have a platform device; and 
> anything else that could fail is out-of-tree. We don't really care about 
> those AFAIK.
>

Yes, agreed on the offb change but I'm not really sure if we don't care
about out-of-tree modules. I mean, you are right in theory but I still
feel that we are changing a core behavior without giving people time to
sort out if needed.

Since before commit 27599aacbaef ("fbdev: Hot-unplug firmware fb devices
on forced removal") registered FBs didn't need to have a device, but now
that will lead to a NULL pointer dereference in dev_is_platform(device).

And that change only landed in v5.18-rc1, so it is fairly recent.

I know that we follow https://www.kernel.org/doc/Documentation/process/stable-api-nonsense.rst
but still my opinion is that having a warning for a couple of releases
if registered_fb[i]->device is NULL, instead of just crashing would be
a better way to handle this.
 
> With offb converted, we could practically remove all of the checks here 
> and call platform_device_unregister() unconditionally.
>

Yes for mainline, but as mentioned I thought mostly about out-of-tree. If
folks agree that we shouldn't care about these, I'm Ok with that as well.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

