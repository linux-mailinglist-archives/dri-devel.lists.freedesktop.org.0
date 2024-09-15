Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5719796AD
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 14:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF45B10E0EF;
	Sun, 15 Sep 2024 12:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hMxf6mYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B46D10E0F8;
 Sun, 15 Sep 2024 12:53:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC5CB5C0448;
 Sun, 15 Sep 2024 12:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717F5C4CEC3;
 Sun, 15 Sep 2024 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726404832;
 bh=LPJ5SATag2i0d8UFpP+hkORo0mZC23PbErfvFGCVqJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hMxf6mYI3/Svo9TsCtzjNWE1vej95mXh2wk9matrrdRv3nG7QqtYJPKpEKeRjhEmI
 oKgfYRkJcVVCg9cZrDz6rgbKMdpfLkpcu3mSPBDaU3kdAgjHs+917hso7w3eRDHsye
 BJxcjCQk1n7xj8TApOhO+OXve7noX8QgmxAw02nfpX3i7n09SV9hvmqbayEu3xcW+4
 NzMugVQ3ji3NOemBG3qibn9zG0CliflB9sTx/nyRY9cZAmENsjRfeD1QD6LOq38Rf5
 BszHw+9SaApfNT6NDik/aTV5dCJji76rZ5K5e9WD+0fy9x+mP6hXVa+x0h7VkmaMvp
 0IXuKrkctidCQ==
Date: Sun, 15 Sep 2024 12:53:48 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
 Hugues Bruant <hugues.bruant@gmail.com>, intel-gfx@lists.freedesktop.org,
 Brian Norris <briannorris@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3] firmware: coreboot: Don't register a pdev if
 screen_info data is present
Message-ID: <ZubY3NtRJWWTS1ON@google.com>
References: <20240913213246.1549213-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913213246.1549213-1-javierm@redhat.com>
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

On Fri, Sep 13, 2024 at 11:32:29PM +0200, Javier Martinez Canillas wrote:
> @@ -27,8 +28,10 @@ static int framebuffer_probe(struct coreboot_device *dev)
>  	int i;
>  	u32 length;
>  	struct lb_framebuffer *fb = &dev->framebuffer;
> +	const struct screen_info *si = &screen_info;
>  	struct platform_device *pdev;
>  	struct resource res;
> +	unsigned int type;
>  	struct simplefb_platform_data pdata = {
>  		.width = fb->x_resolution,
>  		.height = fb->y_resolution,
> @@ -36,6 +39,20 @@ static int framebuffer_probe(struct coreboot_device *dev)
>  		.format = NULL,
>  	};
>  
> +	/*
> +	 * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
> +	 * in the coreboot table should only be used if the payload did
> +	 * not pass a framebuffer information to the Linux kernel.
> +	 *
> +	 * If the global screen_info data has been filled, the Generic
> +	 * System Framebuffers (sysfb) will already register a platform
> +	 * device and pass that screen_info as platform_data to a driver
> +	 * that can scan-out using the system provided framebuffer.
> +	 */
> +	type = screen_info_video_type(si);
> +	if (type)
> +		return -ENODEV;

Given that `type` and `si` aren't used in otherwhere, the local variables can
be dropped.

I haven't had chance to see how to fix the 0-day build errors properly.  If you
have chance to send the next versions, please drop the local variables.
