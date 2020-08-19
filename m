Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4866F249CCF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668F06E0F6;
	Wed, 19 Aug 2020 11:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406F76E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:55:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4277629E;
 Wed, 19 Aug 2020 13:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597838133;
 bh=KzVb1fFBrc4D3CpXPB/y2PaHs6HIL9FLa7DoMoLBT1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5TRPH6XyEUfU9v55IuMb7bltOPaw4Ibt5/GPJo6QJNs+bqUAhG+I7+3Hu7UYx1CK
 TkntTuAVp7BwXttNIS5Q0GiIn9r60HWD6uDdXzi0bdUUfdbMYlQAYMYinsg6lHgOHO
 35juPps5e2lCkmHrmPjGUjLqjDZYAGVk4nLnzXyA=
Date: Wed, 19 Aug 2020 14:55:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] drm/crc-debugfs: Fix memleak in crc_control_write
Message-ID: <20200819115515.GC6049@pendragon.ideasonboard.com>
References: <20200819082228.26847-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819082228.26847-1-dinghao.liu@zju.edu.cn>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kjlu@umn.edu, Mahesh Kumar <mahesh1.kumar@intel.com>,
 linux-kernel@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dinghao,

Thank you for the patch.

On Wed, Aug 19, 2020 at 04:22:28PM +0800, Dinghao Liu wrote:
> When verify_crc_source() fails, source needs to be freed.
> However, current code is returning directly and ends up
> leaking memory.
> 
> Fixes: c0811a7d5befe ("drm/crc: Cleanup crtc_crc_open function")

I think the issue was introduced in d5cc15a0c66e ("drm: crc: Introduce
verify_crc_source callback"). Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/gpu/drm/drm_debugfs_crc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
> index 5d67a41f7c3a..3dd70d813f69 100644
> --- a/drivers/gpu/drm/drm_debugfs_crc.c
> +++ b/drivers/gpu/drm/drm_debugfs_crc.c
> @@ -144,8 +144,10 @@ static ssize_t crc_control_write(struct file *file, const char __user *ubuf,
>  		source[len - 1] = '\0';
>  
>  	ret = crtc->funcs->verify_crc_source(crtc, source, &values_cnt);
> -	if (ret)
> +	if (ret) {
> +		kfree(source);
>  		return ret;
> +	}
>  
>  	spin_lock_irq(&crc->lock);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
