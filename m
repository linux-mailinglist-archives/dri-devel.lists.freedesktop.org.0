Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428DD729E3E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE8E10E141;
	Fri,  9 Jun 2023 15:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE3510E147
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686324203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nsr2cZkPgLFY+BaXEKzJ2aYm+vX7Td07xKrTeYMYEoc=;
 b=OL574m7nyEfel/IgtkZwJt99flnRvZzbz1niX45MwwfqndEguyDU22kYHw2Sf1TichU+vq
 FPVsTIj7P7Ou/4TP1RohIs1+6OAm2KzVUzRtVTYlUsRUef6s18tEf0YhlYTGREliZ2gm5e
 nBTVIgKNRhAJBc94eOZVsVJFww/gn5s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-5WiRQD0SPriMsSqn2bxFcA-1; Fri, 09 Jun 2023 11:23:22 -0400
X-MC-Unique: 5WiRQD0SPriMsSqn2bxFcA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30aeef6f601so684517f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 08:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686324201; x=1688916201;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nsr2cZkPgLFY+BaXEKzJ2aYm+vX7Td07xKrTeYMYEoc=;
 b=dm2WhOopa/dupIq9FWnjfBPDgcyQUZHldtq3iEzVWc5LGY13pE21Vq4ezp1iTxwKQf
 PylFHGFATixCp80Gt5vNHsN7KTInu8WhFQXXFtMEo/3mbBzmlw9WHDZqb3/iu6hUR8jG
 cj1qKZhWjpzbezWuMtq0it1oLC6jNTcMyoWHq/U2ad2tTgICBbpqGeRRPNPrtHCh1Dns
 FUxIZLv8Xi+bdGjcqjFmhFYg7PM7QRyHu1S1HZD+poYGzWseZViCHFb2BvX+r3w2OjhY
 VUf6SyTlLck/vbQrEVhOarayDvqwpErW5XtqaakN2jPDX6jk+lXQDwB8rK9+gyLYrGCE
 ZHZA==
X-Gm-Message-State: AC+VfDxB7G2Ezud6DZydYpozIJ2gkE4obRmjDRMJb+iX0pl1xdhQdolk
 TCKLYUVB5ePscCP2jghywAUuD+xFkHLQ23NHh/jOWorlbebJzls9ZaH6gQkOO19sKE6gYWsURs8
 aLAsp3iHLTLug/k84L36CPeJbXwnn
X-Received: by 2002:adf:e810:0:b0:306:41d3:fca8 with SMTP id
 o16-20020adfe810000000b0030641d3fca8mr1113847wrm.69.1686324201186; 
 Fri, 09 Jun 2023 08:23:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZMHHH6MatLz8pkCREGqaOUTj9HUgzUPc6+5IlphswX+0QGXWiSe9wV4woymoQS7vxAuzLiQ==
X-Received: by 2002:adf:e810:0:b0:306:41d3:fca8 with SMTP id
 o16-20020adfe810000000b0030641d3fca8mr1113828wrm.69.1686324200812; 
 Fri, 09 Jun 2023 08:23:20 -0700 (PDT)
