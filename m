Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF282A25F5D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC3710E02C;
	Mon,  3 Feb 2025 15:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tjfWlBNE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D340E10E02C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:59:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E56A5C651B;
 Mon,  3 Feb 2025 15:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28D4C4CEE2;
 Mon,  3 Feb 2025 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738598375;
 bh=pB/avWjDA66o8qKuT2L9+9mKgLG7V6fnqRlYSS+zEjA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=tjfWlBNE0ro2NFADlOh5t7iM+e5SYlVBcjAvJI1pvU3sAOYkBkuaLtsgzyY890KLD
 W+/AHwBP880dWVzZhETmMYAuqqaaMUUabAL0zq7aSNZEKqR3l+8MyZV5SIjEv6C/Jc
 fPx71AYeqD/Rw1A2U2eqWXkpBBbfLFCnpkvZOLH1BdJFC3wxGqLaN4lvbS+UQ4oml+
 GxxemtxZ1Hf/WLwm/yrg1ESx5brqCoM+ma7EJk0/DxPP1tWMIkof3gujXlLpI26i11
 12YJ/ZSPwL/2eQYq24WhG+khBlM9XYYqv5aLSjnOh8dFaRck8tGo66yZQNO9aHia2H
 Ihmkm0uGc+d3w==
Date: Mon, 3 Feb 2025 09:59:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: wait_event_timeout() usage in decon_wait_for_vblank()
Message-ID: <20250203155933.GA786168@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAQKjZNqFt=SYxCzpQ5JwOADRUwsWsq5KzLRoPG++27SXGubnQ@mail.gmail.com>
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

On Sun, Feb 02, 2025 at 01:02:47PM +0900, Inki Dae wrote:
> 2025년 2월 1일 (토) 오전 1:56, Bjorn Helgaas <helgaas@kernel.org>님이 작성:
> >
> > I don't know this code at all, so this is likely just noise, but the
> > wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
> > me.
> >
> > decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
> > to be cleared.
> >
> > But decon_irq_handler() only clears wait_vsync_event and wakes up
> > wait_vsync_queue when !ctx->i80_if.
> >
> > I don't see any i80_if connection in decon_wait_for_vblank().  Does
> > the wait always time out if i80_if is set?  Is there some reason we
> > don't use decon_wait_for_vblank() at all if i80_if is set?
> 
> For the decon series, the implementation for the i80 interface has not
> yet been completed. If you would like to see how the i80 interface is
> handled in Exynos, please refer to the code for the legacy display
> controller module, exynos_drm_fimd.c, available at the following link:
> https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/tree/drivers/gpu/drm/exynos/exynos_drm_fimd.c?h=exynos-drm-fixes#n1053
> 
> Furthermore, please note that within the decon driver, prior to
> creating the CRTC, it is necessary to implement the TE handler for the
> i80 interface in the te_handler of exynos_drm_crtc_ops and register it
> as a callback.

I'll take your word for it that this all works as intended.  For many
wait_event_timeout() callers, the connection between kicking off some
operation, waiting for completion, and doing the wakeup is a little
bit obscure and hard to analyze without deep knowledge of the driver.
This was just one instance of those.

Bjorn
