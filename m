Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F9CC2F7D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 13:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3B510E919;
	Tue, 16 Dec 2025 12:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C59110E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 12:52:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B582FEC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 04:52:11 -0800 (PST)
Received: from e142607.local (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 7B6533F73B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 04:52:18 -0800 (PST)
Date: Tue, 16 Dec 2025 12:51:53 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, aishwarya.tcv@arm.com
Subject: Re: [PATCH] drm/panthor: Fix NULL pointer dereference on
 panthor_fw_unplug
Message-ID: <aUFV6chRKx7aoQ5z@e142607>
References: <20251215203312.1084182-1-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215203312.1084182-1-karunika.choo@arm.com>
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

On Mon, Dec 15, 2025 at 08:33:12PM +0000, Karunika Choo wrote:
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

Reviewed-by: Liviu Dudau <liviu@dudau.co.uk>

Best regards,
Liviu

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
> -- 
> 2.49.0
> 
