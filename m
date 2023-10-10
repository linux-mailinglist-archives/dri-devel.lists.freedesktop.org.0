Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4AA7BF9BE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 13:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DFB10E1E3;
	Tue, 10 Oct 2023 11:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9858410E1D9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tuuPq9Y/8iwzIQigDfOAX0UcpzMj/9pMotrsb1Kxroc=; b=n7UedGFecxHbj7rIbLfGTX6bHw
 0ZpU7/EvTokgaDNxZR44J64Cs+4mXaTABJanIFKWyuqKo0uFwLaHrhOBiYhtWg3v9ye5mK3KOPeXm
 UqBYhQTBGUR7STsZXtoMHcexHBigVfI2ok7JsJ6OUXJn2s/sygEr361ku2Er/0Vy/IRsBjkMlofJr
 FaS1MoSPoDU5/tcODi7NaPsYmp8pjcbPgJo5Q2Ra3XXgphvNPzt6DvnhTkPbHRkX9Ny7Jf0TYszup
 IS2oXxeTXV1mi33/Ou2yXQsWfY80T82eld7c7TKwND4LiNh5zstlhKNW/QJbJODlLsLrHI+ZoNmKE
 ++X9SVcg==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=41420)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qqAvy-005CaL-Hw;
 Tue, 10 Oct 2023 13:29:54 +0200
Message-ID: <0a6c2a07-bf44-409a-8a09-827410f011a6@tronnes.org>
Date: Tue, 10 Oct 2023 13:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
 <63wdz6ns6wsu3avztqebmeo4aa4ltwmmmywlam3xe6fmftcf3p@5icc2cvy6xvh>
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <63wdz6ns6wsu3avztqebmeo4aa4ltwmmmywlam3xe6fmftcf3p@5icc2cvy6xvh>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/10/23 11:25, Maxime Ripard wrote:
> 
> 
> On Tue, Oct 10, 2023 at 10:55:09AM +0200, Thomas Zimmermann wrote:
>>>> So if I understand correctly, drm_panic would pre-allocate a plane/commit,
>>>> and use that when a panic occurs ?
>>>
>>> And have it checked already, yes. We would only wait for a panic to
>>> happen to pull the trigger on the commit.
>>>
>>>> I have two concern about this approach:
>>>> - How much memory would be allocated for this ? a whole framebuffer can be
>>>> big for just this use case.
>>
>> As I outlined in my email at [1], there are a number of different scenarios.
>> The question of atomic state and commits is entirely separate from the DRM
>> panic handler. We should not throw them together. Whatever is necessary is
>> get a scanout buffer, should happen on the driver side of
>> get_scanout_buffer, not on the drm_panic side.
>>
>> [1] https://lore.kernel.org/dri-devel/39bd4c35-8a61-42ee-8675-ccea4f5d4ac6@suse.de/T/#m22f116e9438e00a5f0a9dc43987d4153424f8be1
>>
>>>
>>> I'dd expect a whole framebuffer for the current
>>> configuration/resolution. It would be typically 4MB for a full-HD system
>>> which isn't a lot really and I guess we can always add an option to
>>> disable the mechanism if needed.
>>>
>>>> - I find it risky to completely reconfigure the hardware in a panic handler.
>>>
>>> I would expect to only change the format and base address of the
>>> framebuffer. I guess it can fail, but it doesn't seem that different to
>>> the async plane update we already have and works well.
>>
>> The one thing I don't understand is: Why should we use atomic commits in the
>> first place? It doesn't make sense for firmware-based drivers.
> 
> Because this is generic infrastructure that is valuable for any drivers
> and not only firmware-based drivers?
> 
>> In some drivers, even the simple ast, we hold locks during the regular
>> commit. Trying to run the panic commit concurrently will likely give a
>> deadlock.
> 
> You're in the middle of a panic. Don't take any locks and you won't deadlock.
> 
>> In the end it's a per-driver decision, but in most cases, the driver can
>> easily switch to a default mode with some ad-hoc code.
> 
> When was the last time a per-driver decision has been a good thing? I'm
> sorry, but the get_scanout_buffer approach buffer won't work for any
> driver out there.
> 
> I'm fine with discussing alternatives if you don't like the ones I
> suggested, but they must allow the panic handler infrastructure to work
> with any driver we have, not just 4.
> 

Why can't we use the model[1] suggested by Daniel using a draw_pixel
callback giving drivers full control on how they can put a pixel on the
display?

This will even work for the AMD debug interface.
In the linear CPU accessible buffer case, we can provide a helper for
that, maybe we can do helpers for other common cases as well.

Adding to that we would need a panic_setup/enter and panic_teardown/exit
callback.

Noralf.

[1]
https://lore.kernel.org/dri-devel/20160810091529.GQ6232@phenom.ffwll.local/
