Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9DA11032
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 19:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB2310E468;
	Tue, 14 Jan 2025 18:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="FfgMk1RU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C82010E139
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 18:34:02 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3ebc678b5c9so3172109b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1736879642; x=1737484442;
 darn=lists.freedesktop.org; 
 h=mime-version:subject:user-agent:references:in-reply-to:message-id
 :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5z9YIpG06fNgQghewWIdHoaHbwOFlIlGAhWP+fV4qbw=;
 b=FfgMk1RUb+WGAPkSpm+TNdRzHJprIXGFjYSN4FbirLrw8E2N6hWq4/b9H8sYkdMtDb
 feAv5m4HMV2UnWv5a5cjVcpfgwGo/VR49mhQprQAmnIwQhE0ELzbj5r4Yu1yaT1eMdPH
 r3+jw9gSw6c5eAvUUFgdoslWk3N+oF6GJafUDYYPK606+ZeprgNJ5MzEgNyFyFWQfbLg
 v7pNLV1qzsdqrX3fn8sxOgP/u0pszqh5qc2aa7lhdAffqNiXxhzgzshpQZEe3v0/exXH
 MaYwgPGQ1oKQTuOth3ndtAyOxrpRrz8AvIJaemPlLu90mWUU4DcPbcf8qlyq5QCORUN/
 XQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736879642; x=1737484442;
 h=mime-version:subject:user-agent:references:in-reply-to:message-id
 :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5z9YIpG06fNgQghewWIdHoaHbwOFlIlGAhWP+fV4qbw=;
 b=HEU2u/KlA/utA3w6ccMWz2ZirGNfcPTVK219umZqYKVAXIvZ0/p8IU9AX7/H/e5Raa
 G/IM0VIHpwiZ+Op7mRrbEgynHwiflBg1wSZJJCsa681GGGrK3F4DGtY512uSbZhlOeHe
 i7D5VrwnpllIEIMItUKKfUayei6C3p01XtZ7TGdV3lPLer0dTJBxtgIbmaB4BzQaoeLN
 Hods/6TKToETKEbzi+t0n2n8QFhfKYt+/fqerU8VNCb4pQGlmKgo4ZAf5UwGgU6Tfy19
 QlqW9cNEVqy16MST307ZydhTlhz54BblpqJE2EJbsE4TLtTIIYf1d0LKZeQv7LtZFJhP
 r3HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTNBXUsQWWimvai3K68REzgiX5eucjZ6L+yeDyd2vo/ZPlmOIbYvC/YDMfh/Gw6XyknxmBJUM3vM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj1U1HJHiIr+KVCbss38VQQOzj+KP50TCwTwgr3z+9VcfEc+fB
 QzGRtYaTUiGQ8WUQpcq4o/9uHwCLUWrBl4mm6K1sJX2w6YWLGNtRklkgZu1Fnec=
X-Gm-Gg: ASbGncsUtVX+35bKq4rLqJHhrE3YA6FxAK1Puv0ROhgbgnrsTrFArfk6Xf5/MwISd3K
 28wWbQ+rCtL3mQ0GZQcqhYBNaqlBcSe2A0yK9dSgj9BoOKe3uDXXJFNx13zO9iaXXwJOetLOJYD
 EFpdU9pO9Y81O1W1yuLmR5nCVk6XnxrOhDAbr5X/pOI/b354F+VYHbJ5M0no5J91OTSKtC3WlrZ
 O+GuGjcuXelNoZUYgfpZyj7Di1Df4iZDulDPCGcTWANx6x2Vq9n0JkCvQ==
X-Google-Smtp-Source: AGHT+IFoEp0/+Yuj1srsUfF1ZalEAFX9wVCGOOLDePc4RDOLlKSutwJ0TvX3r8g5sq9NB9AB4TbTWg==
X-Received: by 2002:a05:6808:1928:b0:3e7:5cfa:87d1 with SMTP id
 5614622812f47-3ef2ed70cbamr16155504b6e.27.1736879641570; 
 Tue, 14 Jan 2025 10:34:01 -0800 (PST)
