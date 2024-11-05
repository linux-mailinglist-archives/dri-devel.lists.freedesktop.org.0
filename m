Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5C9BCEFE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D854910E10B;
	Tue,  5 Nov 2024 14:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="WK8KsgU1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zgzRxGZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C1710E10B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:19:34 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1730816371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D3f0JmLHkvF+6wnB/S3LI0uD2ynto7nK8TgQHv09rcI=;
 b=WK8KsgU1/QBerDp5/7zg7F6Ow7NvKYSDCCXSpKzLEZrGJXa+8OtLdIA3nF3Kq9FH/YZCan
 GxDtdGAJLBFZX2cj7Y47+dOZ7D4ekDsO+/ppRpNYi48PyrSXWQ5ImQBWcwYSKtI+U+TSRv
 XU9UxlorSkZNEej27Ay1jhojthlZJLsAD6Jk+os4kS/eXhB6aG4i7UbDV+uU0K9JjJJYYy
 WcPrzlrbbNSt/ACopLR4EfpKqIXZSIs4G7xwztsnw/Ohio+oCWeKYEbrCHC8lgfs9n6U/I
 kfV5nsyI5fE4BEtcxIJjRCeMqEGAc3uOR2tLcNcE5iGo2KGIfx1pKqor8aS5hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1730816371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D3f0JmLHkvF+6wnB/S3LI0uD2ynto7nK8TgQHv09rcI=;
 b=zgzRxGZPqQir4mOgbd+OBFSjO59uQulWnQJVxsEWyBYwgkds1QLqoxWg+HRX8SINQU0bQh
 lPi6fcDxz9t4UDDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly
 <caleb.connolly@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] drm/log: Implement suspend/resume
In-Reply-To: <ZyoNZfLT6tlVAWjO@pathway.suse.cz>
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
 <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
 <27c1a6bf-d1e4-469f-a0d4-3e74ab0d0a07@redhat.com>
 <a6c00956-3733-43a1-9538-aa2758d2b4a3@redhat.com>
 <ZyT7MScAsHxkACfD@pathway.suse.cz>
 <d5c8ea70-8596-42a1-8688-0f6131187b73@redhat.com>
 <84o72vcm46.fsf@jogness.linutronix.de> <ZyjXB52dbhjZEHp6@pathway.suse.cz>
 <84ikt3c8uy.fsf@jogness.linutronix.de> <ZyoNZfLT6tlVAWjO@pathway.suse.cz>
Date: Tue, 05 Nov 2024 15:25:31 +0106
Message-ID: <844j4lepak.fsf@jogness.linutronix.de>
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

On 2024-11-05, Petr Mladek <pmladek@suse.com> wrote:
> Observation:
>
>   + CON_ENABLED is not needed for the original purpose. Only enabled
>     consoles are added into @console_list.
>
>   + CON_ENABLED is still used to explicitely block the console driver
>     during suspend by console_stop()/console_start() in serial_core.c.
>
>     It is not bad. But it is a bit confusing because we have
>     CON_SUSPENDED flag now and this is about suspend/resume.

Also note that CON_ENABLED is used to gate ->unblank(). It should
probably consider CON_SUSPENDED as well.

>   + CON_SUSPENDED is per-console flag but it is set synchronously
>     for all consoles.
>
>     IMHO, a global variable would make more sense for the big hammer
>     purpose.
>
>
> Big question:
>
>   Does the driver really needs to call console_stop()/console_start()
>   when there is the big hammer?
>
>   I would preserve it because it makes the design more robust.

Agreed. They serve different purposes.

console_stop()/console_start() is a method for _drivers_ to communicate
that they must not be called because their hardware is not
available/functioning.

console_suspend()/console_resume() is a method for the _system_ to
communicate that consoles should be silent because they are annoying or
we do not trust that they won't cause problems.

>   Anyway, the driver-specific handling looks like the right solution.
>   The big hammer feels like a workaround.

Agreed. Do the 6 call sites even really need the big hammer? I am
guessing yes because there are probably console drivers that do not use
console_stop()/console_start() in their suspend/resume and thus rely on
the whole subsystem being disabled.

> Reasonable semantic:
>
>   1. Rename:
>
> 	console_suspend() -> console_suspend_all()
> 	console_resume()  -> console_resume_all()
>
>      and manipulate a global @consoles_suspended variable agagin.
>      It is the big hammer API.

Agreed. As a global variable, it can still rely on SRCU for
synchronization.

>   2. Rename:
>
> 	console_stop(con)  -> console_suspend(con)
> 	console_start(con) -> console_resume(con)
>
>      and manipulare the per-console CON_SUSPENDED flag here.

Agreed.

>    3. Get rid of the ambiguous CON_ENABLED flag. It won't longer
>       have any purpose.
>
>       Except that it is also used to force console registration.
>       But it can be done a better way, e.g. by introducing
>       register_console_force() API.

Agreed.

John
