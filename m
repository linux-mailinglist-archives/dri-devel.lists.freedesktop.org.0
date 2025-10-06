Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1151BBD4E4
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 10:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B1610E339;
	Mon,  6 Oct 2025 08:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sqizLOd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115DF10E339
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 08:07:35 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so28653195e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759738054; x=1760342854;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fIP3nj/kaZqoURQHnILt3INTmC8e4a2ZYKLYXuyFz/8=;
 b=sqizLOd7lQQAEGBMnn+PUPO+6BYeN73R+gfCGSSzBoXs0QXPg/DE/QftAoLL17rd67
 XCgw2cu4jY7afZuk7hOnUhzOIGK0A6DQwK86jc8oK+C8hAIPtQchR2Gg2iytjpjQKWkI
 ZmitL3rguMYYeh2xEpyP7UG1tpmeSUpA3Jpje1VZ4G6g/1xJPHXHQjE+ElAj1cSWoJwl
 TObR0P9XkQa75bZrfwaH9KddomQB/NHn4Us3oye88/lYqooOMMStHqN/zpFUn9Kzwhrw
 dOzi0gXzkMPQsUXO0kVKyyx8gULR24c0l20nUrG0XATq/hTHBLMI+doatenWBKBXYo0J
 MTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759738054; x=1760342854;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fIP3nj/kaZqoURQHnILt3INTmC8e4a2ZYKLYXuyFz/8=;
 b=VU4doqtBbn6oqEzmx0IHdB+NeeJ6+mRt0ZL+2xxr7vCOg0Nh8R/U+a/UeJH608JuoP
 ACQBIW9seAV/SArBflDtejjZnQXj2Uaqp1LqjpSQSpaWisKiMB/awwrccrPh4AB3xH7N
 494LIuJATg6/pyXWRnU/9MByiY8QvWPne2zxWsCw2Ptnoai6hG99IPfuftD9sj/vTiFq
 DVhI7lW0jcln6Xy8F4gNeWqk3YEAoJT/LW2DYuWLFzEm1kiUxdTBPlAFJTGaK3CudjfR
 ZUs+3YHHrmRyWpeu6kkFmaYxOhIj7/UJaVU4mZupRHv+8FKVlKwq3SlXEwCVfgdUvSnw
 GDmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcGpwUNbQB1aLmSoxive7z+WfegC/Ea9PWITwEjQwWqpcjlRJGPRDKXVSupGSntgYLTZc6iTrtor4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIc4FQ2nL0l0+PKjZEIBscWKgPSfjSfWeEygPqvr+nyGQ0l1X3
 kRpFZpFk3OfyB9doIvixGkPWuDrmVjyNIl5vYMEZSjtVxPc3s4KrZ+MSOqDlazrIl8E=
X-Gm-Gg: ASbGncuCUECFfPWOEun+4/DcfmkQVXNxwtcG8cIs9Pd3V/p2P3hg3+/fNRM1HFt3lX7
 aYH05n/jYSOtEcOkIlW2G6LYOcpwu1DCurGOYQS0Xfxj2uAnjXFf8HCB4R7nyjYec2KpxtOJdT7
 /mfEFcNm2jnV8KOEh853YOafH0dEMZzpNoRENSbGrY193AiiBHvAA0tmyNJXfUb/D/rcjIOk8U+
 TEAMUzmWUnBSO6nFiSaBQIGW0qHE8p+xvNSVe2R7l1hZ+iY8HWSIr/iKgPMV31lHtAVmCjGHbAY
 4srt+bG5xZw91qGtDyDGJzNHeGgpEKlEW/ShWCxfCmHPWr84aAv4PX11fnSO7itSTO/bjCmmjlN
 pZ89gPZGuGdUYafTlhVH0VpLbLytLmZLVH0+CXj231Pg7b+LvalaYd7BKv+syIwWTf96MImJw+G
 5+UU6noPpKg6iA
X-Google-Smtp-Source: AGHT+IEPOZAD4VRyHv8G07fK+SBrRsq0r0Hw/6N9Dx+r87/odXDC5BnpiOYuk9CtEdQgvS4jobcOWw==
X-Received: by 2002:a05:600c:1d12:b0:46e:32d4:46a1 with SMTP id
 5b1f17b1804b1-46e7113f48fmr66978345e9.22.1759738053649; 
 Mon, 06 Oct 2025 01:07:33 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4255d8e9724sm19466682f8f.28.2025.10.06.01.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 01:07:33 -0700 (PDT)
Date: Mon, 6 Oct 2025 10:07:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Javier Garcia <rampxxxx@gmail.com>
Cc: deller@gmx.de, tzimmermann@suse.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
Message-ID: <ewca4jzmahwdl47rbojxtynbizu2vuompjxrprsz7aelovnvao@kzpxjjbjj6px>
References: <20251005173812.1169436-1-rampxxxx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251005173812.1169436-1-rampxxxx@gmail.com>
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

Hello,

On Sun, Oct 05, 2025 at 07:38:12PM +0200, Javier Garcia wrote:
> This patch wraps the relevant code blocks with #ifdef CONFIG_FB_DEVICE,
> allowing the driver to be built and used even if CONFIG_FB_DEVICE is not =
selected.
>=20
> The sysfs only give access to show some controller and cursor registers so
> it's not needed to allow driver works correctly.
>=20
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>

I don't understand this patch. CONFIG_FB_DEVICE is about legacy /dev/fb*
stuff, and this patch make the creation of a sysfs file dependent on
that.

> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/f=
bdev/mb862xx/mb862xxfbdrv.c
> index ade88e7bc760..a691a5fefb25 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> @@ -530,6 +530,7 @@ static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_FB_DEVICE
>  /*
>   * show some display controller and cursor registers
>   */
> @@ -569,6 +570,7 @@ static ssize_t dispregs_show(struct device *dev,
>  }
> =20
>  static DEVICE_ATTR_RO(dispregs);
> +#endif
> =20
>  static irqreturn_t mb862xx_intr(int irq, void *dev_id)
>  {
> @@ -759,9 +761,11 @@ static int of_platform_mb862xx_probe(struct platform=
_device *ofdev)
> =20
>  	dev_set_drvdata(dev, info);
> =20
> +#ifdef CONFIG_FB_DEVICE
>  	if (device_create_file(dev, &dev_attr_dispregs))
>  		dev_err(dev, "Can't create sysfs regdump file\n");
>  	return 0;
> +#endif

That looks wrong. Without CONFIG_FB_DEVICE set the success return is
removed and all resources are freed essentially making the
CONFIG_FB_MB862XX_LIME part of the driver unusable.

>  rel_cmap:
>  	fb_dealloc_cmap(&info->cmap);
> @@ -801,7 +805,9 @@ static void of_platform_mb862xx_remove(struct platfor=
m_device *ofdev)
>  	free_irq(par->irq, (void *)par);
>  	irq_dispose_mapping(par->irq);
> =20
> +#ifdef CONFIG_FB_DEVICE
>  	device_remove_file(&ofdev->dev, &dev_attr_dispregs);
> +#endif
> =20
>  	unregister_framebuffer(fbi);
>  	fb_dealloc_cmap(&fbi->cmap);
> @@ -1101,8 +1107,10 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
> =20
>  	pci_set_drvdata(pdev, info);
> =20
> +#ifdef CONFIG_FB_DEVICE
>  	if (device_create_file(dev, &dev_attr_dispregs))
>  		dev_err(dev, "Can't create sysfs regdump file\n");
> +#endif
> =20
>  	if (par->type =3D=3D BT_CARMINE)
>  		outreg(ctrl, GC_CTRL_INT_MASK, GC_CARMINE_INT_EN);
> @@ -1151,7 +1159,9 @@ static void mb862xx_pci_remove(struct pci_dev *pdev)
> =20
>  	mb862xx_i2c_exit(par);
> =20
> +#ifdef CONFIG_FB_DEVICE
>  	device_remove_file(&pdev->dev, &dev_attr_dispregs);
> +#endif
> =20
>  	unregister_framebuffer(fbi);
>  	fb_dealloc_cmap(&fbi->cmap);

The amount of ifdefs could be greatly reduced using the following patch:

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbd=
ev/mb862xx/mb862xxfbdrv.c
index a691a5fefb25..3f79dfc27a53 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -530,7 +530,6 @@ static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
 	return 0;
 }
=20
-#ifdef CONFIG_FB_DEVICE
 /*
  * show some display controller and cursor registers
  */
@@ -570,7 +569,6 @@ static ssize_t dispregs_show(struct device *dev,
 }
=20
 static DEVICE_ATTR_RO(dispregs);
-#endif
=20
 static irqreturn_t mb862xx_intr(int irq, void *dev_id)
 {
@@ -761,11 +759,9 @@ static int of_platform_mb862xx_probe(struct platform_d=
evice *ofdev)
=20
 	dev_set_drvdata(dev, info);
=20
-#ifdef CONFIG_FB_DEVICE
-	if (device_create_file(dev, &dev_attr_dispregs))
+	if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_attr_dis=
pregs))
 		dev_err(dev, "Can't create sysfs regdump file\n");
 	return 0;
-#endif
=20
 rel_cmap:
 	fb_dealloc_cmap(&info->cmap);
@@ -805,9 +801,8 @@ static void of_platform_mb862xx_remove(struct platform_=
device *ofdev)
 	free_irq(par->irq, (void *)par);
 	irq_dispose_mapping(par->irq);
=20
-#ifdef CONFIG_FB_DEVICE
-	device_remove_file(&ofdev->dev, &dev_attr_dispregs);
-#endif
+	if (IS_ENABLED(CONFIG_FB_DEVICE))
+		device_remove_file(&ofdev->dev, &dev_attr_dispregs);
=20
 	unregister_framebuffer(fbi);
 	fb_dealloc_cmap(&fbi->cmap);
@@ -1107,10 +1102,8 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
=20
 	pci_set_drvdata(pdev, info);
=20
-#ifdef CONFIG_FB_DEVICE
-	if (device_create_file(dev, &dev_attr_dispregs))
+	if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_attr_dis=
pregs))
 		dev_err(dev, "Can't create sysfs regdump file\n");
-#endif
=20
 	if (par->type =3D=3D BT_CARMINE)
 		outreg(ctrl, GC_CTRL_INT_MASK, GC_CARMINE_INT_EN);
@@ -1159,9 +1152,8 @@ static void mb862xx_pci_remove(struct pci_dev *pdev)
=20
 	mb862xx_i2c_exit(par);
=20
-#ifdef CONFIG_FB_DEVICE
-	device_remove_file(&pdev->dev, &dev_attr_dispregs);
-#endif
+	if (IS_ENABLED(CONFIG_FB_DEVICE))
+		device_remove_file(&pdev->dev, &dev_attr_dispregs);
=20
 	unregister_framebuffer(fbi);
 	fb_dealloc_cmap(&fbi->cmap);

(It would still be questionable however to make the device file creation
dependent on FB_DEVICE.)

Best regards
Uwe
