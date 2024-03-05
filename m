Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E28717C5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E191D11291E;
	Tue,  5 Mar 2024 08:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="AW1ONpUi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U+YKs3J2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F82F11291E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:14:43 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1709626480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QNj7PzdvPD7WI4n6gxvH/sldUw13zTEnUHfCfXtrBfY=;
 b=AW1ONpUi54JG/W8Xq0iCOJ+eRZYJ71mlsZBTKucUQukQApG9jkJQp/vHbhqXgmx1KJcg0q
 xrymlFFOn0K0nfGkWctpzzoZ72zAPuBe0YI8psTYXU+GxSCjkbH5vRUKBIIaxxNujxjllB
 dH1dWuw1wM2cbKyB0MrxCclkRTYo8Dz/mRGbxw2dgMMFL9utPOrct/XyJ7udlpwyoc5YVQ
 42WlvyPN2gFl6YCASoEctdlIzZGQICvvsf3e9VpNi7UV0Z2KQbJforFdImyUNpJDlvxkl7
 mHKEkbHEflkF1p2+FXc6E0mija2dsyi8/2T0QfXLX+2vQ3g1hwTtRERCBcZ33g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1709626480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QNj7PzdvPD7WI4n6gxvH/sldUw13zTEnUHfCfXtrBfY=;
 b=U+YKs3J2V6X7uOq6wIPVddHSenSEATkimtwzqfXS5cAp6V6TjivHnzU/TBO8ROHOj9ZFab
 t0bUT9BLfjBLuECQ==
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel.vetter@intel.com>, Jocelyn
 Falempe <jfalempe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, Lukas Wunner
 <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] drm/panic: Add drm panic locking
In-Reply-To: <20240301103903.2538083-1-daniel.vetter@ffwll.ch>
References: <20240301100516.2516297-1-daniel.vetter@ffwll.ch>
 <20240301103903.2538083-1-daniel.vetter@ffwll.ch>
Date: Tue, 05 Mar 2024 09:20:04 +0106
Message-ID: <87o7bt6qpf.fsf@jogness.linutronix.de>
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

Hi Daniel,

Great to see this moving forward!

On 2024-03-01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> But for the initial cut of a drm panic printing support I don't think
> we need that, because the critical sections are extremely small and
> only happen once per display refresh. So generally just 60 tiny locked
> sections per second, which is nothing compared to a serial console
> running a 115kbaud doing really slow mmio writes for each byte. So for
> now the raw spintrylock in drm panic notifier callback should be good
> enough.

Is there a reason you do not use the irqsave/irqrestore variants? By
leaving interrupts enabled, there is the risk that a panic from any
interrupt handler may block the drm panic handler.

John Ogness
