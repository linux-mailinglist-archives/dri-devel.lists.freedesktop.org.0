Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED99BF0E1F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A88210E41F;
	Mon, 20 Oct 2025 11:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBFF310E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:39:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5D61063;
 Mon, 20 Oct 2025 04:39:19 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 632213F66E;
 Mon, 20 Oct 2025 04:39:25 -0700 (PDT)
Message-ID: <8c87ca6f-4a89-409c-848d-c6c0f323dddd@arm.com>
Date: Mon, 20 Oct 2025 12:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] drm/panthor: Support GLB_REQ.STATE field for
 Mali-G1 GPUs
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-9-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251014094337.1009601-9-karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 14/10/2025 10:43, Karunika Choo wrote:
> Add support for the GLB_REQ.STATE field introduced in CSF v4.1+, which
> replaces the HALT bit to provide finer control over the MCU state. This
> change implements basic handling for transitioning the MCU between
> ACTIVE and HALT states on Mali-G1 GPUs.
> 
> The update introduces new helpers to issue the state change requests,
> poll for MCU halt completion, and restore the MCU to an active state
> after halting.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 82 ++++++++++++++++++++++------
>  drivers/gpu/drm/panthor/panthor_fw.h |  7 +++
>  2 files changed, 73 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index e6c39c70d348..48bbae8931cb 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -33,6 +33,7 @@
>  #define PROGRESS_TIMEOUT_SCALE_SHIFT		10
>  #define IDLE_HYSTERESIS_US			800
>  #define PWROFF_HYSTERESIS_US			10000
> +#define MCU_HALT_TIMEOUT_US			(10ULL * 1000 * 1000)

NIT: (10ULL * USEC_PER_SEC)

Also isn't 10 seconds somewhat excessive?

>  
>  /**
>   * struct panthor_fw_binary_hdr - Firmware binary header.
> @@ -996,6 +997,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>  					 GLB_IDLE_EN |
>  					 GLB_IDLE;
>  
> +	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))

This function/macro panthor_fw_csf_version() doesn't exist. You replace
it with glb_iface->control->version in the next patch. So this series
isn't bisectable.

I'm also thinking some sort of helper to check whether features are
implemented in the CSF interface would probably help (rather than
repeating these magic version numbers through the code). Or even
separate functions and use indirection like you do the GPU power control?

Thanks,
Steve

> +		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
> +
>  	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
>  	panthor_fw_toggle_reqs(glb_iface, req, ack,
>  			       GLB_CFG_ALLOC_EN |
> @@ -1069,6 +1073,54 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
>  		drm_err(&ptdev->base, "Failed to stop MCU");
>  }
>  
> +static bool panthor_fw_mcu_halted(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	bool halted;
> +
> +	halted = gpu_read(ptdev, MCU_STATUS) == MCU_STATUS_HALT;
> +
> +	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
> +		halted &= (GLB_STATE_GET(glb_iface->output->ack) == GLB_STATE_HALT);
> +
> +	return halted;
> +}
> +
> +static void panthor_fw_halt_mcu(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
> +		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_HALT), GLB_STATE_MASK);
> +	else
> +		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
> +
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +}
> +
> +static bool panthor_fw_wait_mcu_halted(struct panthor_device *ptdev)
> +{
> +	bool halted = false;
> +
> +	if (read_poll_timeout_atomic(panthor_fw_mcu_halted, halted, halted, 10,
> +				     MCU_HALT_TIMEOUT_US, 0, ptdev)) {
> +		drm_warn(&ptdev->base, "Timed out waiting for MCU to halt");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void panthor_fw_mcu_set_active(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
> +		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_ACTIVE), GLB_STATE_MASK);
> +	else
> +		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> +}
> +
>  /**
>   * panthor_fw_pre_reset() - Call before a reset.
>   * @ptdev: Device.
> @@ -1085,19 +1137,13 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>  	ptdev->reset.fast = false;
>  
>  	if (!on_hang) {
> -		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> -		u32 status;
> -
> -		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
> -		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> -		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
> -					   status == MCU_STATUS_HALT, 10,
> -					   100000)) {
> -			ptdev->reset.fast = true;
> -		} else {
> +		panthor_fw_halt_mcu(ptdev);
> +		if (!panthor_fw_wait_mcu_halted(ptdev))
>  			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
> -		}
> +		else
> +			ptdev->reset.fast = true;
>  	}
> +	panthor_fw_stop(ptdev);
>  
>  	panthor_job_irq_suspend(&ptdev->fw->irq);
>  }
> @@ -1125,14 +1171,14 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
>  		 */
>  		panthor_reload_fw_sections(ptdev, true);
>  	} else {
> -		/* The FW detects 0 -> 1 transitions. Make sure we reset
> -		 * the HALT bit before the FW is rebooted.
> +		/*
> +		 * If the FW was previously successfully halted in the pre-reset
> +		 * operation, we need to transition it to active again before
> +		 * the FW is rebooted.
>  		 * This is not needed on a slow reset because FW sections are
>  		 * re-initialized.
>  		 */
> -		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> -
> -		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> +		panthor_fw_mcu_set_active(ptdev);
>  	}
>  
>  	ret = panthor_fw_start(ptdev);
> @@ -1170,6 +1216,10 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  		if (ptdev->fw->irq.irq)
>  			panthor_job_irq_suspend(&ptdev->fw->irq);
>  
> +		panthor_fw_halt_mcu(ptdev);
> +		if (!panthor_fw_wait_mcu_halted(ptdev))
> +			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
> +
>  		panthor_fw_stop(ptdev);
>  	}
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 6598d96c6d2a..a19ed48b2d0b 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -214,6 +214,13 @@ struct panthor_fw_global_input_iface {
>  #define GLB_FWCFG_UPDATE			BIT(9)
>  #define GLB_IDLE_EN				BIT(10)
>  #define GLB_SLEEP				BIT(12)
> +#define GLB_STATE_MASK				GENMASK(14, 12)
> +#define   GLB_STATE_ACTIVE			0
> +#define   GLB_STATE_HALT			1
> +#define   GLB_STATE_SLEEP			2
> +#define   GLB_STATE_SUSPEND			3
> +#define   GLB_STATE(x)				(((x) << 12) & GLB_STATE_MASK)
> +#define   GLB_STATE_GET(x)			(((x) & GLB_STATE_MASK) >> 12)
>  #define GLB_INACTIVE_COMPUTE			BIT(20)
>  #define GLB_INACTIVE_FRAGMENT			BIT(21)
>  #define GLB_INACTIVE_TILER			BIT(22)

