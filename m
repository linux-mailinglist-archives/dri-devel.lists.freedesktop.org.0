Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60013B0DA27
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 14:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E888610E2FC;
	Tue, 22 Jul 2025 12:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fYkIGOCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA5310E18A;
 Tue, 22 Jul 2025 12:53:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C31514604C;
 Tue, 22 Jul 2025 12:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A56BC4CEEB;
 Tue, 22 Jul 2025 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753188836;
 bh=l36K1arYiCPZuEsEChdSPm/wgV9PJ5GgyMMrjLPPdys=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=fYkIGOCRlImvJJtBzEwQb6Bk5uiYGRbwN/JRMt5gkmj9bwHltVcsWQXO+j0l9/2Xr
 ZIayfwC4znACkCcOP6pc3uvvmy36X0i2UYksFwxVjavrIwIZI92HOFjMIZqwVEnxTd
 jXRy+MVECjq7qiibmuELUDkxQITc520xDW1TUCJbJKGMx2MkQHcuGE4O9P8x1ZMJOX
 cW3lt9nIRjt+dyYa+2tPh0pLKeZV+nPti49J7ryozKsBtFXVubBXpy8QYRoJSo6Q97
 kFzUJ/oKuzEydTt1VkhdRnZ7LYXxuwzV8gwz6DTAR7DRmesdiOVWA95PbcaUYuqmqM
 FjF1NgJ2mrXlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 14:53:52 +0200
Message-Id: <DBILKMS2C1HI.QDSXTIXBVWV2@kernel.org>
Subject: Re: [PATCH] Revert "drm/nouveau: check ioctl command codes better"
Cc: "Lyude Paul" <lyude@redhat.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Arnd Bergmann" <arnd@arndb.de>,
 "Satadru Pramanik" <satadru@gmail.com>, "Chris Bainbridge"
 <chris.bainbridge@gmail.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Dave Airlie" <airlied@redhat.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250722115830.2587297-1-arnd@kernel.org>
In-Reply-To: <20250722115830.2587297-1-arnd@kernel.org>
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

On Tue Jul 22, 2025 at 1:58 PM CEST, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> My previous patch ended up causing a regression for the
> DRM_IOCTL_NOUVEAU_NVIF ioctl. The intention of my patch was to only
> pass ioctl commands that have the correct dir/type/nr bits into the
> nouveau_abi16_ioctl() function.
>
> This turned out to be too strict, as userspace does use at least
> write-only and write-read direction settings. Checking for both of these
> still did not fix the issue, so the best we can do for the 6.16 release
> is to revert back to what we've had since linux-3.16.
>
> This version is still fragile, but at least it is known to work with
> existing userspace. Fixing this properly requires a better understanding
> of what commands are being passed from userspace in practice, and how
> that relies on the undocumented (mis)behavior in nouveau_drm_ioctl().
>
> Fixes: e5478166dffb ("drm/nouveau: check ioctl command codes better")
> Link: https://lore.kernel.org/dri-devel/CAFrh3J85tsZRpOHQtKgNHUVnn=3DEG=
=3DQKBnZTRtWS8eWSc1K1xkA@mail.gmail.com/
> Reported-by: Satadru Pramanik <satadru@gmail.com>
> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-fixes, thanks!

  [ Add Closes: tags, fix minor typo in commit message. - Danilo ]
