Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426473D2D1
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 20:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153310E18C;
	Sun, 25 Jun 2023 18:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BE910E187
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 18:04:12 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QpzPl6CHTzDrNy;
 Sun, 25 Jun 2023 18:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687716252; bh=3cOd9Tulf+RLZ2R/lGuVfEdERy8xqZ4HHWjkWZv3FAs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lXentHTOo29YwgA/Q5WAgBBEUsl5DTqsmOJd4wsjxBgZocgZ/PG9hmyBm6a2IjvcQ
 jSPI26UWubdYOe7kngWhcU0/oO570ofVUyrxiNgiJQfcscdp5bpwrskBKK4yXdJc0q
 2YM4+n0xeBBSr2pFLMDwbOsLDvaGUK77nSPcbPXQ=
X-Riseup-User-ID: 7EBE90DED2258EE1CA830B796CBA05FD63338D890F31F4C1BCCCB27A6DA77A56
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4QpzPg4YpbzJntB;
 Sun, 25 Jun 2023 18:04:07 +0000 (UTC)
Message-ID: <64c40359-d0ee-5070-2a52-033c7e655e0a@riseup.net>
Date: Sun, 25 Jun 2023 15:04:05 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/6] drm/vkms: Add a module param to enable/disable the
 default device
Content-Language: en-US
To: Jim Shargo <jshargo@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230623222353.97283-7-jshargo@chromium.org>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230623222353.97283-7-jshargo@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jim,

On 6/23/23 19:23, Jim Shargo wrote:
> In many testing circumstances, we will want to just create a new device
> and test against that. If we create a default device, it can be annoying
> to have to manually select the new device instead of choosing the only
> one that exists.
> 
> The param, enable_default, is defaulted to true to maintain backwards
> compatibility.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.c | 44 ++++++++++++++++++++++-----------
>   1 file changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 314a04659c5f..1cb56c090a65 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -42,17 +42,26 @@
>   #define DRIVER_MAJOR	1
>   #define DRIVER_MINOR	0
>   
> +static bool enable_default_device = true;
> +module_param_named(enable_default_device, enable_default_device, bool, 0444);
> +MODULE_PARM_DESC(enable_default_device,
> +		 "Enable/Disable creating the default device");

Wouldn't be better to just call it "enable_default"?

Also, could you add this parameter to vkms_config debugfs file?

Best Regards,
- Maíra

> +
>   static bool enable_cursor = true;
>   module_param_named(enable_cursor, enable_cursor, bool, 0444);
> -MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
> +MODULE_PARM_DESC(enable_cursor,
> +		 "Enable/Disable cursor support for the default device");
>   
>   static bool enable_writeback = true;
>   module_param_named(enable_writeback, enable_writeback, bool, 0444);
> -MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
> +MODULE_PARM_DESC(
> +	enable_writeback,
> +	"Enable/Disable writeback connector support for the default device");
>   
>   static bool enable_overlay;
>   module_param_named(enable_overlay, enable_overlay, bool, 0444);
> -MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> +MODULE_PARM_DESC(enable_overlay,
> +		 "Enable/Disable overlay support for the default device");
>   
>   DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>   
> @@ -278,10 +287,7 @@ void vkms_remove_device(struct vkms_device *vkms_device)
>   static int __init vkms_init(void)
>   {
>   	int ret;
> -	struct platform_device *pdev;
> -	struct vkms_device_setup vkms_device_setup = {
> -		.configfs = NULL,
> -	};
> +	struct platform_device *default_pdev = NULL;
>   
>   	ret = platform_driver_register(&vkms_platform_driver);
>   	if (ret) {
> @@ -289,19 +295,27 @@ static int __init vkms_init(void)
>   		return ret;
>   	}
>   
> -	pdev = platform_device_register_data(NULL, DRIVER_NAME, 0,
> -					     &vkms_device_setup,
> -					     sizeof(vkms_device_setup));
> -	if (IS_ERR(pdev)) {
> -		DRM_ERROR("Unable to register default vkms device\n");
> -		platform_driver_unregister(&vkms_platform_driver);
> -		return PTR_ERR(pdev);
> +	if (enable_default_device) {
> +		struct vkms_device_setup vkms_device_setup = {
> +			.configfs = NULL,
> +		};
> +
> +		default_pdev = platform_device_register_data(
> +			NULL, DRIVER_NAME, 0, &vkms_device_setup,
> +			sizeof(vkms_device_setup));
> +		if (IS_ERR(default_pdev)) {
> +			DRM_ERROR("Unable to register default vkms device\n");
> +			platform_driver_unregister(&vkms_platform_driver);
> +			return PTR_ERR(default_pdev);
> +		}
>   	}
>   
>   	ret = vkms_init_configfs();
>   	if (ret) {
>   		DRM_ERROR("Unable to initialize configfs\n");
> -		platform_device_unregister(pdev);
> +		if (default_pdev)
> +			platform_device_unregister(default_pdev);
> +
>   		platform_driver_unregister(&vkms_platform_driver);
>   	}
>   
