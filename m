Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0039449B4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C6C10E8FF;
	Thu,  1 Aug 2024 10:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="cagmzj07";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/t4N75zz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E48210E8FF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:51:47 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1722509505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ZKTOOlZVI+YrqeoR4euLdbDErwrHIjykpDdt+xf1z8=;
 b=cagmzj07Lcs7RLrazer5vQvdhLoWMu5sPBJqjyTR5FHZtZH5bmXGUzPKj0AQUYgzWh06BQ
 BVUttSh1PgZrCOa4n0xlYyZJ9GqLFG9pWSVEYgtqsN7acD+LpccmOnvHgwJK540MXLbK+J
 JZD2iGQ8D5eUvuSGUivRwUCBoQXSLjw26IY//7J+35AiHb6Iu/bQxXaKGTwLqLZEkbRR0e
 xLSPOlcDE/GTM/JGLqiYkBc5gfcrGMDIkA32G+kH2Otmnh8SXPfhb9G3PNbpafPoUHwgBc
 q6ZS4v0QzVaDsejBXQ5OPqAFXUAesIo+ykfTodG1H7ogUcRc/Gb89IawmAvAXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1722509505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ZKTOOlZVI+YrqeoR4euLdbDErwrHIjykpDdt+xf1z8=;
 b=/t4N75zzBw+EuLRI2I7Nan98hfqU5E7CSvATRHZlXPvMN8V/nH0FXf8zY6minxvxYBaABV
 jp5JmZtFUvHsK4CA==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw
 the kmsg on the screen
In-Reply-To: <20240801100640.462606-4-jfalempe@redhat.com>
References: <20240801100640.462606-1-jfalempe@redhat.com>
 <20240801100640.462606-4-jfalempe@redhat.com>
Date: Thu, 01 Aug 2024 12:57:45 +0206
Message-ID: <87o76czfb2.fsf@jogness.linutronix.de>
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
>  * It uses a circular buffer so the console->write() callback is very
>    quick, and will never stall.
>  * Drawing is done asynchronously using a workqueue.

For CON_NBCON, neither of the above points are necessary. You can draw
directly from the write_thread() callback. See below:

> +static bool drm_log_work_draw(void)
> +{
> +	unsigned int len;
> +	char buf[512];
> +
> +	len = drm_log_buf_read(buf, sizeof(buf));
> +	if (len)
> +		drm_log_draw_all(buf, len);
> +	return len != 0;
> +}

For CON_NBCON, this is essentially your write_thread() callback:

void drm_log_write_thread(struct console *con,
			  struct nbcon_write_context *wctxt)
{
	drm_log_draw_all(wctxt->outbuf, wctxt->len);
}

You cannot implement a write_atomic() callback because the console must
be able to print directly in NMI context and must not defer. But
write_atomic() is optional, so you should be fine there.

Disclaimer: Only in PREEMPT_RT patchset at the moment.

John Ogness