Received: from [192.168.5.206] ([136.62.142.9])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f03769a5aesm4260137b6e.28.2025.01.14.10.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 10:33:59 -0800 (PST)
From: Faith Ekstrand <faith@gfxstrand.net>
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 James Jones <jajones@nvidia.com>
CC: Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?B?TWljaGVsIETDpG56ZXI=?= <michel.daenzer@mailbox.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "amd-gfx mailing list" <amd-gfx@lists.freedesktop.org>,
 "ML Mesa-dev" <mesa-dev@lists.freedesktop.org>, <nd@arm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Date: Tue, 14 Jan 2025 12:33:57 -0600
Message-ID: <19466180208.28b9.76a0d8c26856b44b62c020e2e9d89f6d@gfxstrand.net>
In-Reply-To: <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="194661804563f1328b953bb77c"
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

This is a multi-part message in MIME format.
--194661804563f1328b953bb77c
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On January 14, 2025 03:39:45 Marek Olšák <maraeo@gmail.com> wrote:
> I would keep the existing modifier interfaces, API extensions, and 
> expectations the same as today for simplicity.
>
> The new linear modifier definition (proposal) will have these fields:
>   5 bits for log2 pitch alignment in bytes
>   5 bits for log2 height alignment in rows
>
>   5 bits for log2 offset alignment in bytes
>   5 bits for log2 minimum pitch in bytes
>
>   5 bits for log2 minimum (2D) image size in bytes

I'm not strictly opposed to adding a new modifier or two but this seems 
massively over-designed. First off, no one uses anything but simple 2D 
images for WSI and BOs are allocated in units of 4k pages so 2, 4, and 5 
can go. If we assume pitch alignment and offset alignment are the same (and 
offset is almost always 0 anyway), 3 can go.

Even with that, I'm struggling to see how useful this is. My understanding 
is that you're trying to solve a problem where you need an exact 64-byte 
alignment for some AMD scanout stuff. That's not even possible to support 
on Nvidia (minimum alignment is 128B) so practically you're looking at one 
modifier that's shared between AMD and Intel. Why can't we just add an AMD 
modifier, make Intel support it, and move on?

Otherwise we're massively exploding the modifier space for... Why? Intel 
will have to advertise basically all of them. Nvidia will advertise most of 
them. AMD will advertise something. And now apps have tens of thousands of 
modifiers to sort through when we could have just added one and solved the 
problem.

~Faith


