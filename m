Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F7DABE083
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107A310E5A2;
	Tue, 20 May 2025 16:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gS9PU2qF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099510E4F5;
 Tue, 20 May 2025 16:22:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6E9B6154E;
 Tue, 20 May 2025 16:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E5CC4CEE9;
 Tue, 20 May 2025 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747758127;
 bh=PwfREHNjD08LoQHQb+2a+oNlUMWRFVPe7Pshx9/+Sd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gS9PU2qFMkHTyXBWHGpMjGBqnmICcI/5UxWYCsftTsMxQJZSbXiHsnyZTkAsmvodx
 PDnqBphspLZrY1SqdwpDyUyTKeQR1TO/3tFW9tvS2+lG4vQY0Ov7pSCuVolxAVrTPi
 mi/07FRg6VDuihqB85ocMl3Uo+09+GJd7NNeMFvd3SfFIx3riM4iSyXPAZEoYDUmgt
 91SteDzb6V0ab6zijrraG+XA0Z01RAbS1eb7rEFFkPKUxmd2dNrqFvul0liYWaKYNl
 gU5oNX85u7X/IJ9zNNjfeNGI8Igl1eqicTPUnEDc6w6bsZ53DLqQFCMNVM9KWzA8e5
 mDoNeqPHaWbdA==
Date: Tue, 20 May 2025 18:22:02 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/40] drm/gpuvm: Allow VAs to hold soft reference to
 BOs
Message-ID: <aCysKgGyq5eOXW87@cassiopeiae>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-3-robdclark@gmail.com>
 <aCwx_9KIc9QBd7_0@pollux>
 <CAF6AEGs6_ZgBpKwe7weZWUppCZ87Y6wOt9RsF68hsJO-VpeiJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs6_ZgBpKwe7weZWUppCZ87Y6wOt9RsF68hsJO-VpeiJA@mail.gmail.com>
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

On Tue, May 20, 2025 at 08:54:53AM -0700, Rob Clark wrote:
> On Tue, May 20, 2025 at 12:40 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Mon, May 19, 2025 at 10:51:25AM -0700, Rob Clark wrote:
> > It invalidates the whole design and makes a lot of functions fundamentally
> > invalid to call, which is well demonstrated by all the WARN_ON() calls this
> > patch attempts to add.
> 
> I think of it more as adding a different mode of operation.  One
> where, perhaps some functions of gpuvm are not available, but that is
> fine because they are also unneeded in that mode of operation.  Hence
> the WARN_ON()s to make that clear.

This isn't a different mode of operation. You're breaking the design and
internal guarantees and validity the code relies on. And as a consequence you
have to disable the functions that are obviously broken by scattering it with
WARN_ON() calls.

And for the remaining code that is not disabled we'd have entirely new
requirements on the guarantees the caller must provide in terms of reference
counts.

This is as if I'd try to promote a car with a broken engine control unit and
would tell you "It's just in a different mode of operation, where driving isn't
supported, but you can still heat the cabin and power the radio with the
engine.", hoping that the broken engine control unit has no other side effects.

Sorry, as much as I'd like to help and unblock you, I don't buy it.
