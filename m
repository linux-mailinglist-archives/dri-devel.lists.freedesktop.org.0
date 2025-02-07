Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC589A2C988
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D2B10EB80;
	Fri,  7 Feb 2025 16:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EIZgPFVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FBA10E295
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:59:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DF55441DA;
 Fri,  7 Feb 2025 16:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738947548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Vahkevl3F2lREJftLS6cdDcMfSleJSqHFUq+QmTQiU=;
 b=EIZgPFVwykSWcWsy5rEycLE3/B7/sf4MUrf1slqX0ATxUFm38qPjPCuXAqKRbQuPb8eR6K
 QFMAjFbzLzwYIdmrHdCReGMsoxXej+b2rEIMXQ+9U9Sn0OMnmwDXFq5NmztJ63kWf1OLEP
 6jSPV4ImPaT3K47J5PHaXXH5XUDajBtH9/oV8nSLaeZxXI4UNCgYjX38EBiIF5LBvzv/93
 0kLyRH/jKaOw21g20z37NOVZ+JRl3iWKZyxNvtIyKoOZrqef1JAKoeg1gCw7pYERkG0X+S
 xZhv1kJhRZgGBGqU9EtU7j2Emso9fNhZdRvyww9hyUPV+SRd9RLzk0H2y2nwrg==
Date: Fri, 7 Feb 2025 17:59:04 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
 Mark Brown <broonie@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Robin Murphy <robin.murphy@arm.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 8/8] drm/vkms: convert to use faux_device
Message-ID: <Z6Y72LK1UW86x8av@louis-chauvet-laptop>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
 Mark Brown <broonie@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Robin Murphy <robin.murphy@arm.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <2025020620-skedaddle-olympics-1735@gregkh>
 <2025020625-unlaced-vagueness-ae34@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020625-unlaced-vagueness-ae34@gregkh>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefggffgtddtudegiedtgeeluddtleegjeehveegieffvefgfeehkeekiedvjeetveenucffohhmrghinhepsghoohhtlhhinhdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedviedprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopegrlhgvkhhsrghnuggvrhdrlhhosggrkhhinhesihhnthgvlhdrtghomhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 06/02/25 - 18:38, Greg Kroah-Hartman wrote:
> The vkms driver does not need to create a platform device, as there is
> no real platform resources associated it,  it only did so because it was
> simple to do that in order to get a device to use for resource
> management of drm resources.  Change the driver to use the faux device
> instead as this is NOT a real platform device.
> 
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  v3: new patch in the series.  For an example of the api working, does
>      not have to be merged at this time, but I can take it if the
>      maintainers give an ack.

Hi,

