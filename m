Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14973AEA187
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B59910E8CF;
	Thu, 26 Jun 2025 14:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h/yjG2dW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74F410E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 14:57:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 10470613A9;
 Thu, 26 Jun 2025 14:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43249C4CEEB;
 Thu, 26 Jun 2025 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1750949845;
 bh=DpQu293QtnkVCjW/dcgcoz5uwg7vQNBKK1Jw3JgSQ40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/yjG2dWFn9WJLfhtEMNsY4uEfjYEayQAJL4nbfuLyf0IEfVA+bsMr2naPrff9YRz
 Qz0s6K8uKmFpUpVU0AmSQoOFAeH27b6xFGkUTBMAvZK21AdAQSCnNa2CWGoYWKyz+L
 LamXjn3K8rm15iHh60tz+sPTgTVcYHzezZVx0GFA=
Date: Thu, 26 Jun 2025 15:57:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 mcanal@igalia.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 stable@vger.kernel.org, sashal@kernel.org
Subject: Re: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
Message-ID: <2025062607-hardener-splotchy-1e70@gregkh>
References: <20250626142243.19071-1-pranav.tyagi03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626142243.19071-1-pranav.tyagi03@gmail.com>
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

On Thu, Jun 26, 2025 at 07:52:43PM +0530, Pranav Tyagi wrote:
> From: Maíra Canal <mcanal@igalia.com>
> 
> [ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]
> 
> Currently, it is possible for the composer to be set as enabled and then
> as disabled without a proper call for the vkms_vblank_simulate(). This
> is problematic, because the driver would skip one CRC output, causing CRC
> tests to fail. Therefore, we need to make sure that, for each time the
> composer is set as enabled, a composer job is added to the queue.
> 
> In order to provide this guarantee, add a mutex that will lock before
> the composer is set as enabled and will unlock only after the composer
> job is added to the queue. This way, we can have a guarantee that the
> driver won't skip a CRC entry.
> 
> This race-condition is affecting the IGT test "writeback-check-output",
> making the test fail and also, leaking writeback framebuffers, as the
> writeback job is queued, but it is not signaled. This patch avoids both
> problems.
> 
> [v2]:
>     * Create a new mutex and keep the spinlock across the atomic commit in
>       order to avoid interrupts that could result in deadlocks.
> 
> [ Backport to 5.15: context cleanly applied with no semantic changes.
> Build-tested. ]

Did you forget about 6.1.y?

confused,

greg k-h
