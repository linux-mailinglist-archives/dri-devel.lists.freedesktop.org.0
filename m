Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE21B55C107
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 14:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EE410F7E4;
	Tue, 28 Jun 2022 12:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE7F10F7E4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656420117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuD3Xs6rKkTrZfuL6GjG+VXLjBdgV/pwWBRud+rnjNc=;
 b=bdmXnntX8eiPxbUvVGVdg3/MpXcDdQkCwawpoUVFepeG8a935GGPLIkjF3M5LQBR8OTfUh
 t68H4kJQ8mHo+yEOCEA+qPpHuP+mMjFo/+SoLFyNkGuH/ECWlqp/nZnMVbY0Xp3oS6w2qn
 Z//RVnfcsHzvIxG9rxiamd/UHR5tfpQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-66mtIvc5PAOKyYc397p8yQ-1; Tue, 28 Jun 2022 08:41:56 -0400
X-MC-Unique: 66mtIvc5PAOKyYc397p8yQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so8838845wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 05:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IuD3Xs6rKkTrZfuL6GjG+VXLjBdgV/pwWBRud+rnjNc=;
 b=I8WdloPpyPhh33dNLdm3/5WzWY1NbA+zaKl9R5G6v2dxF5qmXlpKybltmCmEnTNstI
 Al3NqRhiOMP1bq76iQrhIqvQmqaUN5nUtDg9UPJ3RFDooKptgLAetL2xtlTfqtP6E0dz
 YxLtqSQgVB9ImLa8tq7ec9x4j9VUf7ptJw0ivPIpwy92MQuNq8eJLfiWiHKka2XmJAE1
 5kIMv71ccu4K/Fzvtx01TnBJ9ROtLKFJwnK7jE84ZSjEMRUwtSfvY2VDlh6lbHI3tMBk
 DdDrhRFZOvXFZSukpWzcHmNUx5gZFPw51k4RRstJLKGIspy1m/gM5q7RL6tj7E062YOi
 Yj/Q==
X-Gm-Message-State: AJIora8iCcUQ1BqKrs15eumOopvb0KZGbrz7uQx41pS5HG7C3QKoZA3C
 dEswSiWCDV/81YmwIQ1JZv0NSpS23vfoPSgGQEKB/27HWhhMqMa7kph2JJz/EHVvrSVbt338qH6
 Xc79Ko0UWMY1eeeexFSnuNECIipeg
X-Received: by 2002:adf:dbc1:0:b0:219:e994:6ba7 with SMTP id
 e1-20020adfdbc1000000b00219e9946ba7mr17337872wrj.229.1656420115318; 
 Tue, 28 Jun 2022 05:41:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tghK4nMsa8srfSVoGmmm2ilUn0MJSlRYh7VaV3mT8hXZHZauaQaEdSCMC2O7Lev7VXQSCsjw==
X-Received: by 2002:adf:dbc1:0:b0:219:e994:6ba7 with SMTP id
 e1-20020adfdbc1000000b00219e9946ba7mr17337853wrj.229.1656420115062; 
 Tue, 28 Jun 2022 05:41:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1c6a08000000b003a044fe7fe7sm11253762wmc.9.2022.06.28.05.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 05:41:54 -0700 (PDT)
Message-ID: <98aab56e-b0a7-1a39-d715-9ad10d7705a0@redhat.com>
Date: Tue, 28 Jun 2022 14:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Annoying AMDGPU boot-time warning due to simplefb / amdgpu
 resource clash
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
 <3920df43-37f5-618d-70ba-de34a886e8ab@redhat.com>
 <CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com>
 <561af3c0-c7cf-3580-ce35-320cb13a037c@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <561af3c0-c7cf-3580-ce35-320cb13a037c@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2022 10:43, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.06.22 um 19:25 schrieb Linus Torvalds:
