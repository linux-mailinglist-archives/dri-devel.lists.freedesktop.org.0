Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8788877DD4A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2016D10E30E;
	Wed, 16 Aug 2023 09:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCF110E30E;
 Wed, 16 Aug 2023 09:30:34 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2DFAB40E0140; 
 Wed, 16 Aug 2023 09:30:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id d7ePAOSzahNX; Wed, 16 Aug 2023 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692178227; bh=P6NhbwykV33BYuwxgNIWya2/w0ZvTwkFQjVCfw8K6js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QU1or508FycqFDuv+O8i4Uny9FoAOlEp0TMZNyRjsBRNGCdiENV3itTqwc0hMe1ub
 8JeHBG3g36HkjIHyv3wDgEpBg4vIaC+psLVC1dWIh6sdYLuWIEQDBuxhhF6Rz5tjx2
 tChu0PgO/WUY7xJzVx03+V+KjqyHJ8MrKfAd6CXbqqxuJtgZcQx/4ZQb0h4bp/a0x4
 88pygUnHEzrJKgY/6KHc2aFwq0Rf8+93n+aJvcxl1aPwBREfVYZn57hK0xe4i66Na/
 Id36jX03n8j2h95wipIXebwkTDLKDvW4sd87iZxZZLEubqDcSawVG/THcpPOWyK3Yp
 ANY49t/fPoyqDfsPh+kb8t4rYCLjLGMkDTb7U5ges08lV9ay/N3G3jM9mjwWzhMXYn
 +AChUem+48p6Nf6eoFwUCCggz/3jME4yramG2I/XsWuiArMPsXOlq1UGKQWvudEDzw
 dVp8RK5QxzUztSFWRrd3WyZH6pc+PzNu6PjjPOxmqpRFHamiYjcbI2w8PBKRw5rtwy
 k6tPUfylKZk/1b+73KskU6UbrVfD1vvEZ0UlqzW+DTp0j2oYam4KmdKFP84THhLrk0
 5o3ohNHNYAwQibZicrdeXGY7KoTVhOi9PpnXh0ZhjX5YgYSVRdzjz3TSk31lqmc7vh
 2tp7tSkNWNBMeceEBIc0J4vc=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9B22140E0196;
 Wed, 16 Aug 2023 09:30:20 +0000 (UTC)
Date: Wed, 16 Aug 2023 11:30:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
Message-ID: <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
References: <20230814144933.3956959-1-kherbst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230814144933.3956959-1-kherbst@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 04:49:32PM +0200, Karol Herbst wrote:
> We can't simply free the connector after calling drm_connector_init on it.
> We need to clean up the drm side first.
> 
> It might not fix all regressions from 2b5d1c29f6c4 ("drm/nouveau/disp:
> PIOR DP uses GPIO for HPD, not PMGR AUX interrupts"), but at least it
> fixes a memory corruption in error handling related to that commit.
> 
> Link: https://lore.kernel.org/lkml/20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local/
> Fixes: 95983aea8003 ("drm/nouveau/disp: add connector class")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

This one ontop of -rc5 doesn't help, unfortunately.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
