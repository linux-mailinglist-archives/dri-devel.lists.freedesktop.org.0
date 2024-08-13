Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AB950D6E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D0A10E072;
	Tue, 13 Aug 2024 19:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=johnrowley.me header.i=@johnrowley.me header.b="N2qZQ7kW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 583 seconds by postgrey-1.36 at gabe;
 Tue, 13 Aug 2024 17:34:51 UTC
Received: from mail.vapourmail.eu (mail.vapourmail.eu [5.75.183.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8139710E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:34:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB5BFC2697; Tue, 13 Aug 2024 19:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnrowley.me;
 s=dkim; t=1723569905;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=xdXzcgdjm8y6Vk8alVXfL09El/KuymXya5PjdqPpRzw=;
 b=N2qZQ7kW5fusxS2OisfvqSEz7EiLrmtt0QvEQjqzzaJqQnT9f0JxPcJB3SB4wv1MASJn1v
 lX7Sa4JUluC57rJW5Nmf8qlb1QUei4Zi2r/mb3VDarhHenyj8eKRKC682OkrctKfBZCHHA
 DEaE/x+L8ZOrJ6mM4DEVS2jDLFaNDhqRqA9884iMm4XBwPBykPLlnxiqt9FkMenFtOvljb
 chwaqPAHForsIF1n9hl0hnMr1yevnwEBgN8hNsmEACqhNW310JtaVIsmx3K0XWgbvTsax9
 6GVfd6vI/lGsj+3eGuFs++Mygt0UlzVb/GBxPOKWJYbX5xXs6bZ5nDNFeP+NUw==
Message-ID: <40b12fd6-66d9-44cd-b86c-8ae14c846ed3@johnrowley.me>
Date: Tue, 13 Aug 2024 18:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bisected/regression: choopy youtube video on Ryzen IGP -
 0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yanko Kaneti <yaneti@declera.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Li Jingxiang <jingxiang.li@ecarxgroup.com>
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
 <26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com>
 <a7dc49b7-0da2-4fbf-a045-1bcd72ebaa8c@amd.com>
 <43b8f01904131c9d3461436c0d1c916663f721e2.camel@declera.com>
 <fc75ca479e78f0f7baf9a7442b9907c588647fb8.camel@declera.com>
 <0df2b2b3-561d-4dc7-89ab-8c8a3bc2ee9e@amd.com>
Content-Language: en-GB
From: John Rowley <lkml@johnrowley.me>
In-Reply-To: <0df2b2b3-561d-4dc7-89ab-8c8a3bc2ee9e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 13 Aug 2024 19:55:46 +0000
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

Apologies for resurrecting an old thread, but I'm experiencing the same issue.

For me it manifests mostly as choppy scrolling in Mullvad Browser (Flatpak),
also Firefox.

E.g. on https://github.com/dandavison/delta, when trackpad flick-scrolling down
the page, it's quite smooth up until the sections headed "Line numbers" and
"Merge conflicts", there the scrolling hangs for maybe half a sec, then
continues onwards.

I've yet to debug further why these sections in particular trip up scrolling.
But it happens on other websites too (not all, i.e. simple pages are fine).

I independently bisected it down to the same commit as Yanko; commit
0ddd2ae586d28e521d37393364d989ce118802e0: drm/ttm: increase ttm pre-fault value
to PMD size.

Reverting this commit on top of mainline master (d74da846046a) fixes the problem
and scrolling is then smooth again.

I'm also using a Ryzen IGP; Radeon 780M (1002:15bf) as part of 7840U. I'm
running Arch Linux with all packages up to date, nothing else really abstract
about my setup.

Please let me know if I can help to investigate further.

On 02/08/2024 10:46, Christian König wrote:
> I'm still scratching my head what the heck this could be.
>
> Increasing the TTM prefault number has minimal more CPU overhead on the first access but makes subsequent accesses to the same buffer faster (because the buffer is already completely present).
>
> So as long as Chrome didn't wrote some single bytes repeatably on newly allocated buffers I don't see how the change could affect video playback at all.
>
> Maybe Chrome did exactly that because of a bug or something, but in general such an application behavior wouldn't make much sense (except if you want to burn CPU cycles).
>
> Anyway not going to look further into that issue.
>
> Thanks,
> Christian.
>
> Am 02.08.24 um 11:40 schrieb Yanko Kaneti:
>> Hi,
>>
>> So, can't reproduce this any more with with recent rawhide (rc1+).
>> Tried also with the same old kernels but this time its with newer mesa
>> and google-chrome (126 -> 127). The same scenario as before now works
>> ok.
>>
>> Cheers and sorry for the noise.
>> - Yanko
>>
>> On Wed, 2024-07-24 at 10:13 +0300, Yanko Kaneti wrote:
>>> Hi,
>>>
>>> Well, it starts, then within a second or two it begins stuttering with
>>> long (half a second/second) freezes of the video , while the audio seems
>>> to work fine. Nothing in the log from chrome or kernel , AFAICS,  to
>>> show anything is wrong.
>>>
>>> Regards
>>> Yanko
>>>
>>> On Wed, 2024-07-24 at 09:02 +0200, Christian König wrote:
>>>> Hi Yanko,
>>>>
>>>> interesting. What do you mean with "choppy"? E.g. lag on startup?
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> Am 23.07.24 um 21:42 schrieb Yanko Kaneti:
>>>>> Hello,
>>>>>
>>>>> Noticed and bisected a rawhide (with the new 6.11-rc0 snapshots) regression to this commit:
>>>>>
>>>>>     0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
>>>>>
>>>>> The regression manifests in choppy youtube video playback in google-chrome-stable.
>>>>>    https://www.youtube.com/watch?v=uOpl2XNOgMA
>>>>>    google-chrome-stable-126.0.6478.182-1.x86_64
>>>>>    VP9 video,
>>>>>    Chrome -> Override software rendering list -> on
>>>>>    Chrome -> Hardware-accelerated video decode - default enabled
>>>>>
>>>>> No other visible graphics issues.
>>>>>
>>>>> Its a desktop system with Ryzen 7 5700GRyzen 7 5700G  IGP
>>>>> [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] [1002:1638]
>>>>>
>>>>> Tested with linus tip and just reverting the commit fixes the issue.
>>>>>
>>>>> Sorry for the brevity, not sure what other details might be relevant.
>>>>>
>>>>> - Yanko
>>>>>
>>>>>
>
