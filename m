Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E441D92D3B1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F62810E7DC;
	Wed, 10 Jul 2024 14:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="vnFhuSC2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VKGXipAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC63C10E7DC;
 Wed, 10 Jul 2024 14:01:43 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1720620101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Et5l8wbkPTW0SmqvPS5ISuDSY1IwQ9qONGjNBZSNKw8=;
 b=vnFhuSC2VBqWV9SCWATEZgz7pyFBe16UTJe9kG87ame65DQs7Cpwzd+Ij9ZbnNVeaR/IiT
 /Oq0DD9eDwsGSTTodj0iebvYq01hcrcMzS8nVuvXWa2Osu3HMINl0QTrsKPNGWxJPKSI5a
 pH76lB8eyILBpE5x6JzJ0/BWYOVSDaQEx5M5bWVhUpa8Yq6nRfv2VzlShVVKdbAzXhmq9J
 tLqBek4Bo2enxYjDG/Znjh2Ezj5psXeH4oHsXNRm6FHrWqTnPAUs8tNyX1EFsJbyLwn//6
 itpGSqTcloqgNM4qAfZTdXuiQKNbjiXc7JZ29RQjAxySdPLvR1duPpzSQolyyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1720620101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Et5l8wbkPTW0SmqvPS5ISuDSY1IwQ9qONGjNBZSNKw8=;
 b=VKGXipAtKYmyYCqcpqINqZlTwQXUNbLuV9OyyCIIf1AjQo0+T0C60xxIM+jLY6x5O1tO8z
 bhiXrHPkG722RfDA==
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Daniel
 Vetter <daniel.vetter@ffwll.ch>,
 syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com, Daniel Vetter
 <daniel.vetter@intel.com>, stable@vger.kernel.org, Kent Overstreet
 <kent.overstreet@linux.dev>, Brian Foster <bfoster@redhat.com>,
 linux-bcachefs@vger.kernel.org, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>
Subject: Re: [PATCH] bcachefs: no console_lock in bch2_print_string_as_lines
In-Reply-To: <20240710130335.765885-1-daniel.vetter@ffwll.ch>
References: <20240710093120.732208-2-daniel.vetter@ffwll.ch>
 <20240710130335.765885-1-daniel.vetter@ffwll.ch>
Date: Wed, 10 Jul 2024 16:07:40 +0206
Message-ID: <87o775cpmj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

On 2024-07-10, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> console_lock is the outermost subsystem lock for a lot of subsystems,
> which means get/put_user must nest within. Which means it cannot be
> acquired somewhere deeply nested in other locks, and most definitely
> not while holding fs locks potentially needed to resolve faults.
>
> console_trylock is the best we can do here. But John pointed out on a
> previous version that this is futile:
>
> "Using the console lock here at all is wrong. The console lock does not
> prevent other CPUs from calling printk() and inserting lines in between.
>
> "There is no way to guarantee a contiguous ringbuffer block using
> multiple printk() calls.
>
> "The console_lock usage should be removed."
>
> https://lore.kernel.org/lkml/87frsh33xp.fsf@jogness.linutronix.de/
>
> Do that.
>
> Reported-by: syzbot+6cebc1af246fe020a2f0@syzkaller.appspotmail.com
> References: https://lore.kernel.org/dri-devel/00000000000026c1ff061cd0de12@google.com/
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Fixes: a8f354284304 ("bcachefs: bch2_print_string_as_lines()")

Reviewed-by: John Ogness <john.ogness@linutronix.de>
