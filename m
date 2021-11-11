Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6944D421
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 10:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBC9897BC;
	Thu, 11 Nov 2021 09:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1275589D66
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:33:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k37so12775861lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 01:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=T2JXf7BEwwvvs6+hhjbcnLHYZzbxm6qKxWeDaXuFa3k=;
 b=e9o4oc/QHvP+8TqODGp8Nv2PjsG36SHExy9IXgAJQLevaRAth8Zcy9gGx6FMxo+Bnq
 smzF+mJ5s/rghKgulF8f3QdkTra3VFdUq9awbBOQ8+WoEVNZoXQmcZ4VQ0LRFocPu/VA
 wKJxdobTR1H6k5ygW1YIy18wJqZEsZhY+kPMEUwTfXm7dvw3U0+ebcuJH7lumoqFa66b
 1AS72XwuVNDP5duibaIl+qQ9XZqeKVYk6Oay9KCCmUHNCtUQQhXasTB8RQ1elKMOFs5D
 q8SjrguJUuru5/FxOTrB3zXJRCWmdWWzNdHMwWCTOHO+wb0LGOdblDrQ5fakXZHWuxRE
 zmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=T2JXf7BEwwvvs6+hhjbcnLHYZzbxm6qKxWeDaXuFa3k=;
 b=Zoe1BJsDlFxtx4BO9tFE63kemWQHFcJZDVJuQhk4Bff566oUW1djRQ1cLB+IaYMD3i
 aHRu9eQwO2GCV7lI3shLNkMgKKD2QMtiyq1qwsrCNvMTMuBkXSmvI7udStpiWjK3BK9p
 R87psJ/t+ZZ8IGhGNr4tnjdTU2l+rWs9sZB5EEg2vz9URAPkm2SiEYf0RgoUPfPsHcju
 MexSBiM4A4nh6mPlVTWiRQy1d65rTI4f4TqV0BAhBqowkijzQaajr2UROgEj+MlFIaHd
 Ewixu2FMBfODD6oJF1XSSYfvMNVPxF+eZrcBZdUBP1KQlqhKcBn/Zl7IKy/z5/YyeFF3
 97Dw==
X-Gm-Message-State: AOAM5307NIMe0869mcoLqnmButrT4B2sKVtRNyfJ6BI1/Lg2BS5SCmY1
 5FJlT/4mx7MTuryNpFrQx9Y=
X-Google-Smtp-Source: ABdhPJxsnkd4ZZC6C9n7juYYRpr2IDUBlbz60NXTy1VUIfHtwwpsJLP+sIp5lEBw9MMqommRPrmiTw==
X-Received: by 2002:a19:d61a:: with SMTP id n26mr5484901lfg.313.1636623221697; 
 Thu, 11 Nov 2021 01:33:41 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f20sm236719lfm.161.2021.11.11.01.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 01:33:41 -0800 (PST)
Date: Thu, 11 Nov 2021 11:33:37 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v2 6/8] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20211111113337.0fd68f75@eldfell>
In-Reply-To: <CAOA8r4FHpmu0ZPjTj+qM0rV5jyQ2vt467uX1vhnqUbmBUMm3dA@mail.gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-7-igormtorrente@gmail.com>
 <20211109134017.09e71c77@eldfell>
 <CAOA8r4FHpmu0ZPjTj+qM0rV5jyQ2vt467uX1vhnqUbmBUMm3dA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BaAui.6dyvYOSIUvl0h1syW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: hamohammed.sa@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/BaAui.6dyvYOSIUvl0h1syW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Nov 2021 13:56:54 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> On Tue, Nov 9, 2021 at 8:40 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > Hi Igor,
