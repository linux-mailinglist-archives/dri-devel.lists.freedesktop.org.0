Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B260D245972
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 22:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D486E15A;
	Sun, 16 Aug 2020 20:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605466E15A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 20:16:08 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6259F20027;
 Sun, 16 Aug 2020 22:16:02 +0200 (CEST)
Date: Sun, 16 Aug 2020 22:16:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v2 01/12] fbdev: gxfb: use generic power management
Message-ID: <20200816201601.GA1426650@ravnborg.org>
References: <20200810165458.GA292825@ravnborg.org>
 <20200810185723.15540-1-vaibhavgupta40@gmail.com>
 <20200810185723.15540-2-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810185723.15540-2-vaibhavgupta40@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=Q4VJyNBwd-cc_6aBFL8A:9
 a=CjuIK1q_8ugA:10
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Bjorn Helgaas <bjorn@helgaas.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Andres Salomon <dilinger@queued.net>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vaibhav

On Tue, Aug 11, 2020 at 12:27:12AM +0530, Vaibhav Gupta wrote:
> Drivers should do only device-specific jobs. But in general, drivers using
> legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
> PM-related tasks themselves which can be done by PCI Core itself. This
> brings extra load on the driver and it directly calls PCI helper functions
> to handle them.
> 
> Although the gxfb driver does not have that extra load,
Sorry, but I am lost here.
If this drivers does not have the extra load that you describe here then
I really cannot see why it is relevant for this driver to describe it.

This is a seldomly touched driver - so it helps if the changelog when we
finally touch the code is easy to parse.

> we should switch to
> the new generic framework by updating function signatures and define a
> "struct dev_pm_ops" variable to bind PM callbacks so that we can remove
> the legacy .suspend & .resume bindings.
This part matches the patch - good.

> Additionally, this helps us to
> remove the unnecessary call to gxfb_suspend() in the event of Freeze and
> Hibernate, as the function does nothing in their case.
What I think you are explaining above is that the pci pm support
will only call the suspend operation in case of suspend, so the 
state.event == PM_EVENT_SUSPEND can be dropped in gxfb_suspend().

For reference later I would prefer that this is explained a bit
more explicit - not that the changelog needs update anyway.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Patch looks good, but please give the changelog one more go.
I have not checked other patches - but I assume they would benefit
from a similar clarification.

	Sam

> ---
>  drivers/video/fbdev/geode/gxfb.h       |  5 ----
>  drivers/video/fbdev/geode/gxfb_core.c  | 36 ++++++++++++++------------
>  drivers/video/fbdev/geode/suspend_gx.c |  4 ---
>  3 files changed, 20 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/video/fbdev/geode/gxfb.h b/drivers/video/fbdev/geode/gxfb.h
> index d2e9c5c8e294..792c111c21e4 100644
> --- a/drivers/video/fbdev/geode/gxfb.h
> +++ b/drivers/video/fbdev/geode/gxfb.h
> @@ -21,7 +21,6 @@ struct gxfb_par {
>  	void __iomem *dc_regs;
>  	void __iomem *vid_regs;
>  	void __iomem *gp_regs;
> -#ifdef CONFIG_PM
>  	int powered_down;
>  
>  	/* register state, for power management functionality */
> @@ -36,7 +35,6 @@ struct gxfb_par {
>  	uint64_t fp[FP_REG_COUNT];
>  
>  	uint32_t pal[DC_PAL_COUNT];
> -#endif
>  };
>  
>  unsigned int gx_frame_buffer_size(void);
> @@ -49,11 +47,8 @@ void gx_set_dclk_frequency(struct fb_info *info);
>  void gx_configure_display(struct fb_info *info);
>  int gx_blank_display(struct fb_info *info, int blank_mode);
>  
> -#ifdef CONFIG_PM
>  int gx_powerdown(struct fb_info *info);
>  int gx_powerup(struct fb_info *info);
> -#endif
> -
>  
>  /* Graphics Processor registers (table 6-23 from the data book) */
>  enum gp_registers {
> diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
> index d38a148d4746..44089b331f91 100644
> --- a/drivers/video/fbdev/geode/gxfb_core.c
> +++ b/drivers/video/fbdev/geode/gxfb_core.c
> @@ -322,17 +322,14 @@ static struct fb_info *gxfb_init_fbinfo(struct device *dev)
>  	return info;
>  }
>  
> -#ifdef CONFIG_PM
> -static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused gxfb_suspend(struct device *dev)
>  {
> -	struct fb_info *info = pci_get_drvdata(pdev);
> +	struct fb_info *info = dev_get_drvdata(dev);
>  
> -	if (state.event == PM_EVENT_SUSPEND) {
> -		console_lock();
> -		gx_powerdown(info);
> -		fb_set_suspend(info, 1);
> -		console_unlock();
> -	}
> +	console_lock();
> +	gx_powerdown(info);
> +	fb_set_suspend(info, 1);
> +	console_unlock();
>  
>  	/* there's no point in setting PCI states; we emulate PCI, so
>  	 * we don't end up getting power savings anyways */
> @@ -340,9 +337,9 @@ static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
>  	return 0;
>  }
>  
> -static int gxfb_resume(struct pci_dev *pdev)
> +static int __maybe_unused gxfb_resume(struct device *dev)
>  {
> -	struct fb_info *info = pci_get_drvdata(pdev);
> +	struct fb_info *info = dev_get_drvdata(dev);
>  	int ret;
>  
>  	console_lock();
> @@ -356,7 +353,6 @@ static int gxfb_resume(struct pci_dev *pdev)
>  	console_unlock();
>  	return 0;
>  }
> -#endif
>  
>  static int gxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
> @@ -467,15 +463,23 @@ static const struct pci_device_id gxfb_id_table[] = {
>  
>  MODULE_DEVICE_TABLE(pci, gxfb_id_table);
>  
> +static const struct dev_pm_ops gxfb_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend	= gxfb_suspend,
> +	.resume		= gxfb_resume,
> +	.freeze		= NULL,
> +	.thaw		= gxfb_resume,
> +	.poweroff	= NULL,
> +	.restore	= gxfb_resume,
> +#endif
> +};
> +
>  static struct pci_driver gxfb_driver = {
>  	.name		= "gxfb",
>  	.id_table	= gxfb_id_table,
>  	.probe		= gxfb_probe,
>  	.remove		= gxfb_remove,
> -#ifdef CONFIG_PM
> -	.suspend	= gxfb_suspend,
> -	.resume		= gxfb_resume,
> -#endif
> +	.driver.pm	= &gxfb_pm_ops,
>  };
>  
>  #ifndef MODULE
> diff --git a/drivers/video/fbdev/geode/suspend_gx.c b/drivers/video/fbdev/geode/suspend_gx.c
> index 1110a527c35c..8c49d4e98772 100644
> --- a/drivers/video/fbdev/geode/suspend_gx.c
> +++ b/drivers/video/fbdev/geode/suspend_gx.c
> @@ -11,8 +11,6 @@
>  
>  #include "gxfb.h"
>  
> -#ifdef CONFIG_PM
> -
>  static void gx_save_regs(struct gxfb_par *par)
>  {
>  	int i;
> @@ -259,5 +257,3 @@ int gx_powerup(struct fb_info *info)
>  	par->powered_down  = 0;
>  	return 0;
>  }
> -
> -#endif
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
