Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A387A3DB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 09:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58F610E2E5;
	Wed, 13 Mar 2024 08:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mGvEuauO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A2D10E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 08:03:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D57BC61326;
 Wed, 13 Mar 2024 08:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA46C433F1;
 Wed, 13 Mar 2024 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710317007;
 bh=l0tGitGHLV1/9HpYMoRsuk1aHCzZMdgkRs83nroWmVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mGvEuauOZjLA4AeWdQaZ+xmqo10WtmE5pwVpnPX0E/aJ2es93C2b/33NpdvX41Aqh
 gmn2AcTYEcTBCbwGAS08SmV7apHF6Ia/fwgWiu2ZC7kQt/+za5mMddJl3353b9zc7/
 ydJv/hB/0SJFpCfzLw44FqdT7MsMYvOcsdw4BBtzsylthkA1KFP6BHfRVXVNxmOjA7
 sIhOceZC222dV5+vlAqoITB63IXiljpNJ7skvwjHL7HV1lbKha+Pgv0tKqyY8m6n3w
 vQy8PYF3SfKvrWI/LT8SB6rnBwC09gx7SP8hLJQ0EJgMMr3FzSkTtTwsBIEIQFX3qn
 tjoEKqVFkKZUw==
Date: Wed, 13 Mar 2024 08:03:21 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, andy@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 robin@protonic.nl, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 00/10] backlight: Replace struct fb_info in interfaces
Message-ID: <20240313080321.GE1522089@google.com>
References: <20240305162425.23845-1-tzimmermann@suse.de>
 <heasef3pdfyj7xyngnvbg527pc5uyy2v6hatz4wr6q3sfkhw3h@f4lnresjcnmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <heasef3pdfyj7xyngnvbg527pc5uyy2v6hatz4wr6q3sfkhw3h@f4lnresjcnmb>
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

On Wed, 13 Mar 2024, Uwe Kleine-König wrote:

> Hello Thomas,
> 
> On Tue, Mar 05, 2024 at 05:22:33PM +0100, Thomas Zimmermann wrote:
> > Backlight drivers implement struct backlight_ops.check_fb, which
> > uses struct fb_info in its interface. Replace the callback with one
> > that does not use fb_info.
> > 
> > In DRM, we have several drivers that implement backlight support. By
> > including <linux/backlight.h> these drivers depend on <linux/fb.h>.
> > At the same time, fbdev is deprecated for new drivers and likely to
> > be replaced on many systems.
> > 
> > This patchset is part of a larger effort to implement the backlight
> > code without depending on fbdev.
> > 
> > Patch 1 makes the backlight core match backlight and framebuffer
> > devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
> > drivers and remove unnecessary implementations of check_fb. Finally,
> > patch 10 replaces the check_fb hook with controls_device, which
> > uses the framebuffer's Linux device instead of the framebuffer.
> 
> I assume the merge plan for this series is via drm-misc in one go?

Backlight in one go.  This will be the second attempt at applying it.

-- 
Lee Jones [李琼斯]
