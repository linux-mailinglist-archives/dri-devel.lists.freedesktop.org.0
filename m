Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E67C69B9FB
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 13:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEA310E1FC;
	Sat, 18 Feb 2023 12:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBBA10E201
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676723157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RijZqlt6QPxnZ5qsCx6gnldqHryetV8XG7/DeGD2O5Y=;
 b=UT5cEKPmutgk7KsDPAfH9i/IEh31slq4azgIHIgcUFCpKr33cmVBzDqDouMhefyucAaSdQ
 tQK4h2htiTY+Y+YUzepBS5k6lAoSe9LQhChXQ1IXW+8JulYr15CzefJTMiw9XXN1816XML
 AQMMHbgVn5NPfGdmaR8mOqJAqbdU6gM=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-dxTIL7TbNQWhIcHBsQecaQ-1; Sat, 18 Feb 2023 07:25:56 -0500
X-MC-Unique: dxTIL7TbNQWhIcHBsQecaQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 a41-20020a05651c212900b0029099954a31so140436ljq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 04:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RijZqlt6QPxnZ5qsCx6gnldqHryetV8XG7/DeGD2O5Y=;
 b=Yf+G55PiTG25OsOI/057NE9liUin5SmQjdf+NkzK9U+h0Xyg0dvYraU6SO1f+f8Jko
 7oYkyeLeuLotO+jBMKniJkbQ5uv13QArbFK8Q34ryiMbKeylD+CGOY+6wRhYgzc5YsNQ
 guQZnr4HeF3akku2q4zy/Z8c6t0364QECitBly7rkn4LGIR3MpoT/gxphbkr2bmE0FDn
 WFRK5f2COEMsLkS73A9zU8C/XiP7KFvz++DV2BJRdHWuAj3VQLfwL2SU7jgPzGOm4RaE
 snAQ+Tw9dOSMqcQwWqwkPM5tWrWtn3IezGr4psqeWYRJT/qKkMt7Dmr3+6V3igHYiK2m
 lWcA==
X-Gm-Message-State: AO0yUKWDPf+fnNu3eB6hova7swfFxUDjBMC+BKVBhEsgp2Ie6EeqJstd
 KQBTPwUDrhxn7eIx0enlJInNZ2QJVw/t2MvPxOsT/Xyq5giqRGul5gE74fIb2ejBgM6VqrXWBsy
 R9oZ5BLn6rJWuSXaPXlo6yLjrimfO5oDzS+t7FzvkWomz
X-Received: by 2002:ac2:46f8:0:b0:4db:38ba:618d with SMTP id
 q24-20020ac246f8000000b004db38ba618dmr1266297lfo.12.1676723154857; 
 Sat, 18 Feb 2023 04:25:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/Z7L8+b7P0J8LwiD8xHpb8nnAbtyDGwQ25yG4cizIYlJMz2FM+E2DWgrE9e6Ejw2J20Q2KybtR01oL+r0Zquw=
X-Received: by 2002:ac2:46f8:0:b0:4db:38ba:618d with SMTP id
 q24-20020ac246f8000000b004db38ba618dmr1266288lfo.12.1676723154517; Sat, 18
 Feb 2023 04:25:54 -0800 (PST)
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
 <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com>
 <dab6eb81-db3f-8fa1-84ad-9b40e209514b@googlemail.com>
 <CACAvsv5iYdF3P8AbyrbYo3zGmYRYhxDWn7WbAR5V9qHpbgBXRA@mail.gmail.com>
 <1632a9ef-2954-c8f0-cdc9-03157c9d8547@googlemail.com>
 <5abbee70-cc84-1528-c3d8-9befd9edd611@googlemail.com>
 <5cf46df8-0fa2-e9f5-aa8e-7f7f703d96dd@googlemail.com>
 <f72fe15b-db1d-56dd-aaf6-3cba68a8bf0a@leemhuis.info>
 <CACO55tvR4ydDOXt=9nbR3n2aFLKrj8zeuGRR_xpezVQBBLrjqg@mail.gmail.com>
 <a6188878-f84c-0fcc-9509-b9d7ab797f4c@leemhuis.info>
 <d031f0a5-8d5e-af51-6db6-11844de3eeba@googlemail.com>
 <CAPM=9tz+wksJTvMi_4Ef7XWezfH0ReN2se189s8Q=obJjHC+Fw@mail.gmail.com>
 <4e786e22-f17a-da76-5129-8fef0c7c825a@googlemail.com>
 <b829633e-ccc4-7a54-1cad-f29254de1251@leemhuis.info>
 <CACO55tsvM07_6mGU3dCgeji0a6B4JJKSDOOBuCHv2Mw3rYbCHg@mail.gmail.com>
 <181bea6a-e501-f5bd-b002-de7a244a921a@googlemail.com>
In-Reply-To: <181bea6a-e501-f5bd-b002-de7a244a921a@googlemail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 18 Feb 2023 13:25:42 +0100
Message-ID: <CACO55tsGXfy9-a-nexvcn7pnDGoEWXMqhiQEBwCDkGyOeT1sXQ@mail.gmail.com>
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Chris Clayton <chris2553@googlemail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com,
 Ben Skeggs <skeggsb@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 18, 2023 at 1:22 PM Chris Clayton <chris2553@googlemail.com> wrote:
