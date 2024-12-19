Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988079F7EF2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 17:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F175710E4B5;
	Thu, 19 Dec 2024 16:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="iC/KV4KB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F12610E4B5;
 Thu, 19 Dec 2024 16:09:39 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YDb8v518pz9scS;
 Thu, 19 Dec 2024 17:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1734624575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dQmhWuInElh0V3ajtYHLVaKOzhyS8c4Tx/s+IfdoM4=;
 b=iC/KV4KBDK84iPP5RnxfsFXB6LWah57Su5H1pfP6ahgpNKcfavT/wdk9zQFK5w+C5p5XBz
 jGC0QQNBea5dFIB7psfKDLU5GPGU/xmVk0hfYnKMLOxFR63/5h0PQCguOGk4P+ATfamC4+
 f9GkH1tXDjz3JPHi+VKc5kaHGLZhOJBZTKTFR/4dXIo8OcMxd0pYmM4xU/SWf6sa11NtJ8
 KfwZGJIBccetr8H0piUSVAUjCLU53xpZhgpmq5qOvUVqFqH5Gy4sjUJiat4+W/DVAC+NCr
 Ieulbq1ILC2AnSqdWZpfE5Q6KUw2/tEhAAHX/e3w7Yhd8A2gIdEx1CRe0b784g==
Message-ID: <688f69c5-a7b7-46eb-89ef-379c3f5c7632@mailbox.org>
Date: Thu, 19 Dec 2024 17:09:33 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Daniel Stone <daniel@fooishbar.org>, Brian Starkey <brian.starkey@arm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4qypms4dm9oqnhm7zze3xq9ftmfnrdt5
X-MBO-RS-ID: 8d13fff367ea8b0ba47
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

On 2024-12-19 10:02, Daniel Stone wrote:
> 
> How this would be used in practice is also way too underdocumented. We
> need to document that exact-round-up 64b is more restrictive than
> any-multiple-of 64b is more restrictive than 'classic' linear. We need
> to document what people should advertise - if we were starting from
> scratch, the clear answer would be that anything which doesn't care
> should advertise all three, anything advertising any-multiple-of
> should also advertise exact-round-up, etc.
> 
> But we're not starting from scratch, and since linear is 'special',
> userspace already has explicit knowledge of it. So AMD is going to
> have to advertise LINEAR forever, because media frameworks know about
> DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
> that the buffer is linear. That and not breaking older userspace
> running in containers or as part of a bisect or whatever.
> 
> There's also the question of what e.g. gbm_bo_get_modifier() should
> return. Again, if we were starting from scratch, most restrictive
> would make sense. But we're not, so I think it has to return LINEAR
> for maximum compatibility (because modifiers can't be morphed into
> other ones for fun), which further cements that we're not removing
> LINEAR.
> 
> And how should allocators determine what to go for? Given that, I
> think the only sensible semantics are, when only LINEAR has been
> passed, to pick the most restrictive set possible; when LINEAR
> variants have been passed as well as LINEAR, to act as if LINEAR were
> not passed at all.

These are all very good points, which call for stricter-than-usual application of the "new UAPI requires corresponding user-space patches" rule:

* Patches adding support for the new modifiers in Mesa (and kernel) drivers for at least two separate vendors
* Patches adding support in at least one non-Mesa user-space component, e.g. a Wayland compositor which has code using the existing linear modifier (e.g. mutter)


Ideally also describe a specific multi-vendor scenario which can't work with the existing linear modifier, and validate that it works with the new ones.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
