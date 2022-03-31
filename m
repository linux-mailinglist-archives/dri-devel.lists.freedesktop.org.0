Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875314EE2AE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 22:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4EE10E22A;
	Thu, 31 Mar 2022 20:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6C410E22A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 20:33:31 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2551F1F47264;
 Thu, 31 Mar 2022 21:33:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648758809;
 bh=gN9zNz1zzPuZgWyaPP1NeUB9qbSo4Bm6mqx0ACpEtcI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EexBfuwpWJvAw03x3m7kAtl0lvjlVHJmfmW84kSfcyJg7D3OhxaFcx0DK1pEq/wTy
 uU2xVyEUe0pD+ZCXARPZff1luz611yif3Xwj+R0fGn085ACzJgxndcsA13ya3TIjXX
 d2E8HX9smjvPT4Sxr3sdN4dnrIRRA4q5Cb8L+N1B6kldbtGIKkjKx2LxaQhG1r3CuD
 2VWVZLcsRezcoRXaQGs20MGi5+xnpZimR2kmaPRMhFHUo5g5PUpV1QEf5U4Af+2eqp
 WQhUtt/D8U+O5SDOebrLs6Ya06BCKrnWpoy6APy8pWQnj+X5igmOGc9uoxM4hMPu5G
 Ia5c0TwmwcvuQ==
Message-ID: <1a3e973a-4d85-20bd-b388-8962f0ffcf15@collabora.com>
Date: Thu, 31 Mar 2022 23:33:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: BUG: KASAN: use-after-free in drm_atomic_helper_wait_for_vblanks()
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <4438d667-1be2-24f1-c987-1a8e3fb85bcc@collabora.com>
 <20220311142205.ztg6njrubmnjud7c@houat>
 <32a34a20-f9b5-3b7b-95f5-a6a34ad225c4@collabora.com>
 <YkQmrQCt5IPOMxj8@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <YkQmrQCt5IPOMxj8@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/22 12:45, Daniel Vetter wrote:
> On Tue, Mar 15, 2022 at 12:53:30AM +0300, Dmitry Osipenko wrote:
>> On 3/11/22 17:22, Maxime Ripard wrote:
>>> Hi Dmitry,
>>>
>>> On Thu, Mar 10, 2022 at 03:33:07AM +0300, Dmitry Osipenko wrote:
>>>> I was playing/testing SuperTuxKart using VirtIO-GPU driver and spotted a
>>>> UAF bug in drm_atomic_helper_wait_for_vblanks().
>>>>
>>>> SuperTuxKart can use DRM directly, i.e. you can run game in VT without
>>>> Xorg or Wayland, this is where bugs happens. SuperTuxKart uses a
>>>> non-blocking atomic page flips and UAF happens when a new atomic state
>>>> is committed while there is a previous page flip still in-fly.
>>>>
>>>> What happens is that the new and old atomic states refer to the same
>>>> CRTC state somehow. Once the older atomic state is destroyed, the CRTC
>>>> state is freed and the newer atomic state continues to use the freed
>>>> CRTC state.
>>>
>>> I'm not sure what you mean by "the new and old atomic states refer to
>>> the same CRTC state", are those the same pointers?
>>
>> Yes, the pointers are the same. I'd assume that the newer atomic state
>> should duplicate CRTC state, but apparently it doesn't happen.
> 
> The legacy cursor hack stuff does this, and it pretty fundamentally breaks
> everything. Might be good to retest with that disabled:
> 
> https://lore.kernel.org/dri-devel/20201023123925.2374863-1-daniel.vetter@ffwll.ch/
> 
> The problem is a bit that this might cause some regressions, for drivers
> which don't yet have the fancy new cursor fastpath for plane updates.
> -Daniel

Thank you, I tested yours patch and unfortunately it doesn't fix my
problem. Should be a separate bug.

Those async update code paths aren't trivial, will take some time for me
to debug it.
