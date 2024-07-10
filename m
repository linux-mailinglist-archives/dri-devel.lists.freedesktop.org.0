Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C933792D002
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 13:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DEA10E72A;
	Wed, 10 Jul 2024 11:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="0i+BFO8H";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TnWTzxN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B10910E72A;
 Wed, 10 Jul 2024 11:02:45 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1720609363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MB5RUz9En8zgRblZi0YlJjmBHs76SzaICxSLYusWtHk=;
 b=0i+BFO8HLrjhBE23gu5RU+VP//VQGx7vfP0Ussd6Mzs7fmI3MqZqwtO6gVraOzZCvzj5Wt
 ZdJhW0mKwWTZTg81dyZ+K3lzM/1zbhtUYuxGB1mng0bqo+jpgGLF2H6/rT0TsntP71GQ2X
 xA1WBNl/6HUoW8WaIwYYqCBZd4j1cZ/XyDqsDmA4H239njnXMnZZVe7XGYV97e9XD965ln
 Mn31S1LGxBAOCqyVN5OLGvXXRagN+qKfAk8jxP9T6BA/dCb/CA8po7LZypucSu1Px0VM8D
 9XiFu+O4p9AjP5OZMqvI8lP7AXbqNZhEcYlkIvW0uC9lPZ9nvDVPKFsQ0h5TWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1720609363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MB5RUz9En8zgRblZi0YlJjmBHs76SzaICxSLYusWtHk=;
 b=TnWTzxN7PjYBExaJdixfiCKsoQwmIaEjW23sPMzLsrosGcAODgfoVfcEiLCXyuKTmu3ay6
 BNX61qresqLc2bDw==
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
Subject: Re: [PATCH 2/2] bcachefs: only console_trylock in
 bch2_print_string_as_lines
In-Reply-To: <20240710093120.732208-2-daniel.vetter@ffwll.ch>
References: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
 <20240710093120.732208-2-daniel.vetter@ffwll.ch>
Date: Wed, 10 Jul 2024 13:08:42 +0206
Message-ID: <87frsh33xp.fsf@jogness.linutronix.de>
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
> console_trylock is the best we can do here.
>
> Including printk folks since even trylock feels realyl iffy here to
> me.

Using the console lock here at all is wrong. The console lock does not
prevent other CPUs from calling printk() and inserting lines in between.

There is no way to guarantee a contiguous ringbuffer block using
multiple printk() calls.

The console_lock usage should be removed.

John Ogness
