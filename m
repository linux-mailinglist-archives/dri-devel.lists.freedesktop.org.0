Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9021C79E3
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 21:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB6D89343;
	Wed,  6 May 2020 19:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFA289343
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 19:07:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 09799804FE;
 Wed,  6 May 2020 21:07:02 +0200 (CEST)
Date: Wed, 6 May 2020 21:07:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] video: fbdev: valkyriefb.c: fix warning comparing
 pointer to 0
Message-ID: <20200506190701.GE8227@ravnborg.org>
References: <20200429140942.8137-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429140942.8137-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=NiWkjFAJyjduSeFMYQYA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
 dri-devel@lists.freedesktop.org, b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 10:09:42PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/video/fbdev/valkyriefb.c:348:10-11: WARNING comparing pointer to
> 0, suggest !E
> drivers/video/fbdev/valkyriefb.c:334:12-13: WARNING comparing pointer to
> 0
> drivers/video/fbdev/valkyriefb.c:348:10-11: WARNING comparing pointer to
> 0
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
Thanks, applied to drm-misc-next.

	Sam

> ---
>  drivers/video/fbdev/valkyriefb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
> index 4d20c4603e5a..8425afe37d7c 100644
> --- a/drivers/video/fbdev/valkyriefb.c
> +++ b/drivers/video/fbdev/valkyriefb.c
> @@ -331,7 +331,7 @@ int __init valkyriefb_init(void)
>  		struct resource r;
>  
>  		dp = of_find_node_by_name(NULL, "valkyrie");
> -		if (dp == 0)
> +		if (!dp)
>  			return 0;
>  
>  		if (of_address_to_resource(dp, 0, &r)) {
> @@ -345,7 +345,7 @@ int __init valkyriefb_init(void)
>  #endif /* ppc (!CONFIG_MAC) */
>  
>  	p = kzalloc(sizeof(*p), GFP_ATOMIC);
> -	if (p == 0)
> +	if (!p)
>  		return -ENOMEM;
>  
>  	/* Map in frame buffer and registers */
> -- 
> 2.21.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
