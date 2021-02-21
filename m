Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1EF320E91
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 00:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EA36E41A;
	Sun, 21 Feb 2021 23:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8576E41A
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 23:45:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8991A64E08;
 Sun, 21 Feb 2021 23:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613951150;
 bh=bebfcHSPVvXAYvSMBqmKSl9MQHrfaWf+ddsQTWVnsP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U+qZdAvWGGzflMb7opbdSoC7Sd06+LtwJ0WiGDZXCes31Fxte79PKif/tNpQAB9y6
 jNUcDXDUaWfYuu+Qt1ny4IIwhiEZnlA9AC7PtffscBbYOU811l/v7qfRj2qJpEyxnE
 LI0tjBFekHXpJLTUOykMlY8AwtpEtMLhBRRBbu5UT1YLjGvrGNWkh9eSgXX8Rxs/ms
 ZeSIesCt9Ci0CJJC0GqJJLItYOUgGxhIHfIlg20crWaH0rKbpJXBtzUjc8kX6HIqFF
 hVHdsZ5YNX0vmUiqnKOqkCpOan7FKYt5V7rOiW2QRH9R3aHAiqB9PPBqqn/e6ul7aT
 lqG3ofxbrAoOQ==
Date: Sun, 21 Feb 2021 16:45:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [git pull] drm for 5.12-rc1
Message-ID: <20210221234549.GA21254@24bbad8f3778>
References: <CAPM=9txd-x1NKWK9BBqVTDNOR00zNqcXgs76YJrDfL94eMLYqQ@mail.gmail.com>
 <CAHk-=wgiPxXzRNnfaXk7ozSWSu7fFU--kTmVjkDaTB05wwUk_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgiPxXzRNnfaXk7ozSWSu7fFU--kTmVjkDaTB05wwUk_g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Kevin Wang <kevin1.wang@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 21, 2021 at 03:07:17PM -0800, Linus Torvalds wrote:
> On Thu, Feb 18, 2021 at 10:06 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Let me know if there are any issues,
> 
> gcc was happy, and I obviously already pushed out my merge, but then
> when I did my clang build afterwards, it reports:
> 
>   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning:
> variable 'structure_size' is used uninitialized whenever switch
> default is taken [-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:770:23: note:
> uninitialized use occurs here
>           memset(header, 0xFF, structure_size);
>                                ^~~~~~~~~~~~~~
> 
> and clang is very very right. That "default" case is completely
> broken, and will generate a randomly sized memset. Not good.
> 
> Presumably that default case never happens, but if so it shouldn't exist.
> 
> Perhaps better yet, make the "default" case just do a "return" instead
> of a break. Breaking out of the switch statement to code that cannot
> possibly work is all kinds of mindless.
> 
> Kevin/Alex? This was introduced by commit de4b7cd8cb87
> ("drm/amd/pm/swsmu: unify the init soft gpu metrics function")
> 
>               Linus

I sent https://lore.kernel.org/r/20210218224849.5591-1-nathan@kernel.org/
a few days ago and Kevin reviewed it, just seems like Alex needs to pick
it up.

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
