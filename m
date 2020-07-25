Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C070822DFDD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E409589F53;
	Sun, 26 Jul 2020 15:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch
 [185.70.40.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8FA6EA5E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 05:20:46 +0000 (UTC)
Date: Sat, 25 Jul 2020 05:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1595654443;
 bh=fNtUVokgzqgxDWagukyFnXesfhfXrJW8Fu9a6W33bSc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=OQzc1PSECV5erApTpM9sgdrgHIVCb90BdRniY6MR5dux8QWFg7kfwtmEiZuYQDrYl
 Gpp3PRhkEfg6G86Ji8X9kKwj/khlrEuqyFsVqJhHuy2rNKfbXfL2S/nnC6B5y5RF+1
 teW/dchZ6Jzl4dKUsWs7bcGILdMbRFGofvrld0xs=
To: Duncan <1i5t5.duncan@cox.net>
From: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
Message-ID: <c7mHa5xU_kh7K9KM5P1UJoCY00b3Oxj3s_y3vr0LGQzUPtWlhv5JjjhT4CnnbDhuTZhCuHT2uMbjdDCZ-JLmHVlS7B_k-wj1OTmZpMD7cg4=@protonmail.com>
In-Reply-To: <20200724215914.6297cc7e@ws>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <202007231524.A24720C@keescook>
 <a86cba0b-4513-e7c3-ae75-bb331433f664@molgen.mpg.de>
 <202007241016.922B094AAA@keescook>
 <3c92db94-3b62-a70b-8ace-f5e34e8f268f@molgen.mpg.de>
 <_vGVoFJcOuoIAvGYtkyemUvqEFeZ-AdO4Jk8wsyVv3MwO-6NEVtULxnZzuBJNeHNkCsQ5Kxn5TPQ_VJ6qyj9wXXXX8v-hc3HptnCAu0UYsk=@protonmail.com>
 <20200724215914.6297cc7e@ws>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.5 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, anthony.ruhier@gmail.com,
 Kees Cook <keescook@chromium.org>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, regressions@leemhuis.info,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, mphantomx@yahoo.com.br,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, July 25, 2020 12:59 AM, Duncan <1i5t5.duncan@cox.net> wrote:

> On Sat, 25 Jul 2020 03:03:52 +0000
> Mazin Rezk mnrzk@protonmail.com wrote:
>
> > > Am 24.07.20 um 19:33 schrieb Kees Cook:
> > >
> > > > There was a fix to disable the async path for this driver that
> > > > worked around the bug too, yes? That seems like a safer and more
> > > > focused change that doesn't revert the SLUB defense for all
> > > > users, and would actually provide a complete, I think, workaround
> >
> > That said, I haven't seen the async disabling patch. If you could
> > link to it, I'd be glad to test it out and perhaps we can use that
> > instead.
>
> I'm confused. Not to put words in Kees' mouth; /I/ am confused (which
> admittedly could well be just because I make no claims to be a
> coder and am simply reading the bug and thread, but I'd appreciate some
> "unconfusing" anyway).
>
> My interpretation of the "async disabling" reference was that it was to
> comment #30 on the bug:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=207383#c30
>
> ... which (if I'm not confused on this point too) appears to be yours.
> There it was stated...
>
> > > > >
>
> I've also found that this bug exclusively occurs when commit_work is on
> the workqueue. After forcing drm_atomic_helper_commit to run all of the
> commits without adding to the workqueue and running the OS, the issue
> seems to have disappeared.
> <<<<
>
> Would not forcing all commits to run directly, without placing them on
> the workqueue, be "async disabling"? That's what I /thought/ he was
> referencing.

Oh, I thought he was referring to a different patch. Kees, could I get
your confirmation on this?

The change I made actually affected all of the DRM code, although this could
easily be changed to be specific to amdgpu. (By forcing blocking on
amdgpu_dm's non-blocking commit code)

That said, I'd still need to test further because I only did test it for a
couple of hours then. Although it should work in theory.

>
> OTOH your base/context swap idea sounds like a possibly "less
> disturbance" workaround, if it works, and given the point in the
> commit cycle... (But if it's out Sunday it's likely too late to test
> and get it in now anyway; if it's another week, tho...)

The base/context swap idea should make the use-after-free behave how it
did in 5.6. Since the bug doesn't cause an issue in 5.6, it's less of a
"less disturbance" workaround and more of a "no disturbance" workaround.

Thanks,
Mazin Rezk

>
> ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>
> Duncan - No HTML messages please; they are filtered as spam.
> "Every nonfree program has a lord, a master --
> and if you use the program, he is your master." Richard Stallman


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
