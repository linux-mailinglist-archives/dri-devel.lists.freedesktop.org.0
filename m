Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0D87D043
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376E41122EB;
	Fri, 15 Mar 2024 15:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="lQCVzD8U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V5xi7Z6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDA11122EB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:29:06 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1710516544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATlCjYZH5WhO81b4XvMZY1HJXm9F4f7CX+hL3Qf5Czs=;
 b=lQCVzD8Uirr4+GWwJjsstrqbXKK4v4EXlUFa1M58uTvACUge2a3DLQiOxhJNhuxQ8CrS/6
 0mvhkAGuiNOLilQz6KaweU3hEhV/c0Jf8pL6Cf80DWjxM02FiugnNTnDU5Vo6HJW42TPdH
 N/YdYeD5PPtXwEPdkJPYQXr59IoHsgfT37TaeAeaigZJzbF3TVJneFCGkFZ40o8rrPeZqO
 o2Ls3FzkqNQ27ACPaZ5uVXvGZVXW/YVwNKJXWF/2f6m0ruaCF9tlo6lVtbXjiMxwmz2XAm
 xuRs52THPeNyiujYuYfImOAaXiLEU7INNMS6h2VBVKfYDYF2IZV2FEGfPnKsSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1710516544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATlCjYZH5WhO81b4XvMZY1HJXm9F4f7CX+hL3Qf5Czs=;
 b=V5xi7Z6vPn1aLLWRzV5lGRqdcDqx1dOpFe4vAS7I1Kjiozr9w3LjTmta8GAGX2EFehZQi8
 mnN4Esf0x3le8ODw==
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com, Daniel Vetter <daniel.vetter@ffwll.ch>, Jocelyn
 Falempe <jfalempe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, Lukas Wunner
 <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v10 1/9] drm/panic: Add drm panic locking
In-Reply-To: <20240315151317.857684-2-jfalempe@redhat.com>
References: <20240315151317.857684-1-jfalempe@redhat.com>
 <20240315151317.857684-2-jfalempe@redhat.com>
Date: Fri, 15 Mar 2024 16:34:18 +0106
Message-ID: <87plvvbjl9.fsf@jogness.linutronix.de>
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

On 2024-03-15, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> +static inline int drm_panic_trylock(struct drm_device *dev, unsigned long *flags)
> +{
> +	return raw_spin_trylock_irqsave(&dev->mode_config.panic_lock, *flags);
> +}

[...]

> +static inline unsigned long drm_panic_lock(struct drm_device *dev)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&dev->mode_config.panic_lock, flags);
> +	return flags;
> +}

I find it a bit strange that @flags is passed as an argument in the
trylock variant but returned in the lock variant. I would pass it as an
argument in both variants. Just a suggestion.

John Ogness