>
>
>
> The pitch and the image size in bytes are no longer arbitrary values. They 
> are fixed values computed from {width, height, bpp, modifier} as follows:
>   aligned_width = align(width * bpp / 8, 1 << log2_pitch_alignment);
>
>   aligned_height = align(height, 1 << log2_height_alignment);
>   pitch = max(1 << log2_minimum_pitch, aligned_width);
>
>   image_size = max(1 << log2_minimum_image_size, pitch * aligned_height);
>
>
> The modifier defines the layout exactly and non-ambiguously. Overaligning 
> the pitch or height is not supported. Only the offset alignment has some 
> freedom regarding placement. Drivers can expose whatever they want within 
> that definition, even exposing only 1 linear modifier is OK. Then, you can 
> look at modifiers of other drivers if you want to find commonalities.
>
>
> DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from detecting 
> whether 2 devices have 0 compatible memory layouts, which is a useful thing 
> to know.
>
>
> Marek
>
>
>
> On Fri, Jan 10, 2025 at 4:23 PM James Jones <jajones@nvidia.com> wrote:
>
> On 12/19/24 10:03, Simona Vetter wrote:
>> On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:
>>> On Wed, 18 Dec 2024 at 10:32, Brian Starkey <brian.starkey@arm.com> wrote:
>>>> On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
>>>>> For that reason I think linear modifiers with explicit pitch/size
>>>>> alignment constraints is a sound concept and fits into how modifiers work
>>>>> overall.
>>>>
>>>> Could we make it (more) clear that pitch alignment is a "special"
>>>> constraint (in that it's really a description of the buffer layout),
>>>> and that constraints in-general shouldn't be exposed via modifiers?
>>>
>>> It's still worryingly common to see requirements for contiguous
>>> allocation, if for no other reason than we'll all be stuck with
>>> Freescale/NXP i.MX6 for a long time to come. Would that be in scope
>>> for expressing constraints via modifiers as well, and if so, should we
>>> be trying to use feature bits to express this?
>>>
>>> How this would be used in practice is also way too underdocumented. We
>>> need to document that exact-round-up 64b is more restrictive than
>>> any-multiple-of 64b is more restrictive than 'classic' linear. We need
>>> to document what people should advertise - if we were starting from
>>> scratch, the clear answer would be that anything which doesn't care
>>> should advertise all three, anything advertising any-multiple-of
>>> should also advertise exact-round-up, etc.
>>>
>>> But we're not starting from scratch, and since linear is 'special',
>>> userspace already has explicit knowledge of it. So AMD is going to
>>> have to advertise LINEAR forever, because media frameworks know about
>>> DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
>>> that the buffer is linear. That and not breaking older userspace
>>> running in containers or as part of a bisect or whatever.
>>>
>>> There's also the question of what e.g. gbm_bo_get_modifier() should
>>> return. Again, if we were starting from scratch, most restrictive
>>> would make sense. But we're not, so I think it has to return LINEAR
>>> for maximum compatibility (because modifiers can't be morphed into
>>> other ones for fun), which further cements that we're not removing
>>> LINEAR.
>>>
>>> And how should allocators determine what to go for? Given that, I
>>> think the only sensible semantics are, when only LINEAR has been
>>> passed, to pick the most restrictive set possible; when LINEAR
>>> variants have been passed as well as LINEAR, to act as if LINEAR were
>>> not passed at all.
>>
>> Yeah I think this makes sense, and we'd need to add that to the kerneldoc
>> about how drivers/apps/frameworks need to work with variants of LINEAR.
>>
>> Just deprecating LINEAR does indeed not work. The same way it was really
>> hard slow crawl (and we're still not there everywhere, if you include
>> stuff like bare metal Xorg) trying to retire the implied modifier. Maybe,
>> in an extremely bright future were all relevant drivers advertise a full
>> set of LINEAR variants, and all frameworks understand them, we'll get
>> there. But if AMD is the one special case that really needs this I don't
>> think it's realistic to plan for that, and what Daniel describe above
>> looks like the future we're stuck to.
>> -Sima
>
> I spent some time thinking about this over the break, because on a venn
> diagram it does overlap a sliver of the work we've done to define the
> differences between the concepts of constraints Vs. capabilities in the
> smorgasbord of unified memory allocator talks/workshops/prototypes/etc.
> over the years. I'm not that worried about some overlap being
> introduced, because every reasonable rule deserves an exception here and
> there, but I have concerns similar to Daniel's and Brian's.
>
> Once you start adding more than one special modifier, some things in the
> existing usage start to break down. Right now you can naively pass
> around modifiers, then somewhere either before or just after allocation
> depending on your usage, check if LINEAR is available and take your
> special "I can parse this thing" path, for whatever that means in your
> special use case. Modifying all those paths to include one variant of
> linear is probably OK-but-not-great. Modifying all those paths to
> include <N> variants of linear is probably unrealistic, and I do worry
> about slippery slopes here.
>
> ---
>
> What got me more interested though was this led to another thought. At
> first I didn't notice that this was an exact-match constraint and
> thought it meant the usual alignment constraint of >=, and I was
> concerned about how future variants would interact poorly. It could
> still be a concern if things progress down this route, and we have
> vendor A requiring >= 32B alignment and vendor B requiring == 64B
> alignment. They're compatible, but modifiers expressing this would
> naively cancel each-other out unless vendor A proactively advertised ==
> 64B linear modifiers too. This isn't a huge deal at that scale, but it
> could get worse, and it got me thinking about a way to solve the problem
> of a less naive way to merge modifier lists.
>
> As a background, the two hard problems left with implementing a
> constraint system to sit alongside the format modifier system are:
>
> 1) A way to name special heaps (E.g., local vidmem on device A) in the
> constraints in a way that spans process boundaries using some sort of
> identifier. There are various ways to solve this. Lately the thinking is
> something around dma heaps, but no one's fleshed it out yet that I'm aware.
>
> 2) A transport that doesn't require us to revise every userspace API,
> kernel API, and protocol that got revised to support DRM format
> modifiers, and every API/protocol introduced since.
>
> I haven't seen any great ideas for the latter problem yet, but what if
> we did this:
>
> - Introduced a new DRM format modifier vendor that was actually
> vendor-agnostic, but implied the format modifier was a constraint
> definition fragment instead of an actual modifier.
>
> - Constraint-aware code could tack on its constraints (The ones it
> requires and/or the ones it can support allocating) as a series of
> additional modifiers using this vendor code. A given constraint might be
> fragmented into multiple modifiers, but their definition and
> serialization/deserialization mechanism could be defined in drm_fourcc.h
> as macros all the clients could use.
>
> - Existing non-constraint-aware code in a modifier usage chain might
> filter these modifiers out using the existing strict intersection logic.
> Hence, any link in the chain not aware of constraints would likely block
> their use, but that's OK. We're muddling along without them now. It
> wouldn't make those situations any worse.
>
> - New code would be required to use some minimal library (Header-only
> perhaps, as Simon and I proposed a few years ago) to intersect format
> modifier lists instead, and this code would parse out the constraint
> modifiers from each input list and use the envisioned per-constraint
> logic to merge them. It would result in yet another merged
> modifier+constraint list encoded as a list of modifiers that could be
> passed along through any format-modifier-aware API.
>
> - One consideration that would be sort of tricky is that constraints are
> supposed to be advertised per-modifier, so you'd have to have a way to
> associate constraint modifiers in a given set with real modifiers in
> that set or in general. This is easily solved though. Some bits of the
> constraint modifiers would already need to be used to associate and
> order constraint fragments during deserialization, since modifier lists
> aren't strictly ordered.
>
> This effectively allows you to use format modifiers to encode
> arbitrarily complex constraint mechanisms by piggybacking on the
> existing format modifier definition and transport mechanisms without
> breaking backwards compatibility. It's a little dirty, because modifiers
> are being abused to implement a raw bitstream, but modifiers and
> constraints are related concepts, so it's not a complete hack. It still
> requires modifying all the implementations in the system to fully make
> use of constraints, but doesn't require e.g. revising X11 DRI3 protocol
> again to tunnel them through Xwayland, and in situations where the
> constraint-aware thing sits downstream of the non-constraint-aware thing
> in the allocation pipeline, you could get some benefit even when all the
> upstream things aren't updated yet, because it could still merge in its
> local constraints before allocating or passing the modifier list down
> the chain.
>
> Does this seem like something worth pursuing to others? I've been trying
> to decide how to best move the allocation constraints efforts forward,
> so it's potentially something I could put some time into this year.
>
> Thanks,
> -James


