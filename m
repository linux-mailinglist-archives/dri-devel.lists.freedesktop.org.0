Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A045290D0E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 23:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D57C6EE94;
	Fri, 16 Oct 2020 21:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1536EE94
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 21:01:20 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 10B9C20030;
 Fri, 16 Oct 2020 23:01:17 +0200 (CEST)
Date: Fri, 16 Oct 2020 23:01:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] video: use kobj_to_dev()
Message-ID: <20201016210116.GC1496366@ravnborg.org>
References: <1600776867-24226-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600776867-24226-1-git-send-email-wangqing@vivo.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=1WtWmnkvAAAA:8 a=e5mUnYsNAAAA:8
 a=S625N62x_EdrrIXL-UUA:9 a=4VdfB5lweFc2GgQk:21 a=SvyDWAbSgJdgMsRO:21
 a=CjuIK1q_8ugA:10 a=-_UHfarfsM-RsASml2Jt:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bernie Thompson <bernie@plugable.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wang Qing

On Tue, Sep 22, 2020 at 08:14:24PM +0800, Wang Qing wrote:
> Use kobj_to_dev() instead of container_of()
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Thanks, applied to drm-misc-next. Patch will appear in -next in a few
weeks.

	Sam

> ---
>  drivers/video/fbdev/aty/radeon_base.c | 4 ++--
>  drivers/video/fbdev/udlfb.c           | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
> index 3fe509c..878c39a
> --- a/drivers/video/fbdev/aty/radeon_base.c
> +++ b/drivers/video/fbdev/aty/radeon_base.c
> @@ -2200,7 +2200,7 @@ static ssize_t radeon_show_edid1(struct file *filp, struct kobject *kobj,
>  				 struct bin_attribute *bin_attr,
>  				 char *buf, loff_t off, size_t count)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct fb_info *info = dev_get_drvdata(dev);
>          struct radeonfb_info *rinfo = info->par;
>  
> @@ -2212,7 +2212,7 @@ static ssize_t radeon_show_edid2(struct file *filp, struct kobject *kobj,
>  				 struct bin_attribute *bin_attr,
>  				 char *buf, loff_t off, size_t count)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct fb_info *info = dev_get_drvdata(dev);
>          struct radeonfb_info *rinfo = info->par;
>  
> diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
> index 5b014b4..f9b3c1c
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -1457,7 +1457,7 @@ static ssize_t edid_show(
>  			struct file *filp,
>  			struct kobject *kobj, struct bin_attribute *a,
>  			 char *buf, loff_t off, size_t count) {
> -	struct device *fbdev = container_of(kobj, struct device, kobj);
> +	struct device *fbdev = kobj_to_dev(kobj);
>  	struct fb_info *fb_info = dev_get_drvdata(fbdev);
>  	struct dlfb_data *dlfb = fb_info->par;
>  
> @@ -1479,7 +1479,7 @@ static ssize_t edid_store(
>  			struct file *filp,
>  			struct kobject *kobj, struct bin_attribute *a,
>  			char *src, loff_t src_off, size_t src_size) {
> -	struct device *fbdev = container_of(kobj, struct device, kobj);
> +	struct device *fbdev = kobj_to_dev(kobj);
>  	struct fb_info *fb_info = dev_get_drvdata(fbdev);
>  	struct dlfb_data *dlfb = fb_info->par;
>  	int ret;
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
