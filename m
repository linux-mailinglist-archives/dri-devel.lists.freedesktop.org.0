Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208329F6205
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 10:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B2110E24B;
	Wed, 18 Dec 2024 09:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vk3hJD0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5773F10E24B;
 Wed, 18 Dec 2024 09:44:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YCpfq19rgz9tPc;
 Wed, 18 Dec 2024 10:44:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1734515059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fop8eHOTRMY4TBTOG39Dc+IvevBhBUxCELddBDSsyng=;
 b=vk3hJD0AILyl+0AQy35//DmkjDjQ4EPw/AtUXl3ryzt4MKxmDDGZRBFtXM2UiSvq/Jw/tV
 JToEhbXtfWUVs31MQ9+OlzJY9ZLEgVIb+eY5fLjNT/s51SZFZ1v2URgA6QwtswYhB/a3OY
 5cqsmRNERiIg7pgHuswt3J+oGbbl44qHyYvh3WM0YSf/hRU1Dkv4f2No+8u8FRNvPWgSr0
 986el8z9NzWbX7/SpkYkl7ng8beUuHaAgI3aU5T3nvaHs5v3Rf4l80/f7XT2R/l0WZ7HQt
 TbXSwFskb2JxmmRqdxHlk3gQ3eJcF0idN66Kv6SI5m7IXCKDKnju0hjFbnRKeg==
Message-ID: <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
Date: Wed, 18 Dec 2024 10:44:17 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Brian Starkey <brian.starkey@arm.com>
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 45ueczqnrkz58p6in8unteqm5x3rehfp
X-MBO-RS-ID: 1266e0373c64f166735
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

On 2024-12-17 12:03, Brian Starkey wrote:
> On Tue, Dec 17, 2024 at 11:13:05AM +0000, Michel Dänzer wrote:
>> On 2024-12-17 10:14, Brian Starkey wrote:
>>
>>> Modifiers are meant to describe framebuffers, and this pitch alignment
>>> requirement isn't really a framebuffer property - it's a device
>>> constraint. It feels out of place to overload modifiers with it.

FWIW, KMS framebuffers aren't the only use case for sharing buffers between devices.


>>> I'm not saying we don't need a way to describe constraints to
>>> allocators, but I question if modifiers the right mechanism to
>>> communicate them?
>> While I agree with your concern in general, AFAIK there's no other
>> solution for this even on the horizon, after years of talking about
>> it. The solution proposed here seems like an acceptable stop gap,
>> assuming it won't result in a gazillion linear modifiers.
> 
> UAPI is baked forever, so it's worth being a little wary IMO.
> 
> This sets a precedent for describing constraints via modifiers. The
> reason no other proposal is on the horizon is because describing the
> plethora of constraints across devices is a hard problem; and the
> answer so far has been "userspace needs to know" (à la Android's
> gralloc).
> 
> If we start down the road of describing constraints with modifiers, I
> fear we'll end up in a mess. The full enumeration of modifiers is
> already horrendous for parameterized types, please let's not
> combinatorially multiply those by constraints.

I agree there's a slippery slope.

That said, linear buffers are special in that they're the only possibility which can work for sharing buffers between devices in many cases, in particular when the devices are from different vendors or even different generations from the same vendor.

So as long as device vendors don't get too creative with their linear pitch alignment restrictions, it still seems like this might be workable stop-gap solution for that specific purpose alone, until a better solution for handling constraints arrives.


> P.S. "is the only modifier that has a chance of not working" is
> fundamentally false.

My reading of that part of the comment is that pitch alignment shouldn't be an issue with non-linear modifiers, since the constraints for pitch should be part of the modifier definition. Maybe that could be clarified in the comment.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