>
>
>
> On 15/02/2023 11:09, Karol Herbst wrote:
> > On Wed, Feb 15, 2023 at 11:36 AM Linux regression tracking #update
> > (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
> >>
> >> On 13.02.23 10:14, Chris Clayton wrote:
> >>> On 13/02/2023 02:57, Dave Airlie wrote:
> >>>> On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googlemail.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 10/02/2023 19:33, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>>>>> On 10.02.23 20:01, Karol Herbst wrote:
> >>>>>>> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking (Thorsten
> >>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>
> >>>>>>>> On 08.02.23 09:48, Chris Clayton wrote:
> >>>>>>>>>
> >>>>>>>>> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.
> >>>>>>>>
> >>>>>>>> Yeah, looks like it. That's unfortunate, but happens. But there is still
> >>>>>>>> time to fix it and there is one thing I wonder:
> >>>>>>>>
> >>>>>>>> Did any of the nouveau developers look at the netconsole captures Chris
> >>>>>>>> posted more than a week ago to check if they somehow help to track down
> >>>>>>>> the root of this problem?
> >>>>>>>
> >>>>>>> I did now and I can't spot anything. I think at this point it would
> >>>>>>> make sense to dump the active tasks/threads via sqsrq keys to see if
> >>>>>>> any is in a weird state preventing the machine from shutting down.
> >>>>>>
> >>>>>> Many thx for looking into it!
> >>>>>
> >>>>> Yes, thanks Karol.
> >>>>>
> >>>>> Attached is the output from dmesg when this block of code:
> >>>>>
> >>>>>         /bin/mount /dev/sda7 /mnt/sda7
> >>>>>         /bin/mountpoint /proc || /bin/mount /proc
> >>>>>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
> >>>>>         /bin/echo t > /proc/sysrq-trigger
> >>>>>         /bin/sleep 1
> >>>>>         /bin/sync
> >>>>>         /bin/sleep 1
> >>>>>         kill $(pidof dmesg)
> >>>>>         /bin/umount /mnt/sda7
> >>>>>
> >>>>> is executed immediately before /sbin/reboot is called as the final step of rebooting my system.
> >>>>>
> >>>>> I hope this is what you were looking for, but if not, please let me know what you need
> >>>
> >>> Thanks Dave. [...]
> >> FWIW, in case anyone strands here in the archives: the msg was
> >> truncated. The full post can be found in a new thread:
> >>
> >> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
> >>
> >> Sadly it seems the info "With runpm=0, both reboot and poweroff work on
> >> my laptop." didn't bring us much further to a solution. :-/ I don't
> >> really like it, but for regression tracking I'm now putting this on the
> >> back-burner, as a fix is not in sight.
> >>
> >> #regzbot monitor:
> >> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
> >> #regzbot backburner: hard to debug and apparently rare
> >> #regzbot ignore-activity
> >>
> >
> > yeah.. this bug looks a little annoying. Sadly the only Turing based
> > laptop I got doesn't work on Nouveau because of firmware related
> > issues and we probably need to get updated ones from Nvidia here :(
> >
> > But it's a bit weird that the kernel doesn't shutdown, because I don't
> > see anything in the logs which would prevent that from happening.
> > Unless it's waiting on one of the tasks to complete, but none of them
> > looked in any way nouveau related.
> >
> > If somebody else has any fancy kernel debugging tips here to figure
> > out why it hangs, that would be very helpful...
> >
>
> I think I've figured this out. It's to do with how my system is configured. I do have an initrd, but the only thing on
> it is the cpu microcode which, it is recommended, should be loaded early. The absence of the NVidia firmare from an
> initrd doesn't matter because the drivers for the hardware that need to load firmware are all built as modules, So, by
> the time the devices are configured via udev, the root partition is mounted and the drivers can get at the firmware.
>
> I've found, by turning on nouveau debug and taking a video of the screen as the system shuts down, that nouveau seems to
> be trying to run the scrubber very very late in the shutdown process. The problem is that by this time, I think the root
> partition, and thus the scrubber binary, have become inaccessible.
>
> I seem to have two choices - either make the firmware accessible on an initrd or unload the module in a shutdown script
> before the scrubber binary becomes inaccessible. The latter of these is the workaround I have implemented whilst the
> problem I reported has been under investigation. For simplicity, I think I'll promote my workaround to being the
> permanent solution.
>
> So, apologies (and thanks) to everyone whose time I have taken up with this non-bug.
>

Well.. nouveau shouldn't prevent the system from shutting down if the
firmware file isn't available. Or at least it should print a
warning/error. Mind messing with the code a little to see if skipping
it kind of works? I probably can also come up with a patch by next
week.

> Chris
>
> >> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> >> --
> >> Everything you wanna know about Linux kernel regression tracking:
> >> https://linux-regtracking.leemhuis.info/about/#tldr
> >> That page also explains what to do if mails like this annoy you.
> >>
> >> #regzbot ignore-activity
> >>
> >
>

