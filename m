Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792721BEECA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 05:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B9A6E165;
	Thu, 30 Apr 2020 03:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9AA6E125;
 Thu, 30 Apr 2020 03:58:42 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id l5so2473105ybf.5;
 Wed, 29 Apr 2020 20:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FIwWvB1bcjrgfWAykQ5flP8M3l3Y++aqvhNqkjaW3S0=;
 b=UV5kIo0TX3CL2ps98HTMoWP2CHG35rrpWPzCa2GHvD4ZHX0OROJ+ZjBaoaQ03y2wfE
 ICe259ObbpcaEUu36lI9FuwzwFuVVkbL+AuQVVaeCubRw0OGxf6acQJ2+nD0TjKLr2n7
 Y+T10Oyh7V7GrEG5fKI7fGvHkI+eJrcmjpUg4xGXlbTN9CDCOw3/Jw6mKQiagFzCaBN8
 Rpk3VMXlOK4uZuj4N6d1RQSsHjaUt/Imi3vC3hSBMlojJJgjQQCSBcKXeFPfcvNSxIva
 P0FklL5JIkB6IhEZNE+XfaA8yiyATrbEqZzPhqp/vIy2u2PGTq8JJTNn9yay5+aL3ksm
 9JLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FIwWvB1bcjrgfWAykQ5flP8M3l3Y++aqvhNqkjaW3S0=;
 b=CvRW+tnMNXhS13ILd3OlwVMaF/1mPi80zeIK9+UmdRJ1yzbVjXBLltBOgKbE/b50gg
 327Or6ERwlNKD3zCtwrH1EJmD7OZv1gfJO56AVjv8eVuFq9cLdpMBVnDlWmX2YkCw6LU
 cD4tgL8iSP1vdFkWLdl06/nDoOqTYi5h5X9aP+fy7IchWyrDjyk+PLYbax0GEQXcOk3R
 a2KKs6obTCHY5z1DI+GNye/wItsur4ix5SuyKWNA1YxdKM9vFT4zNqxqf0VstoOEHN+C
 zvMceUGM1TaztnckA4SaURI0ZXqAjW/ycxeh2np6gSKN04Onk2Z5ivsdK0Sk0BETM24Z
 xjRg==
X-Gm-Message-State: AGi0PubuNQpUkSHpQ/do69PBbmwUTU66S2P0V3fnt/+jiEejMiJXm1Af
 02QkOKQYuJLSmR3zCtAU7qruUL/R2rooi/9Ptrw=
X-Google-Smtp-Source: APiQypIAwfcTkBjD11IKPHp/L8eLblpfs6T06DURXindp+KMXfmopDU1wbJDpZp657G9gL+SloE/f2+ROCQSt7U6bVU=
X-Received: by 2002:a25:12c1:: with SMTP id 184mr2644186ybs.162.1588219121198; 
 Wed, 29 Apr 2020 20:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <1587472651-105308-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1587472651-105308-1-git-send-email-zou_wei@huawei.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 30 Apr 2020 13:58:30 +1000
Message-ID: <CACAvsv5qXhLkspF0==z36xY1R1Uv=-XUHEwnH52GDurivbF5Tw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/nouveau/acr: Use kmemdup instead of kmalloc and
 memcpy
To: Zou Wei <zou_wei@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks!

On Wed, 22 Apr 2020 at 16:56, Zou Wei <zou_wei@huawei.com> wrote:
>
> Fixes coccicheck warning:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c:103:23-30: WARNING opportunity for kmemdup
> drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c:113:22-29: WARNING opportunity for kmemdup
>
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> index aecce2d..667fa01 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> @@ -100,25 +100,21 @@ nvkm_acr_hsfw_load_image(struct nvkm_acr *acr, const char *name, int ver,
>         hsfw->data_size = lhdr->data_size;
>
>         hsfw->sig.prod.size = fwhdr->sig_prod_size;
> -       hsfw->sig.prod.data = kmalloc(hsfw->sig.prod.size, GFP_KERNEL);
> +       hsfw->sig.prod.data = kmemdup(fw->data + fwhdr->sig_prod_offset + sig,
> +                                     hsfw->sig.prod.size, GFP_KERNEL);
>         if (!hsfw->sig.prod.data) {
>                 ret = -ENOMEM;
>                 goto done;
>         }
>
> -       memcpy(hsfw->sig.prod.data, fw->data + fwhdr->sig_prod_offset + sig,
> -              hsfw->sig.prod.size);
> -
>         hsfw->sig.dbg.size = fwhdr->sig_dbg_size;
> -       hsfw->sig.dbg.data = kmalloc(hsfw->sig.dbg.size, GFP_KERNEL);
> +       hsfw->sig.dbg.data = kmemdup(fw->data + fwhdr->sig_dbg_offset + sig,
> +                                    hsfw->sig.dbg.size, GFP_KERNEL);
>         if (!hsfw->sig.dbg.data) {
>                 ret = -ENOMEM;
>                 goto done;
>         }
>
> -       memcpy(hsfw->sig.dbg.data, fw->data + fwhdr->sig_dbg_offset + sig,
> -              hsfw->sig.dbg.size);
> -
>         hsfw->sig.patch_loc = loc;
>  done:
>         nvkm_firmware_put(fw);
> --
> 2.6.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
