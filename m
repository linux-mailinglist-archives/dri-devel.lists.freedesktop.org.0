Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37E2CC1FE5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C824B10E71B;
	Tue, 16 Dec 2025 10:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kMoOFdJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2056110E71B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765881593;
 bh=OZy5jtqtUVBl1+kp6S5KScYDG3h4roefYLrCXO1760Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kMoOFdJctQiefb9L1zf9l2SAqCY28Qym8Lw1HvVIdM4cxfqDUftYHtAN47KGQHohq
 tGGlr5XCk9VBMhfu3N0GnMxvYDKTdUIJ+3expygACLGVqAYW+coIpaser294ciDxmx
 /ZkMTxrFoLoUxhPDPXJsd0NPpX5d1kU8SCJ5YgtdC55C8q8LccC5FN8IDCZXWOPScN
 d4Dr38Ea/p3DIFMERI31LSka6wmpDOaCgW6QBkUBWdeExVWu5+NPVM6mZMfPl+A/qm
 Bo94RY0xluuWTqkOJ4cXfp8AWyNGgh037ETbffIMTsF2cJcZBWF9UyEKkt3aoCNlE1
 jE7eeHHaHSxwQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3AD9A17E1104;
 Tue, 16 Dec 2025 11:39:53 +0100 (CET)
Date: Tue, 16 Dec 2025 11:39:49 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, aishwarya.tcv@arm.com
Subject: Re: [PATCH] drm/panthor: Fix NULL pointer dereference on
 panthor_fw_unplug
Message-ID: <20251216113949.3d737b77@fedora>
In-Reply-To: <20251215203312.1084182-1-karunika.choo@arm.com>
References: <20251215203312.1084182-1-karunika.choo@arm.com>
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

On Mon, 15 Dec 2025 20:33:12 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> This patch removes the MCU halt and wait for halt procedures during
> panthor_fw_unplug() as the MCU can be in a variety of states or the FW
> may not even be loaded/initialized at all, the latter of which can lead
> to a NULL pointer dereference.
> 
> It should be safe on unplug to just disable the MCU without waiting for
> it to halt as it may not be able to.
> 
> Fixes: 514072549865 ("drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs")
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 4beaa589ba66..a64ec8756bed 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1261,10 +1261,6 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  		if (ptdev->fw->irq.irq)
>  			panthor_job_irq_suspend(&ptdev->fw->irq);
>  
> -		panthor_fw_halt_mcu(ptdev);
> -		if (!panthor_fw_wait_mcu_halted(ptdev))
> -			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
> -
>  		panthor_fw_stop(ptdev);
>  	}
>  

