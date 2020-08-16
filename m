Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684BB245978
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 22:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20A46E42A;
	Sun, 16 Aug 2020 20:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C365F6E42A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 20:24:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1C02720023;
 Sun, 16 Aug 2020 22:24:44 +0200 (CEST)
Date: Sun, 16 Aug 2020 22:24:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v2 09/12] fbdev: i740fb: use generic power management
Message-ID: <20200816202442.GB1426650@ravnborg.org>
References: <20200810165458.GA292825@ravnborg.org>
 <20200810185723.15540-1-vaibhavgupta40@gmail.com>
 <20200810185723.15540-10-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810185723.15540-10-vaibhavgupta40@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=MP0Wb9vCekDogQPHZHEA:9
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

On Tue, Aug 11, 2020 at 12:27:20AM +0530, Vaibhav Gupta wrote:
> Drivers should do only device-specific jobs. But in general, drivers using
> legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
> PM-related tasks themselves which can be done by PCI Core itself. This
> brings extra load on the driver and it directly calls PCI helper functions
> to handle them.
> 
> Switch to the new generic framework by updating function signatures and
> define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
> unnecessary calls to the PCI Helper functions along with the legacy
> .suspend & .resume bindings.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

I several of the drivers I briefly looked at a new set of helpers were
introduced for the different types of pm actions.
They then called a more generic function that uses the passes
enumeration to decide what to do.

But in this driver the test "state.event == PM_EVENT_FREEZE" is dropped
and there is no freeze operation.
Please explain this change so the reader is not left wondering.

	Sam

> ---
>  drivers/video/fbdev/i740fb.c | 40 +++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
> index c65ec7386e87..8d7f06fc8a5a 100644
> --- a/drivers/video/fbdev/i740fb.c
> +++ b/drivers/video/fbdev/i740fb.c
> @@ -1175,16 +1175,11 @@ static void i740fb_remove(struct pci_dev *dev)
>  	}
>  }
>  
> -#ifdef CONFIG_PM
> -static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
> +static int __maybe_unused i740fb_suspend(struct device *dev)
>  {
> -	struct fb_info *info = pci_get_drvdata(dev);
> +	struct fb_info *info = dev_get_drvdata(dev);
>  	struct i740fb_par *par = info->par;
>  
> -	/* don't disable console during hibernation and wakeup from it */
> -	if (state.event == PM_EVENT_FREEZE || state.event == PM_EVENT_PRETHAW)
> -		return 0;
> -
>  	console_lock();
>  	mutex_lock(&(par->open_lock));
>  
> @@ -1197,19 +1192,15 @@ static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
>  
>  	fb_set_suspend(info, 1);
>  
> -	pci_save_state(dev);
> -	pci_disable_device(dev);
> -	pci_set_power_state(dev, pci_choose_state(dev, state));
> -
>  	mutex_unlock(&(par->open_lock));
>  	console_unlock();
>  
>  	return 0;
>  }
>  
> -static int i740fb_resume(struct pci_dev *dev)
> +static int __maybe_unused i740fb_resume(struct device *dev)
>  {
> -	struct fb_info *info = pci_get_drvdata(dev);
> +	struct fb_info *info = dev_get_drvdata(dev);
>  	struct i740fb_par *par = info->par;
>  
>  	console_lock();
> @@ -1218,11 +1209,6 @@ static int i740fb_resume(struct pci_dev *dev)
>  	if (par->ref_count == 0)
>  		goto fail;
>  
> -	pci_set_power_state(dev, PCI_D0);
> -	pci_restore_state(dev);
> -	if (pci_enable_device(dev))
> -		goto fail;
> -
>  	i740fb_set_par(info);
>  	fb_set_suspend(info, 0);
>  
> @@ -1231,10 +1217,17 @@ static int i740fb_resume(struct pci_dev *dev)
>  	console_unlock();
>  	return 0;
>  }
> -#else
> -#define i740fb_suspend NULL
> -#define i740fb_resume NULL
> -#endif /* CONFIG_PM */
> +
> +static const struct dev_pm_ops i740fb_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend	= i740fb_suspend,
> +	.resume		= i740fb_resume,
> +	.freeze		= NULL,
> +	.thaw		= i740fb_resume,
> +	.poweroff	= i740fb_suspend,
> +	.restore	= i740fb_resume,
> +#endif /* CONFIG_PM_SLEEP */
> +};
>  
>  #define I740_ID_PCI 0x00d1
>  #define I740_ID_AGP 0x7800
> @@ -1251,8 +1244,7 @@ static struct pci_driver i740fb_driver = {
>  	.id_table	= i740fb_id_table,
>  	.probe		= i740fb_probe,
>  	.remove		= i740fb_remove,
> -	.suspend	= i740fb_suspend,
> -	.resume		= i740fb_resume,
> +	.driver.pm	= &i740fb_pm_ops,
>  };
>  
>  #ifndef MODULE
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
