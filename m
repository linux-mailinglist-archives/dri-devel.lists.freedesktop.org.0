Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BAF692566
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 19:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4343710E2BC;
	Fri, 10 Feb 2023 18:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8D10E2BC;
 Fri, 10 Feb 2023 18:35:19 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pQYEv-0006bj-4F; Fri, 10 Feb 2023 19:35:17 +0100
Message-ID: <f72fe15b-db1d-56dd-aaf6-3cba68a8bf0a@leemhuis.info>
Date: Fri, 10 Feb 2023 19:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
Content-Language: en-US, de-DE
To: Chris Clayton <chris2553@googlemail.com>, Ben Skeggs <skeggsb@gmail.com>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com>
 <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
 <ab1b0f73-6b4e-8602-2999-b7bec25d92db@googlemail.com>
 <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
 <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com>
 <dab6eb81-db3f-8fa1-84ad-9b40e209514b@googlemail.com>
 <CACAvsv5iYdF3P8AbyrbYo3zGmYRYhxDWn7WbAR5V9qHpbgBXRA@mail.gmail.com>
 <1632a9ef-2954-c8f0-cdc9-03157c9d8547@googlemail.com>
 <5abbee70-cc84-1528-c3d8-9befd9edd611@googlemail.com>
 <5cf46df8-0fa2-e9f5-aa8e-7f7f703d96dd@googlemail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <5cf46df8-0fa2-e9f5-aa8e-7f7f703d96dd@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1676054119;
 d2db53f2; 
X-HE-SMSGID: 1pQYEv-0006bj-4F
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
 Karol Herbst <kherbst@redhat.com>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.02.23 09:48, Chris Clayton wrote:
> 
> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.

Yeah, looks like it. That's unfortunate, but happens. But there is still
time to fix it and there is one thing I wonder:

Did any of the nouveau developers look at the netconsole captures Chris
posted more than a week ago to check if they somehow help to track down
the root of this problem?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

