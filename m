Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0523153F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 23:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134566E0F6;
	Tue, 28 Jul 2020 21:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E0A6E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 21:58:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d190so914533wmd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=vFvBGR63kxi0CavnWAYuf+Wv1PziHL67xBV12ZHbnZk=;
 b=j0A3V9iymWEPylW+8J5lFEXe46QGmjwmE7cf+StiiX8IaxO4kUSYzrXr5oGDz/HEiD
 lIamJefth0ln//LmVmIosEEG+QOwM8+h0krzNgqa9EzKpU5ermlNsXIX1EdGqW/TklbR
 El9XpzPo7lU1fW6KD3oNeqtdp0Mankae2ncmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=vFvBGR63kxi0CavnWAYuf+Wv1PziHL67xBV12ZHbnZk=;
 b=T/ZRrA4rgNGgh8muyZFHa/wWx/k+aC3nbc4aASRLKQw9xe1+JjR1XqU7RHKAB2A0Y7
 buejyNd7aleK6/fvEVIfGSC9at4C3rV26XIHa89hlJNgWB8YFGo45cjsHI5G7X4zHR1w
 OoRd4uekGZGeuKlEWc1OxiAea1BntXAcIav2e1P8hHgbAeDjJNwB0IWVZhrFwkg6vjEL
 dyVGAv936gScN3Da1IgL84cwIsoPVwkVNK64X4wFvnyMye7hEBdKZt6QJHwLVSe7A5rr
 JsMsuBuu/frw5SnnI/kkQOhsvPYdl9d1sJ9OwyGHjK38x4UF3dYdYZ5joFBPsEeQ7q5l
 kfiw==
X-Gm-Message-State: AOAM531OqJU+ekch1otBSYd5+lKKu6DlvuDbY2mLTQIGDldyOPNrsca9
 NO+kEUlvFqO83Xf3vFSUD/j7dw==
X-Google-Smtp-Source: ABdhPJwXjIGrOhB3qqvLPXS5vBOptuyY0SyPTUR6eqSZg6Arf7VTgu4ZzAkz15TWyQ+FgmxXbEU78w==
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr5459138wmh.129.1595973522904; 
 Tue, 28 Jul 2020 14:58:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t202sm355472wmt.20.2020.07.28.14.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 14:58:42 -0700 (PDT)
Date: Tue, 28 Jul 2020 23:58:40 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
Message-ID: <20200728215840.GH6419@phenom.ffwll.local>
Mail-Followup-To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 Mazin Rezk <mnrzk@protonmail.com>, Duncan <1i5t5.duncan@cox.net>,
 anthony.ruhier@gmail.com, Kees Cook <keescook@chromium.org>,
 sunpeng.li@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info,
 amd-gfx@lists.freedesktop.org,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, mphantomx@yahoo.com.br,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <202007231524.A24720C@keescook>
 <a86cba0b-4513-e7c3-ae75-bb331433f664@molgen.mpg.de>
 <202007241016.922B094AAA@keescook>
 <3c92db94-3b62-a70b-8ace-f5e34e8f268f@molgen.mpg.de>
 <_vGVoFJcOuoIAvGYtkyemUvqEFeZ-AdO4Jk8wsyVv3MwO-6NEVtULxnZzuBJNeHNkCsQ5Kxn5TPQ_VJ6qyj9wXXXX8v-hc3HptnCAu0UYsk=@protonmail.com>
 <20200724215914.6297cc7e@ws>
 <c7mHa5xU_kh7K9KM5P1UJoCY00b3Oxj3s_y3vr0LGQzUPtWlhv5JjjhT4CnnbDhuTZhCuHT2uMbjdDCZ-JLmHVlS7B_k-wj1OTmZpMD7cg4=@protonmail.com>
 <0b0fbe35-75cf-ec90-7c3d-bdcedbe217b7@molgen.mpg.de>
 <0edb1498-6c43-27cc-b2fb-71ea5ca1a56c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0edb1498-6c43-27cc-b2fb-71ea5ca1a56c@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, mphantomx@yahoo.com.br,
 Duncan <1i5t5.duncan@cox.net>, Kees Cook <keescook@chromium.org>,
 sunpeng.li@amd.com, Mazin Rezk <mnrzk@protonmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 regressions@leemhuis.info, amd-gfx@lists.freedesktop.org,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, anthony.ruhier@gmail.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 01:07:13PM -0400, Kazlauskas, Nicholas wrote:
