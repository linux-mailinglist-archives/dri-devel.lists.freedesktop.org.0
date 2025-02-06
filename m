Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23150A2B2A0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 20:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DD510E934;
	Thu,  6 Feb 2025 19:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="L56l4iRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08EE10E934
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:48:45 +0000 (UTC)
Message-ID: <487916d8-da54-4932-81dd-f139870a734a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1738871319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwPDbQEyAXc77Q5C6257jMdBP0ZXb8K4s1MUTLeX9mA=;
 b=L56l4iREX7uPZFdUgfZLgCzh+xM4hGXE8xVUwHTzHq/M4h9cgKCj0VvxDO+QWay4IX2nLe
 Vb2cd+2xlmJQtlFFhEDjZJdIZSjc7mDU62eRinjTmqy25wlmTHhkCYPzjdV13rvFRAxbvf
 dJB1IKw0+uN99W2fs7DxKemlUZtnAt0=
Date: Thu, 6 Feb 2025 14:48:35 -0500
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/10] drm: xlnx: zynqmp: Fix max dma segment size
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-10-160327ca652a@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250115-xilinx-formats-v2-10-160327ca652a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi Tomi,

On 1/15/25 04:03, Tomi Valkeinen wrote:
> Fix "mapping sg segment longer than device claims to support" warning by
> setting the max segment size.
> 
> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
> Tested-by: Sean Anderson <sean.anderson@linux.dev>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index f5781939de9c..a25b22238e3d 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -231,6 +231,8 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +
>  	/* Try the reserved memory. Proceed if there's none. */
>  	of_reserved_mem_device_init(&pdev->dev);
>  
> 

Can you apply this patch? I ran into this warning again today and I think this change
is independent from the rest of the series.

--Sean
