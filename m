Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B46B3BE4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 11:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF4110E9B9;
	Fri, 10 Mar 2023 10:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1110E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678443619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9/Y92dzLPnWp4osldFaN0PHtT3hPC8y/ueP38Tax60=;
 b=DufsuOIv3ViezqO9C1XJpTmiwz3TFaM8/wZn8Xjgc5yICV8ZAJApvO1P3+Uxp8NycoIJQI
 3c/XLgXhl4iiNv8i2B0+q8dZivE3sn91JOjFfDuYHGWFYONyoBpqzDG2jciwkHXJvTe/nj
 82f+gCbW7T3iB+fWEbO5kmMLf4sZDbo=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-deVRoM25OtGVMrB21Ug6Bw-1; Fri, 10 Mar 2023 05:20:18 -0500
X-MC-Unique: deVRoM25OtGVMrB21Ug6Bw-1
Received: by mail-lj1-f197.google.com with SMTP id
 v14-20020a2e9f4e000000b002934fe0289bso1507145ljk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 02:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678443617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9/Y92dzLPnWp4osldFaN0PHtT3hPC8y/ueP38Tax60=;
 b=tf2AAcAuU8ortZzh+Mp+xC0NxZ3CJLXGTRkqlDrgUSoPmcgDjXJSlMwPgCg3+5WOhS
 gZ1GoO/TaD00iny1MLDoFX+K3oAmYLj9Cbj+3+G4DZHC6y9LmnwAlYksK3kpzCWAZVNE
 akDzTchCPGkinkMcUM1Y7ndYTsEKHe6DrZU2eB/AVoavBKTPfI1IpXARo9n8SMmUI8wP
 rnpyExBptpgZzSgbpAK+AA2V4tHZIUJ0YxQX0UJDTwQWhc/SlAR6+tOI+CHtf6jks8j6
 hf8FIG3o2JWkQKZuFag2eV8n//ynsqo9aGnpaQ7JdQ3T8oOC7E25+9y+c45RSWidG5no
 KCGQ==
X-Gm-Message-State: AO0yUKWKUCqW9vSiUnlLTzGWxrvDSURXacJ/pHoYH1G72wtwPYoJ7mDc
 iqgVys6uTvu95HYwh2qzDSb8McnKcXrLWQVtxi0GVRdnhumkU5EKrry8ywtYeRZZcedhfROjdoq
 5C5zIZ6yx4zpWlFHtWDmFBck4XoI4JYhf2xKlBkZcaGeb
X-Received: by 2002:a05:651c:204e:b0:295:a372:1dc2 with SMTP id
 t14-20020a05651c204e00b00295a3721dc2mr7907845ljo.8.1678443617082; 
 Fri, 10 Mar 2023 02:20:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/Bl35G5xu9zj1QZPRKFm+hk+NOC48dm5Np2aUM5pJfLVPlrHr/lK4jMyX6tvpPyZ4BtskI+a05NO92AkTGE+8=
X-Received: by 2002:a05:651c:204e:b0:295:a372:1dc2 with SMTP id
 t14-20020a05651c204e00b00295a3721dc2mr7907830ljo.8.1678443616679; Fri, 10 Mar
 2023 02:20:16 -0800 (PST)
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <CACO55tvR4ydDOXt=9nbR3n2aFLKrj8zeuGRR_xpezVQBBLrjqg@mail.gmail.com>
 <a6188878-f84c-0fcc-9509-b9d7ab797f4c@leemhuis.info>
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
In-Reply-To: <853b7e32-f566-2a92-0f59-3490ad5d88df@googlemail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 10 Mar 2023 11:20:04 +0100
Message-ID: <CACO55tub2f3HmwUU5hYb=0JuuDJM=dG-2rBMvb_oCNgp0CqSHQ@mail.gmail.com>
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Chris Clayton <chris2553@googlemail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 10, 2023 at 10:26=E2=80=AFAM Chris Clayton <chris2553@googlemai=
l.com> wrote:
>
> Hi.
>
> Is it likely that this fix will be sumbmitted to mainline during the ongo=
ing 6.3 development cycle?
>

yes, it's already pushed to drm-misc-fixed, which then will go into
the current devel cycle. I just don't know when it's the next time it
will be pushed upwards, but it should get there eventually. And
because it also contains a Fixes tag it will be backported to older
branches as well.

