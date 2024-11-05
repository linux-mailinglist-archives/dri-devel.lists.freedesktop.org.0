Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C299BCDA3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 14:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ED510E063;
	Tue,  5 Nov 2024 13:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="a9+mYfby";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ijc+eqIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AAB10E063
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 13:16:32 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1730812589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZPkQk0VjMWZh6rtK6XcZtd2+mZOL929NUUV2Q+vzqL8=;
 b=a9+mYfbyYIuh8oBUPQ3f4LUaOLYVpyzEQI7fsQockCUmUHymOXRBR0PIovra52AkPbN3Un
 M7qh2SnIyWY8ZpYClQ9+wYZX5W6y395aVX95PhS0CCun4ZIEKTLIMW28Q0JVAG21ox02Ez
 yfAzCkA9jwn5SNnvq+myNs4fnhncV1K26JYJqYLWDmYtVGn23CEQBk9uDwCntq6KwPQOSc
 JDBpxcNwAkN6VovocrVfDAe6wHdK6hqYLax9STtPF6oQLHX5vGVGZwLvKnmQU9ZuwyDdBd
 RAOr3+8WFlMqrm0E3lGqy/Z+tZOorj/KQmJBpEByoaHbwDSUILSeQ/cmrrr7mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1730812589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZPkQk0VjMWZh6rtK6XcZtd2+mZOL929NUUV2Q+vzqL8=;
 b=Ijc+eqIRga7ZM58MJd4ieLFTZQXjCRq6IyYkJmXYcfXY9ZhLabhEZK6JcFSXkQhpQFfmer
 +7FVFBYWxnfH3hAQ==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly
 <caleb.connolly@linaro.org>, Petr Mladek <pmladek@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v6 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
In-Reply-To: <20241105125109.226866-3-jfalempe@redhat.com>
References: <20241105125109.226866-1-jfalempe@redhat.com>
 <20241105125109.226866-3-jfalempe@redhat.com>
Date: Tue, 05 Nov 2024 14:22:29 +0106
Message-ID: <84fro5es7m.fsf@jogness.linutronix.de>
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

On 2024-11-05, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> drm_log is a simple logger that uses the drm_client API to print the
> kmsg boot log on the screen. This is not a full replacement to fbcon,
> as it will only print the kmsg. It will never handle user input, or a
> terminal because this is better done in userspace.
>
> Design decisions:
>  * It uses the drm_client API, so it should work on all drm drivers
>    from the start.
>  * It doesn't scroll the message, that way it doesn't need to redraw
>    the whole screen for each new message.
>    It also means it doesn't have to keep drawn messages in memory, to
>    redraw them when scrolling.
>  * It uses the new non-blocking console API, so it should work well
>    with PREEMPT_RT.
>
> This patch also adds a Kconfig menu to select the drm client to use.
> It can be overwritten on the kernel command line with:
> drm_client_lib.default=log or drm_client_lib.default=fbdev
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de> # console API