--194661804563f1328b953bb77c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 10pt;">On January 14, 2025 03:3=
9:45 Marek Ol=C5=A1=C3=A1k &lt;maraeo@gmail.com&gt; wrote:</span></div><div=
 id=3D"aqm-original" style=3D"color: black;"><div class=3D"aqm-original-bod=
y"><div style=3D"color: black;">
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"ltr"><div>I would keep the existing modifier interfaces, API ex=
tensions, and expectations the same as today for simplicity.</div><div><br>=
</div><div><div>The new linear modifier definition (proposal) will have the=
se fields:</div><div>&nbsp;&nbsp; 5 bits for log2 pitch alignment in bytes<=
/div><div>&nbsp;&nbsp; 5 bits for log2 height alignment in rows<br></div><d=
iv>&nbsp;&nbsp; 5 bits for log2 offset alignment in bytes</div><div><div>&n=
bsp;&nbsp; 5 bits for log2 minimum pitch in bytes<br></div><div><div>&nbsp;=
&nbsp; 5 bits for log2 minimum (2D) image size in bytes</div></div></div></=
div></div></blockquote></div></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I'm not strictly opposed to adding a new modifier or two but th=
is seems massively over-designed. First off, no one uses anything but simpl=
e 2D images for WSI and BOs are allocated in units of 4k pages so 2, 4, and=
 5 can go. If we assume pitch alignment and offset alignment are the same (=
and offset is almost always 0 anyway), 3 can go.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Even with that, I'm struggling to see how useful t=
his is. My understanding is that you're trying to solve a problem where you=
 need an exact 64-byte alignment for some AMD scanout stuff. That's not eve=
