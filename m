Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A104AFC15
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 19:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356BF10E1E5;
	Wed,  9 Feb 2022 18:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E90710E1E5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 18:54:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id decf265d-89d9-11ec-ac19-0050568cd888;
 Wed, 09 Feb 2022 18:55:38 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 962EC194B52;
 Wed,  9 Feb 2022 19:54:28 +0100 (CET)
Date: Wed, 9 Feb 2022 19:54:25 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] fbcon: use min() to make code cleaner
Message-ID: <YgQN4WXXjSHVDiBK@ravnborg.org>
References: <20220209084810.1561184-1-deng.changcheng@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209084810.1561184-1-deng.changcheng@zte.com.cn>
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
Cc: linux-fbdev@vger.kernel.org, ducheng2@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, daniel.vetter@ffwll.ch, deller@gmx.de,
 deng.changcheng@zte.com.cn, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, cssk@net-c.es, geert@linux-m68k.org,
 svens@stackframe.org, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 08:48:10AM +0000, cgel.zte@gmail.com wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> Use min() in order to make code cleaner.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I had preferred in minmax.h was included, but it has an indirect include
so shrug.

I assume Daniel or Helge will pick it up.

	Sam

> ---
>  drivers/video/fbdev/core/fbcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index f36829eeb5a9..61171159fee2 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -602,7 +602,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
>  		save = kmalloc(array3_size(logo_lines, new_cols, 2),
>  			       GFP_KERNEL);
>  		if (save) {
> -			int i = cols < new_cols ? cols : new_cols;
> +			int i = min(cols, new_cols);
>  			scr_memsetw(save, erase, array3_size(logo_lines, new_cols, 2));
>  			r = q - step;
>  			for (cnt = 0; cnt < logo_lines; cnt++, r += i)
> -- 
> 2.25.1
