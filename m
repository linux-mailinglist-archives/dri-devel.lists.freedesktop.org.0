Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2F3FA811
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 02:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073116E07D;
	Sun, 29 Aug 2021 00:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FAA6E07D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 00:46:12 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 788e3c4a-0862-11ec-aa7e-0050568cd888;
 Sun, 29 Aug 2021 00:45:56 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6B40E194B15;
 Sun, 29 Aug 2021 02:46:11 +0200 (CEST)
Date: Sun, 29 Aug 2021 02:46:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
Cc: airlied@redhat.com, sean@poorly.run, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] GPU:drm: returning ENOMEM
Message-ID: <YSrYyANY/ol0jC6l@ravnborg.org>
References: <20210828154027.8198-1-asha.16@itfac.mrt.ac.lk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828154027.8198-1-asha.16@itfac.mrt.ac.lk>
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

Hi F.A.Sulaiman,
On Sat, Aug 28, 2021 at 09:10:27PM +0530, F.A.Sulaiman wrote:
> When memory allocation is failed this patch returns out of memory error instead of -1.
> 
> Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
> ---
>  drivers/gpu/drm/udl/udl_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
> index 3750fd216131..afebab6186ab 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -24,7 +24,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
>  
>  	read_buff = kmalloc(2, GFP_KERNEL);
>  	if (!read_buff)
> -		return -1;
> +		return -ENOMEM;
>  
>  	for (i = 0; i < len; i++) {
>  		int bval = (i + block * EDID_LENGTH) << 8;

The function is only used in a context where the return value is checked
if it is o or not zero.
But it seems prudent to return a proper error code anyways.

Please revisit the function and fix the other return -1;
Propagate the error from the called function and avoid the hardcoded -1.

	Sam
