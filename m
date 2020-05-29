Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4E1E782A
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 10:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720016E8A3;
	Fri, 29 May 2020 08:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33DD6E8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:22:33 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32CBE2075A;
 Fri, 29 May 2020 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590740553;
 bh=bF+LDFKKjlpS21JygvHXpMb9WnNnBV/JsdAJKAMxjZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICjfZOphbFZLG5btT32Hp4tn9NGWybHZBgnR3m2vcuI6BJJr4xsqSbGpskfnXhahr
 Sux2cUhuyBFdlhJ1kX1rXWLGUCS/ZRrNVUzPCWZzCkHnNn8cjsz/4etAhb/A6Zenbh
 lXFsI8hB0AUoZDIo4CEPmuymr7KPrHwkZDH8UXrE=
Date: Fri, 29 May 2020 10:22:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: wu000273@umn.edu
Subject: Re: [PATCH] omapfb: Fix reference count leak in display_init_sysfs.
Message-ID: <20200529082231.GA847132@kroah.com>
References: <20200528194424.11596-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528194424.11596-1-wu000273@umn.edu>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alexios Zavras <alexios.zavras@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, Enrico Weigelt <info@metux.net>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 02:44:23PM -0500, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> kobject_init_and_add() takes reference even when it fails.
> If this function returns an error, kobject_put() must be called to
> properly clean up the memory associated with the object.
> Because function omap_dss_put_device() doesn't handle dssdev->kobj,
> thus we need insert kobject_put() to clean up the kobject,
> when kobject_init_and_add() fails.
> 
> Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> index 6dbe265b312d..51322ac7df07 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> @@ -316,6 +316,7 @@ int display_init_sysfs(struct platform_device *pdev)
>  			&pdev->dev.kobj, "%s", dssdev->alias);
>  		if (r) {
>  			DSSERR("failed to create sysfs files\n");
> +			kobject_put(&dssdev->kobj);
>  			omap_dss_put_device(dssdev);
>  			goto err;
>  		}

Why is a driver creating "raw" kobjects and the like at all?

/me goes off to look...


Ick, no, that's not ok, this just needs to be an attribute group
attached to the device, no need for a kobject at all.  Having a kobject
means that the files will be ignored totally by userspace tools that
monitor sysfs changes.  So these files are probably not even being
used...

Please fix this up properly.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
