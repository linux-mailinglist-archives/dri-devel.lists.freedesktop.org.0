Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1823F847217
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 15:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DCB10E763;
	Fri,  2 Feb 2024 14:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="IMk1NsIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B7E10E763
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 14:40:29 +0000 (UTC)
Message-ID: <6077168a-16cb-49db-985d-817fe7c5c827@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706884819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SatiKxBzBkAAJofMSZpTp7E4Qz1yre1/7odJDoCi2Wg=;
 b=IMk1NsIyuIrLnuULUk6Px17DYtU1ntv3XXwlRA9QIQUwz8ex1km4njFtCsXicTBb2aNQDH
 YfIUlPi+Ecaata15h7VmAtft+M2x0zNs9mNh92qMv6/2atd7/IzhkN1BfKCiO2veFZKvaZ
 Q3VaU7h2SDvyBGmaASidBaIyaZGlcqY=
Date: Fri, 2 Feb 2024 22:40:09 +0800
MIME-Version: 1.0
Subject: Re: [v2,3/8] firmware/sysfb: Set firmware-framebuffer parent device
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-4-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240202120140.3517-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi, Thomas:

I love your patch, yet it can cause the linux kernel fail to compile
if the CONFIG_SYSFB_SIMPLEFB option is not selected. I paste the log
at below for easier to read and debug. Please fix this. :-)

drivers/firmware/sysfb.c: In function ‘sysfb_init’:
drivers/firmware/sysfb.c:134:22: error: too many arguments to function 
‘sysfb_create_simplefb’
   134 |                 pd = sysfb_create_simplefb(si, &mode, parent);
       |                      ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/firmware/sysfb.c:36:
./include/linux/sysfb.h:105:39: note: declared here
   105 | static inline struct platform_device 
*sysfb_create_simplefb(const struct screen_info *si,
       | ^~~~~~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:243: drivers/firmware/sysfb.o] Error 1
make[3]: *** [scripts/Makefile.build:481: drivers/firmware] Error 2
make[3]: *** Waiting for unfinished jobs....

This is because you forget to modify prototype of sysfb_create_simplefb() function,
Please see it in include/linux/sysfb.h, at the 106 line of the file.


On 2024/2/2 19:58, Thomas Zimmermann wrote:
> Set the firmware framebuffer's parent device, which usually is the
> graphics hardware's physical device. Integrates the framebuffer in
> the Linux device hierarchy and lets Linux handle dependencies among
> devices. For example, the graphics hardware won't be suspended while
> the firmware device is still active.
>
> v2:
> 	* detect parent device in sysfb_parent_dev()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/firmware/sysfb.c          | 19 ++++++++++++++++++-
>   drivers/firmware/sysfb_simplefb.c |  5 ++++-
>   include/linux/sysfb.h             |  3 ++-
>   3 files changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 3c197db42c9d9..d02945b0d8ea1 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -29,6 +29,7 @@
>   #include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/mm.h>
> +#include <linux/pci.h>
>   #include <linux/platform_data/simplefb.h>
>   #include <linux/platform_device.h>
>   #include <linux/screen_info.h>
> @@ -69,9 +70,21 @@ void sysfb_disable(void)
>   }
>   EXPORT_SYMBOL_GPL(sysfb_disable);
>   
> +static __init struct device *sysfb_parent_dev(const struct screen_info *si)
> +{
> +	struct pci_dev *pdev;
> +
> +	pdev = screen_info_pci_dev(si);
> +	if (pdev)
> +		return &pdev->dev;
> +
> +	return NULL;
> +}
> +
>   static __init int sysfb_init(void)
>   {
>   	struct screen_info *si = &screen_info;
> +	struct device *parent;
>   	struct simplefb_platform_data mode;
>   	const char *name;
>   	bool compatible;
> @@ -83,10 +96,12 @@ static __init int sysfb_init(void)
>   
>   	sysfb_apply_efi_quirks();
>   
> +	parent = sysfb_parent_dev(si);
> +
>   	/* try to create a simple-framebuffer device */
>   	compatible = sysfb_parse_mode(si, &mode);
>   	if (compatible) {
> -		pd = sysfb_create_simplefb(si, &mode);
> +		pd = sysfb_create_simplefb(si, &mode, parent);
>   		if (!IS_ERR(pd))
>   			goto unlock_mutex;
>   	}
> @@ -109,6 +124,8 @@ static __init int sysfb_init(void)
>   		goto unlock_mutex;
>   	}
>   
> +	pd->dev.parent = parent;
> +
>   	sysfb_set_efifb_fwnode(pd);
>   
>   	ret = platform_device_add_data(pd, si, sizeof(*si));
> diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
> index 74363ed7501f6..75a186bf8f8ec 100644
> --- a/drivers/firmware/sysfb_simplefb.c
> +++ b/drivers/firmware/sysfb_simplefb.c
> @@ -91,7 +91,8 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
>   }
>   
>   __init struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
> -						     const struct simplefb_platform_data *mode)
> +						     const struct simplefb_platform_data *mode,
> +						     struct device *parent)
>   {
>   	struct platform_device *pd;
>   	struct resource res;
> @@ -143,6 +144,8 @@ __init struct platform_device *sysfb_create_simplefb(const struct screen_info *s
>   	if (!pd)
>   		return ERR_PTR(-ENOMEM);
>   
> +	pd->dev.parent = parent;
> +
>   	sysfb_set_efifb_fwnode(pd);
>   
>   	ret = platform_device_add_resources(pd, &res, 1);
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index 19cb803dd5ecd..6ee3ade3f8b06 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -91,7 +91,8 @@ static inline void sysfb_set_efifb_fwnode(struct platform_device *pd)
>   bool sysfb_parse_mode(const struct screen_info *si,
>   		      struct simplefb_platform_data *mode);
>   struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
> -					      const struct simplefb_platform_data *mode);
> +					      const struct simplefb_platform_data *mode,
> +					      struct device *parent);
>   
>   #else /* CONFIG_SYSFB_SIMPLE */
>   
