Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969C62B1F0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 04:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5FA10E004;
	Wed, 16 Nov 2022 03:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C2810E004
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 03:49:56 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id z17so10883127qki.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 19:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UZKsJoIfY0MbBUSTBsROBs0HiEIHYnlS6Iz33e/OHjA=;
 b=mtqJUeYxkwrG3fBI5/xBCHLc/j0jW7eQMtQrzL+oOfVpdLQcp8/JAU1RqaqlV6X+/c
 Ds84Omjs+/DALUI2ug+4cgeKGeJoVIRadkqN5exONZkQRiHbgNP25X2rMbnu/RA493lg
 0YeryszRx2oUjQqzyAiryhJ6s9CHxBsU217jqb6AzzHr/ERNTzEkWPzSLGeZZkHu4tOx
 qWCBn7PBOB4u7TdCe7VE01AWGdlzwPKW2GBcInOoy1lr3of4OW3dvFh8QY3e4XAzBcGa
 55umJL3lTvTXw5iUdwyQIdjvv2r+/5uxltTN2dqyldeeBv99RFJlyisVMCYvR0CL+Z6U
 rnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZKsJoIfY0MbBUSTBsROBs0HiEIHYnlS6Iz33e/OHjA=;
 b=JII9SwzgE16D/E/duMsnS5w/ntPR5Nt/D/C+BWm+xl/OzQcNcvpxC1naDI9uOiGoWi
 PjOsMF4rlGyZiXsFsOjmV+yz3ZObmdzzu8/RGROa3DiN4QLcwa56kUTf5BEn+DJhXso9
 Ob+cJrZBiJOknMtlz8KnkYSUC+Ih4Xj655JDKWeSN34iFTfcLB9laeUXm0Pmca0Odqk2
 6gitus6F7sWg15GF/LuZfmFCGLHD73RbSTBsZRhUmJoVWPyS2LJISeRJzBWbagVdYoB0
 vBdJQmODYKwrsAnQboUCrwIuxcNvJpm8fQ5P0qQDif8KXcj1G9ay0THx2hrJnDepjqzP
 1L0w==
X-Gm-Message-State: ANoB5pnMME9ByHGaGKqT1IpzSU2iG0yEOQ1EaXn+JCXPQ4T+Vq1MLkdi
 2v2u1U4KOQOUpiGpvBbz5B0titRa+j9fNBaCkQY=
X-Google-Smtp-Source: AA0mqf6HmRzZ9V0R9lu84kF5IYZA0L8+E2KmnGXyUBvj652qWLmcdA4Fu7+nBYCKT5++s7jH3itSHDWKxCT+a3IoP6o=
X-Received: by 2002:a05:620a:110d:b0:6ee:bbea:1ebb with SMTP id
 o13-20020a05620a110d00b006eebbea1ebbmr18395623qkk.638.1668570595612; Tue, 15
 Nov 2022 19:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20221105222012.4226-1-Jason@zx2c4.com>
In-Reply-To: <20221105222012.4226-1-Jason@zx2c4.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 16 Nov 2022 13:49:43 +1000
Message-ID: <CAPM=9twc_TBtG_654Hm4SV_G1Ar+PiCuZGg1fV-Zooga+4S0GQ@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: do not branch based on the value of
 current->comm[0]
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-api@vger.kernel.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>, Sean Paul <sean@poorly.run>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 6 Nov 2022 at 08:21, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> This reverts 26b1d3b527e7 ("drm/atomic: Take the atomic toys away from
> X"), a rootkit-like kludge that has no business being inside of a
> general purpose kernel. It's the type of debugging hack I'll use
> momentarily but never commit, or a sort of babbies-first-process-hider
> malware trick.
>
> The backstory is that some userspace code -- xorg-server -- has a
> modesetting DDX that isn't really coded right. With nobody wanting to
> maintain X11 anymore, rather than fixing the buggy code, the kernel was
> adjusted to avoid having to touch X11. A bummer, but fair enough: if the
> kernel doesn't want to support some userspace API any more, the right
> thing to do is to arrange for a graceful fallback where userspace thinks
> it's not available in a manageable way.
>
> However, the *way* it goes about doing that is just to check
> `current->comm[0] == 'X'`, and disable it for only that case. So that
> means it's *not* simply a matter of the kernel not wanting to support a
> particular userspace API anymore, but rather it's the kernel not wanting
> to support xorg-server, in theory, but actually, it turns out, that's
> all processes that begin with 'X'.
>
> Playing games with current->comm like this is obviously wrong, and it's
> pretty shocking that this ever got committed.

I've been ignoring this because I don't really want to reintroduce a
regression for deployed X servers. I don't see the value.

You use a lot of what I'd call overly not backed up language. Why is
it obviously wrong though? Is it "playing games" or is it accessing
the comm to see if the process starts with X.

Do we have lots of userspace processes starting with X that access
this specific piece of the drm modesetting API. I suppose we might and
if we have complaints about that I'd say let's try to fix it better.

Sometimes engineering is hard, It was a big enough problem that a big
enough hammer was used.

I'd hope @Daniel Vetter can comment as well since the original patch was his.

Dave.
