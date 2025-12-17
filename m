Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EDCCC7C46
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 14:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5896D10E2BC;
	Wed, 17 Dec 2025 13:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nXVgrEOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389EC10E2BC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765977089;
 bh=CGJmkiZQyghuDU6+56RB6wVMdvUg1flRb6tYEYSBO54=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nXVgrEOSGl8C2R665F/2FV2emdsFArSPQ0dkzbrI1x3nsgBYIyLe0c/f43nzWGE+t
 y/NBy986jDJrad6QONy/cRJV26jh/5601baKMLf+C48MMZphhX+Zl2E8MELqVaudQi
 bP+qNt2n0MHfYwRNuG5LQ//Y8dRRln/omQitbwAu8M2ufb1JpuGp3hwcw74YJgq//T
 V0UUvEv3JnNUjjvUGQZ0EKRgoUk9TMA6DomqCs+QQYw+xblMlfWxV132oQ5QMr8yVO
 4/REQnztBDD9Msul1Ano5gk/Xl4hMuw7xRFLPGAAeCjqf1AIgFUyQoQHn5Dd9+Z4cF
 NMUgf7PsCndWQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EA2317E110D;
 Wed, 17 Dec 2025 14:11:29 +0100 (CET)
Date: Wed, 17 Dec 2025 14:11:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Avoid showing imported BO as exported in
 DebugFS output
Message-ID: <20251217141126.79695427@fedora>
In-Reply-To: <20251216153242.1042613-1-akash.goel@arm.com>
References: <20251216153242.1042613-1-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 16 Dec 2025 15:32:42 +0000
Akash Goel <akash.goel@arm.com> wrote:

> The "gems" DebugFS file shows the device-wide list of DRM GEM objects.
> It displays various information about an object, including if it is
> PRIME imported, PRIME exported.
> This commit fixes the debugfs_bo_print() function to prevent an imported
> BO from also being shown as exported in the DebugFS file output.
> Both 'import_attach' and 'dma_buf' fields will not be NULL for an
> imported BO.
> 
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index b61908fd508a..5dd92cdcf316 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -668,7 +668,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>  
>  	if (bo->base.base.import_attach)
>  		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED;
> -	if (bo->base.base.dma_buf)
> +	else if (bo->base.base.dma_buf)
>  		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED;
>  
>  	seq_printf(m, "0x%-8x 0x%-10x", gem_state_flags, gem_usage_flags);

