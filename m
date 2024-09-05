Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A455F96DDF1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 17:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF11710E904;
	Thu,  5 Sep 2024 15:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="zOT5hunL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l9Tj357O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949A010E904
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 15:22:38 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1725549756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4Tg8dEgkTswTB6VvQxJ4kNv8/QdAuXjJMDGmVqHWjc=;
 b=zOT5hunL1xI7YbxxPIBQmaQ2SgbJ8GZ8mixTDS+u5CM/ZmL5AoUPHJqEtG60XjbuXkEw6j
 l6yj6F5yE1bGhygRbFpsUqC/2OledY2iw7+VoETsTkanJWvL6m0VnfEcTQBlO0DMsoj4eq
 l6Aooqmsx4rWsFuslIO7seg/PmfseqyYQ34SY5lmwO9uOTiqOcK2IvFKo7sHj0H+iwqYlT
 21+eco3vg6PtAXLl3j/HQAChcnWP9nP2mSGuFZ6EjmCo8JFgNgAU0kYJE8ka1rXVuvhdW6
 CbZiQzsuPCX85o9ctW+ebw1NP2SloIFjUuOo66qybaJ958Ld+FdmeA1YD94g1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1725549756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4Tg8dEgkTswTB6VvQxJ4kNv8/QdAuXjJMDGmVqHWjc=;
 b=l9Tj357OjDMCl5vyh6arql/xekgxrfsNSslEVEF5iEwQP25xBf/RKhlkPP+N4MWRQvkgvb
 he+IKgH6s/I0BaDw==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw
 the kmsg on the screen
In-Reply-To: <87zfpwxqpc.fsf@jogness.linutronix.de>
References: <20240801100640.462606-1-jfalempe@redhat.com>
 <20240801100640.462606-4-jfalempe@redhat.com>
 <87o76czfb2.fsf@jogness.linutronix.de>
 <d4412d54-41b1-4671-9733-34ba1423404c@redhat.com>
 <87zfpwxqpc.fsf@jogness.linutronix.de>
Date: Thu, 05 Sep 2024 17:28:35 +0206
Message-ID: <87a5gm2khw.fsf@jogness.linutronix.de>
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

On 2024-08-01, John Ogness <john.ogness@linutronix.de> wrote:
> On 2024-08-01, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> I think I can also register one console for each drm driver, which
>> will simplify drm_log even further. (currently it would mean having a
>> circular buffer and work function for each driver which is a bit too
>> much).
>
> Indeed.
>
>> Do you know if there is a chance to have write_thread() in 6.12 or
>> 6.13 ?

FYI: The full NBCON API (with write_thread()) is now available in
linux-next.

It would be great to see a version of drm_log that only implements
write_thread() and does not do any of its own buffering with workqueue
and also does not need to track multiple graphic loggers at the same
time.

John Ogness