> >
> > again, that is a really nice speed-up. Unfortunately, I find the code
> > rather messy and hard to follow. I hope my comments below help with
> > re-designing it to be easier to understand.
> >
> >
> > On Tue, 26 Oct 2021 08:34:06 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> > =20
> > > Currently the blend function only accepts XRGB_8888 and ARGB_8888
> > > as a color input.
> > >
> > > This patch refactors all the functions related to the plane compositi=
on
> > > to overcome this limitation.
> > >
> > > Now the blend function receives a struct `vkms_pixel_composition_func=
tions`
> > > containing two handlers.
> > >
> > > One will generate a buffer of each line of the frame with the pixels
> > > converted to ARGB16161616. And the other will take this line buffer,
> > > do some computation on it, and store the pixels in the destination.
> > >
> > > Both the handlers have the same signature. They receive a pointer to
> > > the pixels that will be processed(`pixels_addr`), the number of pixels
> > > that will be treated(`length`), and the intermediate buffer of the si=
ze
> > > of a frame line (`line_buffer`).
> > >
> > > The first function has been totally described previously. =20
> >
> > What does this sentence mean? =20
>=20
> In the sentence "One will generate...", I give an overview of the two typ=
es of
> handlers. And the overview of the first handler describes the full behavi=
or of
> it.
>=20
> But it doesn't look clear enough, I will improve it in the future.
>=20
> > =20
> > >
> > > The second is more interesting, as it has to perform two roles depend=
ing
> > > on where it is called in the code.
> > >
> > > The first is to convert(if necessary) the data received in the
> > > `line_buffer` and write in the memory pointed by `pixels_addr`.
> > >
> > > The second role is to perform the `alpha_blend`. So, it takes the pix=
els
> > > in the `line_buffer` and `pixels_addr`, executes the blend, and stores
> > > the result back to the `pixels_addr`.
> > >
> > > The per-line implementation was chosen for performance reasons.
> > > The per-pixel functions were having performance issues due to indirect
> > > function call overhead.
> > >
> > > The per-line code trades off memory for execution time. The `line_buf=
fer`
> > > allows us to diminish the number of function calls.
> > >
> > > Results in the IGT test `kms_cursor_crc`:
> > >
> > > |                     Frametime                       |
> > > |:---------------:|:---------:|:----------:|:--------:|
> > > |  implmentation  |  Current  |  Per-pixel | Per-line |
> > > | frametime range |  8~22 ms  |  32~56 ms  |  6~19 ms |
> > > |     Average     |  10.0 ms  |   35.8 ms  |  8.6 ms  |
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> > > ---
> > > V2: Improves the performance drastically, by perfoming the operations
> > >     per-line and not per-pixel(Pekka Paalanen).
> > >     Minor improvements(Pekka Paalanen).
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_composer.c | 321 ++++++++++++++++---------=
--
> > >  drivers/gpu/drm/vkms/vkms_formats.h  | 155 +++++++++++++
> > >  2 files changed, 342 insertions(+), 134 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
> > >
> > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/v=
kms/vkms_composer.c
> > > index 383ca657ddf7..69fe3a89bdc9 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > @@ -9,18 +9,26 @@
> > >  #include <drm/drm_vblank.h>
> > >
> > >  #include "vkms_drv.h"
> > > -
> > > -static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> > > -                              const struct vkms_composer *composer)
> > > -{
> > > -     u32 pixel;
> > > -     int src_offset =3D composer->offset + (y * composer->pitch)
> > > -                                   + (x * composer->cpp);
> > > -
> > > -     pixel =3D *(u32 *)&buffer[src_offset];
> > > -
> > > -     return pixel;
> > > -}
> > > +#include "vkms_formats.h"
> > > +
> > > +#define get_output_vkms_composer(buffer_pointer, composer)          =
 \
