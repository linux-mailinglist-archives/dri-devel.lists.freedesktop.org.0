Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183DEA35D4E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 13:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2746C10E2C5;
	Fri, 14 Feb 2025 12:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kaN/ixHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F1A10E2C5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 12:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 930E55C5961;
 Fri, 14 Feb 2025 12:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EEDC4CED1;
 Fri, 14 Feb 2025 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739534995;
 bh=aMZ0cmH8caWaku0ONbONWBbEbf8eUQ81CViz/ZDY0Ko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kaN/ixHYZVsyIh53ymK5s3pCRmBqz31qY2izgd8EvdNcoO0lNCyxV5O9t922mcH6A
 VQhA5lPJuajiEsBcVSZjGdPeT1XDaW5KkF4rD0HyuPzoC9yVM7HuZByJO1bjVg6QAN
 W7ONolEqPuyonTXbNBJYImXvPPWvsldL2GBI0DTQXU8jYBZ26B/6CpclU+E1X5iOVT
 KedRs79+TMfk1CB34POekCy6vqNhHGP95dw1cdygpe+f6Dx/cXco7rCXla4DTH3X3X
 am6o0pElXYsqn9P1awqfvXqHEEAV2qV3Iph7MWGgB/mq+zyEz7mtkWqXkF07ogP11J
 J+IEgrLHtQL6g==
Date: Fri, 14 Feb 2025 12:09:50 +0000
From: Will Deacon <will@kernel.org>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 David Airlie <airlied@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Clean up FW version information display
Message-ID: <20250214120949.GA12809@willie-the-truck>
References: <20250213161248.1642392-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213161248.1642392-1-steven.price@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Feb 13, 2025 at 04:12:48PM +0000, Steven Price wrote:
> Assigning a string to an array which is too small to include the NUL
> byte at the end causes a warning on some compilers. But this function
> also has some other oddities like the 'header' array which is only ever
> used within sizeof().
> 
> Tidy up the function by removing the 'header' array, allow the NUL byte
> to be present in git_sha_header, and calculate the length directly from
> git_sha_header.
> 
> Reported-by: Will Deacon <will@kernel.org>
> Fixes: 9d443deb0441 ("drm/panthor: Display FW version information")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Note that there should be no functional change from this patch.
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 4a9c4afa9ad7..645fc6d2e63b 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -636,8 +636,8 @@ static int panthor_fw_read_build_info(struct panthor_device *ptdev,
>  				      u32 ehdr)
>  {
>  	struct panthor_fw_build_info_hdr hdr;
> -	char header[9];
> -	const char git_sha_header[sizeof(header)] = "git_sha: ";
> +	const char git_sha_header[] = "git_sha: ";
> +	const int header_len = sizeof(git_sha_header) - 1;

nit: strlen()?

In any case, this fixes the arm64 CI [1], so:

Acked-by: Will Deacon <will@kernel.org>

It would be great to land this as a fix to save us having to carry it
on our CI branch.

Cheers,

Will

[1] https://lore.kernel.org/r/20250213154237.GA11897@willie-the-truck
