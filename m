Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B063879CD
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A536EB70;
	Tue, 18 May 2021 13:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C9C6EB70
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 13:22:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0E946008E;
 Tue, 18 May 2021 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621344169;
 bh=WQdgNlO00HhjMFdrkbm64uxHBJSPAptuMCxpaqsX5Ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eobGBP/zR+zFAlh4OHSckEZCrGAD8rw8f5LybnkJhkGJEYW9y2Mhl3iq9P4fP4//1
 J/f20J4SV4ufuJlIrcUcUEkHL4lWvmrP9qd1yYdbrTdhdISsRHe5NX/Q6S6ah3fwUW
 EJRB4LkdoLZB2FnhoW4u6iSKc9ZIPgYf3FHUkDJjv2NA1aYLL3/sWwgci3jp8jq3ZM
 78/udASoxg//AJfKwNx4XRFrP2dNLcp41DHdaBlSHGUpo0u1WY5KMiAJK7EEnYXnVo
 XkzNemx1O7/i6UPIqakAu6Mxf0PqC5gV4FqVMCstAkon1oeqFLcMokjiXTMwT0+fYM
 BoY5YZu5Sl9EQ==
Date: Tue, 18 May 2021 09:22:48 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg KH <greg@kroah.com>
Subject: Re: [PATCH AUTOSEL 5.12 5/5] tty: vt: always invoke
 vc->vc_sw->con_resize callback
Message-ID: <YKO/qKRwPYJF7ols@sashalap>
References: <20210518010940.1485417-1-sashal@kernel.org>
 <20210518010940.1485417-5-sashal@kernel.org>
 <CAHk-=whw9_rp0NYTsCqcGnUkcV5Qgv7FTxADtPrdq4KFmsj+Lg@mail.gmail.com>
 <YKNUl/f/c8HfF6dS@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YKNUl/f/c8HfF6dS@kroah.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 07:45:59AM +0200, Greg KH wrote:
>On Mon, May 17, 2021 at 06:35:24PM -0700, Linus Torvalds wrote:
>> On Mon, May 17, 2021 at 6:09 PM Sasha Levin <sashal@kernel.org> wrote:
>> >
>> > From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> >
>> > [ Upstream commit ffb324e6f874121f7dce5bdae5e05d02baae7269 ]
>>
>> So I think the commit is fine, and yes, it should be applied to
>> stable, but it's one of those "there were three different patches in
>> as many days to fix the problem, and this is the right one, but maybe
>> stable should hold off for a while to see that there aren't any
>> problem reports".
>>
>> I don't think there will be any problems from this, but while the
>> patch is tiny, it's conceptually quite a big change to something that
>> people haven't really touched for a long time.
>>
>> So use your own judgement, but it might be a good idea to wait a week
>> before backporting this to see if anything screams.
>
>I was going to wait a few weeks for this, and the other vt patches that
>were marked with cc: stable@ before queueing them up.

I'll drop it from my queue then.

-- 
Thanks,
Sasha