>> On Mon, Jun 27, 2022 at 1:02 AM Javier Martinez Canillas
>> <javierm@redhat.com> wrote:
>>>
>>> The flag was dropped because it was causing drivers that requested their
>>> memory resource with pci_request_region() to fail with -EBUSY (e.g: the
>>> vmwgfx driver):
>>>
>>> https://www.spinics.net/lists/dri-devel/msg329672.html
>>
>> See, *that* link would have been useful in the commit.
>>
>> Rather than the useless link it has.
>>
>> Anyway, removing the busy bit just made things worse.
>>
>>>> If simplefb is actually still using that frame buffer, it's a problem.
>>>> If it isn't, then maybe that resource should have been released?
>>>
>>> It's supposed to be released once amdgpu asks for conflicting 
>>> framebuffers
>>> to be removed calling 
>>> drm_aperture_remove_conflicting_pci_framebuffers().
>>
>> That most definitely doesn't happen. This is on a running system:
>>
>>    [torvalds@ryzen linux]$ cat /proc/iomem | grep BOOTFB
>>          00000000-00000000 : BOOTFB
>>
>> so I suspect that the BUSY bit was never the problem - even for
>> vmwgfx). The problem was that simplefb doesn't remove its resource.
>>
>> Guys, the *reason* for resource management is to catch people that
>> trample over each other's resources.
>>
>> You literally basically disabled the code that checked for it by
>> removing the BUSY flag, and just continued to have conflicting
>> resources.
>>
>> That isn't a "fix", that is literally "we are ignoring and breaking
>> the whole reason that the resource tree exists, but we'll still use it
>> for no good reason".
> 
> The EFI/VESA framebuffer is represented by a platform device. The BUSY 
> flag we removed is in the 'sysfb' code that creates this device. The 
> BOOTFB resource you see in your /proc/iomem is the framebuffer memory. 
> The code is in sysfb_create_simplefb() [1]
> 
> Later during boot a device driver, 'simplefb' or 'simpledrm', binds to 
> the device and reserves the framebuffer memory for rendering into it. 
> For example in simpledrm. [2] At that point a BUSY flag is set for that 
> reservation.
> 
>>
>> Yeah, yeah, most modern drivers ignore the IO resource tree, because
>> they end up working on another resource level entirely: they work on
>> not the IO resources, but on the "driver level" instead, and just
>> attach to PCI devices.
>>
>> So these days, few enough drivers even care about the IO resource
>> tree, and it's mostly used for (a) legacy devices (think ISA) and (b)
>> the actual bus resource handling (so the PCI code itself uses it to
>> sort out resource use and avoid conflicts, but PCI drivers themselves
>> generally then don't care, because the bus has "taken care of it".
>>
>> So that's why the amdgpu driver itself doesn't care about resource
>> allocations, and we only get a warning for that memory type case, not
>> for any deeper resource case.
>>
>> And apparently the vmwgfx driver still uses that legacy "let's claim
>> all PCI resources in the resource tree" instead of just claiming the
>> device itself. Which is why it hit this whole BOOTFB resource thing
>> even harder.
>>
>> But the real bug is that BOOTFB seems to claim this resource even
>> after it is done with it and other drivers want to take over.
> 
> Once amdgpu wants to take over, it has to remove the the platform device 
> that represents the EFI framebuffer. It does so by calling the 
> drm_aperture_ function, which in turn calls 
> platform_device_unregister(). Afterwards, the platform device, driver 
> and BOOTFB range are supposed to be entirely gone.
> 
> Unfortunately, this currently only works if a driver is bound to the 
> platform device. Without simpledrm or simplefb, amdgpu won't find the 
> platform device to remove.
> 
> I guess, what happens on your system is that sysfb create a device for 
> the EFI framebuffer and then amdgpu comes and doesn't find it for 
> removal. And later you see these warnings because BOOTFB is still around.
> 
> Javier already provided patches for this scenario, which are in the DRM 
> tree. From drm-next, please cherry-pick
> 
>    0949ee75da6c ("firmware: sysfb: Make sysfb_create_simplefb() return a 
> pdev pointer")
> 
>    bc824922b264 ("firmware: sysfb: Add sysfb_disable() helper function")
> 
>    873eb3b11860 ("fbdev: Disable sysfb device registration when removing 
> conflicting FBs")
> 
> for testing. With these patches, amdgpu will find the sysfb device and 
> unregister it.
> 
> The patches are queued up for the next merge window. If they resolve the 
> issue, we'll already send with the next round of fixes.

I was able to reproduce the warning with kernel v5.19-rc4, a radeon GPU 
and the following config:

CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_FB_SIMPLE is not set

After applying the 3 patches you mentioned, the issue is resolved. (at 
least on my setup).

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/firmware/sysfb_simplefb.c#L115 
> 
> [2] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/tiny/simpledrm.c#L544 
> 
> 
>>
>> Not the BUSY bit.
>>
>>                       Linus
> 

