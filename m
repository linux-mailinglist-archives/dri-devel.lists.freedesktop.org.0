Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E454B74E8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 20:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D176810E47A;
	Tue, 15 Feb 2022 19:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9ED10E47A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 19:59:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98D42B81CC2;
 Tue, 15 Feb 2022 19:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7990DC340EB;
 Tue, 15 Feb 2022 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644955169;
 bh=SDqM7j7mEfwIY0ZRiphWLUUJe87XSwuNN2c+pVrVzVI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NJOUXAOkkVz53MA8gXUhWtMSW4jQgL2EsGf+Td5qutjO6kBYfKCTEFIjG/oS4pEGX
 /voy7GGUWUVWfWGdw8oAjTRvaU3ai27E8iEDhNRLKt24pabx47oyirtPrsPTpM3ufq
 zIbU7BEI75akuIN3k4JYPJIT5Rj6KuDh7jEEPZLTAgMdnvpmdV3aM6iKTLQ9b08T7c
 T829I+35D8DUvO0TnXEna1qImNt5ZKeWs5rSoBZUiJ/z6m+AyYP20id/dKVfH8fXmd
 BmoycJTvmJLE+QZa+3P+ip4xC6P4FlA39gIE8zm+SDrNpFcmP7yWT9pUgzut0wuVFS
 uYWQBQVg2GUQA==
Date: Tue, 15 Feb 2022 20:59:24 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] drm: fb-helper: Avoid nesting spinlock_t into
 raw_spinlock_t
In-Reply-To: <87o8382j5s.fsf@jogness.linutronix.de>
Message-ID: <nycvar.YFH.7.76.2202152058300.11721@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2202151640200.11721@cbobk.fhfr.pm>
 <YgvLdvPihuQ9KZ6/@linutronix.de> <87o8382j5s.fsf@jogness.linutronix.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Sebastian Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Feb 2022, John Ogness wrote:

> >> drm_fb_helper_damage() is acquiring spinlock_t (helper->damage_lock), 
> >> while it can be called from contexts where raw_spinlock_t is held (e.g. 
> >> console_owner lock obtained on vprintk_emit() codepath).
> >> 
> >> As the critical sections protected by damage_lock are super-tiny, let's 
> >> fix this by converting it to raw_spinlock_t in order not to violate 
> >> PREEMPT_RT-imposed lock nesting rules.
> >> 
> >> This fixes the splat below.
> >> 
> >>  =============================
> >>  [ BUG: Invalid wait context ]
> >>  5.17.0-rc4-00002-gd567f5db412e #1 Not tainted
> >
> > rc4. Is this also the case in the RT tree which includes John's printk
> > changes?
> 
> In the RT tree, the fbcon's write() callback is only called in
> preemptible() contexts. So this is only a mainline issue.
> 
> The series I recently posted to LKML [0] should also address this issue
> (if/when it gets accepted).
> 
> John
> 
> [0] https://lore.kernel.org/lkml/20220207194323.273637-1-john.ogness@linutronix.de

Thanks for confirmation, seems like this problem is indeed cured by your 
series.

I still believe though that we shouldn't let 5.17 released with this 
warning being emitted into dmesg, so I'd suggest going with my patch for 
mainline, and revert it in your series on top of it.

Thanks,

-- 
Jiri Kosina
SUSE Labs

