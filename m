Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 944AC5AF10E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 18:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F268D10E093;
	Tue,  6 Sep 2022 16:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAD710E711
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662482981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yay+E2EHDZycvMLCYh8Yv6p9BOB/M7G94VLrkOGWvxY=;
 b=hxKaftjHr5ZOkDkrYWzH359ZfRIXYFTxzkRnm+m0RqYZ9etWCuDJiTMmnvmLbJHvbBsF8A
 /44rQGCQvY1q21xE/TtZJnEQratnwK5wS6QhesH48QhO6yJ75MdwgHbfHytHa1m8Swtu0C
 GUgAhEAFw9SuIA7BETbLoWju8Sb8DxM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-fYJa-zbgPJy_GWj_7D6XwA-1; Tue, 06 Sep 2022 12:49:40 -0400
X-MC-Unique: fYJa-zbgPJy_GWj_7D6XwA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hp14-20020a1709073e0e00b00741a2093c4aso4009068ejc.20
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 09:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Yay+E2EHDZycvMLCYh8Yv6p9BOB/M7G94VLrkOGWvxY=;
 b=6ML6WGcKt7wAS2DFmEfRDihdLg9qdrMCRBWA/vrdoJez4uDFOPjbSVgv2LioCff81g
 EwXJvZydO3KM6zvurlFUOHvHnoeuh8IJtY0N67kjSSrr+PqC2Wfv+D7umwknGrT6xeGp
 ZAaPHlPMQaLY6oBMcWWhskIZ07tD/whLjKXLKRRdIPaTOEa6zzWUdKOjKhpHimBirLjf
 U4YPGrVNiUEENDsn/nULjADpZGxTeamaMyXoeW5V2LPlwIOvUb38kOGsJkPkWLL0FriX
 l39/hbAlLT1L4aXXMHlZP9edM4+hC14thwwTyEC4kFpX0Z+B/T8RrZqdASFEYP9bQgVg
 qSzQ==
X-Gm-Message-State: ACgBeo0e/AvvFgBebXgJ0SqrVrJZGtt3P50Ekd5TZvXUAa/UJ4xozz47
 lYpJ+ewgChQiz8iP2dQnZWB7IwUr4/Piyvt1ThTX3quYH0cuxRLZrD+Cskam1abFLtzQg/tqQy/
 e6r53tiliuONVF7roYEEGn/Do/1KU
X-Received: by 2002:a17:907:1b22:b0:741:8809:b4e6 with SMTP id
 mp34-20020a1709071b2200b007418809b4e6mr30082789ejc.84.1662482978756; 
 Tue, 06 Sep 2022 09:49:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7pRmh6PdtKGc6d4Q0ZOGIOZzH6n2u2UXifEDQLJtLCrdcTc2n54qb2K20XwdtN/S2EnCa8og==
X-Received: by 2002:a17:907:1b22:b0:741:8809:b4e6 with SMTP id
 mp34-20020a1709071b2200b007418809b4e6mr30082776ejc.84.1662482978484; 
 Tue, 06 Sep 2022 09:49:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 kx16-20020a170907775000b007413aad3acbsm6776222ejc.165.2022.09.06.09.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 09:49:37 -0700 (PDT)
Message-ID: <d9244cd6-9e20-eed2-b429-e69f81629a6e@redhat.com>
Date: Tue, 6 Sep 2022 18:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] drm/gma500: Fix BUG: sleeping function called from
 invalid context errors
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220905133738.466490-1-hdegoede@redhat.com>
 <20220905133738.466490-2-hdegoede@redhat.com>
 <CAMeQTsYi34r9Cv2Jp=DtOyjh6xex9xb49nFpw93eiinp7wHz2A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMeQTsYi34r9Cv2Jp=DtOyjh6xex9xb49nFpw93eiinp7wHz2A@mail.gmail.com>
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

Hi,

