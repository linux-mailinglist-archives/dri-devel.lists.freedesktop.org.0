Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D726898696D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 01:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D1010E868;
	Wed, 25 Sep 2024 23:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="jab1XArA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D46710E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 19:22:29 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id D18612040C;
 Wed, 25 Sep 2024 21:22:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwJVTPf963ii; Wed, 25 Sep 2024 21:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1727292147; bh=4AOBEWDi+wIT+2mWhnODD4oRA7Jy5g1vOfK1zL2v2jw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jab1XArAQCpMpUifYMzULpPmP4mLFDH14YqPBFrPOIbDkP1YvzUpHR8cLQFlWFHjJ
 IXzqI7sENWvoev0+LlTtCV/W5T1+zpD6pEbQlpRriQUd9p4HAzyq40COGMb+XnvhqZ
 yqx7mvOYY33lpBpQOVkykPVy9H6u2X6KJ1/RTJepHwN/mppKOxWpcNEoZ52hu8m0Mn
 bEuD9jWZNBdoHYhfePEfbImFaUOFdOqPal0eniAaMKW25CbNsNBa7bqmAi6FS3nI/h
 n8vvUUHHhWnXg20R0LPdhIVoKHvhG2XM6UqYAM3tLYuxV+tW1+E+deClkZJlPdUnNn
 xMOqG17lNUX4w==
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 19:22:26 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kauschluss@disroot.org
Subject: Re: [PATCH 2/6] drm/exynos: exynos7_drm_decon: fix suspended
 condition in decon_commit()
In-Reply-To: <f64c303e-8a88-4aee-9110-ee4a06a3d67f@kernel.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-2-6c5861c1cb04@disroot.org>
 <f64c303e-8a88-4aee-9110-ee4a06a3d67f@kernel.org>
Message-ID: <206c17ac8f79bbd51bf94b8f1f72fbb9@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 25 Sep 2024 23:21:53 +0000
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

On 2024-09-20 12:40, Krzysztof Kozlowski wrote:
> On 19/09/2024 17:11, Kaustabh Chakraborty wrote:
>> decon_commit() gets called during atomic_enable. At this stage, DECON is
>> suspended, and thus the function refuses to run. Fix the suspended
>> condition checking in decon_commit().
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
> 
> If this is a fix, then you miss fixes tag and cc-stable. However the
> explanation seems just incomplete. This looked like a intentional code,
> so you should explain really why original approach was wrong.

Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")

Now that I read the commit description of the above commit, which mentions
that the DECON driver is based on the FIMD driver, I think it makes more
sense to rewrite the suspend logic exactly as done in the FIMD driver.
Will do it in v2.

Here's a commit description which may be better suited, let me know:

A flag variable in struct decon_context, called 'suspended' is set to false
at the end of decon_atomic_enable() and is set back to true at the end of
decon_atomic_disable().

Functions called in decon_atomic_enable(), such as decon_enable_vblank()
and decon_commit() are guarded by suspend condition checking, where it
refuses to proceed if 'suspended' is set to true. Since 'suspended' isn't
set to true until the end of the calling function, the called functions
aren't even executed.

The original commit, 96976c3d9aff ("drm/exynos: Add DECON driver")
implementing the DECON driver, is based on the FIMD driver, but changes
the suspend flag logic which causes this issue. Implement the suspend
logic present in FIMD, which changes the flag at the beginning of
atomic_enable and atomic_disable instead.

> 
> Best regards,
> Krzysztof
