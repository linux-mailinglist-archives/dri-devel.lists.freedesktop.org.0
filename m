Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848458BA9C3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DCE10F9CE;
	Fri,  3 May 2024 09:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C018010F9F0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 09:21:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 952FA2F4;
 Fri,  3 May 2024 02:22:21 -0700 (PDT)
Received: from [10.1.39.22] (e122027.cambridge.arm.com [10.1.39.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E92793F73F;
 Fri,  3 May 2024 02:21:54 -0700 (PDT)
Message-ID: <97070db2-8f4a-48fc-98b7-d04dec96ff67@arm.com>
Date: Fri, 3 May 2024 10:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/panthor: Force an immediate reset on
 unrecoverable faults
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
 <20240502183813.1612017-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240502183813.1612017-2-boris.brezillon@collabora.com>
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

On 02/05/2024 19:38, Boris Brezillon wrote:
> If the FW reports an unrecoverable fault, we need to reset the GPU
> before we can start re-using it again.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  1 +
>  drivers/gpu/drm/panthor/panthor_device.h |  1 +
>  drivers/gpu/drm/panthor/panthor_sched.c  | 11 ++++++++++-
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 75276cbeba20..4c5b54e7abb7 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -293,6 +293,7 @@ static const struct panthor_exception_info panthor_exception_infos[] = {
>  	PANTHOR_EXCEPTION(ACTIVE),
>  	PANTHOR_EXCEPTION(CS_RES_TERM),
>  	PANTHOR_EXCEPTION(CS_CONFIG_FAULT),
> +	PANTHOR_EXCEPTION(CS_UNRECOVERABLE),
>  	PANTHOR_EXCEPTION(CS_ENDPOINT_FAULT),
>  	PANTHOR_EXCEPTION(CS_BUS_FAULT),
>  	PANTHOR_EXCEPTION(CS_INSTR_INVALID),
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 2fdd671b38fd..e388c0472ba7 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -216,6 +216,7 @@ enum drm_panthor_exception_type {
>  	DRM_PANTHOR_EXCEPTION_CS_RES_TERM = 0x0f,
>  	DRM_PANTHOR_EXCEPTION_MAX_NON_FAULT = 0x3f,
>  	DRM_PANTHOR_EXCEPTION_CS_CONFIG_FAULT = 0x40,
> +	DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE = 0x41,
>  	DRM_PANTHOR_EXCEPTION_CS_ENDPOINT_FAULT = 0x44,
>  	DRM_PANTHOR_EXCEPTION_CS_BUS_FAULT = 0x48,
>  	DRM_PANTHOR_EXCEPTION_CS_INSTR_INVALID = 0x49,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 7f16a4a14e9a..1d2708c3ab0a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1281,7 +1281,16 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
>  	if (group)
>  		group->fatal_queues |= BIT(cs_id);
>  
> -	sched_queue_delayed_work(sched, tick, 0);
> +	if (CS_EXCEPTION_TYPE(fatal) == DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE) {
> +		/* If this exception is unrecoverable, queue a reset, and make
> +		 * sure we stop scheduling groups until the reset has happened.
> +		 */
> +		panthor_device_schedule_reset(ptdev);
> +		cancel_delayed_work(&sched->tick_work);
> +	} else {
> +		sched_queue_delayed_work(sched, tick, 0);
> +	}
> +
>  	drm_warn(&ptdev->base,
>  		 "CSG slot %d CS slot: %d\n"
>  		 "CS_FATAL.EXCEPTION_TYPE: 0x%x (%s)\n"

