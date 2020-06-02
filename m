Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35D1EBA5F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 13:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680D489950;
	Tue,  2 Jun 2020 11:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117989950
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 11:28:11 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id o2so1821995vsr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 04:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MrsaCGMsxTtIoOCqcMdZ4C1bTw37N0EwvD0GhGKPg5c=;
 b=SYFHd5CjZsRD9rFmDi8LwQKJOJTS7RfvhSKpKPMnELMZ8rVW0lpSB1QuuO2kjuIPsr
 oPvRfgssA3LmCl4WaderkbkKnWiKcJjswpuuTRuiAX+ucQEpf0taxKXhu94aqPzWour+
 d5JDDAS5T8tyERQplHTrPsXV9sLYbxIqVNaAhAqONeV+LQ8jgY5CDviWH7J5wSkK7Q8S
 MYLzmYMYavojrfKdN2LFWWg06yKrOUu73kC9yf/kxBKi33fT5Z2kycLNl+ihMS8p2A9O
 +xsmS3eng/+tmoFFnN3J4p+4jUf0wCIvqwJeIy5sbSPlxe0d+QWVUvX9kmnBdaRhli5X
 1vUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MrsaCGMsxTtIoOCqcMdZ4C1bTw37N0EwvD0GhGKPg5c=;
 b=pLSTjrJNAYKYsJE8cqHTmNp1xtgLxBk3juIKJOrefcLLUssdkH40xRTQE4tMy299dX
 fElTv193kQoKdegufoNpAlFW+uXQb5R1aJh/dJ3++AgOZfY2eXVafBQAOx2z80taQUTj
 yITKjyWLBTd+ejP6Be0+pHSU7Aa2vgvFiAK1u2/S/Po4eJ/QTUIirQwUPpw79L0Hom8a
 +w9/2iB9QAk545G/qOvwOp7UCubLQokUKuY9ZttkXyZbL7AnCHspJaHM1UwNdp80qy22
 9GCOmB8DXegfcsaymMqfuOGuNSzSWeDLlO8y1P5xR+o98EP/3yeWCfOwrEV5beWp9AMX
 6mxw==
X-Gm-Message-State: AOAM532EKfiBNLtIbKoB6EVY+KaNQvADTUy+SMAs6MmcBqaibUy2QpLe
 6Ech0eJFICgZNklnaPnqegJS3RoNDOe/KQH7K+E=
X-Google-Smtp-Source: ABdhPJxvkp0xKNancykWUqW+vOfVHn5HOQRf+uGXkTljBAdGL8i/zKpsdyfyx6meJ41TYU3KfR/jxJbBl9Y23HbGgLM=
X-Received: by 2002:a67:3291:: with SMTP id y139mr5489124vsy.37.1591097290771; 
 Tue, 02 Jun 2020 04:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
 <20200511115524.22602-3-Rodrigo.Siqueira@amd.com>
 <CACvgo53KfLkTg4UvT5E+afX+z4FjMcpdctD5=v32WJs6TS5s5g@mail.gmail.com>
In-Reply-To: <CACvgo53KfLkTg4UvT5E+afX+z4FjMcpdctD5=v32WJs6TS5s5g@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 12:24:53 +0100
Message-ID: <CACvgo50pYWM8DQuGjJwiZdO1vJvmg-XG08a+MYSWDmgVezN7Gw@mail.gmail.com>
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

On Tue, 12 May 2020 at 12:34, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi Rodrigo,
>
> On Mon, 11 May 2020 at 12:55, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:
> >
> > From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> >
> > The compute_crc() function is responsible for calculating the
> > framebuffer CRC value; due to the XRGB format, this function has to
> > ignore the alpha channel during the CRC computation. Therefore,
> > compute_crc() set zero to the alpha channel directly in the input
> > framebuffer, which is not a problem since this function receives a copy
> > of the original buffer. However, if we want to use this function in a
> > context without a buffer copy, it will change the initial value. This
> > patch makes compute_crc() calculate the CRC value without modifying the
> > input framebuffer.
> >
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c | 31 +++++++++++++++++-----------
> >  1 file changed, 19 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 258e659ecfba..686d25e7b01d 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -9,33 +9,40 @@
> >
> >  #include "vkms_drv.h"
> >
> > +static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> > +                                const struct vkms_composer *composer)
> > +{
> > +       int src_offset = composer->offset + (y * composer->pitch)
> > +                                         + (x * composer->cpp);
> > +
> > +       return *(u32 *)&buffer[src_offset];
> > +}
> > +
> >  /**
> >   * compute_crc - Compute CRC value on output frame
> >   *
> > - * @vaddr_out: address to final framebuffer
> > + * @vaddr: address to final framebuffer
> >   * @composer: framebuffer's metadata
> >   *
> >   * returns CRC value computed using crc32 on the visible portion of
> >   * the final framebuffer at vaddr_out
> >   */
> > -static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
> > +static uint32_t compute_crc(const u8 *vaddr,
> > +                           const struct vkms_composer *composer)
> >  {
> > -       int i, j, src_offset;
> > +       int x, y;
> >         int x_src = composer->src.x1 >> 16;
> >         int y_src = composer->src.y1 >> 16;
> >         int h_src = drm_rect_height(&composer->src) >> 16;
> >         int w_src = drm_rect_width(&composer->src) >> 16;
> > -       u32 crc = 0;
> > +       u32 crc = 0, pixel = 0;
> >
> > -       for (i = y_src; i < y_src + h_src; ++i) {
> > -               for (j = x_src; j < x_src + w_src; ++j) {
> > -                       src_offset = composer->offset
> > -                                    + (i * composer->pitch)
> > -                                    + (j * composer->cpp);
> > +       for (y = y_src; y < y_src + h_src; ++y) {
> > +               for (x = x_src; x < x_src + w_src; ++x) {
> >                         /* XRGB format ignores Alpha channel */
> > -                       memset(vaddr_out + src_offset + 24, 0,  8);
> > -                       crc = crc32_le(crc, vaddr_out + src_offset,
> > -                                      sizeof(u32));
> > +                       pixel = get_pixel_from_buffer(x, y, vaddr, composer);
> > +                       bitmap_clear((void *)&pixel, 0, 8);
> > +                       crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
> >                 }
> >         }
> >
> IMHO using something like the following makes the code far simpler and clearer.
>
> offset = composer->offset + (y_src * composer->pitch) + (x_src * composer->cpp);
>
> for (i = 0; i < h_src; i++, offset += composer->pitch) {
>    for (j = 0; j < w_src; j++, offset += composer->cpp) {
>       pixel = get_pixel_from_buffer(vaddr, offset);
>       crc = crc32_le(crc, &pixel, sizeof(u32); // cast should not be needed
>    }
> }
>
> With the bitmap_clear() and related comment moved into get_pixel_from_buffer().
>
If you fold the bitmap_clear() in get_pixel_from_buffer(), and drop
the cast (unless I'm missing something and it's really needed) for
crc32_le() this patch is:

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

I would suggest (but it's not a requirement) that you simplify the
loop/offset calculation as separate patch in v5.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