Received: from [192.168.1.162] ([178.237.233.17])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d52d1000000b002c71b4d476asm4698575wrv.106.2023.06.09.08.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 08:23:20 -0700 (PDT)
Message-ID: <3ef205a7-f418-e22d-6bae-7be08f60d2f8@redhat.com>
Date: Fri, 9 Jun 2023 17:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
To: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local> <YqMH14MEqGZtujfk@phenom.ffwll.local>
From: Albert Esteve <aesteve@redhat.com>
In-Reply-To: <YqMH14MEqGZtujfk@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: krastevm@vmware.com, David Airlie <airlied@linux.ie>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/10/22 10:59, Daniel Vetter wrote:
> On Fri, Jun 10, 2022 at 10:41:05AM +0200, Daniel Vetter wrote:
>> Hi all,
>>
>> Kinda top post because the thread is sprawling and I think we need a
>> summary/restart. I think there's at least 3 issues here:
>>
>> - lack of hotspot property support, which means compositors can't really
>>    support hotspot with atomic. Which isn't entirely true, because you
>>    totally can use atomic for the primary planes/crtcs and the legacy
>>    cursor ioctls, but I understand that people might find that a bit silly :-)
>>
>>    Anyway this problme is solved by the patch set here, and I think results
>>    in some nice cleanups to boot.
>>
>> - the fact that cursors for virtual drivers are not planes, but really
>>    special things. Which just breaks the universal plane kms uapi. That
>>    part isn't solved, and I do agree with Simon and Pekka that we really
>>    should solve this before we unleash even more compositors onto the
>>    atomic paths of virtual drivers.
>>
>>    I think the simplest solution for this is:
>>    1. add a new DRM_PLANE_TYPE_VIRTUAL_CURSOR, and set that for these
>>    special cursor planes on all virtual drivers
>>    2. add the new "I understand virtual cursors planes" setparam, filter
>>    virtual cursor planes for userspace which doesn't set this (like we do
>>    right now if userspace doesn't set the universal plane mode)
>>    3. backport the above patches to all stable kernels
>>    4. make sure the hotspot property is only set on VIRTUAL_CURSOR planes
>>    and nothing else in the rebased patch series
> Simon also mentioned on irc that these special planes must not expose the
> CRTC_X/Y property, since that doesn't really do much at all. Or is our
> understanding of how this all works for commandeered cursors wrong?
>
>> - third issue: These special virtual display properties arent documented.
>>    Aside from hotspot there's also suggested X/Y and maybe other stuff. I
>>    have no idea what suggested X/Y does and what userspace should do with
>>    it. I think we need a new section for virtualized drivers which:
>>    - documents all the properties involved
>>    - documents the new cap for enabling virtual cursor planes
>>    - documents some of the key flows that compositors should implement for
>>      best experience
>>    - documents how exactly the user experience will degrade if compositors
>>      pretend it's just a normal kms driver (maybe put that into each of the
>>      special flows that a compositor ideally supports)
>>    - whatever other comments and gaps I've missed, I'm sure
>>      Simon/Pekka/others will chime in once the patch exists.
> Great bonus would be an igt which demonstrates these flows. With the
> interactive debug breakpoints to wait for resizing or whatever this should
> be all neatly possible.
> -Daniel

Hi all,

We have been testing the v2 of this patch and it works correctly for us.

First we tested with a patched Mutter, the mouse clicks were correct, 
and behavior was as expected.

But I've also added an IGT test as suggested above: 
https://gitlab.freedesktop.org/aesteve/igt-gpu-tools/-/compare/master...modeset-cursor-hotspot-test?from_project_id=1274

I could post the IGT patch upstream once Zack's patches land.

Hope that helps!

-Albert

>
>> There's a bit of fixing oopsies (virtualized drivers really shouldn't have
>> enabled universal planes for their cursors) and debt (all these properties
>> predate the push to document stuff so we need to fix that), but I don't
>> think it's too much. And I think, from reading the threads, that this
>> should cover everything?
>>
>> Anything I've missed? Or got completely wrong?
>>
>> Cheers, Daniel
>>
>> On Fri, Jun 03, 2022 at 02:14:59PM +0000, Simon Ser wrote:
>>> Hi,
>>>
>>> Please, read this thread:
>>> https://lists.freedesktop.org/archives/dri-devel/2020-March/thread.html#259615
>>>
>>> It has a lot of information about the pitfalls of cursor hotspot and
>>> other things done by VM software.
>>>
>>> In particular: since the driver will ignore the KMS cursor plane
>>> position set by user-space, I don't think it's okay to just expose
>>> without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
>>>
>>> cc wayland-devel and Pekka for user-space feedback.
>>>
>>> On Thursday, June 2nd, 2022 at 17:42, Zack Rusin <zack@kde.org> wrote:
>>>
>>>> - all userspace code needs to hardcore a list of drivers which require
>>>> hotspots because there's no way to query from drm "does this driver
>>>> require hotspot"
>>> Can you elaborate? I'm not sure I understand what you mean here.
>>>
>>> Thanks,
>>>
>>> Simon
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

