Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3900065D154
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 12:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FB410E574;
	Wed,  4 Jan 2023 11:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0CC10E09C;
 Wed,  4 Jan 2023 11:23:08 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Nn6fJ1rJrz9scg;
 Wed,  4 Jan 2023 12:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1672831384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avM8OdydVoo4qB2SWSNzMfKXSEXlrv924E6rdRgKqaI=;
 b=Vgocnz6HikW5cnFjt8tLwKto5OnEUmqkWPYN6i51DvriXTCVxlaQ+F58wnSbIPs5JIe9c9
 J0aMujcDIQOhjwMBy83uF2xdEWCQQN4JTstnPrHLycfXTA9rqdwyHKW57JiKIpOK6SVPNl
 Dy1hE40t+2ecAtYSZUjZuEj2KoCCHsVQDjxYxQkSCbzmetk3WbIJrzHnYUY77O2xXMM/m4
 24B6asT6D2Q7SY0+nqRAw4Nn73nHlnOKQ/zGW6l33UOEOsF22MHv+cEhmcPE9dYsZqr/7E
 CBHDphddG5+EzWLXsZz80Q8WzSOVh6DoSk48cckHmxv86hYf8sqQ3mRl6khTmg==
Message-ID: <a9964b71-d517-9cbc-2129-8f88320bb7f9@mailbox.org>
Date: Wed, 4 Jan 2023 12:23:00 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
Content-Language: en-CA
To: Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
 <b53b1d6e-e81c-98d0-7a7f-a6d5fede90fc@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <b53b1d6e-e81c-98d0-7a7f-a6d5fede90fc@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: grmxdtytzkrhihb6cfn4fogirmq839rq
X-MBO-RS-ID: a476da60ef3b16e3a0a
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/23/22 20:10, Harry Wentland wrote:
> On 12/14/22 04:01, Pekka Paalanen wrote:
>> On Tue, 13 Dec 2022 18:20:59 +0100
>> Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>> On 12/12/22 19:21, Harry Wentland wrote:
>>>> This will let us pass kms_hdr.bpc_switch.
>>>>
>>>> I don't see any good reasons why we still need to
>>>> limit bpc to 8 bpc and doing so is problematic when
>>>> we enable HDR.
>>>>
>>>> If I remember correctly there might have been some
>>>> displays out there where the advertised link bandwidth
>>>> was not large enough to drive the default timing at
>>>> max bpc. This would leave to an atomic commit/check
>>>> failure which should really be handled in compositors
>>>> with some sort of fallback mechanism.
>>>>
>>>> If this somehow turns out to still be an issue I
>>>> suggest we add a module parameter to allow users to
>>>> limit the max_bpc to a desired value.  
>>>
>>> While leaving the fallback for user space to handle makes some sense
>>> in theory, in practice most KMS display servers likely won't handle
>>> it.
>>>
>>> Another issue is that if mode validation is based on the maximum bpc
>>> value, it may reject modes which would work with lower bpc.
>>>
>>>
>>> What Ville (CC'd) suggested before instead (and what i915 seems to be
>>> doing already) is that the driver should do mode validation based on
>>> the *minimum* bpc, and automatically make the effective bpc lower
>>> than the maximum as needed to make the rest of the atomic state work.
>>
>> A driver is always allowed to choose a bpc lower than max_bpc, so it
>> very well should do so when necessary due to *known* hardware etc.
>> limitations.
>>
> 
> I spent a bunch of time to figure out how this actually pans out in
> amdgpu and it looks like we're doing the right thing, i.e. if bandwidth
> limitations require it we'll downgrade bpc appropriately. These changes
> happened over the last couple years or so. So while raising the default
> max_bpc wasn't safe in amdgpu years ago it is completely fine now.
> 
> As for the relevant code it's mostly handled in create_validate_stream_for_sink
> in amdgpu_dm.c where we iterate over a stream's mode validation with
> decreasing bpc if it fails (down to a bpc of 6).
> 
> For HDMI we also have a separate adjust_colour_depth_from_display_info
> function that downgrades bpc in order to fit within the max_tmds_clock.
> 
> So, in short, this change should not lead to displays not lighting up
> because we no longer force a given bpc.

Thanks for double-checking! This patch is

Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