> On 2020-07-28 5:22 a.m., Paul Menzel wrote:
> > Dear Linux folks,
> > 
> > 
> > Am 25.07.20 um 07:20 schrieb Mazin Rezk:
> > > On Saturday, July 25, 2020 12:59 AM, Duncan wrote:
> > > 
> > > > On Sat, 25 Jul 2020 03:03:52 +0000 Mazin Rezk wrote:
> > > > 
> > > > > > Am 24.07.20 um 19:33 schrieb Kees Cook:
> > > > > > 
> > > > > > > There was a fix to disable the async path for this driver that
> > > > > > > worked around the bug too, yes? That seems like a safer and more
> > > > > > > focused change that doesn't revert the SLUB defense for all
> > > > > > > users, and would actually provide a complete, I think, workaround
> > > > > 
> > > > > That said, I haven't seen the async disabling patch. If you could
> > > > > link to it, I'd be glad to test it out and perhaps we can use that
> > > > > instead.
> > > > 
> > > > I'm confused. Not to put words in Kees' mouth; /I/ am confused (which
> > > > admittedly could well be just because I make no claims to be a
> > > > coder and am simply reading the bug and thread, but I'd appreciate some
> > > > "unconfusing" anyway).
> > > > 
> > > > My interpretation of the "async disabling" reference was that it was to
> > > > comment #30 on the bug:
> > > > 
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=207383#c30
> > > > 
> > > > 
> > > > ... which (if I'm not confused on this point too) appears to be yours.
> > > > There it was stated...
> > > > 
> > > > I've also found that this bug exclusively occurs when commit_work is on
> > > > the workqueue. After forcing drm_atomic_helper_commit to run all of the
> > > > commits without adding to the workqueue and running the OS, the issue
> > > > seems to have disappeared.
> > > > <<<<
> > > > 
> > > > Would not forcing all commits to run directly, without placing them on
> > > > the workqueue, be "async disabling"? That's what I /thought/ he was
> > > > referencing.
> > > 
> > > Oh, I thought he was referring to a different patch. Kees, could I get
> > > your confirmation on this?
> > > 
> > > The change I made actually affected all of the DRM code, although
> > > this could
> > > easily be changed to be specific to amdgpu. (By forcing blocking on
> > > amdgpu_dm's non-blocking commit code)
> > > 
> > > That said, I'd still need to test further because I only did test it
> > > for a
> > > couple of hours then. Although it should work in theory.
> > > 
> > > > OTOH your base/context swap idea sounds like a possibly "less
> > > > disturbance" workaround, if it works, and given the point in the
> > > > commit cycle... (But if it's out Sunday it's likely too late to test
> > > > and get it in now anyway; if it's another week, tho...)
> > > 
> > > The base/context swap idea should make the use-after-free behave how it
> > > did in 5.6. Since the bug doesn't cause an issue in 5.6, it's less of a
> > > "less disturbance" workaround and more of a "no disturbance" workaround.
> > 
> > Sorry for bothering, but is there now a solution, besides reverting the
> > commits, to avoid freezes/crashes *without* performance regressions?
> > 
> > 
> > Kind regards,
> > 
> > Paul
> 
> Mazin's "drm/amd/display: Clear dm_state for fast updates" change
> accomplishes this, at least as a temporary hack.

Yeah I gets it's horrible, but better than nothing. Reverting the old
amdgpu change to a private state object is probably a lot more invasive.

> I've started work on a more large scale fix that we could get in in after.

Does that include a fix for the "stuff needed by irq handler"? Either way
pls cc dri-devel, I think this is something worth of a bit wider
discussion. Feels like unsolved homework from the entire "make DC
integrate into linux" saga ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
