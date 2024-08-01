Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75F944961
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6034610E8F9;
	Thu,  1 Aug 2024 10:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="YZDDq0Ye";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vH2A30OZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB6910E8F7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:36:20 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1722508577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7pSGdedTnrKHyGVkygnUytyWdZqoA6ccx0V5Arx0A2o=;
 b=YZDDq0YeYlcFlFz8zgHfnLJpNr4EDCzlGLaWR4lm985l5vuDRRvnIkcI6rP8/pF75pJU3D
 OFcHyyP7xBI+TtoLud3ZUqWlulyRHRGc56oHNHOpt8XFQZWMgl7rKxoGOX3kWAA8nE0/Of
 stQ+p9ZDXUwMGj8qCgpPUWyQU6zeqeN2r0OdilmiwdFIiJbmcF7IrUvWx9mF1fEIiA3M+7
 JOJSK25ZH1jn2OP4YdWybzZEoK19W0VyNe6aV3GHf6fnwzjNBE+jv4csFrhu+pSWTPAJrx
 IYFWSkbD93B/U38hLGAnoKzYJ6MovRvmBm9LMS/gbOetpvax5aU9gkq//Umxbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1722508577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7pSGdedTnrKHyGVkygnUytyWdZqoA6ccx0V5Arx0A2o=;
 b=vH2A30OZZV7ITVYUpIAF2gS72r5BOxeA8JZgDoC+UfePCVPovEM2vegvtBuH1at0vGrlqT
 r6msIPD3wksROgAg==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [RFC PATCH 0/3] drm/log: Introduce a new boot logger to draw
 the kmsg on the screen
In-Reply-To: <20240801100640.462606-1-jfalempe@redhat.com>
References: <20240801100640.462606-1-jfalempe@redhat.com>
Date: Thu, 01 Aug 2024 12:42:17 +0206
Message-ID: <87r0b8zg0u.fsf@jogness.linutronix.de>
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
>  * I tried to use the new nbcon interface, but didn't get any message
>  from the write_atomic() callback, but the goal is to use that when
>  it's ready.

Be aware that the write_atomic() callback _must_ also print from NMI
context. write_thread() may be the callback you are interested
instead. Note that for CON_NBCON, write_atomic() is optional,
write_thread() is mandatory.

Disclaimer: All of this currently only available in the PREEMPT_RT
patchset. So until it hits mainline, semantics may yet change.

John Ogness
