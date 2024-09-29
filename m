Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6DB989738
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 22:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD5310E03F;
	Sun, 29 Sep 2024 20:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Sun, 29 Sep 2024 20:01:31 UTC
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi
 [62.142.5.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BA310E03F
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 20:01:31 +0000 (UTC)
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
 by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 5ee75b3e-7e9b-11ef-9946-005056bd6ce9;
 Sun, 29 Sep 2024 22:45:25 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Sep 2024 22:45:24 +0300
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbcon: break earlier in search_fb_in_map and
 search_for_mapped_con
Message-ID: <ZvmuVPwaHb1vFCmZ@surfacebook.localdomain>
References: <20240926115911.620624-1-qianqiang.liu@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926115911.620624-1-qianqiang.liu@163.com>
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

Thu, Sep 26, 2024 at 07:59:11PM +0800, Qianqiang Liu kirjoitti:
> Break the for loop immediately upon finding the target, making the
> process more efficient.

You may make it even more effecient (in terms of code readability as I believe
compiler optimizes this anyway to the same):

>  	int i, retval = 0;
>  
>  	for (i = first_fb_vc; i <= last_fb_vc; i++) {
> -		if (con2fb_map[i] == idx)
> +		if (con2fb_map[i] == idx) {
>  			retval = 1;
> +			break;
> +		}

		return 1;

>  	}
>  	return retval;

	return 0;

>  }

...

>  	int i, retval = 0;
>  
>  	for (i = first_fb_vc; i <= last_fb_vc; i++) {
> -		if (con2fb_map[i] != -1)
> +		if (con2fb_map[i] != -1) {
>  			retval = 1;
> +			break;
> +		}
>  	}
>  	return retval;

Ditto.

...

Since it's applied, you can consider a followup.

-- 
With Best Regards,
Andy Shevchenko