n possible to support on Nvidia (minimum alignment is 128B) so practically =
you're looking at one modifier that's shared between AMD and Intel. Why can=
't we just add an AMD modifier, make Intel support it, and move on?&nbsp;</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Otherwise we're massively=
 exploding the modifier space for... Why? Intel will have to advertise basi=
cally all of them. Nvidia will advertise most of them. AMD will advertise s=
omething. And now apps have tens of thousands of modifiers to sort through =
when we could have just added one and solved the problem.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">~Faith&nbsp;</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: b=
lack;" dir=3D"auto"><div class=3D"aqm-original-body"><div style=3D"color: b=
lack;"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0=
 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;"><div dir=
=3D"ltr"><div><div><div><div><br></div><div><br></div></div></div><div>The
 pitch and the image size in bytes are no longer arbitrary values. They=20
are fixed values computed from {width, height, bpp, modifier} as=20
follows:</div><div>&nbsp;&nbsp; aligned_width =3D align(width * bpp / 8, 1 =
&lt;&lt; log2_pitch_alignment);<br></div><div>&nbsp;&nbsp; aligned_height =
=3D align(height, 1 &lt;&lt; log2_height_alignment);</div><div>&nbsp;&nbsp;=
 pitch =3D max(1 &lt;&lt; log2_minimum_pitch, aligned_width);<br></div><div=
>&nbsp;&nbsp; image_size =3D max(1 &lt;&lt; log2_minimum_image_size, pitch =
* aligned_height);<br></div><div></div><div><br></div><div>The
 modifier defines the layout exactly and non-ambiguously. Overaligning the =
pitch or height is not supported. Only the=20
offset alignment has some freedom regarding placement. Drivers can
 expose whatever they want within that definition, even exposing only 1 lin=
ear modifier is OK. Then, you can look at modifiers of other drivers if you=
 want to find commonalities.<br></div><div><br></div></div><div>DRM_FORMAT_=
MOD_LINEAR needs to go because it prevents apps from detecting whether 2 de=
vices have 0 compatible memory layouts, which is a useful thing to know.<br=
></div><div><br></div><div>Marek<br></div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan=
 10, 2025 at 4:23=E2=80=AFPM James Jones &lt;<a href=3D"mailto:jajones@nvid=
ia.com">jajones@nvidia.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 12/19/24 10:03, Simona Vetter wrote:<br>
&gt; On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:<br>
&gt;&gt; On Wed, 18 Dec 2024 at 10:32, Brian Starkey &lt;<a href=3D"mailto:=
brian.starkey@arm.com" target=3D"_blank">brian.starkey@arm.com</a>&gt; wrot=
e:<br>
&gt;&gt;&gt; On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:=
<br>
&gt;&gt;&gt;&gt; For that reason I think linear modifiers with explicit pit=
ch/size<br>
&gt;&gt;&gt;&gt; alignment constraints is a sound concept and fits into how=
 modifiers work<br>
