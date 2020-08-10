Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBAE240B74
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 18:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE7E89D5B;
	Mon, 10 Aug 2020 16:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E56789D5B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 16:55:06 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3A159804D9;
 Mon, 10 Aug 2020 18:55:00 +0200 (CEST)
Date: Mon, 10 Aug 2020 18:54:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v1 01/12] fbdev: gxfb: use generic power management
Message-ID: <20200810165458.GA292825@ravnborg.org>
References: <20200805180722.244008-1-vaibhavgupta40@gmail.com>
 <20200805180722.244008-2-vaibhavgupta40@gmail.com>
 <20200808111746.GA24172@ravnborg.org>
 <20200810093948.GB6615@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810093948.GB6615@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=3wanNKNTOeUfviNiXn8A:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bjorn@helgaas.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Andres Salomon <dilinger@queued.net>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-geode@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vaibhav
On Mon, Aug 10, 2020 at 03:09:48PM +0530, Vaibhav Gupta wrote:
> On Sat, Aug 08, 2020 at 01:17:46PM +0200, Sam Ravnborg wrote:
> > Hi Vaibhav
> > 
> > On Wed, Aug 05, 2020 at 11:37:11PM +0530, Vaibhav Gupta wrote:
> > > Drivers using legacy power management .suspen()/.resume() callbacks
> > > have to manage PCI states and device's PM states themselves. They also
> > > need to take care of standard configuration registers.
> > > 
> > > Switch to generic power management framework using a single
> > > "struct dev_pm_ops" variable
> > 
> > "to take the unnecessary load from the driver."
> > - I do not parse the above - I cannot see what load is removed.
> > But the code is simpler which is fine. The drawback is that we now
> > always link in the suspend_gx functions but hopefultl the linker drops
> > them later.
> > 
> > > This also avoids the need for the driver to directly call most of the PCI
> > > helper functions and device power state control functions, as through
> > > the generic framework PCI Core takes care of the necessary operations,
> > > and drivers are required to do only device-specific jobs.
> > Again, I do not see what calles are removed.
> > A single check for the state is dropped - anything else?
> >
> Yeah, the commit messages are bit misleading, I have modified them. 
> > > 
> > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > ---
> > >  drivers/video/fbdev/geode/gxfb.h       |  5 ----
> > >  drivers/video/fbdev/geode/gxfb_core.c  | 36 ++++++++++++++------------
> > >  drivers/video/fbdev/geode/suspend_gx.c |  4 ---
> > >  3 files changed, 20 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/video/fbdev/geode/gxfb.h b/drivers/video/fbdev/geode/gxfb.h
> > > index d2e9c5c8e294..792c111c21e4 100644
> > > --- a/drivers/video/fbdev/geode/gxfb.h
> > > +++ b/drivers/video/fbdev/geode/gxfb.h
> > > @@ -21,7 +21,6 @@ struct gxfb_par {
> > >  	void __iomem *dc_regs;
> > >  	void __iomem *vid_regs;
> > >  	void __iomem *gp_regs;
> > > -#ifdef CONFIG_PM
> > >  	int powered_down;
> > >  
> > >  	/* register state, for power management functionality */
> > > @@ -36,7 +35,6 @@ struct gxfb_par {
> > >  	uint64_t fp[FP_REG_COUNT];
> > >  
> > >  	uint32_t pal[DC_PAL_COUNT];
> > > -#endif
> > >  };
> > >  
> > >  unsigned int gx_frame_buffer_size(void);
> > > @@ -49,11 +47,8 @@ void gx_set_dclk_frequency(struct fb_info *info);
> > >  void gx_configure_display(struct fb_info *info);
> > >  int gx_blank_display(struct fb_info *info, int blank_mode);
> > >  
> > > -#ifdef CONFIG_PM
> > >  int gx_powerdown(struct fb_info *info);
> > >  int gx_powerup(struct fb_info *info);
> > > -#endif
> > > -
> > >  
> > >  /* Graphics Processor registers (table 6-23 from the data book) */
> > >  enum gp_registers {
> > > diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
> > > index d38a148d4746..44089b331f91 100644
> > > --- a/drivers/video/fbdev/geode/gxfb_core.c
> > > +++ b/drivers/video/fbdev/geode/gxfb_core.c
> > > @@ -322,17 +322,14 @@ static struct fb_info *gxfb_init_fbinfo(struct device *dev)
> > >  	return info;
> > >  }
> > >  
> > > -#ifdef CONFIG_PM
> > > -static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
> > > +static int __maybe_unused gxfb_suspend(struct device *dev)
> > >  {
> > > -	struct fb_info *info = pci_get_drvdata(pdev);
> > > +	struct fb_info *info = dev_get_drvdata(dev);
> > I do not see any dev_set_drvdata() so I guess we get a NULL pointer
> > here which is not intended.
> > Adding a dev_set_data() to gxfb_probe() would do the trick.
> > 
> gxfb_probe() invokes pci_set_drvdata(pdev, info) which in turn calls
> dev_set_drvdata(&pdev->dev, data). Adding dev_get_drvdata() will be redundant.
OK, not obvious but you are right that calling dev_get_drvdata() would
be redundant and no need.
There is a pci_get_drvdata() user left so we cannot just skip it and use
the dev_set_drvdata() direct.

> 
> > >  
> > > -	if (state.event == PM_EVENT_SUSPEND) {
> > > -		console_lock();
> > > -		gx_powerdown(info);
> > > -		fb_set_suspend(info, 1);
> > > -		console_unlock();
> > > -	}
> > > +	console_lock();
> > > +	gx_powerdown(info);
> > > +	fb_set_suspend(info, 1);
> > > +	console_unlock();
> > >  
> > >  	/* there's no point in setting PCI states; we emulate PCI, so
> > >  	 * we don't end up getting power savings anyways */
> > > @@ -340,9 +337,9 @@ static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
> > >  	return 0;
> > >  }
> > >  
> > > -static int gxfb_resume(struct pci_dev *pdev)
> > > +static int __maybe_unused gxfb_resume(struct device *dev)
> > >  {
> > > -	struct fb_info *info = pci_get_drvdata(pdev);
> > > +	struct fb_info *info = dev_get_drvdata(dev);
> > >  	int ret;
> > >  
> > >  	console_lock();
> > > @@ -356,7 +353,6 @@ static int gxfb_resume(struct pci_dev *pdev)
> > >  	console_unlock();
> > >  	return 0;
> > >  }
> > > -#endif
> > >  
> > >  static int gxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >  {
> > > @@ -467,15 +463,23 @@ static const struct pci_device_id gxfb_id_table[] = {
> > >  
> > >  MODULE_DEVICE_TABLE(pci, gxfb_id_table);
> > >  
> > > +static const struct dev_pm_ops gxfb_pm_ops = {
> > > +#ifdef CONFIG_PM_SLEEP
> > > +	.suspend	= gxfb_suspend,
> > > +	.resume		= gxfb_resume,
> > > +	.freeze		= NULL,
> > > +	.thaw		= gxfb_resume,
> > > +	.poweroff	= NULL,
> > > +	.restore	= gxfb_resume,
> > > +#endif
> > > +};
> > Can we use SET_SYSTEM_SLEEP_PM_OPS here?
> > .freeze will be assigned gxfb_suspend, but gxfb_suspend will anyway be
> > called as far as I read the code.
> > Likewise for poweroff.
> > 
> Earlier, gxfb_suspend() performed each operation just for suspend event.
> And as it was legacy code, it was invoked by pci_legacy_suspend() for
> pci_pm_suspend(), pci_pm_freeze() and pci_pm_poweroff().
> Thus, the code was wrapped inside "if" container:
> 	if (state.event == PM_EVENT_SUSPEND) { }
> 
> After binding it with dev_pm_ops variable, pm->suspend() is invoked by just
> pci_pm_suspend() which is required.
> 
> So I removed the "if" container and bind the callback with pm->suspend pointer
> only.
Looking at platform.c I got the impression that freeze() would call
pci_legacy_suspend() anyway - but I may have missind something.
So I guess this is OK then.

I look forward for next revision with updated changelogs.

	Sam
> 
> Using SET_SYSTEM_PM_OPS will bring back the extra step of invoking gxfb_suspend()
> for freeze and poweroff, even though the function will do nothing in that case.
> 
> Vaibhav Gupta
> > 	Sam
> > 
> > > +
> > >  static struct pci_driver gxfb_driver = {
> > >  	.name		= "gxfb",
> > >  	.id_table	= gxfb_id_table,
> > >  	.probe		= gxfb_probe,
> > >  	.remove		= gxfb_remove,
> > > -#ifdef CONFIG_PM
> > > -	.suspend	= gxfb_suspend,
> > > -	.resume		= gxfb_resume,
> > > -#endif
> > > +	.driver.pm	= &gxfb_pm_ops,
> > >  };
> > >  
> > >  #ifndef MODULE
> > > diff --git a/drivers/video/fbdev/geode/suspend_gx.c b/drivers/video/fbdev/geode/suspend_gx.c
> > > index 1110a527c35c..8c49d4e98772 100644
> > > --- a/drivers/video/fbdev/geode/suspend_gx.c
> > > +++ b/drivers/video/fbdev/geode/suspend_gx.c
> > > @@ -11,8 +11,6 @@
> > >  
> > >  #include "gxfb.h"
> > >  
> > > -#ifdef CONFIG_PM
> > > -
> > >  static void gx_save_regs(struct gxfb_par *par)
> > >  {
> > >  	int i;
> > > @@ -259,5 +257,3 @@ int gx_powerup(struct fb_info *info)
> > >  	par->powered_down  = 0;
> > >  	return 0;
> > >  }
> > > -
> > > -#endif
> > > -- 
> > > 2.27.0
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
