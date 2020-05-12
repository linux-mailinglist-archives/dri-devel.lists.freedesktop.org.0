Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAE91CF372
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 13:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2636E8BE;
	Tue, 12 May 2020 11:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46FF6E8BE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 11:37:26 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id w188so3220706vkf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 04:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j3KKWLl8HkCXQ+MjcPLWxrbD4LKOdKANjNPpG/Ugus0=;
 b=Vbge21sbZsurEnSDxiksRTO9LZRl3h2o3BB6q1sAGyp/DOuqkK9GiqIwfc1pn2rKaQ
 +FOZP1b81+/JyMT6ifVCGu6OuMY8LeGnbZMahPjvjNxM8MiDlDifwD608MPe8WxX2RcB
 tEiqz96bDFDg0Hp/zaEQhF9th2wdMK/Dw15F4sxHzJVApsdZJP8RoHkvv2IJOmd54QWs
 DF6a8YPJC1TSjX/ZCfJVpcSSvVsW5ZniqxI3vPjuCEuakvdiRcbFRgJALcargyo7JKye
 E1z4azcfHOLWj19CKF53Dniupqfd0fYW3VRrKj9vEz91uXYLPR3j7bHxv1KYNEHIX8Qk
 MJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j3KKWLl8HkCXQ+MjcPLWxrbD4LKOdKANjNPpG/Ugus0=;
 b=T9bvuaJc88Vlfq62OQwg9Bd3nyczRc98N8WfgKVVeamlx7NeVMIA6bIrNc7PSk/C9W
 x8x7RTWfv7tBdAdlWfozIBLxYjZIggKLXkAzRfSBvvMS59AjgqMQZ67GuMPr+qLRcnWq
 cgjtE9ikpMQyW/VBaTUsqux5VrftMG/keQQsBIOOYgI1slR2KfKEfStczdagA601fzPk
 h8+JM9eIcq5FgYve7HPe+ZKa1j6tfzuHW7s0UpbeCVDI5i+fAEGHLtykz4WLLwVYczCT
 Hq1T4qyTIrDYF1U6YGFkshkJv3rgIcMOHVYW5DhHbKdArekUUyJPvUWD1CpcOlMzUHOW
 uIoQ==
X-Gm-Message-State: AGi0PuYPIykfMGERA4H9JIkl9AlOMfzyYs8Gu+4LMUE2wq8LjfX1vEPS
 etXS0Fibyw28ZZ1T8pctYQn4Yg93BXcn2lNjtms=
X-Google-Smtp-Source: APiQypIQM2/qGTsyEbGNVjZeO6kaUSKCSi0gcRXR6wsSfcpJVHlkk5f8mQh/QXyXnkH5Y0GCjhYJfKkFAWpoM6ISnAE=
X-Received: by 2002:a1f:2f91:: with SMTP id v139mr15017877vkv.22.1589283445902; 
 Tue, 12 May 2020 04:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
 <20200511115524.22602-3-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20200511115524.22602-3-Rodrigo.Siqueira@amd.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 May 2020 12:34:47 +0100
Message-ID: <CACvgo53KfLkTg4UvT5E+afX+z4FjMcpdctD5=v32WJs6TS5s5g@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] drm/vkms: Compute CRC without change input data
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Helen Koike <helen.koike@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On Mon, 11 May 2020 at 12:55, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:
>
> From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>
> The compute_crc() function is responsible for calculating the
> framebuffer CRC value; due to the XRGB format, this function has to
> ignore the alpha channel during the CRC computation. Therefore,
> compute_crc() set zero to the alpha channel directly in the input
> framebuffer, which is not a problem since this function receives a copy
> of the original buffer. However, if we want to use this function in a
> context without a buffer copy, it will change the initial value. This
> patch makes compute_crc() calculate the CRC value without modifying the
> input framebuffer.
>
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 31 +++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 258e659ecfba..686d25e7b01d 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -9,33 +9,40 @@
>
>  #include "vkms_drv.h"
>
> +static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> +                                const struct vkms_composer *composer)
> +{
> +       int src_offset = composer->offset + (y * composer->pitch)
> +                                         + (x * composer->cpp);
> +
> +       return *(u32 *)&buffer[src_offset];
> +}
> +
>  /**
>   * compute_crc - Compute CRC value on output frame
>   *
> - * @vaddr_out: address to final framebuffer
> + * @vaddr: address to final framebuffer
>   * @composer: framebuffer's metadata
>   *
>   * returns CRC value computed using crc32 on the visible portion of
>   * the final framebuffer at vaddr_out
>   */
> -static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
> +static uint32_t compute_crc(const u8 *vaddr,
> +                           const struct vkms_composer *composer)
>  {
> -       int i, j, src_offset;
> +       int x, y;
>         int x_src = composer->src.x1 >> 16;
>         int y_src = composer->src.y1 >> 16;
>         int h_src = drm_rect_height(&composer->src) >> 16;
>         int w_src = drm_rect_width(&composer->src) >> 16;
> -       u32 crc = 0;
> +       u32 crc = 0, pixel = 0;
>
> -       for (i = y_src; i < y_src + h_src; ++i) {
> -               for (j = x_src; j < x_src + w_src; ++j) {
> -                       src_offset = composer->offset
> -                                    + (i * composer->pitch)
> -                                    + (j * composer->cpp);
> +       for (y = y_src; y < y_src + h_src; ++y) {
> +               for (x = x_src; x < x_src + w_src; ++x) {
>                         /* XRGB format ignores Alpha channel */
> -                       memset(vaddr_out + src_offset + 24, 0,  8);
> -                       crc = crc32_le(crc, vaddr_out + src_offset,
> -                                      sizeof(u32));
> +                       pixel = get_pixel_from_buffer(x, y, vaddr, composer);
> +                       bitmap_clear((void *)&pixel, 0, 8);
> +                       crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
>                 }
>         }
>
IMHO using something like the following makes the code far simpler and clearer.

offset = composer->offset + (y_src * composer->pitch) + (x_src * composer->cpp);

for (i = 0; i < h_src; i++, offset += composer->pitch) {
   for (j = 0; j < w_src; j++, offset += composer->cpp) {
      pixel = get_pixel_from_buffer(vaddr, offset);
      crc = crc32_le(crc, &pixel, sizeof(u32); // cast should not be needed
   }
}

With the bitmap_clear() and related comment moved into get_pixel_from_buffer().

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
