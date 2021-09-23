Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B8415A56
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 10:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5606E0EF;
	Thu, 23 Sep 2021 08:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F786E0EF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632387130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=thEWeBX8tJD0SvZZtTtoLtQGEuAX1oktQdocHUgzcPo=;
 b=gARs9fNP0xovNNTzgTFLlcd65Hi2+8dRSOvesqjtb8p7X2St07lCK8pT640meD2Q4ew0hF
 VYyJmFcPOAEBp+F4beWPAQli8igfU/8vDSySJvuorFJc2oNQoihTDuMfSGShh8RkIJZL7O
 fguY8CfgSdlzbrtFqx1z0xycfY9u9OA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-O6FEh-AFNQiu5KtatZ22pQ-1; Thu, 23 Sep 2021 04:52:09 -0400
X-MC-Unique: O6FEh-AFNQiu5KtatZ22pQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 r7-20020aa7c147000000b003d1f18329dcso6112211edp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 01:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=thEWeBX8tJD0SvZZtTtoLtQGEuAX1oktQdocHUgzcPo=;
 b=xV2nBLwhLLIOZXAZJpzzrx53n/NF9ayoQzTjnzopjsqEdEd7I6VdOzn2+DXQf+JF0t
 Iwx5q3ROIDTAXVFY8cXVfTp+TKVCx37L6k2dF1eFM55RB0986dLCp1ODjvYvLPqlSnTx
 NN5xXzi4WXMEZQQ98G6alEj2Gfisg344hGVexjdL/FhPVGWxdCzZAEwXPTs06PWlWqXS
 aKVot76d4eqsVuplb269ou1eNS/PC9tmfJeIIILnkKId7yufHfA0iHTOoJ8CTFC/Ez+8
 M98J9mzFGRMN3vylyEj8oxx4T84zr4L9v6GDKJAhlpfGz1TFjomciGGdwAb6Ps7HNQ6d
 96rQ==
X-Gm-Message-State: AOAM532s5qB77P/TDY9UoERMJzEjlonQD2mD/fSZg4fQNXbvLnc2Eh5w
 PPlKHLvzb5Lcwl6jfD5fwAEz9nx1EOnz+atRv5JwY8qSGx54eDbx4aDjnu66calZI/A2yfOG9EE
 4RKh1Zon+DTbFt8nZahO93nfPPGuZSK5MZLaPst9d0va1n76s5Du3FGaIUVrQJ4TYB+XQ+7I4K7
 uXl/RI
X-Received: by 2002:a50:e0c9:: with SMTP id j9mr4103836edl.336.1632387127255; 
 Thu, 23 Sep 2021 01:52:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe0V5tMds6DeC2YQWb7hiTji4vCR4fTE/kfq6PcFgpbKJ/ORvv0zj2UPvmB5+MOKlux3UA2w==
X-Received: by 2002:a50:e0c9:: with SMTP id j9mr4103811edl.336.1632387126894; 
 Thu, 23 Sep 2021 01:52:06 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id f4sm2565732ejf.61.2021.09.23.01.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 01:52:06 -0700 (PDT)
Subject: Re: Handling DRM master transitions cooperatively
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dennis Filder <d.filder@web.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
 <20210909103703.09a573e4@eldfell> <YUCncex3woPlAhI6@phenom.ffwll.local>
 <20210922115657.17006ed1@eldfell>
 <3195aecb-833f-9f8f-efad-51d80da6f4dc@redhat.com>
 <20210923112300.0a40480d@eldfell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <09a93c12-275e-92de-e12c-3d6cc116c591@redhat.com>
