Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7BA9F2426
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 14:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F02910E386;
	Sun, 15 Dec 2024 13:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UgdALH13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9E610E386
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 13:13:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A454A57;
 Sun, 15 Dec 2024 14:12:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734268359;
 bh=oVsaFywUpOuv+msqvVac4ISm2LdrnqEXWubTqo/CYlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UgdALH13Od9P2Xwxw2tffH3ewbTXorof9YJ0zEZTayP4/AuuA7GBo9G1Qu/tQ4O9D
 /4pgzVcnY/NLA+WsSi2IBCkvs/iqRuT/PXRktwTYBncCEVo0yt7+QwCjxx19LQkaGi
 eGx5eqBzNm7eH10t/R2GXEqEgtcMdu8NG17/3GQA=
Date: Sun, 15 Dec 2024 15:12:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCHv3] drm: zynqmp_dp: Fix integer overflow in
 zynqmp_dp_rate_get()
Message-ID: <20241215131258.GC25852@pendragon.ideasonboard.com>
References: <20241215125355.938953-1-karprzy7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241215125355.938953-1-karprzy7@gmail.com>
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

Ho Karol,

Thank you for the patch.

On Sun, Dec 15, 2024 at 01:53:55PM +0100, Karol Przybylski wrote:
> This patch fixes a potential integer overflow in the zynqmp_dp_rate_get()
> 
> The issue comes up when the expression
> drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit
> Now the constant is a compatible 64-bit type.
> 
> Resolves coverity issues: CID 1636340 and CID 1635811
> 
> Cc: stable@vger.kernel.org
> Fixes: 28edaacb821c6 ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes from previous versions:
> Added Fixes tag
> Added Cc for stable kernel version
> Fixed formatting
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 25c5dc61ee88..56a261a40ea3 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
>  	struct zynqmp_dp *dp = data;
>  
>  	mutex_lock(&dp->lock);
> -	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
> +	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
>  	mutex_unlock(&dp->lock);
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
