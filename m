Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C636CC9ECAB
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 12:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73E610E767;
	Wed,  3 Dec 2025 11:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oEsuHtLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5447010E767
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 11:02:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1CBFB42D8B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 11:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24C6C19421
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 11:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764759723;
 bh=XyDNn3G8kg6wWghI4PDS5DtNG3vyQHUSE6b4xPglqCo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oEsuHtLiEOCCxVPOhPPz/kRGmyYJ/0xPolCgN9U5hL73Mm2SxBqqDVwz5u3XHbzhZ
 t7tyMTWeHQvwZZ6yMOulsOhysy4TO6BGqIZ9cZfWWUc1XtCifo+WMbP4UdiJYzCMMy
 CVmA/XsvlvC3nzGbIsUlSeJhzB6077LqgXTcIHeCxjpMXTs+9HkVTihVZvLMotwJKa
 yHyciWTAe0Z6KBypoIooogUWbfrMubNvm62bqEqfCx8MWPBIqDhirgqRm039h3HVXJ
 6+yA33YT/52alwbiu/30CD1vOH8OeE2w/8gTR70Oy9kdW0aPQQXRvdK4krmvz3sO1b
 V+wyGW1/EAVuw==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-595825c8eb3so6300909e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 03:02:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWl8kTA9EXAvcgfldlT/9tEnYGpannf1OmDjvmluEWK/nRkPBtnBd04wNQXW1TjUt8pTJhBg96pGl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiZZ0tAPy1EKTK5dJ59Bl+qyZBZffXKFv3w+0Nq0+xo3fWVt4c
 Ru3B6gwDz4vqEdB3uXLEhNfoEW2Dbx/uypQYw/+ier62hRBr7XbdiKz+xq/BHBzEqUKwlt/2yxV
 KvN/kALMvalSw+9o/TMmwn7u4mf25+J0=
X-Google-Smtp-Source: AGHT+IFuhpabaksil21eQE1vIpzPVt55SWw484hYEd2Vfxi7j4bVYBREpg7FKOsp/6H4iezcQiAsWnQPNPSYNdpjtHw=
X-Received: by 2002:a05:6512:b96:b0:594:3567:e835 with SMTP id
 2adb3069b0e04-597d3fe1a23mr765074e87.35.1764759721362; Wed, 03 Dec 2025
 03:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
 <20251203090706.53778-5-tvrtko.ursulin@igalia.com>
 <5ecc23ed-929f-4e60-a7a1-d4bd759e9af2@suse.de>
 <CAMj1kXEVq65rBQraKn8kcCiA6wU7tPfCCbf2Bma4F3p0As3ToQ@mail.gmail.com>
 <e5acaa09-a92f-48d1-b2af-64a120242de9@suse.de>
 <caaf2e08-0770-4808-8872-e432e2ff5ec4@igalia.com>
In-Reply-To: <caaf2e08-0770-4808-8872-e432e2ff5ec4@igalia.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 3 Dec 2025 12:01:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGRR5SGyG2yvc660zO3x6OwsphKv3B1tn=DsTKKXQme7w@mail.gmail.com>
X-Gm-Features: AWmQ_bmaNJLpfbGHaWELpxbkZWzfynUs4w9eLpPR4LVUM3jcsRdYFuVNEU_3tLg
Message-ID: <CAMj1kXGRR5SGyG2yvc660zO3x6OwsphKv3B1tn=DsTKKXQme7w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] efi: sysfb_efi: Fix efidrmfb and simpledrmfb on
 Valve Steam Deck
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 3 Dec 2025 at 11:34, Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>
>
> On 03/12/2025 10:29, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 03.12.25 um 11:13 schrieb Ard Biesheuvel:
> >> On Wed, 3 Dec 2025 at 11:05, Thomas Zimmermann <tzimmermann@suse.de>
> >> wrote:
> >>> Hi
> >>>
> >>> Am 03.12.25 um 10:07 schrieb Tvrtko Ursulin:
> >>>> Valve Steam Deck has a 800x1280 portrait screen installed in a
> >>>> landscape
> >>>> orientation. The firmware offers a software rotated 1280x800 mode which
> >>>> GRUB can be made to switch to when displaying a boot menu. If this mode
> >>>> was selected frame buffer drivers will see this fake mode and fbcon
> >>>> rendering will be corrupted.
> >>>>
> >>>> Lets therefore add a selective quirk inside the current "swap with and
> >>>> height" handling, which will detect this exact mode and fix it up
> >>>> back to
> >>>> the native one.
> >>>>
> >>>> This will allow the DRM based frame buffer drivers to detect the
> >>>> correct
> >>>> mode and, apply the existing panel orientation quirk, and render the
> >>>> console in landscape mode with no corruption.
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Cc: Ard Biesheuvel <ardb@kernel.org>
> >>>> Cc: Melissa Wen <mwen@igalia.com>
> >>>> Cc: linux-efi@vger.kernel.org
> >>>> ---
> >>>>    drivers/firmware/efi/sysfb_efi.c | 56 +++++++++++++++++++++++++++
> >>>> ++---
> >>>>    1 file changed, 51 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/
> >>>> efi/sysfb_efi.c
> >>>> index eacf9a50eab2..566492e67798 100644
> >>>> --- a/drivers/firmware/efi/sysfb_efi.c
> >>>> +++ b/drivers/firmware/efi/sysfb_efi.c
> >>>> @@ -231,16 +231,42 @@ static const struct dmi_system_id
> >>>> efifb_dmi_system_table[] __initconst = {
> >>>>        {},
> >>>>    };
> >>>>
> >>>> +struct efifb_mode_fixup {
> >>>> +     unsigned int width;
> >>>> +     unsigned int height;
> >>>> +     unsigned int linelength;
> >>>> +};
> >>>> +
> >>>>    static int __init efifb_swap_width_height(const struct
> >>>> dmi_system_id *id)
> >>> It's something different now. Can this please become a separate list
> >>> with a separate callback?
> >>>
> >> Why? That means we have to introduce another dmi_check_system() call,
> >> and manually implement the logic to ensure that it is not called
> >> redundantly, i.e., after the first one already found a match.
> >
> > If the separate list isn't feasible, let's at least have a separate
> > callback.
>
> Ard asked for that already so in v3 it is already separate.
>
> I have also locally changed 2/4 to use
> __screen_info_lfb_bits_per_pixel() and if now everyone is happy I can
> send out a v4 with that?
>

Give it a day or so, it's not going to be merged before -rc1 anyway
