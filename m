Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B54A87EDB1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 17:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE8310F091;
	Mon, 18 Mar 2024 16:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EtVCRhMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B5810F091
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:39:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9AA5B1;
 Mon, 18 Mar 2024 17:38:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710779917;
 bh=4NAA95X70MYFGS3j8mtOCQqU+sM9czp1zd7c8cbv+7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EtVCRhMUOayXa87KnMhvz4FJmAGYKRgYYsaQp2OUnY+xsxq4sySy16to6xwOaKzjq
 WLmlRqpHbOBCOo2uykeSuPBBKmgUIS4baGMX24Cla64r62veGZqkB+YvqT0jxVFfiy
 BNx9G/WRd+kkMruQm/DFC6oroyMfBGzLgtthP+jQ=
Date: Mon, 18 Mar 2024 18:39:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/6] drm: zynqmp_dp: Downgrade log level for aux retries
 message
Message-ID: <20240318163901.GH13682@pendragon.ideasonboard.com>
References: <20240315230916.1759060-1-sean.anderson@linux.dev>
 <20240315230916.1759060-2-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240315230916.1759060-2-sean.anderson@linux.dev>
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

Hi Sean,

Thank you for the patch.

On Fri, Mar 15, 2024 at 07:09:11PM -0400, Sean Anderson wrote:
> Enable this message for verbose debugging only as it is otherwise
> printed after every AUX message, quickly filling the log buffer.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index a0606fab0e22..98a32e6a0459 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1006,7 +1006,7 @@ zynqmp_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>  					       msg->buffer, msg->size,
>  					       &msg->reply);
>  		if (!ret) {
> -			dev_dbg(dp->dev, "aux %d retries\n", i);
> +			dev_vdbg(dp->dev, "aux %d retries\n", i);

I didn't know about dev_vdbg(). I suppose this makes sense,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			return msg->size;
>  		}
>  

-- 
Regards,

Laurent Pinchart
