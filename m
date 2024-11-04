Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC589BB90A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 16:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC5210E2B8;
	Mon,  4 Nov 2024 15:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="daeSv8Tg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AqNqZMao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168910E2B8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 15:32:56 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1730734374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2QC0Bk9OJEyHVHN98ZgrsyfJ80PseBVAS8n2MGRAkbE=;
 b=daeSv8TgZ7xUmG8BTCmaQePdaALze5WlrjITCDmHwhXIUJrkLv198NZSwZesNKGq7Jtmjq
 pCcmBcImbEs2yjvLlTz75oJmPsfcySaNWB/ZWYcEeOUUzYQatm4r/O8ZNP/8MWItfDElCc
 gCISbBgHtl6nDb4xGzZNiCPg8n14tnc+fjwrYMagSSxdxTJgEbA8aWBz6lG5aMijVKSmkN
 ZV9K/+b22XzzpjbE+TmeXtryQaGIamCre9+W5c0ZRwIC3ZodYkRVG3fWCGGcuU4qluEhJS
 5O03alLzK1lmkfQUsFR/WDIJztLgAOxrxH9nIaYKxenfKX2L6HtVLvttm/9U9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1730734374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2QC0Bk9OJEyHVHN98ZgrsyfJ80PseBVAS8n2MGRAkbE=;
 b=AqNqZMaoJ2vVi6NRGqEZuTp+ac1oMg1xnbuWnO7eJtuZcWGRDLRJ1mZ/ydUMu94Kkz0ysD
 IEN/eW61I5+vdEDA==
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
In-Reply-To: <ZyjXB52dbhjZEHp6@pathway.suse.cz>
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
 <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
 <27c1a6bf-d1e4-469f-a0d4-3e74ab0d0a07@redhat.com>
 <a6c00956-3733-43a1-9538-aa2758d2b4a3@redhat.com>
 <ZyT7MScAsHxkACfD@pathway.suse.cz>
 <d5c8ea70-8596-42a1-8688-0f6131187b73@redhat.com>
 <84o72vcm46.fsf@jogness.linutronix.de> <ZyjXB52dbhjZEHp6@pathway.suse.cz>
Date: Mon, 04 Nov 2024 16:38:53 +0106
Message-ID: <84ikt3c8uy.fsf@jogness.linutronix.de>
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

On 2024-11-04, Petr Mladek <pmladek@suse.com> wrote:
> I wonder whether console_start()/console_stop() should really
> manipulate CON_ENABLE flag. It might be historical solution when
> @console_suspended was a global variable.
>
> But it has changed with the commit 9e70a5e109a4a2336 ("printk: Add
> per-console suspended state").
>
> It might make more sense when console_start()/console_stop()
> manipulates CON_SUSPENDED flag. Then it would make sense
> to rename them suspend_this_console()/resume_this_console().

I worry about letting console drivers and printk.c both modify this flag
during normal runtime. One might clear CON_SUSPENDED too soon and cause
trouble.

CON_ENABLE and @console_suspended were always orthogonal. Moving
@console_suspended to CON_SUSPENDED did not change that relationship.

IMHO we should continue to keep them separate. But your point about the
console not being registered is a good one. We should update
console_stop()/console_start() to only operate on @console if it is
registered. Since those functions take the console_list_lock anyway, it
would be a simple change.

John
