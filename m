Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFA156BD34
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 18:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8910E78A;
	Fri,  8 Jul 2022 16:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 217F610E7A9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 16:07:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 254361063
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:07:34 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 88F203F66F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:07:33 -0700 (PDT)
Date: Fri, 8 Jul 2022 17:07:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: carsten.haitzler@foss.arm.com
Subject: Re: [PATCH 2/3] drm/komeda - At init write GCU control block to
 handle already on DPU
Message-ID: <YshWRMqb/h+bAWda@e110455-lin.cambridge.arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
 <20220606114714.175499-2-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606114714.175499-2-carsten.haitzler@foss.arm.com>
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
Cc: dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 12:47:13PM +0100, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> If something has already set up the DPU before the komeda driver comes
> up, it will fail to init because it was just writing to the SRST bit in
> the GCU control register and ignoring others. This resulted in TBU
> bringup stalling and init failing. By writing completely we also  set the
> mode back to 0 (inactive) too and thus TBU bringup works.

This is a rather large hammer, tbh. I would like to see if there is a better way of
handling the handover from EFIFB that this patch is trying to fix, but I lack an
usable plaform for that. It will generate a flicker at module load time, but if users
of Morello are happy with that, then

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> index 00fa56c29b3e..39618c1a4c81 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> @@ -309,8 +309,7 @@ static int d71_reset(struct d71_dev *d71)
>  	u32 __iomem *gcu = d71->gcu_addr;
>  	int ret;
>  
> -	malidp_write32_mask(gcu, BLK_CONTROL,
> -			    GCU_CONTROL_SRST, GCU_CONTROL_SRST);
> +	malidp_write32(gcu, BLK_CONTROL, GCU_CONTROL_SRST);
>  
>  	ret = dp_wait_cond(!(malidp_read32(gcu, BLK_CONTROL) & GCU_CONTROL_SRST),
>  			   100, 1000, 10000);
> -- 
> 2.32.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
