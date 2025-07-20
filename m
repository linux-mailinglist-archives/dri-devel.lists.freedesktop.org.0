Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1CB0B565
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 13:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CC110E1E0;
	Sun, 20 Jul 2025 11:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="QRaPlXD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEE110E1E0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 11:19:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 53F7C600085A;
 Sun, 20 Jul 2025 12:19:43 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id fFBU6Rh2sC4W; Sun, 20 Jul 2025 12:19:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 7D5E1600086B;
 Sun, 20 Jul 2025 12:19:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1753010380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4AYcinkFOAcq7n312XvMccrwqLxCWTdWzIdRjmqY2XU=;
 b=QRaPlXD66sIibZEDIjJ2zvX7gQs/B8rdfQb+t5Zae4AQxVWBGEGEgc3UgMJRugmK60YJU1
 sgM2DPkHRz0HHqtOhSvMVuCjnD45iKEWVGAL+RNwBJv7rba0Eiuayp9OOz7Ckv9ZpZfch/
 3MqHqNxeCQkIdPnHpwM+KQVgmIgJNC4=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A09F5360071;
 Sun, 20 Jul 2025 12:19:37 +0100 (WEST)
Message-ID: <73686985-27c4-4a4f-8b75-18df112367a7@tecnico.ulisboa.pt>
Date: Sun, 20 Jul 2025 12:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up
 driver
To: Brigham Campbell <me@brighamcampbell.com>,
 Doug Anderson <dianders@chromium.org>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-3-me@brighamcampbell.com>
 <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
 <f0d300fc-0141-4eab-a888-d1d32778f5de@tecnico.ulisboa.pt>
 <DBGPVFN5DTGU.5UTP35ALYS2Q@brighamcampbell.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <DBGPVFN5DTGU.5UTP35ALYS2Q@brighamcampbell.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/20/25 8:50 AM, Brigham Campbell wrote:
> On Sat Jul 19, 2025 at 11:10 AM MDT, Diogo Ivo wrote:
>>> nit: can just be this:
>>>
>>> struct mipi_dsi_multi_context dsi_ctx = {};
>>
>> I am not an expert here but I was under the impression that this is only
>> valid with C23 while the kernel is written in C11. Is there something I
>> am missing?
>>
>> Diogo
> 
> You're right, C23 was the first standard to bless the usage of the empty
> initializer, ` = {};`, but if I'm right, it's been a GNU extension long
> before C11. At risk of being pedantic, I'll draw attention to line 580
> of the kernel's root Makefile:
> 
> KBUILD_CFLAGS += -std=gnu11
> 
> The kernel is technically written in the GNU variant of C11, extensions
> and all. In fact, the first patch of this series uses optional variadic
> macro arguments, which aren't a part of any official C standard as far
> as I'm aware.
> 
> In any case, a simple grep for some forms of the empty initializer shows
> usages all over the drm subsystem.
> 
> That said, I don't know if GNU extensions are formally documented or
> where one would look for that information. Importantly, I am by far the
> junior as far as kernel coding is concerned. I yield to your experience
> and I'm happy to change this initialization in v6 if that's best.

I found the documentation here [1], and it does state regarding designated
initializers that "Omitted fields are implicitly initialized the same as for
objects that have static storage duration." so I take it that no v6 is 
needed :)

Diogo

[1]: 
https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html#Designated-Inits