> Consequently, I've
> implemented a (very simple) workaround. All that happens is that in the (sysv) init script that starts and stops SDDM,
> the nouveau module is removed once SDDM is stopped. With that in place, my system no longer freezes on reboot or poweroff.
> 
> Let me know if I can provide any additional diagnostics although, with the problem seemingly occurring so late in the
> shutdown process, I may need help on how to go about capturing.
> 
> Chris
> 
> On 02/02/2023 20:45, Chris Clayton wrote:
>>
>>
>> On 01/02/2023 13:51, Chris Clayton wrote:
>>>
>>>
>>> On 30/01/2023 23:27, Ben Skeggs wrote:
>>>> On Tue, 31 Jan 2023 at 09:09, Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>
>>>>> Hi again.
>>>>>
>>>>> On 30/01/2023 20:19, Chris Clayton wrote:
>>>>>> Thanks, Ben.
>>>>>
>>>>> <snip>
>>>>>
>>>>>>> Hey,
>>>>>>>
>>>>>>> This is a complete shot-in-the-dark, as I don't see this behaviour on
>>>>>>> *any* of my boards.  Could you try the attached patch please?
>>>>>>
>>>>>> Unfortunately, the patch made no difference.
>>>>>>
>>>>>> I've been looking at how the graphics on my laptop is set up, and have a bit of a worry about whether the firmware might
>>>>>> be playing a part in this problem. In order to offload video decoding to the NVidia TU117 GPU, it seems the scrubber
>>>>>> firmware must be available, but as far as I know,that has not been released by NVidia. To get it to work, I followed
>>>>>> what ubuntu have done and the scrubber in /lib/firmware/nvidia/tu117/nvdec/ is a symlink to
>>>>>> ../../tu116/nvdev/scrubber.bin. That, of course, means that some of the firmware loaded is for a different card is being
>>>>>> loaded. I note that processing related to firmware is being changed in the patch. Might my set up be at the root of my
>>>>>> problem?
>>>>>>
>>>>>> I'll have a fiddle an see what I can work out.
>>>>>>
>>>>>> Chris
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Ben.
>>>>>>>
>>>>>>>>
>>>>>
>>>>> Well, my fiddling has got my system rebooting and shutting down successfully again. I found that if I delete the symlink
>>>>> to the scrubber firmware, reboot and shutdown work again. There are however, a number of other files in the tu117
>>>>> firmware directory tree that that are symlinks to actual files in its tu116 counterpart. So I deleted all of those too.
>>>>> Unfortunately, the absence of one or more of those symlinks causes Xorg to fail to start. I've reinstated all the links
>>>>> except scrubber and I now have a system that works as it did until I tried to run a kernel that includes the bad commit
>>>>> I identified in my bisection. That includes offloading video decoding to the NVidia card, so what ever I read that said
>>>>> the scrubber firmware was needed seems to have been wrong. I get a new message that (nouveau 0000:01:00.0: fb: VPR
>>>>> locked, but no scrubber binary!), but, hey, we can't have everything.
>>>>>
>>>>> If you still want to get to the bottom of this, let me know what you need me to provide and I'll do my best. I suspect
>>>>> you might want to because there will a n awful lot of Ubuntu-based systems out there with that scrubber.bin symlink in
>>>>> place. On the other hand,m it could but quite a while before ubuntu are deploying 6.2 or later kernels.
>>>> The symlinks are correct - whole groups of GPUs share the same FW, and
>>>> we use symlinks in linux-firmware to represent this.
>>>>
>>>> I don't really have any ideas how/why this patch causes issues with
>>>> shutdown - it's a path that only gets executed during initialisation.
>>>> Can you try and capture the kernel log during shutdown ("dmesg -w"
>>>> over ssh? netconsole?), and see if there's any relevant messages
>>>> providing a hint at what's going on?  Alternatively, you could try
>>>> unloading the module (you will have to stop X/wayland/gdm/etc/etc
>>>> first) and seeing if that hangs too.
>>>>
>>>> Ben.
>>>
>>> Sorry for the delay - I've been learning about netconsole and netcat. However, I had no success with ssh and netconsole
>>> produced a log with nothing unusual in it.
>>>
>>> Simply stopping Xorg and removing the nouveau module succeeds.
>>>
>>> So, I rebuilt rc6+ after a pull from linus' tree this morning and set the nouveau debug level to 7. I then booted to a
>>> console before doing a reboot (with Ctl+Alt+Del). As expected the machine locked up just before it would ordinarily
>>> restart. The last few lines on the console might be helpful:
>>>
>>> ...
>>> nouveau 0000:01:00:0  fifo: preinit running...
>>> nouveau 0000:01:00:0  fifo: preinit completed in 4us
>>> nouveau 0000:01:00:0  gr: preinit running...
>>> nouveau 0000:01:00:0  gr: preinit completed in 0us
>>> nouveau 0000:01:00:0  nvdec0: preinit running...
>>> nouveau 0000:01:00:0  nvdec0: preinit completed in 0us
>>> nouveau 0000:01:00:0  nvdec0: preinit running...
>>> nouveau 0000:01:00:0  nvdec0: preinit completed in 0us
>>> nouveau 0000:01:00:0  sec2: preinit running...
>>> nouveau 0000:01:00:0  sec2: preinit completed in 0us
>>> nouveau 0000:01:00:0  fb:.VPR locked, running scrubber binary
>>>
>>> These messages appear after the "sd 4:0:0:0 [sda] Stopping disk" I reported in my initial email.
>>>
>>> After the "running scrubber" line appears the machine is locked and I have to hold down the power button to recover. I
>>> get the same outcome from running "halt -dip", "poweroff -di" and "shutdown -h -P now". I guess it's no surprise that
>>> all three result in the same outcome because invocations halt, poweroff and reboot (without the -f argument)from a
>>> runlevel other than 0 resukt in shutdown being run. switching to runlevel 0 with "telenit 0" results in the same
>>> messages from nouveau followed by the lockup.
>>>
>>> Let me know if you need any additional diagnostics.
>>>
>>> Chris
>>>
>>
>> I've done some more investigation and found that I hadn't done sufficient amemdment the scripts run at shutdown to
>> prevent the network being shutdown. I've now got netconsole captures for 6.2.0-rc6+
>> (9f266ccaa2f5228bfe67ad58a94ca4e0109b954a) and, for comparison, 6.1.9. These two logs are attached.
>>
>> Chris
>>
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Chris
>>>>>
>>>>> <snip>
> 
> 
