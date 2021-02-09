Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA41314A80
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77C889058;
	Tue,  9 Feb 2021 08:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BEB88FE2;
 Tue,  9 Feb 2021 08:27:08 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bl23so29913029ejb.5;
 Tue, 09 Feb 2021 00:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=83PWemMk5DlXAHRWxhE7VRoFGSJQZZf3+9tQgywkfuI=;
 b=qbAfp+4RRGTocqt4zfCGmLbkKdXW5juqbNC+jdzI2h2bkRVJ2/+pcQxoravHOjd5Y1
 URia0Jx0OLGyjjhqGEPhVt7ERxF7VN2o4cdgOCacsH6KxSH9FmQ582NljawYUgSjPtic
 X7UQaRlcRf8UC1ZdxpryOFQU9VHaT9irKK+Z4Xxz7mdibhCUTUQALMRz+jIHVvptgPEn
 zRBbq2G9iAwPLdxpWzvRMIRyVBqiH7Y2Y1w1m2fnkqloy8fRPFPZpANDTMQ8NFr7yzB9
 qjvZ58ZtdCTkSe9YitfQ528ROr3Q5ehvGm+YdjKPv2Fh0Z8GMttCXT067qhOQtx1EBFE
 Zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=83PWemMk5DlXAHRWxhE7VRoFGSJQZZf3+9tQgywkfuI=;
 b=KZ20WstgMtRv/eheQ+KNUPdRRPusYd36jF5Alf7LCvYUQw4zkfoaAFgOp13ZNaNzZh
 9sKAgq0qCn/GnnhfHNRjR9hoysCR8ri06tdKgCQG5cYTL1dTQ939Yo18t4vENBbdb6OQ
 bkVEAVRxxlzNzNz/Vek/YiZ1UuChq32lEzW14VH6VuAM2eboaKXLMQgV0TYF2Bdq886e
 n9SGmlmhBYeYbKiNZMZyfQpfjSIcSRH8HEXg60CtMy6tV8H7RkKLbamUKET2NnT/B8GS
 akk8UaB02KU5XwX90rvuBYvT60wJLMEQtJ73yFsvtUSdpECnN52HjkwkrPhdWHrkLFWz
 BIMQ==
X-Gm-Message-State: AOAM5331qHEZ9esr1RbueczYGwaQZ3zM//t27mvUF8MQbiAer7jvU/zZ
 PSqOOLXbjEfrSzJ4iuYvJTc=
X-Google-Smtp-Source: ABdhPJy7r8KxDOg5H69Bo0nqdm3yoArdu+H0MQJV1SV19zaTwDpTvpHo04fBAQK8nvAQuc2Zad42Zw==
X-Received: by 2002:a17:906:d922:: with SMTP id
 rn2mr21858069ejb.414.1612859226723; 
 Tue, 09 Feb 2021 00:27:06 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493?
 ([2a02:908:1252:fb60:444c:9a67:948b:2493])
 by smtp.gmail.com with ESMTPSA id u5sm11934168edc.29.2021.02.09.00.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 00:27:06 -0800 (PST)
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, christian.koenig@amd.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
 <3f7efc21-f2fb-73a9-216c-aa1e531e35a0@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <53b95e8b-4079-2bd1-46e1-df15b2fdd2cc@gmail.com>
Date: Tue, 9 Feb 2021 09:27:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3f7efc21-f2fb-73a9-216c-aa1e531e35a0@amd.com>
Content-Language: en-US
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: multipart/mixed; boundary="===============2049612482=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2049612482==
Content-Type: multipart/alternative;
 boundary="------------6C1A95E80479002A55C0A4C0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6C1A95E80479002A55C0A4C0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 08.02.21 um 23:09 schrieb Andrey Grodzovsky:
>
>
> On 2/8/21 4:37 AM, Christian König wrote:
>> Am 07.02.21 um 22:50 schrieb Daniel Vetter:
>>> [SNIP]
>>>> Clarification - as far as I know there are no page fault handlers 
>>>> for kernel
>>>> mappings. And we are talking about kernel mappings here, right ?  
>>>> If there were
>>>> I could solve all those issues the same as I do for user mappings, by
>>>> invalidating all existing mappings in the kernel (both kmaps and 
>>>> ioreamps)and
>>>> insert dummy zero or ~0 filled page instead.
>>>> Also, I assume forcefully remapping the IO BAR to ~0 filled page 
>>>> would involve
>>>> ioremap API and it's not something that I think can be easily done 
>>>> according to
>>>> am answer i got to a related topic a few weeks ago
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-pci%2Fmsg103396.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6eP0nhS%2BZwp1Y54CwfX8vaV3FTWbW8IylW5JFaf92pY%3D&amp;reserved=0 
>>>> (that was the only reply
>>>> i got)
>>> mmiotrace can, but only for debug, and only on x86 platforms:
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Ftrace%2Fmmiotrace.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QBF9J%2BVIRUkUTTjvNoZR8NqFNt8CpHkcknH2qKX7dd8%3D&amp;reserved=0 
>>>
>>>
>>> Should be feasible (but maybe not worth the effort) to extend this to
>>> support fake unplug.
>>
>> Mhm, interesting idea you guys brought up here.
>>
>> We don't need a page fault for this to work, all we need to do is to 
>> insert dummy PTEs into the kernels page table at the place where 
>> previously the MMIO mapping has been.
>
>
> But that exactly what Mathew from linux-mm says is not a trivial thing 
> to do, quote:
>
> "
>
> ioremap() is done through the vmalloc space.  It would, in theory, be
> possible to reprogram the page tables used for vmalloc to point to your
> magic page.  I don't think we have such a mechanism today, and there are
> lots of problems with things like TLB flushes.  It's probably going to
> be harder than you think.
> "

I haven't followed the full discussion, but I don't see much preventing 
this.

All you need is a new ioremap_dummy() function which takes the old start 
and length of the mapping.

Still a bit core and maybe even platform code, but rather useful I think.

Christian.

>
> If you believe it's actually doable then it would be useful not only for simulating device
> unplugged situation with all MMIOs returning 0xff... but for actual handling of driver accesses
> to MMIO after device is gone and, we could then drop entirely this patch as there would be no need
> to guard against such accesses post device unplug.


>
>   
>>
>>>>> But ugh ...
>>>>>
>>>>> Otoh validating an entire driver like amdgpu without such a trick
>>>>> against 0xff reads is practically impossible. So maybe you need to 
>>>>> add
>>>>> this as one of the tasks here?
>>>> Or I could just for validation purposes return ~0 from all reg 
>>>> reads in the code
>>>> and ignore writes if drm_dev_unplugged, this could already easily 
>>>> validate a big
>>>> portion of the code flow under such scenario.
>>> Hm yeah if your really wrap them all, that should work too. Since
>>> iommappings have __iomem pointer type, as long as amdgpu is sparse
>>> warning free, should be doable to guarantee this.
>>
>> Problem is that ~0 is not always a valid register value.
>>
>> You would need to audit every register read that it doesn't use the 
>> returned value blindly as index or similar. That is quite a bit of work.
>
>
> But ~0 is the value that will be returned for every read post device 
> unplug, regardless if it's valid or not, and we have to cope with
> it then, no ?
>
> Andrey
>
>
>>
>> Regards,
>> Christian.
>>
>>> -Daniel
>>>
>>>> Andrey
>>>>
>>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------6C1A95E80479002A55C0A4C0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">Am 08.02.21 um 23:09 schrieb Andrey
      Grodzovsky:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3f7efc21-f2fb-73a9-216c-aa1e531e35a0@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2/8/21 4:37 AM, Christian König
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com">Am
        07.02.21 um 22:50 schrieb Daniel Vetter: <br>
        <blockquote type="cite">[SNIP] <br>
          <blockquote type="cite">Clarification - as far as I know there
            are no page fault handlers for kernel <br>
            mappings. And we are talking about kernel mappings here,
            right ?  If there were <br>
            I could solve all those issues the same as I do for user
            mappings, by <br>
            invalidating all existing mappings in the kernel (both kmaps
            and ioreamps)and <br>
            insert dummy zero or ~0 filled page instead. <br>
            Also, I assume forcefully remapping the IO BAR to ~0 filled
            page would involve <br>
            ioremap API and it's not something that I think can be
            easily done according to <br>
            am answer i got to a related topic a few weeks ago <br>
            <a class="moz-txt-link-freetext"