On 9/6/22 14:50, Patrik Jakobsson wrote:
> On Mon, Sep 5, 2022 at 3:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> gma_crtc_page_flip() was holding the event_lock spinlock while calling
>> crtc_funcs->mode_set_base() which takes ww_mutex.
>>
>> The only reason to hold event_lock is to clear gma_crtc->page_flip_event
>> on mode_set_base() errors.
>>
>> Instead unlock it after setting gma_crtc->page_flip_event and on
>> errors re-take the lock and clear gma_crtc->page_flip_event it
>> it is still set.
> 
> Hi Hans, thanks for having a look at gma500.
> 
> See comments below.
> 
>>
>> This fixes the following WARN/stacktrace:
>>
>> [  512.122953] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:870
>> [  512.123004] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1253, name: gnome-shell
>> [  512.123031] preempt_count: 1, expected: 0
>> [  512.123048] RCU nest depth: 0, expected: 0
>> [  512.123066] INFO: lockdep is turned off.
>> [  512.123080] irq event stamp: 0
>> [  512.123094] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
>> [  512.123134] hardirqs last disabled at (0): [<ffffffff8d0ec28c>] copy_process+0x9fc/0x1de0
>> [  512.123176] softirqs last  enabled at (0): [<ffffffff8d0ec28c>] copy_process+0x9fc/0x1de0
>> [  512.123207] softirqs last disabled at (0): [<0000000000000000>] 0x0
>> [  512.123233] Preemption disabled at:
>> [  512.123241] [<0000000000000000>] 0x0
>> [  512.123275] CPU: 3 PID: 1253 Comm: gnome-shell Tainted: G        W         5.19.0+ #1
>> [  512.123304] Hardware name: Packard Bell dot s/SJE01_CT, BIOS V1.10 07/23/2013
>> [  512.123323] Call Trace:
>> [  512.123346]  <TASK>
>> [  512.123370]  dump_stack_lvl+0x5b/0x77
>> [  512.123412]  __might_resched.cold+0xff/0x13a
>> [  512.123458]  ww_mutex_lock+0x1e/0xa0
>> [  512.123495]  psb_gem_pin+0x2c/0x150 [gma500_gfx]
>> [  512.123601]  gma_pipe_set_base+0x76/0x240 [gma500_gfx]
>> [  512.123708]  gma_crtc_page_flip+0x95/0x130 [gma500_gfx]
>> [  512.123808]  drm_mode_page_flip_ioctl+0x57d/0x5d0
>> [  512.123897]  ? drm_mode_cursor2_ioctl+0x10/0x10
>> [  512.123936]  drm_ioctl_kernel+0xa1/0x150
>> [  512.123984]  drm_ioctl+0x21f/0x420
>> [  512.124025]  ? drm_mode_cursor2_ioctl+0x10/0x10
>> [  512.124070]  ? rcu_read_lock_bh_held+0xb/0x60
>> [  512.124104]  ? lock_release+0x1ef/0x2d0
>> [  512.124161]  __x64_sys_ioctl+0x8d/0xd0
>> [  512.124203]  do_syscall_64+0x58/0x80
>> [  512.124239]  ? do_syscall_64+0x67/0x80
>> [  512.124267]  ? trace_hardirqs_on_prepare+0x55/0xe0
>> [  512.124300]  ? do_syscall_64+0x67/0x80
>> [  512.124340]  ? rcu_read_lock_sched_held+0x10/0x80
>> [  512.124377]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> [  512.124411] RIP: 0033:0x7fcc4a70740f
>> [  512.124442] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>> [  512.124470] RSP: 002b:00007ffda73f5390 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> [  512.124503] RAX: ffffffffffffffda RBX: 000055cc9e474500 RCX: 00007fcc4a70740f
>> [  512.124524] RDX: 00007ffda73f5420 RSI: 00000000c01864b0 RDI: 0000000000000009
>> [  512.124544] RBP: 00007ffda73f5420 R08: 000055cc9c0b0cb0 R09: 0000000000000034
>> [  512.124564] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c01864b0
>> [  512.124584] R13: 0000000000000009 R14: 000055cc9df484d0 R15: 000055cc9af5d0c0
>> [  512.124647]  </TASK>
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/gma500/gma_display.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
>> index bd40c040a2c9..cf038e322164 100644
>> --- a/drivers/gpu/drm/gma500/gma_display.c
>> +++ b/drivers/gpu/drm/gma500/gma_display.c
>> @@ -532,15 +532,19 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
>>                 WARN_ON(drm_crtc_vblank_get(crtc) != 0);
>>
>>                 gma_crtc->page_flip_event = event;
>> +               spin_unlock_irqrestore(&dev->event_lock, flags);
>>
>>                 /* Call this locked if we want an event at vblank interrupt. */
> 
> If we don't hold the event_lock around mode_set_base() we could
> potentially get a vblank before we do the modeset. That would send the
> event prematurely. I think this is what the comment tries to tell us.

There is no way to avoid the vblank-irq and the mode_set_base() call racing
with each other and then delivering a blank event from what is actually
the page-flip which just completed.

Even with the old code, of we hold the lock over the mode_set_base() and then
the vblank-irq triggers while we are holding the lock this will block the
irq-handler until the mode_set_base() has completed (which is probably
only a couple 100s of usecs / max 1 msec) and then as soon as
gma_crtc_page_flip() releases the lock the irq-handler will continue
running and still prematurely deliver the vblank event.

In practice this is not a problem because userspace does:

-submit frame
-wait for vblank
-render new frame
-submit new frame
-wait for vblank

And the time it takes to render a new frame means that after the
first wait for vblank userspace never hits the race, unless
userspace cannot keep up (is rendering at say less then 60 fps)
in that case it may hit the race if it is only barely keeping up
and if it is only barely keeping up then userspace hitting / winning
the race is actually a good thing, because then it should start
rendering the next frame asap.

So TL;DR: we cannot avoid sometimes racing but in practice this
is not an issue. The kernel oopses this fixes OTOH are a real
issue.

I hope this helps explain why I still believe this is the right fix.

Regards,

Hans





> 
> -Patrik
> 
>>                 ret = crtc_funcs->mode_set_base(crtc, crtc->x, crtc->y, old_fb);
>>                 if (ret) {
>> -                       gma_crtc->page_flip_event = NULL;
>> -                       drm_crtc_vblank_put(crtc);
>> +                       spin_lock_irqsave(&dev->event_lock, flags);
>> +                       if (gma_crtc->page_flip_event) {
>> +                               gma_crtc->page_flip_event = NULL;
>> +                               drm_crtc_vblank_put(crtc);
>> +                       }
>> +                       spin_unlock_irqrestore(&dev->event_lock, flags);
>>                 }
>>
>> -               spin_unlock_irqrestore(&dev->event_lock, flags);
>>         } else {
>>                 ret = crtc_funcs->mode_set_base(crtc, crtc->x, crtc->y, old_fb);
>>         }
>> --
>> 2.36.1
>>
> 