Date: Thu, 23 Sep 2021 10:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923112300.0a40480d@eldfell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/23/21 10:23 AM, Pekka Paalanen wrote:
> On Wed, 22 Sep 2021 11:21:16 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi,
>>
>> On 9/22/21 10:56 AM, Pekka Paalanen wrote:
>>> On Tue, 14 Sep 2021 15:45:21 +0200
>>> Daniel Vetter <daniel@ffwll.ch> wrote:
>>>   
>>>> On Thu, Sep 09, 2021 at 10:37:03AM +0300, Pekka Paalanen wrote:  
>>>>> On Wed, 8 Sep 2021 18:27:09 +0200
>>>>> Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>     
>>>>>> On Wed, Sep 8, 2021 at 9:36 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:    
>>>>>>>
>>>>>>> On Tue, 7 Sep 2021 14:42:56 +0200
>>>>>>> Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>      
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 9/7/21 12:07 PM, Pekka Paalanen wrote:      
>>>>>>>>> On Fri, 3 Sep 2021 21:08:21 +0200
>>>>>>>>> Dennis Filder <d.filder@web.de> wrote:
>>>>>>>>>      
>>>>>>>>>> Hans de Goede asked me to take a topic from a private discussion here.
>>>>>>>>>> I must also preface that I'm not a graphics person and my knowledge of
>>>>>>>>>> DRI/DRM is cursory at best.
>>>>>>>>>>
>>>>>>>>>> I initiated the conversation with de Goede after learning that the X
>>>>>>>>>> server now supports being started with an open DRM file descriptor
>>>>>>>>>> (this was added for Keith Packard's xlease project).  I wondered if
>>>>>>>>>> that could be used to smoothen the Plymouth->X transition somehow and
>>>>>>>>>> asked de Goede if there were any such plans.  He denied, but mentioned
>>>>>>>>>> that a new ioctl is in the works to prevent the kernel from wiping the
>>>>>>>>>> contents of a frame buffer after a device is closed, and that this
>>>>>>>>>> would help to keep transitions smooth.      
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> I believe the kernel is not wiping anything on device close. If
>>>>>>>>> something in the KMS state is wiped, it originates in userspace:
>>>>>>>>>
>>>>>>>>> - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
>>>>>>>>>   output off, you need to be careful to "leak" your FB if you want a
>>>>>>>>>   smooth hand-over)      
>>>>>>>>
>>>>>>>> The "kernel is not wiping anything on device close" is not true,
>>>>>>>> when closing /dev/dri/card# any remaining FBs from the app closing
>>>>>>>> it will be dealt with as if they were RmFB-ed, causing the screen
>>>>>>>> to show what I call "the fallback fb", at least with the i915 driver.      
>>>>>>>
>>>>>>> No, that's not what should happen AFAIK.
>>>>>>>
>>>>>>> True, all FBs that are not referenced by active CRTCs or planes will
>>>>>>> get freed, since their refcount drops to zero, but those CRTCs and
>>>>>>> planes that are active will remain active and therefore keep their
>>>>>>> reference to the respective FBs and so the FBs remain until replaced or
>>>>>>> turned off explicitly (by e.g. fbcon if you switch to that rather than
>>>>>>> another userspace KMS client). I believe that is the whole reason why
>>>>>>> e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS client
>>>>>>> would not have anything to scrape.
>>>>>>>
>>>>>>> danvet, what is the DRM core intention?      
>>>>>>
>>>>>> Historical accidents mostly. There's two things that foil easy
>>>>>> handover to the next compositor:
>>>>>> - RMFB instead of CLOSEFB semantics, especially when closing the
>>>>>> drmfd. This is uapi, so anything we change needs to be opt-in    
>>>>>
>>>>> What does this mean and refer to?
>>>>>
>>>>> Are you trying to say, that closing the DRM device fd (freeing the file
>>>>> description) causes an implicit RmFB on all the FBs tied to that DRM
>>>>> device file description?
>>>>>
>>>>> I never realised that before.    
>>>>
>>>> Yes, final close does iterate over fb and do an RMFB. Which is why we've
>>>> had this discussion whether closefb semantics should be an ADDFB2 flag at
>>>> creation time instead.  
>>>
>>> Hi Daniel,
>>>
>>> such flag would make sense to me.  
>>
>> Hmm, I was thinking having a separate call to mark a FB to switch to
>> closefb semantics. But both plymouth (because of end of animation)
>> and GNOME (because a mostly empty gnome-shell needs to be rendered
>> to avoid leaking privacy sensitive info) will need to prepare a
>> special FB on exit anyways, so then an ADDFB2 flag would work fine.
>>
>> I would be happy to work on the plymouth side of this, so that we
>> have at least one consumer of such a flag lined up for merging.
> 
> Right, but I'm thinking this from the other side: why would anyone
> deliberately *want* RmFB semantics on device close?

Device-close also happens on application crashes. So basically
any time where the app (typically a display-server) may display
privacy sensitive contents which we don't want to leak to other
apps, we want RmFB semantics on close.

ATM e.g. GNOME just leaves everything on the screen in place
at logout / shutdown. So "apps" are definitely going to need to
have some work done to them to make sure that from a privacy
pov it is safe to leave the FB in place after they exit.

> I can't think of any, and hence I would be inclined to assume that
> userspace would just switch to using closefb semantics for everything
> all the time.
> 
> Legacy userspace is one thing, but userspace that is updated to set
> closefb semantics will also be aware of what closefb means: it leaves
> the FBs up and CRTCs and planes enabled, if you leave them like that.
> So if they don't want that, they know they should not do that.
> 
> Asking in another way: why would the same program sometimes use RmFB
> semantics and sometimes closefb semantics? Even more so, why would one
> switch an FB from one to the other?
> 
> Hmm... to prevent leaking sensitive FBs on crash, perhaps?

Right, I should have read your whole email before responding.

> But you can
> do that decision at AddFB2 time, right?

Yes I believe so.

> Maybe not, as you can't really
> force EGL to allocate a new buffer at will.

It does not need to be a new buffer as long as we are sure it has
safe contents in it, there will need to be a special render path
for rendering a "safe" desktop view on logout and once that
rendering has completed to a buffer, then that buffer can be
considered safe I guess (note I don't have a whole lot of
experience with EGL).

> Oh, but when EGL gives me a
> buffer that I know is safe to leave up, I also know that it is not up
> on any KMS plane (no front buffer rendering), so I can just RmFB and
> AddFB2 again. That's a bit of a detour though.
> 
> At least a separate ioctl on an FB would be more flexible than a flag
> at AddFB2.
> 
> Btw. what happens if I try to AddFB2 the same buffer twice?

These questions are best answered by someone who knows this stuff
better then me...

Regards,

Hans