> > > +     ((struct vkms_composer) {                                      =
 \
> > > +             .fb =3D &(struct drm_framebuffer) {                    =
   \
> > > +                     .format =3D &(struct drm_format_info) {        =
   \
> > > +                             .format =3D DRM_FORMAT_ARGB16161616,   =
   \
> > > +                     },                                             =
 \ =20
> >
> > Is that really how one can initialize a drm_format_info? Does that
> > struct not have a lot more fields? Shouldn't you call a function to
> > look up the proper struct with all fields populated? =20
>=20
> I did this macro to just fill the necessary fields, and add more of them
> as necessary.
>=20
> I was implementing something very similar to the algorithm that
> you described below. So this macro will not exist in the next version.
>=20
> > =20
> > > +             },                                                     =
 \
> > > +             .map[0].vaddr =3D (buffer_pointer),                    =
   \
> > > +             .src =3D (composer)->src,                              =
   \
> > > +             .dst =3D (composer)->dst,                              =
   \
> > > +             .cpp =3D sizeof(u64),                                  =
   \
> > > +             .pitch =3D drm_rect_width(&(composer)->dst) * sizeof(u6=
4) \
> > > +     }) =20
> >
> > Why is this a macro rather than a function? =20
>=20
> I don't have a good answer for that. I'm just more used to these kinds of
> initializations using macro instead of function.
>=20
> > =20
> > > +
> > > +struct vkms_pixel_composition_functions {
> > > +     void (*get_src_line)(void *pixels_addr, int length, u64 *line_b=
uffer);
> > > +     void (*set_output_line)(void *pixels_addr, int length, u64 *lin=
e_buffer); =20
> >
> > I would be a little more comfortable if instead of u64 *line_buffer you
> > would have something like
> >
> > struct line_buffer {
> >         u16 *row;
> >         size_t nelem;
> > }
> >
> > so that the functions to be plugged into these function pointers could
> > assert that you do not accidentally overflow the array (which would
> > imply a code bug in kernel).
> >
> > One could perhaps go even for:
> >
> > struct line_pixel {
> >         u16 r, g, b, a;
> > };
> >
> > struct line_buffer {
> >         struct line_pixel *row;
> >         size_t npixels;
> > }; =20
>=20
> If we decide to follow this representation, would it be possible
> to calculate the crc in the similar way that is being done currently?
>=20
> Something like that:
>=20
> crc =3D crc32_le(crc, line_buffer.row, w * sizeof(line_pixel));

Hi Igor,

yes. I think the CRC calculated does not need to be reproducible in
userspace, so you can very well compute it from the internal
intermediate representation. It also does not need to be portable
between architectures, AFAIU.

> I mean, If the compiler can decide to put a padding somewhere, it
> would mess with the crc value. Right?

Padding could mess it up, yes. However, I think in kernel it is a
convention to define structs (especially UAPI structs but this is not
one) such that there is no implicit padding. So there must be some
recommended practises on how to achieve and ensure that.

The size of struct line_pixel as defined above is 8 bytes which is a
"very round" number, and every field has the same type, so there won't
be gaps between fields either. So I think the struct should already be
fine and have no padding, but how to make sure it is, I'm not sure what
you would do in kernel land.

In userspace I would put a static assert to ensure that
sizeof(struct line_pixel) =3D 8. That would be enough, because sizeof
counts not just internal implicit padding but also the needed size
extension for alignment in an array of those. The accumulated size of
the fields individually is 8 bytes, so if the struct size is 8, there
cannot be padding.

> >
> > Because as I mention further down, there is no need for the line buffer
> > to use an existing DRM pixel format at all.
> > =20
>=20
> All this is fine for me. I will change that to the next patch version.
>=20
> > > +};
> > >
> > >  /**
> > >   * compute_crc - Compute CRC value on output frame
> > > @@ -31,179 +39,222 @@ static u32 get_pixel_from_buffer(int x, int y, =
const u8 *buffer,
> > >   * returns CRC value computed using crc32 on the visible portion of
> > >   * the final framebuffer at vaddr_out
> > >   */
> > > -static uint32_t compute_crc(const u8 *vaddr,
> > > +static uint32_t compute_crc(const __le64 *vaddr,
> > >                           const struct vkms_composer *composer)
> > >  {
> > > -     int x, y;
> > > -     u32 crc =3D 0, pixel =3D 0;
> > > -     int x_src =3D composer->src.x1 >> 16;
> > > -     int y_src =3D composer->src.y1 >> 16;
> > > -     int h_src =3D drm_rect_height(&composer->src) >> 16;
> > > -     int w_src =3D drm_rect_width(&composer->src) >> 16;
> > > -
> > > -     for (y =3D y_src; y < y_src + h_src; ++y) {
> > > -             for (x =3D x_src; x < x_src + w_src; ++x) {
> > > -                     pixel =3D get_pixel_from_buffer(x, y, vaddr, co=
mposer);
> > > -                     crc =3D crc32_le(crc, (void *)&pixel, sizeof(u3=
2));
> > > -             }
> > > -     }
> > > +     int h =3D drm_rect_height(&composer->dst);
> > > +     int w =3D drm_rect_width(&composer->dst);
> > >
> > > -     return crc;
> > > +     return crc32_le(0, (void *)vaddr, w * h * sizeof(u64));
> > >  }
> > >
> > > -static u8 blend_channel(u8 src, u8 dst, u8 alpha)
> > > +static __le16 blend_channel(u16 src, u16 dst, u16 alpha) =20
> >
> > This function is doing the OVER operation (Porter-Duff classification)
> > assuming pre-multiplied alpha. I think the function name should reflect
> > that. At the very least it should somehow note pre-multiplied alpha,
> > because KMS property "pixel blend mode" can change that. =20
>=20
> The closest that it has is a comment in the alpha_blend function.
>=20
> But, aside from that, `pre_mul_channel_blend` look good to you?

That would be fine, or just 'blend_premult'.

Later it could get two siblings, blend_none and blend_coverage, to
match "pixel blend mode" property.

> >
> > 'alpha' should be named 'src_alpha'.
> > =20
> > >  {
> > > -     u32 pre_blend;
> > > -     u8 new_color;
> > > +     u64 pre_blend; =20
> >
> > I'm not quite sure if u32 would suffice... max value for src is
> > 0xffff * src_alpha / 0xffff =3D src_alpha. Max value for dst is 0xffff.=
 =20
>=20
> I didn't understand this division. What does the second 0xffff represent?

src_alpha is u16, so the divisor is the normalising factor.

Channel value and src_alpha are u16 which means they are essentially
0.16 fixed point format. If you multiply the two together as u16, the
result would be a 0.32 fixed point format in u32. To get back to 0.16
format, you divide by 0xffff.

Actually, this should be obvious, I was just thinking about it too
complicated.

Since src is pre-multiplied, it follows that src <=3D src_alpha. If you
think in real numbers [0.0, 1.0], it should be easy to see. If
src > src_alpha, then it would mean that the original straight color value
was out of range (greater than 1.0).

>=20
> >
> > So we have at max
> >
> > src_alpha * 0xffff + 0xffff * (0xffff - src_alpha)
> >
> > Each multiplication independently will fit in u32.
> >
> > Rearranging we get
> >
> > src_alpha * 0xffff + 0xffff * 0xffff - 0xffff * src_alpha
> >
> > which equals
> >
> > 0xffff * 0xffff
> >
> > which fits in u32 and does not depend on src_alpha.
> >
> > So unless I made a mistake, looks like u32 should be enough. On 32-bit
> > CPUs it should have speed benefits compared to u64.
> > =20
> > > +     u16 new_color;
> > >
> > > -     pre_blend =3D (src * 255 + dst * (255 - alpha));
> > > +     pre_blend =3D (src * 0xffff + dst * (0xffff - alpha)); =20
> >
> > 'pre_blend' means "before blending" so maybe a better name here as the
> > blending is already done.
> > =20
>=20
> I don't have a good name right now, but I will think of something.
>=20
> > >
> > > -     /* Faster div by 255 */
> > > -     new_color =3D ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
> > > +     new_color =3D DIV_ROUND_UP(pre_blend, 0xffff);
> > >
> > > -     return new_color;
> > > +     return cpu_to_le16(new_color); =20
> >
> > What's the thing with cpu_to_le16 here?
> >
> > I think the temporary line buffers could just be using the cpu-native
> > u16 type. There is no DRM format code for that, but we don't need one
> > either. This format is not for interoperation with anything else, it's
> > just internal here, and the main goals with it are precision and speed.
> >
> > As such, the temporary line buffers could be simply u16 arrays, so you
> > don't need to consider the channel packing into a u64.
> > =20
>=20
> This wouldn't cause a problem to calculate the crc in BE machines?

I don't think so, because userspace cannot expect CRC values to be
portable between machines, drivers or display chips.

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#display-crc-support

Thanks to Simon Ser for finding that piece of doc.

> > >  }
> > > =20
> >
> >
> >
> > From here on, I will be removing the diff minus lines from the quoted
> > code, because these functions are completely new.
> > =20
> > >  /**
> > >   * alpha_blend - alpha blending equation =20
> >
> > This is specifically the pre-multiplied alpha blending, so reflect that
> > in the function name.
> > =20
>=20
> OK, I will use `pre_mul_alpha_blend`. Or something similar.
>=20
> > > + * @src_composer: source framebuffer's metadata
> > > + * @dst_composer: destination framebuffer's metadata
> > > + * @y: The y coodinate(heigth) of the line that will be processed
> > > + * @line_buffer: The line with the pixels from src_compositor
> > >   *
> > >   * blend pixels using premultiplied blend formula. The current DRM a=
ssumption
> > >   * is that pixel color values have been already pre-multiplied with =
the alpha
> > >   * channel values. See more drm_plane_create_blend_mode_property(). =
Also, this
> > >   * formula assumes a completely opaque background.
> > > + *
> > > + * For performance reasons this function also fetches the pixels fro=
m the
> > > + * destination of the frame line y.
> > > + * We use the information that one of the source pixels are in the o=
utput
> > > + * buffer to fetch it here instead of separate function. And because=
 the
> > > + * output format is ARGB16161616, we know that they don't need to be
> > > + * converted.
> > > + * This save us a indirect function call for each line. =20
> >
> > I think this paragraph should be obvious from the type of 'line_buffer'
> > parameter and that you are blending src into dst.
> > =20
> > >   */
> > > +static void alpha_blend(void *pixels_addr, int length, u64 *line_buf=
fer)
> > >  {
> > > +     __le16 *output_pixel =3D pixels_addr; =20
> >
> > Aren't you supposed to be writing into line_buffer, not into src?
> >
> > There is something very strange with the logic here.
> >
> > In fact, the function signature of the blending function is unexpected.
> > A blending function should operate on two line_buffers, not what looks
> > like arbitrary buffer pixels.
> >
> > I think you should forget the old code and design these from scratch.
> > You would have three different kinds of functions:
> >
> > - loading: fetch a row from an image and convert into a line buffer
> > - blending: take two line buffers and blend them into one of the line
> >   buffers
> > - storing: convert a line buffer and write it into an image row
> >
> > I would not coerce these three different operations into less than
> > three function pointer types.
> >
> > To actually run a blending operation between source and destination
> > images, you would need four function pointers:
> > - loader for source (by pixel format)
> > - loader for destination (by pixel format)
> > - blender (by chosen blending operation)
> > - storing for destination (by pixel format)
> >
> > Function parameter types should make it obvious whether something is an
> > image or row in arbitrary format, or a line buffer in the special
> > internal format.
> >
> > Then the algorithm would work roughly like this:
> >
> > for each plane:
> >         for each row:
> >                 load source into lb1
> >                 load destination into lb2
> >                 blend lb1 into lb2
> >                 store lb2 into destination
> >
> > This is not optimal, you see how destination is repeatedly loaded and
> > stored for each plane. So you could swap the loops:
> >
> > allocate lb1, lb2 with destination width
> > for each destination row:
> >         load destination into lb2
> >
> >         for each plane:
> >                 load source into lb1
> >                 blend lb1 into lb2
> >
> >         store lb2 into destination =20
>=20
> I'm doing something very similar right now, based on comments from the
> previous emails. It looks very similar to your pseudocode.
>=20
> And this solves several weirdnesses of my code that you commented
> throughout this review.
>=20
> But I made a decision that I would like to hear your thoughts about it.
>=20
> Using your variables, instead of storing the lb2 in the destination,
> I'm using it to calculate the CRC in the middle of the compositing loop.
> And if necessary, storing/converting the lb2 into the wb buffer.
>=20
> So the pseudocode looks like that:
>=20
> allocate lb1, lb2 with destination width
> for each destination row:
>         load destination into lb2
>=20
>         for each plane:
>                 load source into lb1
>                 blend lb1 into lb2
>=20
>         compute crc of lb2
>=20
>         if wb pending
>                  convert and store ib2 to wb buffer
>=20
> return crc
>=20
> With that we avoid the allocation of the full image buffer.

Yes, exactly. Sounds good.


> >
> > Inside the loop over plane, you need to check if the plane overlaps the
> > current destination row at all. If not, continue on the next plane. If
> > yes, load source into lb1 and compute the offset into lb2 where it
> > needs to be blended. =20
>=20
> Thanks for this tip, this is an optimization that, currently, my code doe=
sn't
> have.
>=20
> >
> > Since we don't support scaling yet, lb1 length will never exceed
> > destination width, because there is no need to load plane buffer pixels
> > we would not be writing out.
> >
> > Also "load destination into lb2" could be replaced with just "clear
> > lb2" is the old destination contents are to be discarded. Then you also
> > don't need the function pointer for "loader for destination".
> >
> > I think you already had all these ideas, just the execution in code got
> > really messy somehow.
> > =20
> > > +     int i;
> > >
> > > +     for (i =3D 0; i < length; i++) {
> > > +             u16 src1_a =3D line_buffer[i] >> 48;
> > > +             u16 src1_r =3D (line_buffer[i] >> 32) & 0xffff;
> > > +             u16 src1_g =3D (line_buffer[i] >> 16) & 0xffff;
> > > +             u16 src1_b =3D line_buffer[i] & 0xffff; =20
> >
> > If you used native u16 array for line buffers, all this arithmetic
> > would be unnecessary.
> > =20
> > >
> > > +             u16 src2_r =3D le16_to_cpu(output_pixel[2]);
> > > +             u16 src2_g =3D le16_to_cpu(output_pixel[1]);
> > > +             u16 src2_b =3D le16_to_cpu(output_pixel[0]);
> > > +
> > > +             output_pixel[0] =3D blend_channel(src1_b, src2_b, src1_=
a);
> > > +             output_pixel[1] =3D blend_channel(src1_g, src2_g, src1_=
a);
> > > +             output_pixel[2] =3D blend_channel(src1_r, src2_r, src1_=
a);
> > > +             output_pixel[3] =3D 0xffff;
> > > +
> > > +             output_pixel +=3D 4;
> > > +     }
> > >  }
> > >
> > >  /**
> > >   * @src_composer: source framebuffer's metadata
> > > + * @dst_composer: destiny framebuffer's metadata
> > > + * @funcs: A struct containing all the composition functions(get_src=
_line,
> > > + *         and set_output_pixel)
> > > + * @line_buffer: The line with the pixels from src_compositor
> > >   *
> > > + * Using the pixel_blend function passed as parameter, this function=
 blends
> > > + * all pixels from src plane into a output buffer (with a blend func=
tion
> > > + * passed as parameter).
> > > + * Information of the output buffer is in the dst_composer parameter
> > > + * and the source plane in the src_composer.
> > > + * The get_src_line will use the src_composer to get the respective =
line,
> > > + * convert, and return it as ARGB_16161616.
> > > + * And finally, the blend function will receive the dst_composer, ds=
t_composer,
> > > + * the line y coodinate, and the line buffer. Blend all pixels, and =
store the
> > > + * result in the output.
> > >   *
> > >   * TODO: completely clear the primary plane (a =3D 0xff) before star=
ting to blend
> > >   * pixel color values
> > >   */
> > > +static void blend(struct vkms_composer *src_composer,
> > >                 struct vkms_composer *dst_composer,
> > > +               struct vkms_pixel_composition_functions *funcs,
> > > +               u64 *line_buffer)
> > >  {
> > > +     int i, i_dst;
> > >
> > >       int x_src =3D src_composer->src.x1 >> 16;
> > >       int y_src =3D src_composer->src.y1 >> 16;
> > >
> > >       int x_dst =3D src_composer->dst.x1;
> > >       int y_dst =3D src_composer->dst.y1;
> > > +
> > >       int h_dst =3D drm_rect_height(&src_composer->dst);
> > > +     int length =3D drm_rect_width(&src_composer->dst);
> > >
> > >       int y_limit =3D y_src + h_dst;
> > > +
> > > +     u8 *src_pixels =3D packed_pixels_addr(src_composer, x_src, y_sr=
c);
> > > +     u8 *dst_pixels =3D packed_pixels_addr(dst_composer, x_dst, y_ds=
t);
> > > +
> > > +     int src_next_line_offset =3D src_composer->pitch;
> > > +     int dst_next_line_offset =3D dst_composer->pitch;
> > > +
> > > +     for (i =3D y_src, i_dst =3D y_dst; i < y_limit; ++i, i_dst++) {
> > > +             funcs->get_src_line(src_pixels, length, line_buffer);
> > > +             funcs->set_output_line(dst_pixels, length, line_buffer);
> > > +             src_pixels +=3D src_next_line_offset;
> > > +             dst_pixels +=3D dst_next_line_offset;
> > >       }
> > >  }
> > >
> > > +static void ((*get_line_fmt_transform_function(u32 format))
> > > +         (void *pixels_addr, int length, u64 *line_buffer))
> > >  {
> > > +     if (format =3D=3D DRM_FORMAT_ARGB8888)
> > > +             return &ARGB8888_to_ARGB16161616;
> > > +     else if (format =3D=3D DRM_FORMAT_ARGB16161616)
> > > +             return &get_ARGB16161616;
> > > +     else
> > > +             return &XRGB8888_to_ARGB16161616;
> > > +}
> > >
> > > +static void ((*get_output_line_function(u32 format))
> > > +          (void *pixels_addr, int length, u64 *line_buffer))
> > > +{
> > > +     if (format =3D=3D DRM_FORMAT_ARGB8888)
> > > +             return &convert_to_ARGB8888;
> > > +     else if (format =3D=3D DRM_FORMAT_ARGB16161616)
> > > +             return &convert_to_ARGB16161616;
> > > +     else
> > > +             return &convert_to_XRGB8888;
> > > +}
> > >
> > > +static void compose_plane(struct vkms_composer *src_composer,
> > > +                       struct vkms_composer *dst_composer, =20
> >
> > I'm confused by the vkms_composer concept. If there is a separate thing
> > for source and destination and they are used together, then I don't
> > think that thing is a "composer" but some kind of... image structure? =
=20
>=20
> I didn't create this struct, but I think this is exactly what it represen=
ts.
>=20
> > "Composer" is what compose_active_planes() does. =20
>=20
> Do you think this struct needs a rename?

In the long run, yes.

> > =20
> > > +                       struct vkms_pixel_composition_functions *func=
s,
> > > +                       u64 *line_buffer)
> > > +{
> > > +     u32 src_format =3D src_composer->fb->format->format;
> > >
> > > +     funcs->get_src_line =3D get_line_fmt_transform_function(src_for=
mat);
> > >
> > > +     blend(src_composer, dst_composer, funcs, line_buffer); =20
> >
> > This function is confusing. You get 'funcs' as argument, but you
> > overwrite one field and then trust that the other field was already set
> > by the caller. The policy of how 'funcs' argument here works is too
> > complicated to me.
> >
> > If you need just one function pointer as argument, then do exactly
> > that, and construct the vfunc struct inside this function. =20
>=20
> I think this will be totally solved with the code redesign.

I think so too.

...

> > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vk=
ms/vkms_formats.h
> > > new file mode 100644
> > > index 000000000000..5b850fce69f3
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > > @@ -0,0 +1,155 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +
> > > +#ifndef _VKMS_FORMATS_H_
> > > +#define _VKMS_FORMATS_H_
> > > +
> > > +#include <drm/drm_rect.h>
> > > +
> > > +#define pixel_offset(composer, x, y) \
> > > +     ((composer)->offset + ((y) * (composer)->pitch) + ((x) * (compo=
ser)->cpp)) =20
> >
> > Why macro instead of a static inline function? =20
>=20
> Again, I don't have a good answer for that :(

I would recommend to use a static inline function always when possible,
and macros only when an inline function cannot work. The reason is that
an inline function has types in its signature so you get some type
safety, and it cannot accidentally mess up other variables in the call
sites. A function also cannot "secretly" use variables from the call
site like a macro can, so the reader can be sure that the function call
will not access anything not listed in the parameters.


> > > +
> > > +/*
> > > + * packed_pixels_addr - Get the pointer to pixel of a given pair of =
coordinates
> > > + *
> > > + * @composer: Buffer metadata
> > > + * @x: The x(width) coordinate of the 2D buffer
> > > + * @y: The y(Heigth) coordinate of the 2D buffer
> > > + *
> > > + * Takes the information stored in the composer, a pair of coordinat=
es, and
> > > + * returns the address of the first color channel.
> > > + * This function assumes the channels are packed together, i.e. a co=
lor channel
> > > + * comes immediately after another. And therefore, this function doe=
sn't work
> > > + * for YUV with chroma subsampling (e.g. YUV420 and NV21).
> > > + */
> > > +static void *packed_pixels_addr(struct vkms_composer *composer, int =
x, int y) =20
> >
> > Is it normal in the kernel to have non-inline functions in headers?
> >
> > Actually this file does not look like a header at all, it should
> > probably be a .c file and not #included. =20
>=20
> Oops. This should not be that way. I will fix it.

While you do that, I wonder if it makes sense to put the functions like
get_line_fmt_transform_function() in this file as well, so you only
need to expose the getters, and the implementations can remain static
functions.


Thanks,
pq

--Sig_/BaAui.6dyvYOSIUvl0h1syW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGM43EACgkQI1/ltBGq
qqdGdRAArAT2QXJ1WN+FmhSgROKSUEeSn0/du2E+ZSc+khbgTBuM5lvhL36FRIUY
tTgIQ9wpR3XLqKefy2dtTRgpBYZ2WGtMKQBuK4OA8bNuwtgkeSwgJXFRGeUcrn3N
x4VuBtV/EPPLDFW8XSkcm56ewxobcALN1o30K6bDOvtNOBfhexjwXeSILU61DD9T
b0w6idxCAyobOrlKnfJJBixU8b0FPIbR5HkJlvxmNerUSHQFlUkokO+Vt2S5XKJx
ohfK//uMCqd2UbEbAk/qQ1dWr6v9HBoHnNDjMBP4JNBjyvK9DuHz2g7Du3LoMLD+
T043oCyI1gX00aXDvW/W6waZA8kVKNXYyuqAG3vgme6qP5mt4J9Hr8u/1dgMZe2T
RgHTtf0q/OTWXYLziY3vyapRDehyosTkBAnCItGjEW0cy0A1JhLV0qosl/l5Ed7q
X2YeVYA5e02B/D+lpYltxt1f1iSaR4BzaCjj1fBgImKsn1+K/84T33xIut+kEtxw
YLN8VlAr7N/NSmNU5VlQbmxthPRuLoA7koo/MJaA2Z2qrwG5lrFF2xVSbhzqR0/u
Z+KQ9EeHKDFsx9QnBOc+deDx6GKglUdM3wExGjvpTBdlLXZyWwEJ5jCNFXwL+I83
8Zzt0QEHXaRy1tXl56gE9EGyU3XlXAIo8sbh76md0YMBEwS6YVE=
=cLtz
-----END PGP SIGNATURE-----

--Sig_/BaAui.6dyvYOSIUvl0h1syW--
