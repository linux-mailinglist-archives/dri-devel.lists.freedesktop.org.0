Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A911F1148
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 04:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EEE6E225;
	Mon,  8 Jun 2020 02:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2756C6E225
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 02:02:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C23D50E;
 Mon,  8 Jun 2020 04:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591581749;
 bh=i1AmAGyM1Zj7pRO9Jd3l5vQMRbYrocwi6kzrZnDqAuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WirakFtdzE9ijjcmNr56wAKu+9v5XXpAX6UQl84sa6ca884vfIBDMyIUbrEvwKLxv
 ayFeIaQI5/ipbHhNHxtjZc4rFrca5XJzxn/cIAC5KYcNQDSzUd/QT3Zvo1mWZ6CE+u
 JWX7OkvNg2JXfVcVmP1Mi5nR51kQNp1tLH9ogrLk=
Date: Mon, 8 Jun 2020 05:02:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Message-ID: <20200608020207.GL22208@pendragon.ideasonboard.com>
References: <20200608014818.2814-1-cai@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608014818.2814-1-cai@lca.pw>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qian,

Thank you for the patch.

On Sun, Jun 07, 2020 at 09:48:18PM -0400, Qian Cai wrote:
> There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make
> the generated .config a bit ugly.
> 
>  # ARM devices
>  #
>  # end of ARM devices
> 
>  CONFIG_DRM_RCAR_WRITEBACK=y
> 
>  #
>  # Frame buffer Devices
> 
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 0919f1f159a4..d80696455d3e 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -48,3 +48,4 @@ config DRM_RCAR_VSP
>  config DRM_RCAR_WRITEBACK
>  	bool
>  	default y if ARM64
> +	depends on DRM

How about depending on DRM_RCAR_DU instead, as DRM_RCAR_WRITEBACK is
used to select compilation of rcar_du_writeback.c that is part of the
rcar-du driver ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
