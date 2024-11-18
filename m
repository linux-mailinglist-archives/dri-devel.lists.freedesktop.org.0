Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E746F9D1768
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 18:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A93610E543;
	Mon, 18 Nov 2024 17:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FDD010E543
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 17:52:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C521516
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 09:52:58 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD7593F5A1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 09:52:27 -0800 (PST)
Date: Mon, 18 Nov 2024 17:52:17 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: boris.brezillon@collabora.com, nd@arm.com,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Simplify FW fast reset path
Message-ID: <Zzt-0QzO5XePyBkF@e110455-lin.cambridge.arm.com>
References: <20241118152152.2921611-1-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118152152.2921611-1-karunika.choo@arm.com>
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

On Mon, Nov 18, 2024 at 03:21:52PM +0000, Karunika Choo wrote:
> Stop checking the FW halt_status as MCU_STATUS should be sufficient.
> This should make the check for successful FW halt and subsequently
> setting fast_reset to true more robust.
> 
> We should also clear GLB_REQ.GLB_HALT bit only on post-reset prior
> to starting the FW.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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
> +		 */
> +		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> +
>  		ret = panthor_fw_start(ptdev);
>  		if (!ret)
>  			goto out;
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
