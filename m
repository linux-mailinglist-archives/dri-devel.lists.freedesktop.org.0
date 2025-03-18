Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F32A66F3F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 10:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46D710E342;
	Tue, 18 Mar 2025 09:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cyaw2Rew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8447B10E342
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 09:05:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22C9AA48EDB;
 Tue, 18 Mar 2025 09:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC16C4CEDD;
 Tue, 18 Mar 2025 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742288744;
 bh=NQHQfnaphrcglH/8XP/KnT9iOjM0YytcMgrIGKaiLKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cyaw2RewTrR9KRMlO/y78jNE+Ob3LtMw3MhozkqeV4KRSJ2hBi5KKBNf5FhHUmr8c
 OQH5zP5bew7XpsktPpAQ6RUxiQKKhvqMufsZqTuRQX92/+nt/5R90pAkDu2aKMeZsp
 RkB2CWHQwFugI4grS9EEW1jpza/MPm2wYtA+RXTMfM7mWEyI47PFeAABKSVFvThsHx
 +THMf/PeWMdPzf2y9DZ25hquShEFofTvSlUKz7na2iB8LFuUGzOEU9Q4iVLp+mg0T/
 MCnSzt7pzHpi0PH+kH40laJz6HhwYDaDWTNVykCqe+m4jgHiraQgP9nah2wnx39mad
 icJqJfa1iAl0w==
Date: Tue, 18 Mar 2025 09:05:39 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 04/11] backlight: Implement fbdev tracking with blank
 state from event
Message-ID: <Z9k3YxOy26OyFnbS@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-5-tzimmermann@suse.de>
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

On Thu, Mar 06, 2025 at 03:05:46PM +0100, Thomas Zimmermann wrote:
> Look at the blank state provided by FB_EVENT_BLANK to determine
> whether to enable or disable a backlight. Remove the tracking fields
> from struct backlight_device.
>
> Tracking requires three variables, fb_on, prev_fb_on and the
> backlight's use_count. If fb_on is true, the display has been
> unblanked. The backlight needs to be enabled if the display was
> blanked before (i.e., prev_fb_on is false) or if use_count is still
> at 0. If fb_on is false, the display has been blanked. In this case,
> the backlight has to be disabled was unblanked before and the
> backlight's use_count is greater than 0.
>
> This change removes fbdev state tracking from blacklight. All the
> backlight requires it its own use counter and information about
> changes to the display. Removing fbdev internals makes  backlight
> drivers easier to integrate into other display drivers, such as DRM.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
