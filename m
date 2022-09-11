Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C25B4FF9
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 18:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643DF10E4EA;
	Sun, 11 Sep 2022 16:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B55210E4EB
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 16:21:20 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id A2339204CA0B; Sun, 11 Sep 2022 09:21:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A2339204CA0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1662913279;
 bh=Z4QMTDUS2dSBcOU+9vvtM4dEnmR8yddlU4SZvyzFekg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MyEWnvVu3dsnLw8poRMoSa6YY4x+ckJRSbanuAxolY57UgncQ/5UQ+l9jr53JK81v
 PIs46XiNi9Hg4WrlJ7w36VjWdXmy/ggnXWlBEbl/RvVoo5lnBVOAWWyA9wZc7XSdvq
 zsKLYL5uvtfx38ZTYt18HPcGhzmKMTFf0FFo+8Sc=
Date: Sun, 11 Sep 2022 09:21:19 -0700
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
Message-ID: <20220911162119.GB7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
 <14302178-c797-8635-4325-070f78b7f805@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14302178-c797-8635-4325-070f78b7f805@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, ssengar@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mikelley@microsoft.com, drawat.floss@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 10, 2022 at 08:11:24PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.09.22 um 16:43 schrieb Saurabh Sengar:
> >hyperv_setup_vram tries to remove conflicting framebuffer based on
> >'screen_info'. As observed in past due to some bug or wrong setting
> >in grub, the 'screen_info' fields may not be set for Gen1, and in such
> >cases drm_aperture_remove_conflicting_framebuffers will not do anything
> >useful.
> >For Gen1 VMs, it should always be possible to get framebuffer
> >conflict removed using PCI device instead.
> >
> >Fixes: a0ab5abced55 ("drm/hyperv : Removing the restruction of VRAM allocation with PCI bar size")
> >Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> >---
> >  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 24 ++++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> >index 6d11e7938c83..b0cc974efa45 100644
> >--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> >+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> >@@ -73,12 +73,28 @@ static int hyperv_setup_vram(struct hyperv_drm_device *hv,
> >  			     struct hv_device *hdev)
> >  {
> >  	struct drm_device *dev = &hv->dev;
> >+	struct pci_dev *pdev;
> >  	int ret;
> >-	drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
> >-						     screen_info.lfb_size,
> >-						     false,
> >-						     &hyperv_driver);
> >+	if (efi_enabled(EFI_BOOT)) {
> >+		drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
> >+							     screen_info.lfb_size,
> 
> Using screen_info here seems wrong in any case. You want to remove
> the framebuffer devices that conflict with your driver, which might
> be unrelated to screen_info. AFAICT the correct solution would
> always retrieve the PCI device for removal (i.e., always do the else
> branch).

In a Gen2 VM, the Hyper-V frame buffer device is presented only as a VMbus device.
It's not presented as a PCI device like it is in a Gen1 VM. This would have worked
if we had the frame buffer device available as PCI device in Gen2 but unfortunately
thats not the case here.

Regards,
Saurabh

> 
> Best regard
> Thomas
> 
> >+							     false,
> >+							     &hyperv_driver);
> >+	} else {
> >+		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> >+		if (!pdev) {
> >+			drm_err(dev, "Unable to find PCI Hyper-V video\n");
> >+			return -ENODEV;
> >+		}
> >+
> >+		ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hyperv_driver);
> >+		pci_dev_put(pdev);
> >+		if (ret) {
> >+			drm_err(dev, "Not able to remove boot fb\n");
> >+			return ret;
> >+		}
> >+	}
> >  	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev



