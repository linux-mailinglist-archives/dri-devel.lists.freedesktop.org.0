Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBC135285E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C056EE3F;
	Fri,  2 Apr 2021 09:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3216EE3F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 09:17:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 577A861008;
 Fri,  2 Apr 2021 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617355057;
 bh=nNXmKyTHRFu5FEX84hqP3eIGOZ1pmAYpxndQn7fgYQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1bVRMjgYnmVMwuln9bkOhNMTJOytmbdU1QgJ5Dtjpb2LfVD+hbNtkvBbBZw8IA7w3
 M/xh4gd+1KECR2HoShaNrE8pvZHCJ1wIkkdioSG/TrpGKy2E6tLztD7laPSepvqlaq
 XqclZkejDnGUS8hOPj7hLv9X/OQIboeIhOwxWN18=
Date: Fri, 2 Apr 2021 11:17:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH] staging: fbtft: change snprintf() to scnprintf()
Message-ID: <YGbhLxwZO9k/330J@kroah.com>
References: <20210402090501.152561-1-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402090501.152561-1-zhangxuezhi3@gmail.com>
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
Cc: devel@driverdev.osuosl.org, zhangxuezhi1@yulong.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 02, 2021 at 09:05:01AM +0000, Carlis wrote:
> From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> 
> show() must not use snprintf() when formatting the value to
> be returned to user space.

Why not?  The code is just fine as-is.

> 
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> ---
>  drivers/staging/fbtft/fbtft-sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
> index 26e52cc2de64..7df92db648d6 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -199,7 +199,7 @@ static ssize_t show_debug(struct device *device,
>  	struct fb_info *fb_info = dev_get_drvdata(device);
>  	struct fbtft_par *par = fb_info->par;
>  
> -	return snprintf(buf, PAGE_SIZE, "%lu\n", par->debug);
> +	return scnprintf(buf, PAGE_SIZE, "%lu\n", par->debug);

If you really want to "fix" this, please just use sysfs_emit().  This
change as-is, does nothing.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
