Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E818550E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 08:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8A46E0FC;
	Sat, 14 Mar 2020 07:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DF06E0FC
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 07:34:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 800B680475;
 Sat, 14 Mar 2020 08:34:50 +0100 (CET)
Date: Sat, 14 Mar 2020 08:34:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH] drm/tiny: fix sparse warning: incorrect type in
 assignment (different base types)
Message-ID: <20200314073449.GB5783@ravnborg.org>
References: <1583684084-4694-1-git-send-email-kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583684084-4694-1-git-send-email-kamlesh.gurudasani@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=Ku1Ndwf_buWlLQO6vocA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kamlesh

On Sun, Mar 08, 2020 at 09:44:44PM +0530, Kamlesh Gurudasani wrote:
> This fixes the following sparse warning:
> 
> drivers/gpu/drm/tiny/ili9486.c:61:16: sparse: sparse: incorrect type in assignment (different base types)
> drivers/gpu/drm/tiny/ili9486.c:61:16: sparse:    expected unsigned short [usertype]
> drivers/gpu/drm/tiny/ili9486.c:61:16: sparse:    got restricted __be16 [usertype]
> drivers/gpu/drm/tiny/ili9486.c:71:32: sparse: sparse: incorrect type in assignment (different base types)
> drivers/gpu/drm/tiny/ili9486.c:71:32: sparse:    expected unsigned short [usertype]
> drivers/gpu/drm/tiny/ili9486.c:71:32: sparse:    got restricted __be16 [usertype]
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>

Thanks. Applied and pushed to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/tiny/ili9486.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index 5084b38..532560ae 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -45,7 +45,7 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
>  	void *data = par;
>  	u32 speed_hz;
>  	int i, ret;
> -	u16 *buf;
> +	__be16 *buf;
>  
>  	buf = kmalloc(32 * sizeof(u16), GFP_KERNEL);
>  	if (!buf)
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
