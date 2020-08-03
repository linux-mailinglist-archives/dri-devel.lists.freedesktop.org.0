Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC88D23AD99
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 21:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1716E2F2;
	Mon,  3 Aug 2020 19:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290486E2F9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 19:44:56 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id ACF8380503;
 Mon,  3 Aug 2020 21:44:52 +0200 (CEST)
Date: Mon, 3 Aug 2020 21:44:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: trix@redhat.com
Subject: Re: [PATCH] video: fbdev: pvr2fb: initialize variables
Message-ID: <20200803194451.GB525506@ravnborg.org>
References: <20200720191845.20115-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720191845.20115-1-trix@redhat.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8
 a=qnTn4qAwrYwZIjOlhbIA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, arnd@arndb.de, gustavo@embeddedor.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, b.zolnierkie@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jhubbard@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tom,

On Mon, Jul 20, 2020 at 12:18:45PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports this repesentative error
> 
> pvr2fb.c:1049:2: warning: 1st function call argument
>   is an uninitialized value [core.CallAndMessage]
>         if (*cable_arg)
>         ^~~~~~~~~~~~~~~
> 
> Problem is that cable_arg depends on the input loop to
> set the cable_arg[0].  If it does not, then some random
> value from the stack is used.
> 
> A similar problem exists for output_arg.
> 
> So initialize cable_arg and output_arg.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks, applied to drm-misc-next.

	Sam

> ---
>  drivers/video/fbdev/pvr2fb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
> index 2d9f69b93392..f4add36cb5f4 100644
> --- a/drivers/video/fbdev/pvr2fb.c
> +++ b/drivers/video/fbdev/pvr2fb.c
> @@ -1028,6 +1028,8 @@ static int __init pvr2fb_setup(char *options)
>  	if (!options || !*options)
>  		return 0;
>  
> +	cable_arg[0] = output_arg[0] = 0;
> +
>  	while ((this_opt = strsep(&options, ","))) {
>  		if (!*this_opt)
>  			continue;
> -- 
> 2.18.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
