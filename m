Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB035BBF7B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 21:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F8110E120;
	Sun, 18 Sep 2022 19:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0751710E120
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663528564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tE7CF8XosIhyF8twRy0S6gif8pWFfuggjBW7rT2UP04=;
 b=iUAiXfiBqpp1nZCRaVJCiOTiBl0AylgwNR6RTZ7843JeLpeSalVOVDLfGEVHDdP0RanKlh
 MQKGF9q7uHbx/GZeNKiYsgZBburcVaJhvj3/aJcwoer4VxItYhcAHuTxySXL5jWJjB3hMJ
 CUxfR1LI09FRwi3GFZVqEnSz/I+dA8s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-Ud-oIkgxMoSXLZpKu1N4rg-1; Sun, 18 Sep 2022 15:16:02 -0400
X-MC-Unique: Ud-oIkgxMoSXLZpKu1N4rg-1
Received: by mail-ed1-f69.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso19228005edc.21
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 12:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tE7CF8XosIhyF8twRy0S6gif8pWFfuggjBW7rT2UP04=;
 b=gjpIJPTW0AuAP4C05+hKSX3HVC8AbtdoT9Vcxt5PKrzcPxxQITPqibGazq9uE6J1un
 859wDtOHMGWJKzz18G368433dNSIxSX6KbOS9LXlWfxVH2feS342W8z13CZnYYWFPK5g
 a7lE1QVVA8sNtpZ9VgcDxHfgL5P6eD4aqJvIHTXWETYP0bxFiBRB5ytkWDohv8uMYOtG
 L47OmSv9IQH9ONUykAzDNWsM+ivcVbNoNe6/XNm6EcVmN+pXVc7LQBeC85niGu3hMBuF
 BsQ4h+XVxF/mMmEomJVkpxURC3gd9eR3f7xS2iyVeD8XwOnFu5kh/5GemLAGuH+iTz4O
 gXlA==
X-Gm-Message-State: ACrzQf1l4TGJnIcw1rDZWWCFEO4cFPaiQRQ8jwnMZdTJUYPPI5dyCFuE
 Jb4xnCbKRUrysQx1tKTZRxxyrmOFm7N55ITyGepu3iF/08KD8PKjbLKnrdu/D8IjYZ96BVZJL3z
 H7/CLYmbXi/wKsKkOCt+j1zfx5si+
X-Received: by 2002:a17:906:5d0a:b0:780:3c42:990f with SMTP id
 g10-20020a1709065d0a00b007803c42990fmr10607932ejt.9.1663528561454; 
 Sun, 18 Sep 2022 12:16:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4n7HMhhes5EkxrhlP8gbP5s3HLG0JkpWhBzUkp63/QAXV5rSGnCa1x07LcwUtB71d1sYvfcg==
X-Received: by 2002:a17:906:5d0a:b0:780:3c42:990f with SMTP id
 g10-20020a1709065d0a00b007803c42990fmr10607919ejt.9.1663528561105; 
 Sun, 18 Sep 2022 12:16:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 q16-20020aa7cc10000000b0044e84d05cd8sm18620177edt.0.2022.09.18.12.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 12:16:00 -0700 (PDT)
Message-ID: <3abaff95-27a3-eae0-aa98-1176c543de77@redhat.com>
Date: Sun, 18 Sep 2022 21:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/6] drm/gma500: 1 fix + further cleanups
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220909115646.99920-1-hdegoede@redhat.com>
 <CAMeQTsaAoz2XHrOy9-s1nUh4Pa27E8=Ted+8vQ+HRzA=1O2ojg@mail.gmail.com>
 <edbea55f-8ad0-e733-619f-aba81846cfb8@redhat.com>
 <CAMeQTsY7xZngbSaDOGMYJ8i0Yogwvv6hDi69hw6QBTCORfdUmQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMeQTsY7xZngbSaDOGMYJ8i0Yogwvv6hDi69hw6QBTCORfdUmQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

On 9/18/22 20:45, Patrik Jakobsson wrote:
> On Sat, Sep 17, 2022 at 2:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Patrik,
>>
>> On 9/14/22 09:50, Patrik Jakobsson wrote:
>>> On Fri, Sep 9, 2022 at 1:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi Patrik,
>>>>
>>>> Here is another gma500 patch-series with one more bugfix and a bunch
>>>> of other cleanups of stuff which I noticed while doing the previous
>>>> set of bugfixes.
>>>>
>>>
>>> Hi Hans, nice cleanups!
>>>
>>> I'm rather busy at the moment so you can commit these yourself to
>>> drm-misc-next if you like.
>>>
>>> "drm/gma500: Wait longer for the GPU to power-down" can go through
>>> drm-misc-fixes if you prefer. It fixed the timeout message on two of
>>> my CDV machines but I never saw an actual problem from the timeouts.
>>>
>>> For the entire series:
>>> Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>>
>> Thanks.
>>
>> I'm pushing these out to drm-misc-next now, but with some small
>> changes:
>>
>> 1. I have dropped the "drm/gma500: Wait longer for the GPU to power-down"
>> patch I'm still seeing timeouts even if I increase the wait time to
>> a full seconds. I believe that the actual issue is this line:
>>
>>         dev_priv->apm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT, PSB_APMBA);
>>
>> sometimes failing. When the timeout happens I see apm_base is set to 0 and
>> reading apm_base + cmd / sts offset returns bogus values.
> 
> Ugh, that is nasty. Debugging the punit is probably not easy. But the
> increased delay did remove the error on two of my 64-bit CDV systems.

It seemed to fix things on my 64 bit CDV system too, but it is really
hit and miss for me. I suspect that if you do a couple of full poweroff
+ boot again cycles it will be back some of the time for you too...