href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-pci%2Fmsg103396.html&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=6eP0nhS%2BZwp1Y54CwfX8vaV3FTWbW8IylW5JFaf92pY%3D&amp;amp;reserved=0"
              moz-do-not-send="true">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-pci%2Fmsg103396.html&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=6eP0nhS%2BZwp1Y54CwfX8vaV3FTWbW8IylW5JFaf92pY%3D&amp;amp;reserved=0</a>
            (that was the only reply <br>
            i got) <br>
          </blockquote>
          mmiotrace can, but only for debug, and only on x86 platforms:
          <br>
          <br>
          <a class="moz-txt-link-freetext"
href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Ftrace%2Fmmiotrace.html&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=QBF9J%2BVIRUkUTTjvNoZR8NqFNt8CpHkcknH2qKX7dd8%3D&amp;amp;reserved=0"
            moz-do-not-send="true">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Ftrace%2Fmmiotrace.html&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=QBF9J%2BVIRUkUTTjvNoZR8NqFNt8CpHkcknH2qKX7dd8%3D&amp;amp;reserved=0</a>
          <br>
          <br>
          Should be feasible (but maybe not worth the effort) to extend
          this to <br>
          support fake unplug. <br>
        </blockquote>
        <br>
        Mhm, interesting idea you guys brought up here. <br>
        <br>
        We don't need a page fault for this to work, all we need to do
        is to insert dummy PTEs into the kernels page table at the place
        where previously the MMIO mapping has been. <br>
      </blockquote>
      <p><br>
      </p>
      <p>But that exactly what Mathew from linux-mm says is not a
        trivial thing to do, quote:</p>
      <p>"</p>
      <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">ioremap() is done through the vmalloc space.  It would, in theory, be
possible to reprogram the page tables used for vmalloc to point to your
magic page.  I don't think we have such a mechanism today, and there are
lots of problems with things like TLB flushes.  It's probably going to
be harder than you think.
"</pre>
    </blockquote>
    <br>
    I haven't followed the full discussion, but I don't see much
    preventing this.<br>
    <br>
    All you need is a new ioremap_dummy() function which takes the old
    start and length of the mapping.<br>
    <br>
    Still a bit core and maybe even platform code, but rather useful I
    think.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:3f7efc21-f2fb-73a9-216c-aa1e531e35a0@amd.com">
      <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">

If you believe it's actually doable then it would be useful not only for simulating device
unplugged situation with all MMIOs returning 0xff... but for actual handling of driver accesses
to MMIO after device is gone and, we could then drop entirely this patch as there would be no need
to guard against such accesses post device unplug.</pre>
    </blockquote>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:3f7efc21-f2fb-73a9-216c-aa1e531e35a0@amd.com">
      <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">

 
</pre>
      <blockquote type="cite"
        cite="mid:fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com"> <br>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">But ugh ... <br>
              <br>
              Otoh validating an entire driver like amdgpu without such
              a trick <br>
              against 0xff reads is practically impossible. So maybe you
              need to add <br>
              this as one of the tasks here? <br>
            </blockquote>
            Or I could just for validation purposes return ~0 from all
            reg reads in the code <br>
            and ignore writes if drm_dev_unplugged, this could already
            easily validate a big <br>
            portion of the code flow under such scenario. <br>
          </blockquote>
          Hm yeah if your really wrap them all, that should work too.
          Since <br>
          iommappings have __iomem pointer type, as long as amdgpu is
          sparse <br>
          warning free, should be doable to guarantee this. <br>
        </blockquote>
        <br>
        Problem is that ~0 is not always a valid register value. <br>
        <br>
        You would need to audit every register read that it doesn't use
        the returned value blindly as index or similar. That is quite a
        bit of work. <br>
      </blockquote>
      <p><br>
      </p>
      <p>But ~0 is the value that will be returned for every read post
        device unplug, regardless if it's valid or not, and we have to
        cope with<br>
        it then, no ?</p>
      <p>Andrey</p>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com"> <br>
        Regards, <br>
        Christian. <br>
        <br>
        <blockquote type="cite">-Daniel <br>
          <br>
          <blockquote type="cite">Andrey <br>
            <br>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------6C1A95E80479002A55C0A4C0--

--===============2049612482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2049612482==--
