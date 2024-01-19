Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D2832376
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 03:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB39910E929;
	Fri, 19 Jan 2024 02:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB0D10E810;
 Fri, 19 Jan 2024 02:48:35 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2cdc1af60b2so3635921fa.1; 
 Thu, 18 Jan 2024 18:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705632454; x=1706237254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sd3GlzgGgJSlvg/FmViDsptsjJQ9iDHdHhzYDbLHp3M=;
 b=YiJYctNogDI1XtmudekSOShAUy5P4NQP/huVLcjHV75ElwrpzqSTuE250bi6omaqb+
 8Hlg3Pla0dniN+/eD5XNlB5hMO94lJRZA2kN0pVOl8u2Llw6h1IHlbtUdkcBg7bOzBAg
 4BTvHJt31YjGlcIXW7i5X5+MUV/+L5Q/YpnmT249FbxudhnaypXyV64mMVaXOHobnzjD
 5c1P8mW6nNYZ4G1aci4Jxl1pAO9qvkcUTlEplKzd9j2RPhg0fftBOdUw3KYjamJyAlVe
 VUhQtANqsSvjNjMLX/azyV1+NwUrEHeJ1QdVBxnuw/wG99jdqOExvqFCY8MfqGi05fFd
 rSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705632454; x=1706237254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sd3GlzgGgJSlvg/FmViDsptsjJQ9iDHdHhzYDbLHp3M=;
 b=BSU9rsPwfB9yP68lnJgbRcdelPtv7NwmB/WUmACX32NEIL3pNS6U6XIl81fgsRsDep
 g/y9LA8lhqkgEQOacaxNXhTKIFTKwFmis1smfgoQnHYluOTVIEE8BVwus3X4Uxns4rbt
 u41kt7FiE/skkWkWfaxzOCVOvOOZ/GcHm+Ye8A/08XsBHBmIDc8k7adQMPWk/PjcUF3z
 NDzWZdqev+Vor152oAmtOSz4cALmlwBYjZeSFVgHO9AKTFqiRo2DX7EcnT3w19Uj9fB2
 1PaH5pqQTcCnEcUUSM9asMQ83Y6iVHIZgPKLjzogwY+MImn8p8ou1VoPei+xuYOqxdUL
 GQpQ==
X-Gm-Message-State: AOJu0YxgzdW9ibAXC5q/EDmhaGJyS4O+Hi1K/jfP83PpiDV4zJUh3YSc
 2Axfko75g7OrfTDJ/7lK42Bp3miQWIQ4EH8DqI7GgC37cVK13khbqz3JmVbxoQ37wkrGpcahCTb
 GF+pKuckbEld6EM7VqJDojhbKS7I=
X-Google-Smtp-Source: AGHT+IHJ2OOWYTIM69OkT1dj/zddfEE8UHpCG3z5tUsKf6gifQfhdC/9L0iSNGBSst5hbB5PUyd8mANhzOFTyTGCFog=
X-Received: by 2002:a2e:bc11:0:b0:2cc:ce6d:5ade with SMTP id
 b17-20020a2ebc11000000b002ccce6d5ademr1319357ljf.84.1705632453818; Thu, 18
 Jan 2024 18:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20240117071328.3811480-1-alexious@zju.edu.cn>
 <CAKGbVbuEyKaeZbvU-SREQkto5AqdQo-wjx=cjf2Sx3eDCnah+Q@mail.gmail.com>
In-Reply-To: <CAKGbVbuEyKaeZbvU-SREQkto5AqdQo-wjx=cjf2Sx3eDCnah+Q@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 19 Jan 2024 10:47:21 +0800
Message-ID: <CAKGbVbsp0Bhk3h3D4bkmpLT7HF6KykTJCUcb_JDL=UtJNc-h5A@mail.gmail.com>
Subject: Re: [PATCH] [v2] drm/lima: fix a memleak in lima_heap_alloc
To: Zhipeng Lu <alexious@zju.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

applied to drm-misc-next

On Wed, Jan 17, 2024 at 8:14=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote:
>
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> On Wed, Jan 17, 2024 at 3:14=E2=80=AFPM Zhipeng Lu <alexious@zju.edu.cn> =
wrote:
> >
> > When lima_vm_map_bo fails, the resources need to be deallocated, or
> > there will be memleaks.
> >
> > Fixes: 6aebc51d7aef ("drm/lima: support heap buffer creation")
> > Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> > ---
> > Changelog:
> >
> > v2: rearrange the error-handling to ladder tags.
> > ---
> >  drivers/gpu/drm/lima/lima_gem.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lim=
a_gem.c
> > index 4f9736e5f929..d3d82ee7fb4c 100644
> > --- a/drivers/gpu/drm/lima/lima_gem.c
> > +++ b/drivers/gpu/drm/lima/lima_gem.c
> > @@ -75,29 +75,36 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima=
_vm *vm)
> >         } else {
> >                 bo->base.sgt =3D kmalloc(sizeof(*bo->base.sgt), GFP_KER=
NEL);
> >                 if (!bo->base.sgt) {
> > -                       sg_free_table(&sgt);
> > -                       return -ENOMEM;
> > +                       ret =3D -ENOMEM;
> > +                       goto err_out0;
> >                 }
> >         }
> >
> >         ret =3D dma_map_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
> >         if (ret) {
> > -               sg_free_table(&sgt);
> > -               kfree(bo->base.sgt);
> > -               bo->base.sgt =3D NULL;
> > -               return ret;
> > +               goto err_out1;
> >         }
> >
> >         *bo->base.sgt =3D sgt;
> >
> >         if (vm) {
> >                 ret =3D lima_vm_map_bo(vm, bo, old_size >> PAGE_SHIFT);
> > -               if (ret)
> > -                       return ret;
> > +               if (ret) {
> > +                       goto err_out2;
> > +               }
> >         }
> >
> >         bo->heap_size =3D new_size;
> >         return 0;
> > +
> > +err_out2:
> > +       dma_unmap_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
> > +err_out1:
> > +       kfree(bo->base.sgt);
> > +       bo->base.sgt =3D NULL;
> > +err_out0:
> > +       sg_free_table(&sgt);
> > +       return ret;
> >  }
> >
> >  int lima_gem_create_handle(struct drm_device *dev, struct drm_file *fi=
le,
> > --
> > 2.34.1
> >
