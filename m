Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF4B526309
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 15:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B220A10FD9D;
	Fri, 13 May 2022 13:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F213010FD9D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:47:40 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1npVdq-0004CS-3r; Fri, 13 May 2022 15:47:38 +0200
Message-ID: <fe7f31a9-ed0a-6ce2-561e-849b9cf76830@leemhuis.info>
Date: Fri, 13 May 2022 15:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
References: <20220509110425.165537-1-hdegoede@redhat.com>
 <6eea44ce-4057-7267-8a0b-096cdc61dd94@redhat.com>
 <aa4c0305-c99b-050b-80a5-d13e8e10b78c@redhat.com>
 <f460b87a-a53c-0570-9c87-9997519ebb97@redhat.com>
 <8719f148-7e28-c5a6-08c4-3fbb28138b1c@leemhuis.info>
 <D060DAC5-4F3A-4268-8E20-24A56DF3AAB1@vmware.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <D060DAC5-4F3A-4268-8E20-24A56DF3AAB1@vmware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1652449661;
 bea40df1; 
X-HE-SMSGID: 1npVdq-0004CS-3r
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.05.22 15:25, Zack Rusin wrote:
>> On May 13, 2022, at 3:43 AM, Thorsten Leemhuis
>> <regressions@leemhuis.info <mailto:regressions@leemhuis.info>> wrote:
>>
>> CCing airlied
>>
>> On 09.05.22 14:02, Javier Martinez Canillas wrote:
>>> On 5/9/22 13:55, Hans de Goede wrote:
>>> [snip]
>>>>>>
>>>>>> Fixes: dabdcdc9822a ("drm/vmwgfx: Switch to mode_cmd2")
>>>>>> BugLink:
>>>>>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2072556&amp;data=05%7C01%7Czackr%40vmware.com%7Ca34647a1351748917ad608da34b459a0%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637880246471436744%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=LSQP%2Bqnf4p51QsF%2B7ZkvKlB5gSx0%2FgRUsgcIPChR33g%3D&amp;reserved=0
>>>>>> <https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2072556&amp;data=05%7C01%7Czackr%40vmware.com%7Ca34647a1351748917ad608da34b459a0%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637880246471436744%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=LSQP%2Bqnf4p51QsF%2B7ZkvKlB5gSx0%2FgRUsgcIPChR33g%3D&amp;reserved=0>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com
>>>>>> <mailto:hdegoede@redhat.com>>
>>>>>> ---
>>>>>
>>>>> Zack fixed this already:
>>>>>
>>>>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D5405d25b9e8e6&amp;data=05%7C01%7Czackr%40vmware.com%7Ca34647a1351748917ad608da34b459a0%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637880246471436744%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=IMtLj94VBo3Bv8oCGmbatBmT%2F2%2B9xkIptnlPTPuHMHc%3D&amp;reserved=0
>>>>> <https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D5405d25b9e8e6&amp;data=05%7C01%7Czackr%40vmware.com%7Ca34647a1351748917ad608da34b459a0%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637880246471436744%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=IMtLj94VBo3Bv8oCGmbatBmT%2F2%2B9xkIptnlPTPuHMHc%3D&amp;reserved=0>
>>>>
>>>> I see, but it seems that this was never pushed to drm-misc-fixes,
>>>> so this is still broken in 5.18-rc#
>>>
>>> Indeed. Agreed that should be cherry-picked in -fixes as well.
>>
>> Looks to me like nobody did that and this regression fix is missing in
> 
> No, it has been done. It’s after rc6 so the patch is in
> drm-misc-next-fixes you can see it at:
> https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vmwgfx?h=drm-misc-next-fixes&id=5405d25b9e8e6e0d3bdb04833d528a9bb35fe7ce
> <https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vmwgfx?h=drm-misc-next-fixes&id=5405d25b9e8e6e0d3bdb04833d528a9bb35fe7ce>

Sorry, I try, but keeping track of subsystem specific rules and branches
is hard -- and Javier actually asked for "drm-misc-fixes".

That being said: I'd like to question the approach here, as the docs for
handling regression clearly explain that this regression fix should be
applied this cycle:
https://www.kernel.org/doc/html/latest/process/handling-regressions.html

[background: the fixes tag in the change mentions an older commit, but
it sees the problem surfaced post-5.17 cycle, as Hand pointed out at the
start of this thread where he linked here:
https://bugzilla.redhat.com/show_bug.cgi?id=2072556 ]

Sure, there are fixes that are dangerous and maybe should wait for the
next cycle, but from what I see this one doesn't look like one of those.
And if we don't fix this now many more people will run into this.

Dave, Daniel, could you please consider picking this up?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
