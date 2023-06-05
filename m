Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8276722F13
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 21:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050C510E1CE;
	Mon,  5 Jun 2023 19:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dijkstra.felixrichter.tech (dijkstra.felixrichter.tech
 [37.120.184.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C36210E1CE;
 Mon,  5 Jun 2023 19:01:32 +0000 (UTC)
Received: from [10.130.10.1] (unknown [10.130.10.1])
 by dijkstra.felixrichter.tech (Postfix) with ESMTPSA id 70D2B1A004E;
 Mon,  5 Jun 2023 21:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=felixrichter.tech;
 s=20210926; t=1685991701;
 bh=hHM21uMY9Q6jRJ4Ux8W5aHArMtuV0rJaAooMpG/+uZ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YgekOJxxO1ROzvhqNkFQ5hHCrYOflkP3GVPDNS0Fhwe7qcWNCO0cTNSAc4Gnf3pKa
 4imRjoDsVaDmE/ZY5pPSSv5RbPzTh7sKbGFo/cicXjBwz9Bfw0eVfOogLHmtCMfPfX
 sPKNNlghcJBiB35GJlFBFTKij9+IXYItzTPkkmSo=
Message-ID: <8d8bd9ab-4e34-2b23-d086-ed7750214310@felixrichter.tech>
Date: Mon, 5 Jun 2023 21:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
 <CADnq5_M-5SD6HDRVtFHPNF3q9XKz75PECdUxR-OaVpPe2Zw=EQ@mail.gmail.com>
 <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
 <0cac032a-0f65-5134-cde5-f535fc58c5ab@felixrichter.tech>
 <e7eed5ce-e7a0-e03e-f8c7-3582d9771a33@leemhuis.info>
 <e24373f9-4405-d7f7-dd54-d0bde111242c@felixrichter.tech>
 <CADnq5_MCXgtxNB_WBfAw+ZSKNeczSYL7gZPkpqqJ859G=LYkgA@mail.gmail.com>
From: Felix Richter <judge@felixrichter.tech>
In-Reply-To: <CADnq5_MCXgtxNB_WBfAw+ZSKNeczSYL7gZPkpqqJ859G=LYkgA@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I will apply this patch and see if fixes the issue for me. Will let you 
now when I am done.

Felix

On 05.06.23 16:11, Alex Deucher wrote:
> On Sat, Jun 3, 2023 at 10:52 AM Felix Richter <judge@felixrichter.tech> wrote:
>> Hi Guys,
>>
>> sorry for the silence from my side. I had a lot of things to take care
>> of after returning from vacation. Also I had to wait on the zfs modules
>> to be updated to support kernel 6.3 for further testing.
>>
>> The bad news is that I am still experiencing issues. I have been able to
>> get a reproducible trigger for the buggy behavior. The moment I take a
>> screenshot or any other program like `wdisplays` accesses the screen
>> buffer the screen starts flickering. The only way to reset it is to
>> reboot the machine or log out of the desktop.
>>
>> With this I did a bisection to figure out which commit is responsible
>> for this. I attached the logs to the mail. The short version is that I
>> identified commit 81d0bcf9900932633d270d5bc4a54ff599c6ebdb as the
>> culprit. Seems that there are side effects of having more flexible
>> buffer placement for the case of the internal GPU. To verify that this
>> actually is the cause of the issue I built the current archlinux kernel
>> with an extra patch to revert the commit:
>> https://github.com/ju6ge/linux/tree/v6.3.5-ju6ge. The result is that be
>> bug is fixed!
> + Hamza
>
> This is a known issue.  You can workaround it by setting
> amdgpu.sg_display=0.  It should be issue should be fixed in:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=08da182175db4c7f80850354849d95f2670e8cd9
>
> Alex
>
>
>
>> Now if this is the desired long term fix I do not know …
>>
>> Kind regards,
>> Felix Richter
>>
>> On 02.05.23 16:12, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 02.05.23 15:48, Felix Richter wrote:
>>>> On 5/2/23 15:34, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>> On 02.05.23 15:13, Alex Deucher wrote:
>>>>>> On Tue, May 2, 2023 at 7:45 AM Linux regression tracking (Thorsten
>>>>>> Leemhuis)<regressions@leemhuis.info>  wrote:
>>>>>>
>>>>>>> On 30.04.23 13:44, Felix Richter wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I am running into an issue with the integrated GPU of the Ryzen 9
>>>>>>>> 7950X. It seems to be a regression from kernel version 6.1 to 6.2.
>>>>>>>> The bug materializes in from of my monitor blinking, meaning it
>>>>>>>> turns full white shortly. This happens very often so that the
>>>>>>>> system becomes unpleasant to use.
>>>>>>>>
>>>>>>>> I am running the Archlinux Kernel:
>>>>>>>> The Issue happens on the bleeding edge kernel: 6.2.13
>>>>>>>> Switching back to the LTS kernel resolves the issue: 6.1.26
>>>>>>>>
>>>>>>>> I have two monitors attached to the system. One 42 inch 4k Display
>>>>>>>> and a 24 inch 1080p Display and am running sway as my desktop.
>>>>>>>>
>>>>>>>> Let me know if there is more information I could provide to help
>>>>>>>> narrow down the issue.
>>>>>>> Thanks for the report. To be sure the issue doesn't fall through the
>>>>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>>>>>>> tracking bot:
>>>>>>>
>>>>>>> #regzbot ^introduced v6.1..v6.2
>>>>>>> #regzbot title drm: amdgpu: system becomes unpleasant to use after
>>>>>>> monitor starts blinking and turns full white
>>>>>>> #regzbot ignore-activity
>>>>>>>
>>>>>>> This isn't a regression? This issue or a fix for it are already
>>>>>>> discussed somewhere else? It was fixed already? You want to clarify
>>>>>>> when
>>>>>>> the regression started to happen? Or point out I got the title or
>>>>>>> something else totally wrong? Then just reply and tell me -- ideally
>>>>>>> while also telling regzbot about it, as explained by the page listed in
>>>>>>> the footer of this mail.
>>>>>>>
>>>>>>> Developers: When fixing the issue, remember to add 'Link:' tags
>>>>>>> pointing
>>>>>>> to the report (the parent of this mail). See page linked in footer for
>>>>>>> details.
>>>>>> This sounds exactly like the issue that was fixed in this patch which
>>>>>> is already on it's way to Linus:
>>>>>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f80850354849d95f2670e8cd9
>>>>> FWIW, you in the flood of emails likely missed that this is the same
>>>>> thread where you yesterday replied "If the module parameter didn't help
>>>>> then perhaps you are seeing some other issue.  Can you bisect?". That's
>>>>> why I decided to add this to the tracking. Or am I missing something
>>>>> obvious here?
>>>>>
>>>>> /me looks around again and can't see anything, but that doesn't have to
>>>>> mean anything...
>>>>>
>>>>> Felix, btw, this guide might help you with the bisection, even if it's
>>>>> just for kernel compilation:
>>>>>
>>>>> https://docs.kernel.org/next/admin-guide/quickly-build-trimmed-linux.html
>>>>>
>>>>> And to indirectly reply to your mail from yesterday[1]. You might want
>>>>> to ignore the arch linux kernel git repo and just do a bisection between
>>>>> 6.1 and the latest 6.2.y kernel using upstream repos; and if I were you
>>>>> I'd also try 6.3 or even mainline before that, in case the issue was
>>>>> fixed already.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/all/04749ee4-0728-92fe-bcb0-a7320279eaac@felixrichter.tech/
>>>>>
>>>> Thanks for the pointers, I'll do a bisection on my desktop from 6.1 to
>>>> the newest commit.
>>> FWIW, I wonder what you actually mean with "newest commit" here: a
>>> bisection between 6.1 and mainline HEAD might be a waste of time, *if*
>>> this is something that only happens in 6.2.y (say due to a broken or
>>> incomplete backport)
>>>
>>>> That was the part I was mostly unsure about … where
>>>> to start from.
>>>>
>>>> I was planning to use PKGBUILD scripts from arch to achieve the same
>>>> configuration as I would when installing
>>>> the package and just rewrite the script to use a local copy of the
>>>> source code instead of the repository.
>>>> That way I can just use the bisect command, rebuild the package and test
>>>> again.
>>> In my experience trying to deal with Linux distro's package managers
>>> creates more trouble than it's worth.
>>>
>>>> But I probably won't be able to finish it this week, since I am on
>>>> vacation starting tomorrow and will not have access to the computer in
>>>> question. I will be back next week, by that time the patch Alex is
>>>> talking about might
>>>> already be in mainline. So if that fixes it, I will notice and let you
>>>> know. If not I will do the bisection to figure out what the actual issue
>>>> is.
>>> Enjoy your vacation!
>>>
>>> Ciao, Thorsten

