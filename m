Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BCB84D2D4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 21:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F8C10E0A6;
	Wed,  7 Feb 2024 20:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="ZyLaurXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCDD10E129
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 20:21:49 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TVWjn272Rz9wpF;
 Wed,  7 Feb 2024 20:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1707337309; bh=i3XpBGDoD9F52CwY8m+nZ5lY1uCjGSkm+bBzMFeSARQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ZyLaurXYGQeBfCIIqx0CFOXmsoYl+R5xYeleD7fdjSbkZJCVFc2q84+aUUerEEEKl
 fuHi8fsW7Vakg8SXCUPogdBvItx/a1fMUHmjUc9t3os8YpaGVEPOk2D4x/PljRzJfD
 gY/EUBwcJDg2eyDa6+7OSqlWw1LQtxLQ1FexwAGQ=
X-Riseup-User-ID: A119657D52AA30ACBA852831A1D54514D8C49CF4D1DBA5B0DA7DE26AB620A038
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TVWjh1VkdzFwY8;
 Wed,  7 Feb 2024 20:21:43 +0000 (UTC)
Message-ID: <902e30af-b917-4cd7-a6bf-2ba13e5cc9ac@riseup.net>
Date: Wed, 7 Feb 2024 17:21:41 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
References: <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
 <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
 <20240202131322.5471e184@xps-13> <20240202174913.789a9db9@eldfell>
 <20240202170734.3176dfe4@xps-13> <20240202214527.1d97c881@ferris.localdomain>
 <d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net>
 <20240207104407.7b06bac2@eldfell> <ZcOpzszyR49_MlqB@localhost.localdomain>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <ZcOpzszyR49_MlqB@localhost.localdomain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/02/24 13:03, Louis Chauvet wrote:
> Hello Pekka, Arthur,
> 
> [...]
> 
>>>> Would it be possible to have a standardised benchmark specifically
>>>> for performance rather than correctness, in IGT or where-ever it
>>>> would make sense? Then it would be simple to tell contributors to
>>>> run this and report the numbers before and after.
>>>>
>>>> I would propose this kind of KMS layout:
>>>>
>>>> - CRTC size 3841 x 2161
>>>> - primary plane, XRGB8888, 3639 x 2161 @ 101,0
>>>> - overlay A, XBGR2101010, 3033 x 1777 @ 201,199
>>>> - overlay B, ARGB8888, 1507 x 1400 @ 1800,250
>>>>
>>>> The sizes and positions are deliberately odd to try to avoid happy
>>>> alignment accidents. The planes are big, which should let the pixel
>>>> operations easily dominate performance measurement. There are
>>>> different pixel formats, both opaque and semi-transparent. There is
>>>> lots of plane overlap. The planes also do not cover the whole CRTC
>>>> leaving the background visible a bit.
>>>>
>>>> There should be two FBs per each plane, flipped alternatingly each
>>>> frame. Writeback should be active. Run this a number of frames, say,
>>>> 100, and measure the kernel CPU time taken. It's supposed to take at
>>>> least several seconds in total.
>>>>
>>>> I think something like this should be the base benchmark. One can
>>>> add more to it, like rotated planes, YUV planes, etc. or switch
>>>> settings on the existing planes. Maybe even FB_DAMAGE_CLIPS. Maybe
>>>> one more overlay that is very tall and thin.
>>>>
>>>> Just an idea, what do you all think?  
>>>
>>> Hi Pekka,
>>>
>>> I just finished writing this proposal using IGT.
>>>
>>> I got pretty interesting results:
>>>
>>> The mentioned commit 8356b97906503a02125c8d03c9b88a61ea46a05a took
>>> around 13 seconds. While drm-misc/drm-misc-next took 36 seconds.
>>>
>>> I'm currently bisecting to be certain that the change to the
>>> pixel-by-pixel is the culprit, but I don't see why it wouldn't be.
>>>
>>> I just need to do some final touches on the benchmark code and it
>>> will be ready for revision.
>>
>> Awesome, thank you very much for doing that!
>> pq
> 
> I also think it's a good benchmarks for classic configurations. The odd 
> size is a very nice idea to verify the corner cases of line-by-line 
> algorithms.
> 
> When this is ready, please share the test, so I can check if my patch is 
> as performant as before.
> 
> Thank you for this work.
> 
> Have a nice day,
> Louis Chauvet
> 

Just sent the benchmark for revision:
https://lore.kernel.org/r/20240207-bench-v1-1-7135ad426860@riseup.net
