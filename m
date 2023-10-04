Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516887B78C5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 09:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2907110E34B;
	Wed,  4 Oct 2023 07:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A2210E342
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 07:33:00 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5041bb9ce51so2049347e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Oct 2023 00:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696404779; x=1697009579;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzbt6X7Q7d0mjTqmZT49evnXk1E+0LrXDBffntKrV+U=;
 b=cy4WsTKGuV5Dq+YF5eSDyZIBfG1yKYTd0HofP5o7GhHRoSQGupmtDzzBEf05syNqOM
 +zWq8gV6hoNcfzscZCmQAPhfEidq2cAoRcsRO5C5c6capgj1ugWv2gKzOOnm+ptfANdr
 fPsqK1RSgv+9+PcdXhpEW8Q7qbyYnFSKZLAkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696404779; x=1697009579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzbt6X7Q7d0mjTqmZT49evnXk1E+0LrXDBffntKrV+U=;
 b=kbnZRU/Tf8d1Q8+iXV+omrPWqG0bichpRB7x7mhEqQjNvluibBnGuUTbSueYdOpAxq
 zIkT5VaJpe79xblwy0I3ARORsUTcwrG1qtrThup4YZKxtyV7PA6sK+Y3xcc4wLaZ2i1B
 Itw0xo7gxa92SeFTJx9iN4ZDKqoknhB2QvK9aZcIUqECuyvAGG9K3gqaVR2IyQxUhmUI
 BF8s68l1Jb46ulTq4YCD9tV/vb6FBELxzhAIvsplkKHc/O18rg/dybx0PF1BUy1BsVqH
 Xy5zwZtjQ0cIdxQKiOtr2BbE1iH900AQbfdcAokFEjGJa4Z9MlpTsXrgiqyt6yKRNu5v
 disg==
X-Gm-Message-State: AOJu0Yw+aixrx+PHf/+n7IJGVd7OtSsBBRWmIjc+yYxwa/g2OYP0Sk4l
 CrQx1Y/D8ofgCRevcB2I49DeKGFT6Cb2NoZTdVVnLA==
X-Google-Smtp-Source: AGHT+IGssoE7hQqBg/N5JbkjtBec11yjXOZDIx9mR4vfXI1H5ndkIzs/dQErwY530PlhjT1G82jsZ/AwIGzfKfKkfKA=
X-Received: by 2002:a05:6512:3b28:b0:500:7de4:300e with SMTP id
 f40-20020a0565123b2800b005007de4300emr1597917lfv.58.1696404778196; Wed, 04
 Oct 2023 00:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231002092051.555479-1-wenst@chromium.org>
 <CAC=S1ng3_z0H48awhum7unXTTk0yfn61pTWqSmPJ9fWdoURL=A@mail.gmail.com>
In-Reply-To: <CAC=S1ng3_z0H48awhum7unXTTk0yfn61pTWqSmPJ9fWdoURL=A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 4 Oct 2023 15:32:47 +0800
Message-ID: <CAGXv+5Ex9ZN+MPZx0CyNaHf0h+DC2VLNH6Obs7Wt-nokU70MNg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Correctly free sg_table in gem prime vmap
To: Fei Shao <fshao@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 3, 2023 at 11:14=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi,
>
> On Mon, Oct 2, 2023 at 5:21=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > The MediaTek DRM driver implements GEM PRIME vmap by fetching the
> > sg_table for the object, iterating through the pages, and then
> > vmapping them. In essence, unlike the GEM DMA helpers which vmap
> > when the object is first created or imported, the MediaTek version
> > does it on request.
> >
> > Unfortunately, the code never correctly frees the sg_table contents.
> > This results in a kernel memory leak. On a Hayato device with a text
> > console on the internal display, this results in the system running
> > out of memory in a few days from all the console screen cursor updates.
> >
> > Add sg_free_table() to correctly free the contents of the sg_table. Thi=
s
> > was missing despite explicitly required by mtk_gem_prime_get_sg_table()=
.
> >
> > Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap fun=
ction")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Please merge for v6.6 fixes.
> >
> > Also, I was wondering why the MediaTek DRM driver implements a lot of
> > the GEM functionality itself, instead of using the GEM DMA helpers.
> > From what I could tell, the code closely follows the DMA helpers, excep=
t
> > that it vmaps the buffers only upon request.
> >
> >
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_gem.c
> > index 9f364df52478..297ee090e02e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > @@ -239,6 +239,7 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj, struct iosys_map *map)
> >         npages =3D obj->size >> PAGE_SHIFT;
> >         mtk_gem->pages =3D kcalloc(npages, sizeof(*mtk_gem->pages), GFP=
_KERNEL);
> >         if (!mtk_gem->pages) {
> > +               sg_free_table(sgt);
> >                 kfree(sgt);
> >                 return -ENOMEM;
> >         }
> > @@ -248,11 +249,13 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object =
*obj, struct iosys_map *map)
> >         mtk_gem->kvaddr =3D vmap(mtk_gem->pages, npages, VM_MAP,
> >                                pgprot_writecombine(PAGE_KERNEL));
> >         if (!mtk_gem->kvaddr) {
> > +               sg_free_table(sgt);
> >                 kfree(sgt);
> >                 kfree(mtk_gem->pages);
> >                 return -ENOMEM;
> >         }
> >  out:
> > +       sg_free_table(sgt);
>
> I think this will cause invalid access from the "goto out" path -
> sg_free_table() accesses the provided sg table pointer, but it doesn't
> handle NULL pointers like kfree() does.

You're right. I'll send a new version fixing this.
