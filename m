Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B539A0992F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 19:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D7810E514;
	Fri, 10 Jan 2025 18:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="VTC54PXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jan 2025 18:17:18 UTC
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964F610E514
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 18:17:18 +0000 (UTC)
Message-ID: <b18dfc63-94fc-4459-ba0d-67b704d38f0c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736532613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+ZK2sNVQG3CftxXFAyvg9WnLzu0fKqq3YAoWAkxSFo=;
 b=VTC54PXO0Q8s4bDBQnojNz3yhaEmT4/m2eBO8ccEqRBY8/HTl09MaK6eylomDEcPrfwfwp
 EZj2aiuTNcPodNCQsTaAt/YkJhW9Z+Q2ZLPhrUS2txsC9qb8CdY+ISQy4OdLnOEDupYQSx
 EK2Rh/GVToquQrg2gCyJzbMw9211hc0=
Date: Fri, 10 Jan 2025 13:10:09 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 10/10] drm: xlnx: zynqmp: Fix max dma segment size
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
 <20241204-xilinx-formats-v1-10-0bf2c5147db1@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20241204-xilinx-formats-v1-10-0bf2c5147db1@ideasonboard.com>
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

On 12/4/24 04:31, Tomi Valkeinen wrote:
> Fix "mapping sg segment longer than device claims to support" warning by
> setting the max segment size.
> 
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

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
Tested-by: Sean Anderson <sean.anderson@linux.dev>
