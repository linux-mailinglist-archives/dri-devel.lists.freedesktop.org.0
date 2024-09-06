Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D763296EDF5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6D110E9B5;
	Fri,  6 Sep 2024 08:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="MlrdBnFC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gn4LBVGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D97C10E9B3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:27:12 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1725611230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJbOCgxy0nHupgffVDYBsbW7CnT3lHShcJuXBEkpffQ=;
 b=MlrdBnFCL2qo10JYfYN2Z01QU2k2UjNl7YwVkHf7LeMSyguIqDJCCo9iI37qBbIxJOFvcy
 /ajxoBhfu45n0p7Ht/naoezemkdXGg30dsyQJRHPzufMjkvMttXCJRa0Ko1seJUHTJp1Cr
 ec2fU/IPwmjFF+3/jubA51E/LW3PEijc1iaH9YplCBf53vPlBM03EVOre92dN7a0wBKUAp
 JT4FlhTSdM22SNEa2P6b9ypgeyiiQ7eZwNQIpW1kvvecz0ygbMzNNdEqyIjwPS/KFwis6w
 C3fWd2DyBQvyPXIbgTV/+JFxEVmYjQgGtKiNojRtrJCE62RyvJmZGiELpC9KXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1725611230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJbOCgxy0nHupgffVDYBsbW7CnT3lHShcJuXBEkpffQ=;
 b=Gn4LBVGYxPZJDbum2aPH6zTSEQQahNdcQvfzfMNIqQ22qBjL9IC2X2S5lciEtz5KFgLEva
 7KSoNHMLUoieV8BA==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Petr Mladek <pmladek@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw
 the kmsg on the screen
In-Reply-To: <a421b31b-53ad-4f56-88be-66a7d4c3bb61@redhat.com>
References: <20240801100640.462606-1-jfalempe@redhat.com>
 <20240801100640.462606-4-jfalempe@redhat.com>
 <87o76czfb2.fsf@jogness.linutronix.de>
 <d4412d54-41b1-4671-9733-34ba1423404c@redhat.com>
 <87zfpwxqpc.fsf@jogness.linutronix.de>
 <87a5gm2khw.fsf@jogness.linutronix.de>
 <a421b31b-53ad-4f56-88be-66a7d4c3bb61@redhat.com>
Date: Fri, 06 Sep 2024 10:33:09 +0206
Message-ID: <87seudchlu.fsf@jogness.linutronix.de>
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

On 2024-09-06, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> It would be great to see a version of drm_log that only implements
>> write_thread() and does not do any of its own buffering with workqueue
>> and also does not need to track multiple graphic loggers at the same
>> time.
>
> Thanks for the head-up.
> I will rebase it on top of Linux-next, and adapt to the new 
> write_thread() API, it should be much simpler.

For drm_log, your write_atomic() callback should be NULL. You only need
to implement the write_thead(), device_lock(), and device_unlock()
callbacks.

Your device_lock()/device_unlock() callbacks probably just need to
lock/unlock your mutex @drm_log_lock.

device_lock() is already called when the write_thread() callback is
called. So your write_thread callback really only needs to call your
drm_log_draw_kmsg_record(&dclient->scanout, wctxt->outbuf, wctxt->len).

Please let me know if you run into any issues. We probably should write
a document "HOWTO write an NBCON console driver".

John Ogness
