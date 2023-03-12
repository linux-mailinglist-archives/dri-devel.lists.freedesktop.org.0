Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA646B66B5
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 14:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFF610E359;
	Sun, 12 Mar 2023 13:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E35D10E125;
 Sun, 12 Mar 2023 13:30:39 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pbLmV-0006iT-BW; Sun, 12 Mar 2023 14:30:35 +0100
Message-ID: <0b277722-5d01-7ca2-e86a-a77a3523e589@leemhuis.info>
Date: Sun, 12 Mar 2023 14:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
Content-Language: en-US, de-DE
To: Karol Herbst <kherbst@redhat.com>, Chris Clayton <chris2553@googlemail.com>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <d031f0a5-8d5e-af51-6db6-11844de3eeba@googlemail.com>
 <CAPM=9tz+wksJTvMi_4Ef7XWezfH0ReN2se189s8Q=obJjHC+Fw@mail.gmail.com>
 <4e786e22-f17a-da76-5129-8fef0c7c825a@googlemail.com>
 <b829633e-ccc4-7a54-1cad-f29254de1251@leemhuis.info>
 <CACO55tsvM07_6mGU3dCgeji0a6B4JJKSDOOBuCHv2Mw3rYbCHg@mail.gmail.com>
 <181bea6a-e501-f5bd-b002-de7a244a921a@googlemail.com>
 <CACO55tsGXfy9-a-nexvcn7pnDGoEWXMqhiQEBwCDkGyOeT1sXQ@mail.gmail.com>
 <dbfc1f77-29f3-7690-c231-55f906a4e7e5@googlemail.com>
 <7f6ec5b3-b5c7-f564-003e-132f112b7cf4@googlemail.com>
 <CACAvsv7Uf5=K44y8YLsiy0aMnc1zvGEQdeDe7RQF=AV+fxxzuQ@mail.gmail.com>
 <c12aa9b8-65a1-0cdf-8948-15309f16b955@googlemail.com>
 <CACO55tvGQdHPnZEMAGPZN3K1nUCV-ruX_QNwSqQAg_z81ab0MA@mail.gmail.com>
 <CACAvsv53xc8dr0e5HEFcV+218WoCbGVor0HDgBw-C51fPkR9kQ@mail.gmail.com>
 <853b7e32-f566-2a92-0f59-3490ad5d88df@googlemail.com>
 <CACO55tub2f3HmwUU5hYb=0JuuDJM=dG-2rBMvb_oCNgp0CqSHQ@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CACO55tub2f3HmwUU5hYb=0JuuDJM=dG-2rBMvb_oCNgp0CqSHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1678627840;
 e70279a8; 
X-HE-SMSGID: 1pbLmV-0006iT-BW
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com,
 Ben Skeggs <skeggsb@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.03.23 11:20, Karol Herbst wrote:
> On Fri, Mar 10, 2023 at 10:26 AM Chris Clayton <chris2553@googlemail.com> wrote:
>>
>> Is it likely that this fix will be sumbmitted to mainline during the ongoing 6.3 development cycle?
>>
> 
> yes, it's already pushed to drm-misc-fixed, which then will go into
> the current devel cycle. I just don't know when it's the next time it
> will be pushed upwards, but it should get there eventually. 

FWIW, the fix landed now as 1b9b4f922f96 ; sadly without a Link: tag to
the report, hence I have to mark this manually as resolved:

#regzbot fix: 1b9b4f922f96108da3bb5d87b2d603f5dfbc5650

> And
> because it also contains a Fixes tag it will be backported to older
> branches as well.

FWIW, nope, that's not enough you have to tag those explicitly to ensure
backporting, as explained in
Documentation/process/stable-kernel-rules.rst Greg points that out every
few weeks, recently here for example:

https://lore.kernel.org/all/Y6BWPo9S9QbnsAx6@kroah.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