> The 32-bit system never had an issue to begin with. I can also take a
> closer look at this.

If you feel like verifying my dev_priv->apm_base = 0; theory that
would be great. Looking at the less hacky iosf-mbi access code from:
arch/x86/platform/intel/iosf_mbi.c

What might help is adding this:

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 3065596257e9..70ce06ee3c1c 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -145,7 +145,7 @@ static int cdv_backlight_init(struct drm_device *dev)
 
 static inline u32 CDV_MSG_READ32(int domain, uint port, uint offset)
 {
-	int mcr = (0x10<<24) | (port << 16) | (offset << 8);
+	int mcr = (0x10<<24) | (port << 16) | (offset << 8) | 0xF0;
 	uint32_t ret_val = 0;
 	struct pci_dev *pci_root = pci_get_domain_bus_and_slot(domain, 0, 0);
 	pci_write_config_dword(pci_root, 0xD0, mcr);

the gma500 cdv code already does this in the write path, but the:
arch/x86/platform/intel/iosf_mbi.c code does it both the write and read
paths.

Also we should probably just add the PCI root-bridge product-id to:
drivers/gpu/drm/gma500/cdv_device.c
 
and start using the iosf_mbi_read() / iosf_mbi_write() helpers from there.
>> I have yet to have a successful boot where the timeout does not happen
>> since I have been poking at this (it seems success/fail wrt the timeout
>> is random). But I suspect that with a successful boot apm_base will not
>> be 0 and that the problem is there. To be continued...
> 
> Do you still get working outputs when this happens? Perhaps we can
> work around it by simply not touching APM if apm_base is 0.

The non working outputs thing is something weirdly timing related,
I have only seen this happen when the gma500_gfx module is not in
the initrd (so it gets loaded later). So I need to retry once we
have a proper fix for this, atm I am using the default Fedora config
of having the module inside the initrd.

Not doing random outl to IO address 0 and 0x04 seems like a good idea
regardless though :)

Regards,

Hans



> 
>>
>>
>> 2. For the "drm/gma500: Rewrite power management code" I noticed the
>> following error during further testing (for the actual backlight changes):
>>
>> [   12.292509] gma500 0000:00:02.0: Unbalanced pm_runtime_enable!
>>
>> The problem is that pci_pm_init() which the PCI core runs for each
>> device already does:
>>
>>         pm_runtime_forbid(&dev->dev);
>>         pm_runtime_set_active(&dev->dev);
>>         pm_runtime_enable(&dev->dev);
>>
>> So the pm_runtime_enable() call in "drm/gma500: Rewrite power management code"
>> was a second enable call and as such was not necessary. So I'm going to
>> squash in the following small fix while pushing this out:
>>
>> diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
>> index 62d2cc1923f1..0080b692dc3e 100644
>> --- a/drivers/gpu/drm/gma500/power.c
>> +++ b/drivers/gpu/drm/gma500/power.c
>> @@ -61,10 +61,11 @@ void gma_power_init(struct drm_device *dev)
>>          * To fix this we need to call pm_runtime_get() once for each active
>>          * pipe at boot and then put() / get() for each pipe disable / enable
>>          * so that the device gets runtime suspended when no pipes are active.
>> +        * Once this is in place the pm_runtime_get() below should be replaced
>> +        * by a pm_runtime_allow() call to undo the pm_runtime_forbid() from
>> +        * pci_pm_init().
>>          */
>>         pm_runtime_get(dev->dev);
>> -       pm_runtime_set_active(dev->dev); /* Must be done before pm_runtime_enable()! */
>> -       pm_runtime_enable(dev->dev);
>>
>>         dev_priv->pm_initialized = true;
>>  }
>> @@ -83,7 +83,6 @@ void gma_power_uninit(struct drm_device *dev)
>>         if (!dev_priv->pm_initialized)
>>                 return;
>>
>> -       pm_runtime_disable(dev->dev);
>>         pm_runtime_put_noidle(dev->dev);
>>  }
>>
>>
>> As you can see all the removed lines are already taken care of by the
>> PCI core, so this squashed in change really is a no-op (other then
>> that it silences the "Unbalanced pm_runtime_enable!" message).
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>
>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>> Hans de Goede (6):
>>>>   drm/gma500: Wait longer for the GPU to power-down
>>>>   drm/gma500: Remove runtime_allowed dead code in psb_unlocked_ioctl()
>>>>   drm/gma500: Remove never set dev_priv->rpm_enabled flag
>>>>   drm/gma500: Remove a couple of not useful function wrappers
>>>>   drm/gma500: Rewrite power management code
>>>>   drm/gma500: Remove unnecessary suspend/resume wrappers
>>>>
>>>>  drivers/gpu/drm/gma500/cdv_device.c    |   2 +-
>>>>  drivers/gpu/drm/gma500/gma_display.c   |  19 +--
>>>>  drivers/gpu/drm/gma500/gma_display.h   |   2 -
>>>>  drivers/gpu/drm/gma500/oaktrail_lvds.c |   1 -
>>>>  drivers/gpu/drm/gma500/power.c         | 156 +++++--------------------
>>>>  drivers/gpu/drm/gma500/power.h         |  18 ---
>>>>  drivers/gpu/drm/gma500/psb_drv.c       |  35 +-----
>>>>  drivers/gpu/drm/gma500/psb_drv.h       |   7 +-
>>>>  drivers/gpu/drm/gma500/psb_irq.c       |  15 ++-
>>>>  9 files changed, 41 insertions(+), 214 deletions(-)
>>>>
>>>> --
>>>> 2.37.2
>>>>
>>>
>>
> 

