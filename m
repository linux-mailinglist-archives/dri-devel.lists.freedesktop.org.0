Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D743C9BB177
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 11:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012C510E1AF;
	Mon,  4 Nov 2024 10:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="1ovJRJ/T";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZfPAEvmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E3310E1AF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 10:46:37 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1730717194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUMq9d/Y/ah4RgFgHvJiQ6t1sVUNjgH2DIyO/HDYra0=;
 b=1ovJRJ/TBkp7r3/PUwP9+odLJ39BlWZTIS/0NdCR92N2FTvB5jtyF2CI07zGwxK5Er8dFf
 lVl58oqFRdTuTa/xkQqhktnzG4tilhVUsY/IqY3Q3neCIyNfPDjbKOrqCp6laEPleyjUC0
 ykjdVCyJB492DT+wzPIqAIyaOdYIeC6hehXmzMvefhSyfWvo6gPq/Sdyv8iTf/4me4RcKI
 ZBqIHczL2eevHojSZWJIAYqX3Vmc99TVkyP0/T9i/qwIgn68rEmW5kRS4gubS6GFufda+T
 RMMqvKzi2uYzT2P+ejTDQwckQtwA/9xB3883JypMV+QyFepN5JQUkigtxUlx2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1730717194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUMq9d/Y/ah4RgFgHvJiQ6t1sVUNjgH2DIyO/HDYra0=;
 b=ZfPAEvmBmdqXqhY0/Fy+yfJ4atEMo8/7475YTV5JyDS79wAY3X11OGPqy6XBZeEDFG3B4S
 mBaDtegd+X1UDhBA==
To: Jocelyn Falempe <jfalempe@redhat.com>, Petr Mladek <pmladek@suse.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Javier
 Martinez Canillas <javierm@redhat.com>, "Guilherme G . Piccoli"
 <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, Caleb Connolly
 <caleb.connolly@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] drm/log: Implement suspend/resume
In-Reply-To: <d5c8ea70-8596-42a1-8688-0f6131187b73@redhat.com>
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
 <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
 <27c1a6bf-d1e4-469f-a0d4-3e74ab0d0a07@redhat.com>
 <a6c00956-3733-43a1-9538-aa2758d2b4a3@redhat.com>
 <ZyT7MScAsHxkACfD@pathway.suse.cz>
 <d5c8ea70-8596-42a1-8688-0f6131187b73@redhat.com>
Date: Mon, 04 Nov 2024 11:52:33 +0106
Message-ID: <84o72vcm46.fsf@jogness.linutronix.de>
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

On 2024-11-04, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> I looked at what serial drivers are doing, because they can also have 
> their clock gated in suspend.
>
> Would calling console_stop() in the suspend and console_start() in 
> resume work ?

Yes. That is what it is for.

John Ogness