> Chris
>
> On 20/02/2023 22:16, Ben Skeggs wrote:
> > On Mon, 20 Feb 2023 at 21:27, Karol Herbst <kherbst@redhat.com> wrote:
> >>
> >> On Mon, Feb 20, 2023 at 11:51 AM Chris Clayton <chris2553@googlemail.c=
om> wrote:
> >>>
> >>>
> >>>
> >>> On 20/02/2023 05:35, Ben Skeggs wrote:
> >>>> On Sun, 19 Feb 2023 at 04:55, Chris Clayton <chris2553@googlemail.co=
m> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 18/02/2023 15:19, Chris Clayton wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 18/02/2023 12:25, Karol Herbst wrote:
> >>>>>>> On Sat, Feb 18, 2023 at 1:22 PM Chris Clayton <chris2553@googlema=
il.com> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 15/02/2023 11:09, Karol Herbst wrote:
> >>>>>>>>> On Wed, Feb 15, 2023 at 11:36 AM Linux regression tracking #upd=
ate
> >>>>>>>>> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On 13.02.23 10:14, Chris Clayton wrote:
> >>>>>>>>>>> On 13/02/2023 02:57, Dave Airlie wrote:
> >>>>>>>>>>>> On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googl=
email.com> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On 10/02/2023 19:33, Linux regression tracking (Thorsten Le=
emhuis) wrote:
> >>>>>>>>>>>>>> On 10.02.23 20:01, Karol Herbst wrote:
> >>>>>>>>>>>>>>> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking=
 (Thorsten
> >>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> On 08.02.23 09:48, Chris Clayton wrote:
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> I'm assuming  that we are not going to see a fix for th=
is regression before 6.2 is released.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Yeah, looks like it. That's unfortunate, but happens. Bu=
t there is still
> >>>>>>>>>>>>>>>> time to fix it and there is one thing I wonder:
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Did any of the nouveau developers look at the netconsole=
 captures Chris
> >>>>>>>>>>>>>>>> posted more than a week ago to check if they somehow hel=
p to track down
> >>>>>>>>>>>>>>>> the root of this problem?
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I did now and I can't spot anything. I think at this poin=
t it would
> >>>>>>>>>>>>>>> make sense to dump the active tasks/threads via sqsrq key=
s to see if
> >>>>>>>>>>>>>>> any is in a weird state preventing the machine from shutt=
ing down.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Many thx for looking into it!
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Yes, thanks Karol.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Attached is the output from dmesg when this block of code:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>         /bin/mount /dev/sda7 /mnt/sda7
> >>>>>>>>>>>>>         /bin/mountpoint /proc || /bin/mount /proc
> >>>>>>>>>>>>>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
> >>>>>>>>>>>>>         /bin/echo t > /proc/sysrq-trigger
> >>>>>>>>>>>>>         /bin/sleep 1
> >>>>>>>>>>>>>         /bin/sync
> >>>>>>>>>>>>>         /bin/sleep 1
> >>>>>>>>>>>>>         kill $(pidof dmesg)
> >>>>>>>>>>>>>         /bin/umount /mnt/sda7
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> is executed immediately before /sbin/reboot is called as th=
e final step of rebooting my system.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I hope this is what you were looking for, but if not, pleas=
e let me know what you need
> >>>>>>>>>>>
> >>>>>>>>>>> Thanks Dave. [...]
> >>>>>>>>>> FWIW, in case anyone strands here in the archives: the msg was
> >>>>>>>>>> truncated. The full post can be found in a new thread:
> >>>>>>>>>>
> >>>>>>>>>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d860=
31e@googlemail.com/
> >>>>>>>>>>
> >>>>>>>>>> Sadly it seems the info "With runpm=3D0, both reboot and power=
off work on
> >>>>>>>>>> my laptop." didn't bring us much further to a solution. :-/ I =
don't
> >>>>>>>>>> really like it, but for regression tracking I'm now putting th=
is on the
> >>>>>>>>>> back-burner, as a fix is not in sight.
> >>>>>>>>>>
> >>>>>>>>>> #regzbot monitor:
> >>>>>>>>>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d860=
31e@googlemail.com/
> >>>>>>>>>> #regzbot backburner: hard to debug and apparently rare
> >>>>>>>>>> #regzbot ignore-activity
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> yeah.. this bug looks a little annoying. Sadly the only Turing =
based
> >>>>>>>>> laptop I got doesn't work on Nouveau because of firmware relate=
d
> >>>>>>>>> issues and we probably need to get updated ones from Nvidia her=
e :(
> >>>>>>>>>
> >>>>>>>>> But it's a bit weird that the kernel doesn't shutdown, because =
I don't
> >>>>>>>>> see anything in the logs which would prevent that from happenin=
g.
> >>>>>>>>> Unless it's waiting on one of the tasks to complete, but none o=
f them
> >>>>>>>>> looked in any way nouveau related.
> >>>>>>>>>
> >>>>>>>>> If somebody else has any fancy kernel debugging tips here to fi=
gure
> >>>>>>>>> out why it hangs, that would be very helpful...
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I think I've figured this out. It's to do with how my system is =
configured. I do have an initrd, but the only thing on
> >>>>>>>> it is the cpu microcode which, it is recommended, should be load=
ed early. The absence of the NVidia firmare from an
> >>>>>>>> initrd doesn't matter because the drivers for the hardware that =
need to load firmware are all built as modules, So, by
> >>>>>>>> the time the devices are configured via udev, the root partition=
 is mounted and the drivers can get at the firmware.
> >>>>>>>>
> >>>>>>>> I've found, by turning on nouveau debug and taking a video of th=
e screen as the system shuts down, that nouveau seems to
> >>>>>>>> be trying to run the scrubber very very late in the shutdown pro=
cess. The problem is that by this time, I think the root
> >>>>>>>> partition, and thus the scrubber binary, have become inaccessibl=
e.
> >>>>>>>>
> >>>>>>>> I seem to have two choices - either make the firmware accessible=
 on an initrd or unload the module in a shutdown script
> >>>>>>>> before the scrubber binary becomes inaccessible. The latter of t=
hese is the workaround I have implemented whilst the
> >>>>>>>> problem I reported has been under investigation. For simplicity,=
 I think I'll promote my workaround to being the
> >>>>>>>> permanent solution.
> >>>>>>>>
> >>>>>>>> So, apologies (and thanks) to everyone whose time I have taken u=
p with this non-bug.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Well.. nouveau shouldn't prevent the system from shutting down if=
 the
> >>>>>>> firmware file isn't available. Or at least it should print a
> >>>>>>> warning/error. Mind messing with the code a little to see if skip=
ping
> >>>>>>> it kind of works? I probably can also come up with a patch by nex=
t
> >>>>>>> week.
> >>>>>>>
> >>>>>> Well, I'd love to but a quick glance at the code caused me to bump=
 into this obscenity:
> >>>>>>
> >>>>>> int
> >>>>>> gm200_flcn_reset_wait_mem_scrubbing(struct nvkm_falcon *falcon)
> >>>>>> {
> >>>>>>         nvkm_falcon_mask(falcon, 0x040, 0x00000000, 0x00000000);
> >>>>>>
> >>>>>>         if (nvkm_msec(falcon->owner->device, 10,
> >>>>>>                 if (!(nvkm_falcon_rd32(falcon, 0x10c) & 0x00000006=
))
> >>>>>>                         break;
> >>>>>>         ) < 0)
> >>>>>>                 return -ETIMEDOUT;
> >>>>>>
> >>>>>>         return 0;
> >>>>>> }
> >>>>>>
> >>>>>> nvkm_msec is #defined to nvkm_usec which in turn is #defined to nv=
km_nsec where the loop that the break is related to
> >>>>>> appears
> >>>>>
> >>>>> I think someone who knows the code needs to look at this. What I ca=
n confirm is that after a freeze, I waited for 90
> >>>>> seconds for a timeout to occur, but it didn't.
> >>>> Hey,
> >>>>
> >>>> Are you able to try the attached patch for me please?
> >>>>
> >>>> Thanks,
> >>>> Ben.
> >>>>
> >>>
> >>> Thanks Ben.
> >>>
> >>> Yes, this patch fixes the lockup on reboot and poweroff that I've bee=
n seeing on my laptop. As you would expect,
> >>> offloaded rendering is still working and the discrete GPU is being po=
wered on and off as required.
> >>>
> >>> Thanks.
> >>>
> >>> Reported-by: Chris Clayton <chris2553@googlemail.com>
> >>> Tested-by: Chris Clayton <chris2553@googlemail.com>
> >>>
> >>
> >> Ben, did you manage to get push rights to drm-misc by now or should I
> >> just pick the patch and push it through -fixes?
> > Feel free to pick it up!
> >
> > Thank you,
> > Ben.
> >
> >>
> >>>>>
> >>>>>
> >>>>> .> Chris
> >>>>>>>>
> >>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tra=
cker' hat)
> >>>>>>>>>> --
> >>>>>>>>>> Everything you wanna know about Linux kernel regression tracki=
ng:
> >>>>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
> >>>>>>>>>> That page also explains what to do if mails like this annoy yo=
u.
> >>>>>>>>>>
> >>>>>>>>>> #regzbot ignore-activity
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>
> >>>
> >>
>

