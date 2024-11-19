Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FB9D224D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 10:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBA410E00D;
	Tue, 19 Nov 2024 09:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="T1N0iS/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E7B10E00D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732007777;
 bh=X6GAMSsXTjJQqYbDR5soYjiKpd/477BQAQcfGhNwh1E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T1N0iS/WRqLcuoMcbLrzNBzCmelEM17akjwszbWfTgHde9wXpQfSNCv9R55etZLTE
 APnaj5zQSMtp/H/VQXrrUxy7sylP9jghnR16gypGWDsAXZ6rPPg7R9X9aWLOscAZTS
 LWPsAlAmkNs7KYkELD17kDlS0Ggtq3cYYhO5XCWL3VRWFvlUuKS+S7ONOqgDFW2/+w
 mypqQVy7B4rWpSZmhZlA8MST6iLTMFmJ6uXoK+29/6YJ2QGRfESnbKosBkFDsyyeA/
 bgVzYHSZ3El49H/qB7VaLrKCY78i+Oe1i8WZxY/xxPc8u5BcHuhwg1lyDYEK/3V0Ny
 sc+JZCypeXFGQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E5D3517E35D1;
 Tue, 19 Nov 2024 10:16:16 +0100 (CET)
Date: Tue, 19 Nov 2024 10:16:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: nd@arm.com, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Simplify FW fast reset path
Message-ID: <20241119101612.351c6302@collabora.com>
In-Reply-To: <20241118152152.2921611-1-karunika.choo@arm.com>
References: <20241118152152.2921611-1-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Mon, 18 Nov 2024 15:21:52 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> Stop checking the FW halt_status as MCU_STATUS should be sufficient.
> This should make the check for successful FW halt and subsequently
> setting fast_reset to true more robust.
> 
> We should also clear GLB_REQ.GLB_HALT bit only on post-reset prior
> to starting the FW.

And maybe add 'only if we're doing a fast reset, because the slow reset
will re-initialize all FW sections, including the global interface.'

> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index ecca5565ce41..6d41089b84ab 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1098,17 +1098,11 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>  		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
>  		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>  		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
> -					status == MCU_STATUS_HALT, 10, 100000) &&
> -		    glb_iface->output->halt_status == PANTHOR_FW_HALT_OK) {
> +					status == MCU_STATUS_HALT, 10, 100000)) {
>  			ptdev->fw->fast_reset = true;
>  		} else {
>  			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
>  		}
> -
> -		/* The FW detects 0 -> 1 transitions. Make sure we reset
> -		 * the HALT bit before the FW is rebooted.
> -		 */
> -		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
>  	}
>  
>  	panthor_job_irq_suspend(&ptdev->fw->irq);
> @@ -1134,6 +1128,11 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
>  	 * the FW sections. If it fails, go for a full reset.
>  	 */
>  	if (ptdev->fw->fast_reset) {
> +		/* The FW detects 0 -> 1 transitions. Make sure we reset
> +		 * the HALT bit before the FW is rebooted.

Can you add
                 * This is not needed on a slow reset, because FW
                 * sections are re-initialized.

?

> +		 */
> +		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> +
>  		ret = panthor_fw_start(ptdev);
>  		if (!ret)
>  			goto out;

This these 2 minor nits addressed, the patch is

`Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>`
