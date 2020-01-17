Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886514117F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E665F6E48F;
	Fri, 17 Jan 2020 19:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A58E6E48F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:13:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 392CD803DE;
 Fri, 17 Jan 2020 20:13:37 +0100 (CET)
Date: Fri, 17 Jan 2020 20:13:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/6] video: fbdev: controlfb: fix sparse warning about
 using incorrect type
Message-ID: <20200117191335.GB24812@ravnborg.org>
References: <20200116140900.26363-1-b.zolnierkie@samsung.com>
 <CGME20200116140915eucas1p2d6a2c654a66a78b6c3c1fc710f8a65b8@eucas1p2.samsung.com>
 <20200116140900.26363-2-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116140900.26363-2-b.zolnierkie@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8
 a=e5mUnYsNAAAA:8 a=M9bYcQpzX3BBdWKpUDsA:9 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bartlomiej

On Thu, Jan 16, 2020 at 03:08:55PM +0100, Bartlomiej Zolnierkiewicz wrote:
> Force le32_to_cpup() argument to be of proper type (const __le32 *).
> 
> Also add missing inline keyword to control_par_to_var() definition
> (to match function prototype).
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/video/fbdev/controlfb.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
> index 38b61cdb5ca4..d7e53520a24c 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -313,7 +313,7 @@ static int controlfb_blank(int blank_mode, struct fb_info *info)
>  		container_of(info, struct fb_info_control, info);
>  	unsigned ctrl;
>  
> -	ctrl = le32_to_cpup(CNTRL_REG(p,ctrl));
> +	ctrl = le32_to_cpup((const __force __le32 *)CNTRL_REG(p, ctrl));

Only judging from the other code in the same driver,
I think a better fix would be to use:

	ctrl = in_le32(CNTRL_REG(p,ctrl));

?

	Sam

>  	if (blank_mode > 0)
>  		switch (blank_mode) {
>  		case FB_BLANK_VSYNC_SUSPEND:
> @@ -952,7 +952,8 @@ static int control_var_to_par(struct fb_var_screeninfo *var,
>   * Convert hardware data in par to an fb_var_screeninfo
>   */
>  
> -static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeninfo *var)
> +static inline void control_par_to_var(struct fb_par_control *par,
> +	struct fb_var_screeninfo *var)
>  {
>  	struct control_regints *rv;
>  	
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
