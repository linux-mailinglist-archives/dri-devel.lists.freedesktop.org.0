Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3DD80A798
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7952E10E27F;
	Fri,  8 Dec 2023 15:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB79610E27C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:39:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7983106F;
 Fri,  8 Dec 2023 07:40:26 -0800 (PST)
Received: from [10.1.33.18] (e122027.cambridge.arm.com [10.1.33.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 209EC3F6C4;
 Fri,  8 Dec 2023 07:39:37 -0800 (PST)
Message-ID: <c7f5159e-c028-4538-b472-b95be3d056ef@arm.com>
Date: Fri, 8 Dec 2023 15:39:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] drm/panthor: Add the FW logical block
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-9-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231204173313.2098733-9-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 17:33, Boris Brezillon wrote:
> Contains everything that's FW related, that includes the code dealing
> with the microcontroller unit (MCU) that's running the FW, and anything
> related to allocating memory shared between the FW and the CPU.
> 
> A few global FW events are processed in the IRQ handler, the rest is
> forwarded to the scheduler, since scheduling is the primary reason for
> the FW existence, and also the main source of FW <-> kernel
> interactions.
> 
> v3:
> - Make the FW path more future-proof (Liviu)
> - Use one waitqueue for all FW events
> - Simplify propagation of FW events to the scheduler logic
> - Drop the panthor_fw_mem abstraction and use panthor_kernel_bo instead
> - Account for the panthor_vm changes
> - Replace magic number with 0x7fffffff with ~0 to better signify that
>   it's the maximum permitted value.
> - More accurate rounding when computing the firmware timeout.
> - Add a 'sub iterator' helper function. This also adds a check that a
>   firmware entry doesn't overflow the firmware image.
> - Drop __packed from FW structures, natural alignment is good enough.
> - Other minor code improvements.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

One typo below (I think it might even have been mine...), but otherwise

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 1332 ++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_fw.h |  504 ++++++++++
>  2 files changed, 1836 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> new file mode 100644
> index 000000000000..85afe769f567
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c

<snip>

> +/**
> + * panthor_fw_csg_wait_acks() - Wait for command stream group requests to be acknowledged.
> + * @ptdev: Device.
> + * @csg_slot: CSG slot ID.
> + * @req_mask: Mask of requests to wait for.
> + * @acked: Pointer to field that's updated with the acked requests.
> + * If the function returns 0, *acked == req_mask.
> + * @timeout_ms: Timeout expressed in milliseconds.
> + *
> + * Return: 0 on success, -ETIMEDOUT otherwise.
> + */
> +int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_slot,
> +			     u32 req_mask, u32 *acked, u32 timeout_ms)
> +{
> +	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, csg_slot);
> +	int ret;
> +
> +	if (drm_WARN_ON(&ptdev->base, req_mask & ~CSG_REQ_MASK))
> +		return -EINVAL;
> +
> +	ret = panthor_fw_wait_acks(&csg_iface->input->req,
> +				   &csg_iface->output->ack,
> +				   &ptdev->fw->req_waitqueue,
> +				   req_mask, acked, timeout_ms);
> +
> +	/*
> +	 * Check that all bits in the state field were updated, is any mismatch

NIT: ..., *if* any mismatch

Steve

