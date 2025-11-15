Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB24C60114
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 08:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEEA10E049;
	Sat, 15 Nov 2025 07:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WdhqVeN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDF210E049
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 07:29:56 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b72bf7e703fso454666866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 23:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763191795; x=1763796595; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XCPqxsFa6KDnq/UuyZpBimWkGLy2aEdXnS+xKFhpcAE=;
 b=WdhqVeN50F7EETzr+ZiyORoON76M2UwViGJ0m/1PAMocLdDYnj3h9PmQmfPZEbr6wS
 ukeLmCzdJLQ3JJIQmYxiAfNBzyDOxdI0R9n59ZRDbuL/Yqm0d3EkH2VhiQgZ9IA06ooX
 7sKLcMfJ2qFpc2bNjYrs3aJ5rnXEeadxu4b9U8id2UjaHpJHGSQrG55jg4YqX0otznuE
 09lBiJ/PSmGKIJVcX6eHC7pMnVaCvm2o2hT532xplV5wjg8HrD+ZugQgUjmu33YEdp/q
 J2DATndEf72cfFMs2NjM2apBkSGfNSTdIa0ZNaEjSEldFA59awm7ChOExuL58B7+jy70
 VAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763191795; x=1763796595;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCPqxsFa6KDnq/UuyZpBimWkGLy2aEdXnS+xKFhpcAE=;
 b=rqT6nhsgKP1f3Siyy1d/Am+OXKqn3n7zuJy4tbKbLBc6LmzVFnssYSwnWuBeuMK65Y
 JrBZpmcyzHddz8EE9v54AgARdva0IrNG3Yy7EPHVWoP1aJymRP8Dvux8dTQ7dMsMr4fl
 MuThiLE/24cQMq/RokCMHLabc4fzzIbjyzQSSxgqv3vsPyf96layuicdRTnfnCr4ahnc
 49LOSXZQjztsU12A07l+X3O69y6AinpxQicLVaPB79IdZhLgq6BSDG9AEHovqTFGuej7
 UY97QLBvNw4pH/2EqtmT2o+PKHnywSTBkXwie6+4AcsOk/gywY6yD7JfPMYSrcVJY3Ns
 L3Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlr3dhaBNMSI4bGiw5wtaXPF1FV0uoJtGeHDko629MujgMAcJ2BvXq3DWm32czFfpYxG7YkiQcbsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPFdMIkXOJ0QrDYK06Fvupfe8RawLk0e+AiojLMGbnEaFv082N
 tj0+JSVRKqxqQusNKq3tFB4TsXLpdNl6Wl3IxvbIHMX3nBzKmwynIubcBopAb3eCUyNhWKwg7UX
 zZOzxjhji9Eo8u7tzqx1wP32CCcbw/7E=
X-Gm-Gg: ASbGncs1XzTp7UWgNKCEdLoJ8aNUBkBOhU71KcQIVQ+FW9A8kKkj6WJIqBtk3iIkgQy
 9k3b1rjbtn4PiRv5TAF/A0HKtcJUH8HrGNhBCRPhPtUT+ww8eaR6OV1YPUyht+GX4nTGtDSgODo
 wYK1bfO7Gj6siuDzCbhNYOjtbkcuqkz8/btyOFkmF4NImh3+725A6KGsztwdegL/1hLHkggdwq2
 /gfA8CO0Zeh0co+faLiWMlj+Sj3UHNjI/A5yyQqz7JNAL9AgPfoi42S6vGS7f7ySzx3Uutmn6Pu
 b9iVCKxkt8op1qDTIRh+18OP
X-Google-Smtp-Source: AGHT+IGFFlGriMdbkcAdxD5aaCkp09loEuvc59rIUdShi5eQS0NgZzUUo2H3BlPjMa7UMiDXEWxdnGVvOoc2N0htRpw=
X-Received: by 2002:a17:907:1b02:b0:b6d:552f:e400 with SMTP id
 a640c23a62f3a-b7367869cb4mr576169166b.3.1763191795022; Fri, 14 Nov 2025
 23:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20251110090446.2910998-1-rampxxxx@gmail.com>
In-Reply-To: <20251110090446.2910998-1-rampxxxx@gmail.com>
From: Javier Garcia <rampxxxx@gmail.com>
Date: Sat, 15 Nov 2025 08:29:43 +0100
X-Gm-Features: AWmQ_bnALRQasujF1SCDe3eociVFBy6ZIjVZttvGy2QuDowEndVcbLwZYJTKm2Y
Message-ID: <CABPJ0vj9+qWo54X6Rg19kCgdQSpKoP_69Byfj0bjGNXys9LoCQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev/vga16fb: Use dev_* fn's instead printk.
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi,

Helge Deller, any comment on this patch?

---

Javier Garcia

On Mon, 10 Nov 2025 at 10:04, Javier Garcia <rampxxxx@gmail.com> wrote:
>
> - Family dev_* fn's will show device name, giving extra info to logs.
> - Delete the prefix `vga16fb:` from msg strings, not needed now.
>
> [    1.037947] vga16fb vga-framebuffer.0: initializing
>
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>  drivers/video/fbdev/vga16fb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index 3b4c50d98ba6..432ba7c8164b 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1324,7 +1324,7 @@ static int vga16fb_probe(struct platform_device *dev)
>                 dev_err(&dev->dev, "vga16b: cannot reserve video memory at 0x%lx\n",
>                        vga16fb_fix.smem_start);
>         }
> -       printk(KERN_DEBUG "vga16fb: initializing\n");
> +       dev_dbg(&dev->dev, "initializing\n");
>         info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
>
>         if (!info) {
> @@ -1336,12 +1336,12 @@ static int vga16fb_probe(struct platform_device *dev)
>         info->screen_base = (void __iomem *)VGA_MAP_MEM(VGA_FB_PHYS_BASE, 0);
>
>         if (!info->screen_base) {
> -               printk(KERN_ERR "vga16fb: unable to map device\n");
> +               dev_err(&dev->dev, "unable to map device\n");
>                 ret = -ENOMEM;
>                 goto err_ioremap;
>         }
>
> -       printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base);
> +       dev_info(&dev->dev, "mapped to 0x%p\n", info->screen_base);
>         par = info->par;
>
>         par->isVGA = screen_info_video_type(si) == VIDEO_TYPE_VGAC;
> @@ -1369,13 +1369,13 @@ static int vga16fb_probe(struct platform_device *dev)
>         i = (info->var.bits_per_pixel == 8) ? 256 : 16;
>         ret = fb_alloc_cmap(&info->cmap, i, 0);
>         if (ret) {
> -               printk(KERN_ERR "vga16fb: unable to allocate colormap\n");
> +               dev_err(&dev->dev, "unable to allocate colormap\n");
>                 ret = -ENOMEM;
>                 goto err_alloc_cmap;
>         }
>
>         if (vga16fb_check_var(&info->var, info)) {
> -               printk(KERN_ERR "vga16fb: unable to validate variable\n");
> +               dev_err(&dev->dev, "unable to validate variable\n");
>                 ret = -EINVAL;
>                 goto err_check_var;
>         }
> @@ -1386,7 +1386,7 @@ static int vga16fb_probe(struct platform_device *dev)
>         if (ret)
>                 goto err_check_var;
>         if (register_framebuffer(info) < 0) {
> -               printk(KERN_ERR "vga16fb: unable to register framebuffer\n");
> +               dev_err(&dev->dev, "unable to register framebuffer\n");
>                 ret = -EINVAL;
>                 goto err_check_var;
>         }
> --
> 2.50.1
>
