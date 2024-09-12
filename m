Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BC5976B9E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0475A10E0F0;
	Thu, 12 Sep 2024 14:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="YbehUcRl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="85PBOx26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE4410E0F0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:11:23 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1726150280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BmQQn0NA7A3HI6f1goHSPD5Aj/1Se9SJOMQU+5q5BMQ=;
 b=YbehUcRlxZcSdo5Y0dF6Se8GM+qSQwyeeQb5GTwLEHG4/rkxv5sXDtzm3i1on3JbIp8ZDs
 syg3HqOYYf2c592xFZnAGn43OBKmUhJ98nWcxQSrnTt3WNJdUFSB2GUAEUzPGwIJ8fggfv
 7D4xO/L3jmRivoXdbq6tpwz/5a9Ok/3hK3cGZZJW2T8Gp71PEH9QPzwmS3g8fH0dY1x5oM
 vE+S1Ne9H/ytoQL0i70NwoGoxFKAy5kZQb7ITWHslB4ge7i556IPLCfOAqUmRnOaBoh8lb
 TfuubwCXS3zXsu5DZoiAX4uepoQKy0AxwbvMMSWms1pQ3Rf3fv4xJFoVMtkBlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1726150280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BmQQn0NA7A3HI6f1goHSPD5Aj/1Se9SJOMQU+5q5BMQ=;
 b=85PBOx26vkTENLN2s5DG+kjBS1IdzrtdYgcfJxebHNu6/e0TtEBEsP6iiixzfNgpjIe2WI
 uQ0bSrxtrvJr4cDA==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v3 2/4] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
In-Reply-To: <20240910070733.156127-3-jfalempe@redhat.com>
References: <20240910070733.156127-1-jfalempe@redhat.com>
 <20240910070733.156127-3-jfalempe@redhat.com>
Date: Thu, 12 Sep 2024 16:17:19 +0206
Message-ID: <84cyl9c67s.fsf@jogness.linutronix.de>
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

On 2024-09-10, Jocelyn Falempe <jfalempe@redhat.com> wrote:
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
>  * drm_log can only be built-in (and drm must be built-in too).
>    The reason is that, if you build it as a module, then a userspace
>    application will be more appropriate than this module.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de> # console API
