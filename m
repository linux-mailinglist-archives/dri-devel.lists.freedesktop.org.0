Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC57E89DD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F014710E257;
	Sat, 11 Nov 2023 08:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4A410E257
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:31:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507b9408c61so3810102e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 00:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699691483; x=1700296283; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CnzMPSuSkDs43Z3P5R9j6n7+bWlsIBEP8r17ky0zTro=;
 b=XmIDZ3vjsrQwE7emyGAoA4QeDiCqz/lAnFVm3Mg2nxq1S2goc4IvvuSK2UdnoIb1kW
 RrxyBCdcB2Wea7mw2mW8LCOml+fIb1JUb2qUWbk4wv7CCAr33edtgCgwd1lPNT8lXnpo
 6RxWBidD0ZZYbwNcaoDPJWF3YT0vgL2qzuUn3BX3JG1yHCow9H0R+vgM+sR/0UZgCYp9
 v9DNg35VxB0P6nh8GLGD+e2Xb/mOGV7OkgAcD/i1lJZZPLQYa+Di1jrzY4s2K5i/w0CD
 vACDFHMbVSS4kW5WEY+OsCJyCYM0jKDgJ/2o06ddyNcpLzHdoW2LkJMEVN4rUKr2Zpao
 XI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699691483; x=1700296283;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CnzMPSuSkDs43Z3P5R9j6n7+bWlsIBEP8r17ky0zTro=;
 b=at8OckWuriBQSrYI2RjguICjX4I+0G9sgI0eDeKAgASlCnepwP6ajp2KwhOEmll6eB
 EbJwrFuP19/XYCJ9VBaliH7UfFul4A4vxN6zVr51M9U2I6UzDo0gahFPPanS5pVAVjGh
 d1yW0ffpBAREy3UjxobrL3LRlxmxuO+GWz1vev6l7NXL0/V6KXaK5k64B/nWaUUh6WyI
 +U7zqWZnNbbtGvLKtTFv4mXFk3a3TXM37Q0Vv1nepxOLp6OYCK8Wj7vxRL9ckpLhsPvL
 iSfTqzJ9tC9dG5On554gwdjZH4cOBk29C1vuyRDYKGnbaddYfxAnvnVQ9+680dBeCk18
 0CjQ==
X-Gm-Message-State: AOJu0Yz0qvEJ6FIkIDa5jsFiSxU0PEMuZo2eZygwD3SRskPXmbD1Lgy2
 nFjbavMt9xP7qEd2sDNixePHYWrC+l7yYBksoXA=
X-Google-Smtp-Source: AGHT+IELK3Jp5o8QXO7eI93fMAFpbKC2f3FagLHhgYb/6DMOHmsvKBQnhpOM1YShIk5J/joBlvbrofzWhq+QJPHovzY=
X-Received: by 2002:a19:3809:0:b0:50a:6375:d5f1 with SMTP id
 f9-20020a193809000000b0050a6375d5f1mr804587lfa.60.1699691483119; Sat, 11 Nov
 2023 00:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20231111042926.52990-1-amworsley@gmail.com>
 <20231111042926.52990-2-amworsley@gmail.com>
In-Reply-To: <20231111042926.52990-2-amworsley@gmail.com>
From: Andrew Worsley <amworsley@gmail.com>
Date: Sat, 11 Nov 2023 19:31:11 +1100
Message-ID: <CA+Y=x3mF4jFX7PiJQ-1Gk9zyBE1mwZaF_GLYjSspT+mxtMn4GQ@mail.gmail.com>
Subject: Re: [PATCH] Fix failure of simpledrm probe when trying to grab FB
 from the EFI-based Framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
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

It's inline - part of the email - not an attachment?

I can see it in the copy that went to me...

Andrew

On Sat, 11 Nov 2023 at 15:30, Andrew Worsley <amworsley@gmail.com> wrote:
>
>    The simpledrm.c does not call aperture_remove_conflicting_devices() in it's probe
>    function as the drivers/video/aperture.c documentation says it should. Consequently
>    it's request for the FB memory fails.
>
> ...
> [    3.085302] simple-framebuffer bd58dc000.framebuffer: [drm] *ERROR* could not acquire memory range [??? 0xffff6e1d8629d580-0x2a5000001a7 flags 0x0]: -16
> [    3.086433] simple-framebuffer: probe of bd58dc000.framebuffer failed with error -16
> ...
>
>    In my case no driver provided /dev/dri/card0 device is available on boot up and X
>    fails to start as per this from X start up log.
>
> ...
> [     5.616] (WW) Falling back to old probe method for modesetting
> [     5.616] (EE) open /dev/dri/card0: No such file or directory
> ...
>
>    Fault confirmed and fixed on Asahi 6.5.0 kernel with both CONFIG_FB_EFI and
>    CONFIG_DRM_SIMPLEDRM config options set.
>
> Signed-off-by: Andrew Worsley <amworsley@gmail.com>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 5fefc895bca2..e55a536b04cf 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -8,6 +8,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/aperture.h>
>
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic.h>
> @@ -828,6 +829,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>         if (mem) {
>                 void *screen_base;
>
> +               ret = aperture_remove_conflicting_devices(mem->start, resource_size(mem),
> +                       DRIVER_NAME);
> +               if (ret) {
> +                       drm_err(dev, "aperture_remove_conflicting_devices: failed:%d\n",
> +                           __func__, ret);
> +                       return ERR_PTR(ret);
> +               }
>                 ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
>                 if (ret) {
>                         drm_err(dev, "could not acquire memory range %pr: %d\n", mem, ret);
> @@ -848,6 +856,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>                 if (!res)
>                         return ERR_PTR(-EINVAL);
>
> +               ret = aperture_remove_conflicting_devices(res->start, resource_size(res),
> +                       DRIVER_NAME);
> +               if (ret) {
> +                       drm_err(dev, "aperture_remove_conflicting_devices: failed:%d\n",
> +                           __func__, ret);
> +                       return ERR_PTR(ret);
> +               }
>                 ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
>                 if (ret) {
>                         drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
> --
> 2.42.0
>