This patch cannot be merged into drm-misc-next because we modified the 
vkms_device structure in commit 49a167c393b0 ("drm/vkms: Switch to dynamic 
allocation for CRTC"), which is present in linux-next.

Once this conflict is resolved, I agree with changing from platform_device 
to faux_device.

Apart from this minor conflict, I believe your patch has revealed an issue 
in VKMS:

Without your patch:

	bash-5.2# modprobe vkms
	[drm] Initialized vkms 1.0.0 for vkms on minor 0
	bash-5.2#

With your patch:

	bash-5.2# modprobe vkms
	faux vkms: Resources present before probing
	[drm] Initialized vkms 1.0.0 for vkms on minor 0
	bash-5.2#

After some investigation, I found that the issue is not caused by your 
patch but by VKMS itself:

During faux_device_create, the device core postpones the device probe to 
run it later [0]. This probe checks if the devres list is empty [1] and 
fails if it is not.

[0]:https://elixir.bootlin.com/linux/v6.13.1/source/drivers/base/bus.c#L534
[1]:https://elixir.bootlin.com/linux/v6.13.1/source/drivers/base/dd.c#L626

With a platform driver, the order of execution was:

	platform_device_register_simple();
		device_add();
	*async* device_probe(); /* no issue, the devres is untouched */
	devres_open_group();

But with faux-device, the order is:

	faux_device_create();
		device_add();
	devres_open_group();
	*async* device_probe(); /* issue here, because of the previous 
				   devres_open_group */

How do you think this should be solved? I would like to keep a simple 
solution, given that:
- we want to have multiple vkms devices (configfs [2])
- we need to ensure that device_probe is called before devres_open_group 
  and devm_drm_dev_alloc to avoid this error

[2]:https://lore.kernel.org/all/20250121-google-config-fs-v3-0-8154a6945142@bootlin.com/

I found two other drm driver that may be broken in the same way (very 
similar code pattern):
https://elixir.bootlin.com/linux/v6.13.1/source/drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c#L64
https://elixir.bootlin.com/linux/v6.13.1/source/drivers/gpu/drm/vgem/vgem_drv.c#L138

Thanks a lot,
Louis Chauvet

Change to hide the issue:

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 89ccf0d6419a..84777d6ba889 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -174,7 +174,7 @@ static int vkms_create(struct vkms_config *config)
        fdev = faux_device_create(DRIVER_NAME, NULL);
        if (!fdev)
                return -ENODEV;
-
+       pr_err("%s:%d\n", __FILE__, __LINE__);
        if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
                ret = -ENOMEM;
                goto out_unregister;



>  drivers/gpu/drm/vkms/vkms_drv.c | 28 ++++++++++++++--------------
>  drivers/gpu/drm/vkms/vkms_drv.h |  4 ++--
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index e0409aba9349..b1269f984886 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -10,7 +10,7 @@
>   */
>  
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
> +#include <linux/device/faux.h>
>  #include <linux/dma-mapping.h>
>  
>  #include <drm/clients/drm_client_setup.h>
> @@ -177,25 +177,25 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  static int vkms_create(struct vkms_config *config)
>  {
>  	int ret;
> -	struct platform_device *pdev;
> +	struct faux_device *fdev;
>  	struct vkms_device *vkms_device;
>  
> -	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> -	if (IS_ERR(pdev))
> -		return PTR_ERR(pdev);
> +	fdev = faux_device_create(DRIVER_NAME, NULL);
> +	if (!fdev)
> +		return -ENODEV;
>  
> -	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> +	if (!devres_open_group(&fdev->dev, NULL, GFP_KERNEL)) {
>  		ret = -ENOMEM;
>  		goto out_unregister;
>  	}
>  
> -	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
> +	vkms_device = devm_drm_dev_alloc(&fdev->dev, &vkms_driver,
>  					 struct vkms_device, drm);
>  	if (IS_ERR(vkms_device)) {
>  		ret = PTR_ERR(vkms_device);
>  		goto out_devres;
>  	}
> -	vkms_device->platform = pdev;
> +	vkms_device->faux_dev = fdev;
>  	vkms_device->config = config;
>  	config->dev = vkms_device;
>  
> @@ -229,9 +229,9 @@ static int vkms_create(struct vkms_config *config)
>  	return 0;
>  
>  out_devres:
> -	devres_release_group(&pdev->dev, NULL);
> +	devres_release_group(&fdev->dev, NULL);
>  out_unregister:
> -	platform_device_unregister(pdev);
> +	faux_device_destroy(fdev);
>  	return ret;
>  }
>  
> @@ -259,19 +259,19 @@ static int __init vkms_init(void)
>  
>  static void vkms_destroy(struct vkms_config *config)
>  {
> -	struct platform_device *pdev;
> +	struct faux_device *fdev;
>  
>  	if (!config->dev) {
>  		DRM_INFO("vkms_device is NULL.\n");
>  		return;
>  	}
>  
> -	pdev = config->dev->platform;
> +	fdev = config->dev->faux_dev;
>  
>  	drm_dev_unregister(&config->dev->drm);
>  	drm_atomic_helper_shutdown(&config->dev->drm);
> -	devres_release_group(&pdev->dev, NULL);
> -	platform_device_unregister(pdev);
> +	devres_release_group(&fdev->dev, NULL);
> +	faux_device_destroy(fdev);
>  
>  	config->dev = NULL;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 00541eff3d1b..4668b0e29a84 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -209,13 +209,13 @@ struct vkms_config {
>   * struct vkms_device - Description of a VKMS device
>   *
>   * @drm - Base device in DRM
> - * @platform - Associated platform device
> + * @faux_dev- Associated faux device
>   * @output - Configuration and sub-components of the VKMS device
>   * @config: Configuration used in this VKMS device
>   */
>  struct vkms_device {
>  	struct drm_device drm;
> -	struct platform_device *platform;
> +	struct faux_device *faux_dev;
>  	struct vkms_output output;
>  	const struct vkms_config *config;
>  };
> -- 
> 2.48.1
> 
