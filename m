Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0DC3C530
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF2F10E11C;
	Thu,  6 Nov 2025 16:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD74D10E11C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:17:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0C0712FC;
 Thu,  6 Nov 2025 08:17:00 -0800 (PST)
Received: from [10.57.72.2] (unknown [10.57.72.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28AB93F66E;
 Thu,  6 Nov 2025 08:17:07 -0800 (PST)
Message-ID: <0a2c1c15-c3c4-4490-ab47-e7102c353bb7@arm.com>
Date: Thu, 6 Nov 2025 16:17:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] drm/panthor: Don't try to enable extract events
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
References: <20251106144656.1012274-1-boris.brezillon@collabora.com>
 <20251106144656.1012274-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251106144656.1012274-3-boris.brezillon@collabora.com>
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

On 06/11/2025 14:46, Boris Brezillon wrote:
> Not only this only works once, because of how extract events work
> (event is enabled if the req and ack bit differ, and it's signalled
> by the FW by setting identical req and ack, to re-enable the event,
> we need to toggle the bit, which we never do). But more importantly,
> we never do anything with this event, so we're better off dropping it
> when programming the CS slot.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 9931f4a6cd96..94514d464e64 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1069,12 +1069,10 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
>  	panthor_fw_update_reqs(cs_iface, req,
>  			       CS_IDLE_SYNC_WAIT |
>  			       CS_IDLE_EMPTY |
> -			       CS_STATE_START |
> -			       CS_EXTRACT_EVENT,
> +			       CS_STATE_START,
>  			       CS_IDLE_SYNC_WAIT |
>  			       CS_IDLE_EMPTY |
> -			       CS_STATE_MASK |
> -			       CS_EXTRACT_EVENT);
> +			       CS_STATE_MASK);
>  	if (queue->iface.input->insert != queue->iface.input->extract && queue->timeout_suspended) {
>  		drm_sched_resume_timeout(&queue->scheduler, queue->remaining_time);
>  		queue->timeout_suspended = false;