&gt;&gt;&gt;&gt; overall.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Could we make it (more) clear that pitch alignment is a "speci=
al"<br>
&gt;&gt;&gt; constraint (in that it's really a description of the buffer la=
yout),<br>
&gt;&gt;&gt; and that constraints in-general shouldn't be exposed via modif=
iers?<br>
&gt;&gt;<br>
&gt;&gt; It's still worryingly common to see requirements for contiguous<br=
>
&gt;&gt; allocation, if for no other reason than we'll all be stuck with<br=
>
&gt;&gt; Freescale/NXP i.MX6 for a long time to come. Would that be in scop=
e<br>
&gt;&gt; for expressing constraints via modifiers as well, and if so, shoul=
d we<br>
&gt;&gt; be trying to use feature bits to express this?<br>
&gt;&gt;<br>
&gt;&gt; How this would be used in practice is also way too underdocumented=
. We<br>
&gt;&gt; need to document that exact-round-up 64b is more restrictive than<=
br>
&gt;&gt; any-multiple-of 64b is more restrictive than 'classic' linear. We =
need<br>
&gt;&gt; to document what people should advertise - if we were starting fro=
m<br>
&gt;&gt; scratch, the clear answer would be that anything which doesn't car=
e<br>
&gt;&gt; should advertise all three, anything advertising any-multiple-of<b=
r>
&gt;&gt; should also advertise exact-round-up, etc.<br>
&gt;&gt;<br>
&gt;&gt; But we're not starting from scratch, and since linear is 'special'=
,<br>
&gt;&gt; userspace already has explicit knowledge of it. So AMD is going to=
<br>
&gt;&gt; have to advertise LINEAR forever, because media frameworks know ab=
out<br>
&gt;&gt; DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they kn=
ow<br>
&gt;&gt; that the buffer is linear. That and not breaking older userspace<b=
r>
&gt;&gt; running in containers or as part of a bisect or whatever.<br>
&gt;&gt;<br>
&gt;&gt; There's also the question of what e.g. gbm_bo_get_modifier() shoul=
d<br>
&gt;&gt; return. Again, if we were starting from scratch, most restrictive<=
br>
&gt;&gt; would make sense. But we're not, so I think it has to return LINEA=
R<br>
&gt;&gt; for maximum compatibility (because modifiers can't be morphed into=
<br>
&gt;&gt; other ones for fun), which further cements that we're not removing=
<br>
&gt;&gt; LINEAR.<br>
&gt;&gt;<br>
&gt;&gt; And how should allocators determine what to go for? Given that, I<=
br>
&gt;&gt; think the only sensible semantics are, when only LINEAR has been<b=
r>
&gt;&gt; passed, to pick the most restrictive set possible; when LINEAR<br>
&gt;&gt; variants have been passed as well as LINEAR, to act as if LINEAR w=
ere<br>
&gt;&gt; not passed at all.<br>
&gt; <br>
&gt; Yeah I think this makes sense, and we'd need to add that to the kernel=
doc<br>
&gt; about how drivers/apps/frameworks need to work with variants of LINEAR=
.<br>
&gt; <br>
&gt; Just deprecating LINEAR does indeed not work. The same way it was real=
ly<br>
&gt; hard slow crawl (and we're still not there everywhere, if you include<=
br>
&gt; stuff like bare metal Xorg) trying to retire the implied modifier. May=
be,<br>
&gt; in an extremely bright future were all relevant drivers advertise a fu=
ll<br>
&gt; set of LINEAR variants, and all frameworks understand them, we'll get<=
br>
&gt; there. But if AMD is the one special case that really needs this I don=
't<br>
&gt; think it's realistic to plan for that, and what Daniel describe above<=
br>
&gt; looks like the future we're stuck to.<br>
&gt; -Sima<br>
<br>
I spent some time thinking about this over the break, because on a venn <br=
>
diagram it does overlap a sliver of the work we've done to define the <br>
differences between the concepts of constraints Vs. capabilities in the <br=
>
smorgasbord of unified memory allocator talks/workshops/prototypes/etc. <br=
>
over the years. I'm not that worried about some overlap being <br>
introduced, because every reasonable rule deserves an exception here and <b=
r>
there, but I have concerns similar to Daniel's and Brian's.<br>
<br>
Once you start adding more than one special modifier, some things in the <b=
r>
existing usage start to break down. Right now you can naively pass <br>
around modifiers, then somewhere either before or just after allocation <br=
>
depending on your usage, check if LINEAR is available and take your <br>
special "I can parse this thing" path, for whatever that means in your <br>
special use case. Modifying all those paths to include one variant of <br>
linear is probably OK-but-not-great. Modifying all those paths to <br>
include &lt;N&gt; variants of linear is probably unrealistic, and I do worr=
y <br>
about slippery slopes here.<br>
<br>
---<br>
<br>
What got me more interested though was this led to another thought. At <br>
first I didn't notice that this was an exact-match constraint and <br>
thought it meant the usual alignment constraint of &gt;=3D, and I was <br>
concerned about how future variants would interact poorly. It could <br>
still be a concern if things progress down this route, and we have <br>
vendor A requiring &gt;=3D 32B alignment and vendor B requiring =3D=3D 64B =
<br>
alignment. They're compatible, but modifiers expressing this would <br>
naively cancel each-other out unless vendor A proactively advertised =3D=3D=
 <br>
