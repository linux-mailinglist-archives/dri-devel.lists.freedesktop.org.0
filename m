Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085EA4C7AD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CE910E48E;
	Mon,  3 Mar 2025 16:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F306710E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:42:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93EB41BCA;
 Mon,  3 Mar 2025 08:42:20 -0800 (PST)
Received: from [10.1.39.33] (e122027.cambridge.arm.com [10.1.39.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 762113F673;
 Mon,  3 Mar 2025 08:42:04 -0800 (PST)
Message-ID: <f82b0996-77ea-4b1e-81c5-c3c8a48b4f95@arm.com>
Date: Mon, 3 Mar 2025 16:42:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Update CS_STATUS_ defines to correct values
To: Ashley Smith <ashley.smith@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250303151840.3669656-1-ashley.smith@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250303151840.3669656-1-ashley.smith@collabora.com>
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

On 03/03/2025 15:18, Ashley Smith wrote:
> Values for SC_STATUS_BLOCKED_REASON_ are documented at https://arm.pages.collabora.com/mali-docs/g610-odin-csf/register/CS_KERNEL_OUTPUT_BLOCK.htm#rp_CS_KERNEL_OUTPUT_BLOCK/CS_STATUS_BLOCKED_REASON

Please don't reference a URL which isn't accessible to 'normal' people
;) Something like...

  as documented in the G610 "Odin" GPU specification
  (CS_STATUS_BLOCKED_REASON register)

...would hopefully be enough to find the relevant documentation for
those of us that have it.

> 
> This change updates the defines to the correct values.
> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 22448abde992..4d3c8b585dcb 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -102,9 +102,9 @@ struct panthor_fw_cs_output_iface {
>  #define CS_STATUS_BLOCKED_REASON_SB_WAIT	1
>  #define CS_STATUS_BLOCKED_REASON_PROGRESS_WAIT	2
>  #define CS_STATUS_BLOCKED_REASON_SYNC_WAIT	3
> -#define CS_STATUS_BLOCKED_REASON_DEFERRED	5
> -#define CS_STATUS_BLOCKED_REASON_RES		6
> -#define CS_STATUS_BLOCKED_REASON_FLUSH		7
> +#define CS_STATUS_BLOCKED_REASON_DEFERRED	4
> +#define CS_STATUS_BLOCKED_REASON_RES		5

NIT: The actual name is RESOURCE not RES. So if we're updating to match
the spec we could rename it (it isn't currently used by the driver).

The actual updated values are correct, so with the above fixed:

Reviewed-by: Steven Price <steven.price@arm.com>

You might also want:

Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")

Thanks,
Steve

> +#define CS_STATUS_BLOCKED_REASON_FLUSH		6
>  #define CS_STATUS_BLOCKED_REASON_MASK		GENMASK(3, 0)
>  	u32 status_blocked_reason;
>  	u32 status_wait_sync_value_hi;
> 
> base-commit: 16e57a72780931c3c70dbc928aeee4a0518075de

