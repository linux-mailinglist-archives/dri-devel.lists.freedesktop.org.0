Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BF944E02
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 16:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286AA10E988;
	Thu,  1 Aug 2024 14:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="YaJtkggl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8SRgewnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5ED10E988
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 14:28:34 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1722522512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIQ5uRwYXhoY3X2ooGCX30n8xR3R9831eLGQsegoiWE=;
 b=YaJtkgglPssTF6lKCViNqI0lvCwRJqTAwPbnlo6rT4qz+2GQupGefTP4MfyV2sqS60jn9C
 ofbCKyBDMDaAb0MEQ5nwYROoA8vCkx8TGHLHeJWs6XO7qVC7DY1auIwkEfeljJGns0fDWE
 +mM8hTGzlaf/NRFU3P9hWjrDftDzDasj5nJWHpyZ/wJ7Tcb2Ij5DZlQq4yBpuabm9IAwqV
 SWS/qgfRD+8Q3KClKe+EaIZz4opB46JroGz9vqAlh6hR/vJtol4gpVhzJ+ImUzIjq5ksou
 OMLuipseA6+l68dAFU+646t0bI/OTjHXx6Oq06qdBLFea48xK9WmzOPI5HQOhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1722522512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIQ5uRwYXhoY3X2ooGCX30n8xR3R9831eLGQsegoiWE=;
 b=8SRgewnhoFhfMIxvgWvp+pLp+3Wpt89xZ3dqNs28rkUAK+kUvWfLZIWEjuUuSrKnAc9Ogn
 P5dbywfp+U27s0Cw==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw
 the kmsg on the screen
In-Reply-To: <d4412d54-41b1-4671-9733-34ba1423404c@redhat.com>
References: <20240801100640.462606-1-jfalempe@redhat.com>
 <20240801100640.462606-4-jfalempe@redhat.com>
 <87o76czfb2.fsf@jogness.linutronix.de>
 <d4412d54-41b1-4671-9733-34ba1423404c@redhat.com>
Date: Thu, 01 Aug 2024 16:34:31 +0206
Message-ID: <87zfpwxqpc.fsf@jogness.linutronix.de>
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

On 2024-08-01, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> I think I can also register one console for each drm driver, which
> will simplify drm_log even further. (currently it would mean having a
> circular buffer and work function for each driver which is a bit too
> much).

Indeed.

> Do you know if there is a chance to have write_thread() in 6.12 or
> 6.13 ?

Sorry, I have no crystal ball. Petr Mladek and I are working really hard
to get things in shape for mainline. I do think there is a chance for
the 6.12 merge window. But it would also need to get past Linus. Our
recent atomic console efforts were rejected [0] for the 6.11 merge
window. We are working to get that series in shape for 6.12 in parallel.

John

[0] https://lore.kernel.org/lkml/CAHk-=whU_woFnFN-3Jv2hNCmwLg_fkrT42AWwxm-=Ha5BmNX4w@mail.gmail.com
