Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7D9BCDA8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 14:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A75110E599;
	Tue,  5 Nov 2024 13:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="RCnOLWs0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bk3Uo3Aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCEE10E16C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 13:17:13 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1730812632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K4W2DVwjGFKZ4BCBSaN1M0hjr3+iDj0J8sxoOxVTCYw=;
 b=RCnOLWs0E22uRdavElFnBEMBIbwd4S0uRs38a/Pt25hmnTWWAkI0zCJKSdquJORW6JKMUT
 GWNwR+QajenzBuxyK4pTEuxgVEuEw1LWwJL26xVmTCitWwyz5AoVB7Hn8z6wkggOWEeQZL
 SZMOW/m+sY+Xf0Sp2WagmZeFJ1+8nmbrCWVgtKQbNLYn4/E+sSOUVdCnI/34d4KIc/9Yl4
 D2Yf89bQ3KasXYjN11El59/B2Jv0PldWaT9t+ySaTGAflLSYCov2o531hHLia8egsrQtof
 d+1LUW9usp8kZ0OTpMleVe2UPQ3V6TvUsk1ma2rDsM/f38plptFtOYh/RATaeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1730812632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K4W2DVwjGFKZ4BCBSaN1M0hjr3+iDj0J8sxoOxVTCYw=;
 b=bk3Uo3Awv+CfakV5KFLy+VM6RJhAAZ1LibiIK52jef3AoJA4VE5nVhIXTRVxi8EB7u6ia2
 yz/OjmV6H5tuPaCg==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly
 <caleb.connolly@linaro.org>, Petr Mladek <pmladek@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v6 5/6] drm/log: Implement suspend/resume
In-Reply-To: <20241105125109.226866-6-jfalempe@redhat.com>
References: <20241105125109.226866-1-jfalempe@redhat.com>
 <20241105125109.226866-6-jfalempe@redhat.com>
Date: Tue, 05 Nov 2024 14:23:11 +0106
Message-ID: <84cyj9es6g.fsf@jogness.linutronix.de>
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
> Normally the console is already suspended when the graphic driver
> suspend callback is called, but if the parameter no_console_suspend
> is set, it might still be active.
> So call console_stop()/console_start() in the suspend/resume
> callbacks, to make sure it won't try to write to the framebuffer
> while the graphic driver is suspended.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>