64B linear modifiers too. This isn't a huge deal at that scale, but it <br>
could get worse, and it got me thinking about a way to solve the problem <b=
r>
of a less naive way to merge modifier lists.<br>
<br>
As a background, the two hard problems left with implementing a <br>
constraint system to sit alongside the format modifier system are:<br>
<br>
1) A way to name special heaps (E.g., local vidmem on device A) in the <br>
constraints in a way that spans process boundaries using some sort of <br>
identifier. There are various ways to solve this. Lately the thinking is <b=
r>
something around dma heaps, but no one's fleshed it out yet that I'm aware.=
<br>
<br>
2) A transport that doesn't require us to revise every userspace API, <br>
kernel API, and protocol that got revised to support DRM format <br>
modifiers, and every API/protocol introduced since.<br>
<br>
I haven't seen any great ideas for the latter problem yet, but what if <br>
we did this:<br>
<br>
- Introduced a new DRM format modifier vendor that was actually <br>
vendor-agnostic, but implied the format modifier was a constraint <br>
definition fragment instead of an actual modifier.<br>
<br>
- Constraint-aware code could tack on its constraints (The ones it <br>
requires and/or the ones it can support allocating) as a series of <br>
additional modifiers using this vendor code. A given constraint might be <b=
r>
fragmented into multiple modifiers, but their definition and <br>
serialization/deserialization mechanism could be defined in drm_fourcc.h <b=
r>
as macros all the clients could use.<br>
<br>
- Existing non-constraint-aware code in a modifier usage chain might <br>
filter these modifiers out using the existing strict intersection logic. <b=
r>
Hence, any link in the chain not aware of constraints would likely block <b=
r>
their use, but that's OK. We're muddling along without them now. It <br>
wouldn't make those situations any worse.<br>
<br>
- New code would be required to use some minimal library (Header-only <br>
perhaps, as Simon and I proposed a few years ago) to intersect format <br>
modifier lists instead, and this code would parse out the constraint <br>
modifiers from each input list and use the envisioned per-constraint <br>
logic to merge them. It would result in yet another merged <br>
modifier+constraint list encoded as a list of modifiers that could be <br>
passed along through any format-modifier-aware API.<br>
<br>
- One consideration that would be sort of tricky is that constraints are <b=
r>
supposed to be advertised per-modifier, so you'd have to have a way to <br>
associate constraint modifiers in a given set with real modifiers in <br>
that set or in general. This is easily solved though. Some bits of the <br>
constraint modifiers would already need to be used to associate and <br>
order constraint fragments during deserialization, since modifier lists <br=
>
aren't strictly ordered.<br>
<br>
This effectively allows you to use format modifiers to encode <br>
arbitrarily complex constraint mechanisms by piggybacking on the <br>
existing format modifier definition and transport mechanisms without <br>
breaking backwards compatibility. It's a little dirty, because modifiers <b=
r>
are being abused to implement a raw bitstream, but modifiers and <br>
constraints are related concepts, so it's not a complete hack. It still <br=
>
requires modifying all the implementations in the system to fully make <br>
use of constraints, but doesn't require e.g. revising X11 DRI3 protocol <br=
>
again to tunnel them through Xwayland, and in situations where the <br>
constraint-aware thing sits downstream of the non-constraint-aware thing <b=
r>
in the allocation pipeline, you could get some benefit even when all the <b=
r>
upstream things aren't updated yet, because it could still merge in its <br=
>
local constraints before allocating or passing the modifier list down <br>
the chain.<br>
<br>
Does this seem like something worth pursuing to others? I've been trying <b=
r>
to decide how to best move the allocation constraints efforts forward, <br>
so it's potentially something I could put some time into this year.<br>
<br>
Thanks,<br>
-James<br>
</blockquote></div>
</blockquote>
</div>
</div>
<!-- body end -->

</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--194661804563f1328b953bb77c--

