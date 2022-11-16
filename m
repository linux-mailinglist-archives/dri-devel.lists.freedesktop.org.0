Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED98B62B6B3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3B810E209;
	Wed, 16 Nov 2022 09:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BFA10E209
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:39:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id f27so42727330eje.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 01:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6oqx15ITri8OuC13o4xCW0SmP3dFj+PiqjV49pnT8A=;
 b=TZCSe/yGP+6YUUxZ+J3RiJY4ZZose/RfW64FOqPUop2XAXuLE6BVBfv1uW5gjHBz+e
 jY4ZL1INXZi+XC4mhyNs198vPjVdRcWqCvAv20Hv5CHDkO16DbUgwCNB3owLSdhv/RF9
 iCekFgLlJcwBBdU6WRRe//N8RcoYY0FGMfYHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S6oqx15ITri8OuC13o4xCW0SmP3dFj+PiqjV49pnT8A=;
 b=djEHs6xjNXJKd/WNfrlTMO7Bn8ci57f/2qV6pyO/x8JoPqLUV4o49TmifLStN1ayW9
 xTu/HGiqCAdCjIM+FKyyWbJR5/NDGlzJAmfeZ1k6ke/bOog6yitoLDykzPuDBtAI7OcI
 XmsQABiqp5nmPKDAloW0g3lisoBAvkQBm6uFwYd/7gytACfZlDfHiNxjP64655eDFbHX
 BiSJ1X5oxu5lp69FaYXSE58r4XmFgcWLuvxTwUc5+rGe2qFJOLGPFwpcuOG8JMkGbqmU
 hwCJJCFEm27R3QCkL9ITpnAgN/339UPTtMieRVbNDNzun8FkqbBscG8c+GMgtSh7OlpO
 qwhQ==
X-Gm-Message-State: ANoB5pkLamk5plYCW7B6zshLxEch53w5rhC5rlfpZFvMImClV8QWWsGH
 wpXrtfXamTI06t2w0INa8/A1VQ==
X-Google-Smtp-Source: AA0mqf5IDCFzMzxg7K+YiFTymvahSK1AsntC/ot3k1xLAUk0GHJ5RGc4u67XB6zl0x/PYZjfkwUibg==
X-Received: by 2002:a17:906:414d:b0:781:951:2fb with SMTP id
 l13-20020a170906414d00b00781095102fbmr17126729ejk.64.1668591583634; 
 Wed, 16 Nov 2022 01:39:43 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 z4-20020aa7d404000000b0046778ce5fdfsm5928035edq.10.2022.11.16.01.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 01:39:43 -0800 (PST)
Date: Wed, 16 Nov 2022 10:39:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/atomic: do not branch based on the value of
 current->comm[0]
Message-ID: <Y3Sv3TgclLH6SD0A@phenom.ffwll.local>
Mail-Followup-To: Dave Airlie <airlied@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 dri-devel@lists.freedesktop.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Christian Brauner <brauner@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Sean Paul <sean@poorly.run>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20221105222012.4226-1-Jason@zx2c4.com>
 <CAPM=9twc_TBtG_654Hm4SV_G1Ar+PiCuZGg1fV-Zooga+4S0GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twc_TBtG_654Hm4SV_G1Ar+PiCuZGg1fV-Zooga+4S0GQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Christian Brauner <brauner@kernel.org>,
 linux-api@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>, Sean Paul <sean@poorly.run>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 01:49:43PM +1000, Dave Airlie wrote:
> On Sun, 6 Nov 2022 at 08:21, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > This reverts 26b1d3b527e7 ("drm/atomic: Take the atomic toys away from
> > X"), a rootkit-like kludge that has no business being inside of a
> > general purpose kernel. It's the type of debugging hack I'll use
> > momentarily but never commit, or a sort of babbies-first-process-hider
> > malware trick.
> >
> > The backstory is that some userspace code -- xorg-server -- has a
> > modesetting DDX that isn't really coded right. With nobody wanting to
> > maintain X11 anymore, rather than fixing the buggy code, the kernel was
> > adjusted to avoid having to touch X11. A bummer, but fair enough: if the
> > kernel doesn't want to support some userspace API any more, the right
> > thing to do is to arrange for a graceful fallback where userspace thinks
> > it's not available in a manageable way.
> >
> > However, the *way* it goes about doing that is just to check
> > `current->comm[0] == 'X'`, and disable it for only that case. So that
> > means it's *not* simply a matter of the kernel not wanting to support a
> > particular userspace API anymore, but rather it's the kernel not wanting
> > to support xorg-server, in theory, but actually, it turns out, that's
> > all processes that begin with 'X'.
> >
> > Playing games with current->comm like this is obviously wrong, and it's
> > pretty shocking that this ever got committed.
> 
> I've been ignoring this because I don't really want to reintroduce a
> regression for deployed X servers. I don't see the value.
> 
> You use a lot of what I'd call overly not backed up language. Why is
> it obviously wrong though? Is it "playing games" or is it accessing
> the comm to see if the process starts with X.
> 
> Do we have lots of userspace processes starting with X that access
> this specific piece of the drm modesetting API. I suppose we might and
> if we have complaints about that I'd say let's try to fix it better.
> 
> Sometimes engineering is hard, It was a big enough problem that a big
> enough hammer was used.
> 
> I'd hope @Daniel Vetter can comment as well since the original patch was his.

Frankly I refrained from replying when I've seen the patch originally
because I didn't manage to come up with a nice&constructive reply like you
did here. The only thing novel here is the amount of backhanded insults
folded into the commit message.

I very much welcome constructive contributions that actually solve the
problem here, or at least move it forward a bit. This patch is neither.

What might be an option is a tainting module option that disables this
check, since the amount of people willing&able to fix up Xorg is still
zero. But that would need to come with a proper commit message and all
that, and ideally a pile of acks from people who insist they really want
this and need it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
