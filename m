Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F09C3F9B3
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FB910E07D;
	Fri,  7 Nov 2025 10:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E3DD10E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 10:59:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AC31516;
 Fri,  7 Nov 2025 02:59:06 -0800 (PST)
Received: from [10.57.72.216] (unknown [10.57.72.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 117533F63F;
 Fri,  7 Nov 2025 02:59:11 -0800 (PST)
Message-ID: <5324fd5e-aa65-40db-932c-41475723463e@arm.com>
Date: Fri, 7 Nov 2025 10:59:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] drm/panthor: Support 64-bit endpoint_req register
 for Mali-G1
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251027161334.854650-1-karunika.choo@arm.com>
 <20251027161334.854650-8-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251027161334.854650-8-karunika.choo@arm.com>
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

On 27/10/2025 16:13, Karunika Choo wrote:
> Add support for the 64-bit endpoint_req register introduced in CSF v4.0+
> GPUs. Unlike a simple register widening, the 64-bit variant occupies the
> next 64 bits after the original 32-bit field, requiring
> version-dependent access.
> 
> This change introduces helper functions to read, write, and update the
> endpoint_req register, ensuring correct handling on both pre-v4.0 and
> v4.0+ firmwares.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> v2:
>  * Wrap the CSG_IFACE_VERSION checks for v4.0.0 with
>    panthor_fw_has_64bit_ep_req().
>  * Removed wrongly included code from previous patch.
>  * Reordered CSG_EP_REQ_PRIORITY_GET() and CSG_EP_REQ_PRIORITY() to
>    reuse CSG_EP_REQ_PRIORITY_MASK definition.
>  * Updated panthor_fw_csg_endpoint_req_*() functions to accept CSG iface
>    structure instead of a CSG id.
>  * Update endpoint_req variables to u64.
>  * Minor readability and code quality fixes.
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 36 +++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_fw.h    | 25 +++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_sched.c | 21 +++++++++------
>  3 files changed, 72 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index fb1f69ef76fb..2ab974c9a09d 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -325,6 +325,42 @@ static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
>  	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
>  }
> 
> +static bool panthor_fw_has_64bit_ep_req(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 0, 0);
> +}
> +
> +u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev,
> +				    struct panthor_fw_csg_iface *csg_iface)
> +{
> +	if (panthor_fw_has_64bit_ep_req(ptdev))
> +		return csg_iface->input->endpoint_req2;
> +	else
> +		return csg_iface->input->endpoint_req;
> +}
> +
> +void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev,
> +				     struct panthor_fw_csg_iface *csg_iface, u64 value)
> +{
> +	if (panthor_fw_has_64bit_ep_req(ptdev))
> +		csg_iface->input->endpoint_req2 = value;
> +	else
> +		csg_iface->input->endpoint_req = lower_32_bits(value);
> +}
> +
> +void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev,
> +					struct panthor_fw_csg_iface *csg_iface, u64 value,
> +					u64 mask)
> +{
> +	if (panthor_fw_has_64bit_ep_req(ptdev))
> +		panthor_fw_update_reqs64(csg_iface, endpoint_req2, value, mask);
> +	else
> +		panthor_fw_update_reqs(csg_iface, endpoint_req, lower_32_bits(value),
> +				       lower_32_bits(mask));
> +}
> +
>  /**
>   * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
>   * @ptdev: Device.
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index a19ed48b2d0b..fbdc21469ba3 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -167,10 +167,11 @@ struct panthor_fw_csg_input_iface {
>  #define CSG_EP_REQ_TILER(x)			(((x) << 16) & GENMASK(19, 16))
>  #define CSG_EP_REQ_EXCL_COMPUTE			BIT(20)
>  #define CSG_EP_REQ_EXCL_FRAGMENT		BIT(21)
> -#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & GENMASK(31, 28))
>  #define CSG_EP_REQ_PRIORITY_MASK		GENMASK(31, 28)
> +#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & CSG_EP_REQ_PRIORITY_MASK)
> +#define CSG_EP_REQ_PRIORITY_GET(x)		(((x) & CSG_EP_REQ_PRIORITY_MASK) >> 28)
>  	u32 endpoint_req;
> -	u32 reserved2[2];
> +	u64 endpoint_req2;
>  	u64 suspend_buf;
>  	u64 protm_suspend_buf;
>  	u32 config;
> @@ -464,6 +465,16 @@ struct panthor_fw_global_iface {
>  		spin_unlock(&(__iface)->lock); \
>  	} while (0)
> 
> +#define panthor_fw_update_reqs64(__iface, __in_reg, __val, __mask) \
> +	do { \
> +		u64 __cur_val, __new_val; \
> +		spin_lock(&(__iface)->lock); \
> +		__cur_val = READ_ONCE((__iface)->input->__in_reg); \
> +		__new_val = (__cur_val & ~(__mask)) | ((__val) & (__mask)); \
> +		WRITE_ONCE((__iface)->input->__in_reg, __new_val); \
> +		spin_unlock(&(__iface)->lock); \
> +	} while (0)
> +
>  struct panthor_fw_global_iface *
>  panthor_fw_get_glb_iface(struct panthor_device *ptdev);
> 
> @@ -473,6 +484,16 @@ panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot);
>  struct panthor_fw_cs_iface *
>  panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot);
> 
> +u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev,
> +				    struct panthor_fw_csg_iface *csg_iface);
> +
> +void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev,
> +				     struct panthor_fw_csg_iface *csg_iface, u64 value);
> +
> +void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev,
> +					struct panthor_fw_csg_iface *csg_iface, u64 value,
> +					u64 mask);
> +
>  int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_id, u32 req_mask,
>  			     u32 *acked, u32 timeout_ms);
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0cc9055f4ee5..d6f5efc10312 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1139,11 +1139,13 @@ csg_slot_sync_priority_locked(struct panthor_device *ptdev, u32 csg_id)
>  {
>  	struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
>  	struct panthor_fw_csg_iface *csg_iface;
> +	u64 endpoint_req;
> 
>  	lockdep_assert_held(&ptdev->scheduler->lock);
> 
>  	csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> -	csg_slot->priority = (csg_iface->input->endpoint_req & CSG_EP_REQ_PRIORITY_MASK) >> 28;
> +	endpoint_req = panthor_fw_csg_endpoint_req_get(ptdev, csg_iface);
> +	csg_slot->priority = CSG_EP_REQ_PRIORITY_GET(endpoint_req);
>  }
> 
>  /**
> @@ -1303,6 +1305,7 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
>  	struct panthor_csg_slot *csg_slot;
>  	struct panthor_group *group;
>  	u32 queue_mask = 0, i;
> +	u64 endpoint_req;
> 
>  	lockdep_assert_held(&ptdev->scheduler->lock);
> 
> @@ -1329,10 +1332,12 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
>  	csg_iface->input->allow_compute = group->compute_core_mask;
>  	csg_iface->input->allow_fragment = group->fragment_core_mask;
>  	csg_iface->input->allow_other = group->tiler_core_mask;
> -	csg_iface->input->endpoint_req = CSG_EP_REQ_COMPUTE(group->max_compute_cores) |
> -					 CSG_EP_REQ_FRAGMENT(group->max_fragment_cores) |
> -					 CSG_EP_REQ_TILER(group->max_tiler_cores) |
> -					 CSG_EP_REQ_PRIORITY(priority);
> +	endpoint_req = CSG_EP_REQ_COMPUTE(group->max_compute_cores) |
> +		       CSG_EP_REQ_FRAGMENT(group->max_fragment_cores) |
> +		       CSG_EP_REQ_TILER(group->max_tiler_cores) |
> +		       CSG_EP_REQ_PRIORITY(priority);
> +	panthor_fw_csg_endpoint_req_set(ptdev, csg_iface, endpoint_req);
> +
>  	csg_iface->input->config = panthor_vm_as(group->vm);
> 
>  	if (group->suspend_buf)
> @@ -2230,9 +2235,9 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  				continue;
>  			}
> 
> -			panthor_fw_update_reqs(csg_iface, endpoint_req,
> -					       CSG_EP_REQ_PRIORITY(new_csg_prio),
> -					       CSG_EP_REQ_PRIORITY_MASK);
> +			panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
> +							   CSG_EP_REQ_PRIORITY(new_csg_prio),
> +							   CSG_EP_REQ_PRIORITY_MASK);
>  			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
>  						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
>  						CSG_ENDPOINT_CONFIG);
> --
> 2.49.0
> 