>> Chris
>>
>> On 20/02/2023 22:16, Ben Skeggs wrote:
>>> On Mon, 20 Feb 2023 at 21:27, Karol Herbst <kherbst@redhat.com> wrote:
>>>>
>>>> On Mon, Feb 20, 2023 at 11:51 AM Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 20/02/2023 05:35, Ben Skeggs wrote:
>>>>>> On Sun, 19 Feb 2023 at 04:55, Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 18/02/2023 15:19, Chris Clayton wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 18/02/2023 12:25, Karol Herbst wrote:
>>>>>>>>> On Sat, Feb 18, 2023 at 1:22 PM Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 15/02/2023 11:09, Karol Herbst wrote:
>>>>>>>>>>> On Wed, Feb 15, 2023 at 11:36 AM Linux regression tracking #update
>>>>>>>>>>> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On 13.02.23 10:14, Chris Clayton wrote:
>>>>>>>>>>>>> On 13/02/2023 02:57, Dave Airlie wrote:
>>>>>>>>>>>>>> On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 10/02/2023 19:33, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>>>>>>>>>>>>> On 10.02.23 20:01, Karol Herbst wrote:
>>>>>>>>>>>>>>>>> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking (Thorsten
>>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> On 08.02.23 09:48, Chris Clayton wrote:
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Yeah, looks like it. That's unfortunate, but happens. But there is still
>>>>>>>>>>>>>>>>>> time to fix it and there is one thing I wonder:
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Did any of the nouveau developers look at the netconsole captures Chris
>>>>>>>>>>>>>>>>>> posted more than a week ago to check if they somehow help to track down
>>>>>>>>>>>>>>>>>> the root of this problem?
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I did now and I can't spot anything. I think at this point it would
>>>>>>>>>>>>>>>>> make sense to dump the active tasks/threads via sqsrq keys to see if
>>>>>>>>>>>>>>>>> any is in a weird state preventing the machine from shutting down.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Many thx for looking into it!
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Yes, thanks Karol.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Attached is the output from dmesg when this block of code:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>         /bin/mount /dev/sda7 /mnt/sda7
>>>>>>>>>>>>>>>         /bin/mountpoint /proc || /bin/mount /proc
>>>>>>>>>>>>>>>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
>>>>>>>>>>>>>>>         /bin/echo t > /proc/sysrq-trigger
>>>>>>>>>>>>>>>         /bin/sleep 1
>>>>>>>>>>>>>>>         /bin/sync
>>>>>>>>>>>>>>>         /bin/sleep 1
>>>>>>>>>>>>>>>         kill $(pidof dmesg)
>>>>>>>>>>>>>>>         /bin/umount /mnt/sda7
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> is executed immediately before /sbin/reboot is called as the final step of rebooting my system.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I hope this is what you were looking for, but if not, please let me know what you need
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks Dave. [...]
>>>>>>>>>>>> FWIW, in case anyone strands here in the archives: the msg was
>>>>>>>>>>>> truncated. The full post can be found in a new thread:
>>>>>>>>>>>>
>>>>>>>>>>>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
>>>>>>>>>>>>
>>>>>>>>>>>> Sadly it seems the info "With runpm=0, both reboot and poweroff work on
>>>>>>>>>>>> my laptop." didn't bring us much further to a solution. :-/ I don't
>>>>>>>>>>>> really like it, but for regression tracking I'm now putting this on the
>>>>>>>>>>>> back-burner, as a fix is not in sight.
>>>>>>>>>>>>
>>>>>>>>>>>> #regzbot monitor:
>>>>>>>>>>>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
>>>>>>>>>>>> #regzbot backburner: hard to debug and apparently rare
>>>>>>>>>>>> #regzbot ignore-activity
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> yeah.. this bug looks a little annoying. Sadly the only Turing based
>>>>>>>>>>> laptop I got doesn't work on Nouveau because of firmware related
>>>>>>>>>>> issues and we probably need to get updated ones from Nvidia here :(
>>>>>>>>>>>
>>>>>>>>>>> But it's a bit weird that the kernel doesn't shutdown, because I don't
>>>>>>>>>>> see anything in the logs which would prevent that from happening.
>>>>>>>>>>> Unless it's waiting on one of the tasks to complete, but none of them
>>>>>>>>>>> looked in any way nouveau related.
>>>>>>>>>>>
>>>>>>>>>>> If somebody else has any fancy kernel debugging tips here to figure
>>>>>>>>>>> out why it hangs, that would be very helpful...
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I think I've figured this out. It's to do with how my system is configured. I do have an initrd, but the only thing on
>>>>>>>>>> it is the cpu microcode which, it is recommended, should be loaded early. The absence of the NVidia firmare from an
>>>>>>>>>> initrd doesn't matter because the drivers for the hardware that need to load firmware are all built as modules, So, by
>>>>>>>>>> the time the devices are configured via udev, the root partition is mounted and the drivers can get at the firmware.
>>>>>>>>>>
>>>>>>>>>> I've found, by turning on nouveau debug and taking a video of the screen as the system shuts down, that nouveau seems to
>>>>>>>>>> be trying to run the scrubber very very late in the shutdown process. The problem is that by this time, I think the root
>>>>>>>>>> partition, and thus the scrubber binary, have become inaccessible.
>>>>>>>>>>
>>>>>>>>>> I seem to have two choices - either make the firmware accessible on an initrd or unload the module in a shutdown script
>>>>>>>>>> before the scrubber binary becomes inaccessible. The latter of these is the workaround I have implemented whilst the
>>>>>>>>>> problem I reported has been under investigation. For simplicity, I think I'll promote my workaround to being the
>>>>>>>>>> permanent solution.
>>>>>>>>>>
>>>>>>>>>> So, apologies (and thanks) to everyone whose time I have taken up with this non-bug.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Well.. nouveau shouldn't prevent the system from shutting down if the
>>>>>>>>> firmware file isn't available. Or at least it should print a
>>>>>>>>> warning/error. Mind messing with the code a little to see if skipping
>>>>>>>>> it kind of works? I probably can also come up with a patch by next
>>>>>>>>> week.
>>>>>>>>>
>>>>>>>> Well, I'd love to but a quick glance at the code caused me to bump into this obscenity:
>>>>>>>>
>>>>>>>> int
>>>>>>>> gm200_flcn_reset_wait_mem_scrubbing(struct nvkm_falcon *falcon)
>>>>>>>> {
>>>>>>>>         nvkm_falcon_mask(falcon, 0x040, 0x00000000, 0x00000000);
>>>>>>>>
>>>>>>>>         if (nvkm_msec(falcon->owner->device, 10,
>>>>>>>>                 if (!(nvkm_falcon_rd32(falcon, 0x10c) & 0x00000006))
>>>>>>>>                         break;
>>>>>>>>         ) < 0)
>>>>>>>>                 return -ETIMEDOUT;
>>>>>>>>
>>>>>>>>         return 0;
>>>>>>>> }
>>>>>>>>
>>>>>>>> nvkm_msec is #defined to nvkm_usec which in turn is #defined to nvkm_nsec where the loop that the break is related to
>>>>>>>> appears
>>>>>>>
>>>>>>> I think someone who knows the code needs to look at this. What I can confirm is that after a freeze, I waited for 90
>>>>>>> seconds for a timeout to occur, but it didn't.
>>>>>> Hey,
>>>>>>
>>>>>> Are you able to try the attached patch for me please?
>>>>>>
>>>>>> Thanks,
>>>>>> Ben.
>>>>>>
>>>>>
>>>>> Thanks Ben.
>>>>>
>>>>> Yes, this patch fixes the lockup on reboot and poweroff that I've been seeing on my laptop. As you would expect,
>>>>> offloaded rendering is still working and the discrete GPU is being powered on and off as required.
>>>>>
>>>>> Thanks.
>>>>>
>>>>> Reported-by: Chris Clayton <chris2553@googlemail.com>
>>>>> Tested-by: Chris Clayton <chris2553@googlemail.com>
>>>>>
>>>>
>>>> Ben, did you manage to get push rights to drm-misc by now or should I
>>>> just pick the patch and push it through -fixes?
>>> Feel free to pick it up!
>>>
>>> Thank you,
>>> Ben.
>>>
>>>>
>>>>>>>
>>>>>>>
>>>>>>> .> Chris
>>>>>>>>>>
>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>>>>>>>> --
>>>>>>>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>>>>>>>> That page also explains what to do if mails like this annoy you.
>>>>>>>>>>>>
>>>>>>>>>>>> #regzbot ignore-activity
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>
>>>>
>>
> 
> 
> 
