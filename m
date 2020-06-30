Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D420EB81
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 04:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDEE89B70;
	Tue, 30 Jun 2020 02:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB0389B70
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 02:36:36 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC9322078B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 02:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593484596;
 bh=qOIMy7rJIRnjoozGpQRic6cjlBy36w0n3lS34lGblQY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ju6ik0FR3gQljqgChGe1BiQA9jW0ZY62wPZ1LSWSyu6PcMfyiVEzzAF3cUGN+Mfl7
 FtnT5ozWqYeqjLkGes9ayJ6OiBqydCSKV0XET4uE2zjgsqUdyBz6iAJdnJ1Y3MwXY9
 v6aZANv9zQxAPQEyzj5BZHXkkL4ayGsW0B1X8udY=
Received: by mail-ot1-f46.google.com with SMTP id 76so2835862otu.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 19:36:36 -0700 (PDT)
X-Gm-Message-State: AOAM532v4ZWKAlBPW+Z8WphOp0yHf1ghNWAF6wDJfOcA38VTq1j3xhkW
 Cxwft8UcoRlT6mjswmYXmTe3u2jleOrP9P6c3w==
X-Google-Smtp-Source: ABdhPJzyrChMvrjS4uoXXTUy/4hkMrTTfU6uXs+s1bFThmfjFsbSO5UGPc0UWUFBgPSBr0FJFnE2a47XBsO0KFuXvis=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr16187909ots.192.1593484596042; 
 Mon, 29 Jun 2020 19:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-6-tzimmermann@suse.de>
In-Reply-To: <20200625120011.16168-6-tzimmermann@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Jun 2020 20:36:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJoQKt7XXinxu7OMwjTBz=wbbtMMKAeuXWTYpS_fA=acw@mail.gmail.com>
Message-ID: <CAL_JsqJoQKt7XXinxu7OMwjTBz=wbbtMMKAeuXWTYpS_fA=acw@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/simplekms: Initialize framebuffer data from
 device-tree node
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 6:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> A firmware framebuffer might also be specified via device-tree files. If
> no device platform data is given, try the DT device node.

You are missing a DT match table for driver matching and module
loading (if a module is supported).

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simplekms.c | 84 ++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/simplekms.c b/drivers/gpu/drm/tiny/simplekms.c
> index ac2ebfcedd22..87636307aa4f 100644
> --- a/drivers/gpu/drm/tiny/simplekms.c
> +++ b/drivers/gpu/drm/tiny/simplekms.c
> @@ -113,6 +113,76 @@ simplefb_get_format_pd(struct drm_device *dev,
>         return simplefb_get_validated_format(dev, pd->format);
>  }
>
> +static int
> +simplefb_read_u32_of(struct drm_device *dev, struct device_node *of_node,
> +                    const char* name, u32 *value)
> +{
> +       int ret = of_property_read_u32(of_node, name, value);
> +       if (ret)
> +               drm_err(dev, "simplefb: can't parse framebuffer %s: error %d\n",
> +                       name, ret);
> +       return ret;
> +}
> +
> +static int
> +simplefb_read_string_of(struct drm_device *dev, struct device_node *of_node,
> +                       const char* name, const char **value)
> +{
> +       int ret = of_property_read_string(of_node, name, value);
> +       if (ret)
> +               drm_err(dev, "simplefb: can't parse framebuffer %s: error %d\n",
> +                       name, ret);
> +       return ret;
> +}
> +
> +static int
> +simplefb_get_width_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +       int ret;
> +       u32 width;
> +
> +       ret = simplefb_read_u32_of(dev, of_node, "width", &width);
> +       if (ret)
> +               return ret;
> +       return simplefb_get_validated_int0(dev, "width", width);
> +}
> +
> +static int
> +simplefb_get_height_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +       int ret;
> +       u32 height;
> +
> +       ret = simplefb_read_u32_of(dev, of_node, "height", &height);
> +       if (ret)
> +               return ret;
> +       return simplefb_get_validated_int0(dev, "height", height);
> +}
> +
> +static int
> +simplefb_get_stride_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +       int ret;
> +       u32 stride;
> +
> +       ret = simplefb_read_u32_of(dev, of_node, "stride", &stride);
> +       if (ret)
> +               return ret;
> +       return simplefb_get_validated_int(dev, "stride", stride);
> +}
> +
> +static const struct drm_format_info *
> +simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +       int ret;
> +       const char *format;
> +
> +       ret = simplefb_read_string_of(dev, of_node, "format", &format);
> +       if (ret)
> +               return ERR_PTR(ret);
> +       return simplefb_get_validated_format(dev, format);
> +}
> +
>  /*
>   * Simple Framebuffer device
>   */
> @@ -163,6 +233,7 @@ static int simplekms_device_init_fb(struct simplekms_device *sdev)
>         struct drm_device *dev = &sdev->dev;
>         struct platform_device *pdev = sdev->pdev;
>         const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
> +       struct device_node *of_node = pdev->dev.of_node;
>
>         if (pd) {
>                 width = simplefb_get_width_pd(dev, pd);
> @@ -177,6 +248,19 @@ static int simplekms_device_init_fb(struct simplekms_device *sdev)
>                 format = simplefb_get_format_pd(dev, pd);
>                 if (IS_ERR(format))
>                         return PTR_ERR(format);
> +       } else if (of_node) {
> +               width = simplefb_get_width_of(dev, of_node);
> +               if (width < 0)
> +                       return width;
> +               height = simplefb_get_height_of(dev, of_node);
> +               if (height < 0)
> +                       return height;
> +               stride = simplefb_get_stride_of(dev, of_node);
> +               if (stride < 0)
> +                       return stride;
> +               format = simplefb_get_format_of(dev, of_node);
> +               if (IS_ERR(format))
> +                       return PTR_ERR(format);
>         } else {
>                 drm_err(dev, "no simplefb configuration found\n");
>                 return -ENODEV;
> --
> 2.27.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
