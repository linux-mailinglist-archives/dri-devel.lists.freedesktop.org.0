Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6421CA66D
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA5D6E1F2;
	Fri,  8 May 2020 08:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B26E6E97A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 11:56:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r26so6511730wmh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cwbndYePx6Sf4kvKBrk06EAK0VStwNUVTL2K+SJVvwI=;
 b=ZaDlNUeMLsuMD7531bd1nDMr7SL++ZBC8CeaJNNmJgZJeTsG2xe8QrypRYuV5wz8w2
 UiZqLAoIUiFiLP15OFxtx3WEqGSaGH1TJTTI+yKEhTII41nX+1Fa1xZFxs6yL7DBIQUp
 mZi+9PEkyHlNOh8XX5FrEbw2i47OkWkMCpHpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cwbndYePx6Sf4kvKBrk06EAK0VStwNUVTL2K+SJVvwI=;
 b=J52ShS6oWRuyjoGfE82TH1GsX9F1A7Gka6rQxZawvYDQ5B8bQux9GzGA+aBUHvVdU1
 sNf3C29rEobm6Py1rwRPjwKwH0vpzXqXv71FBgHnmrqNoewerr2kOK/A64weuaVSoEv/
 Yb8Gpy0W69O4NdonqvXXTsoBi6bFYUyI6NJcACROy7B0spBozUvaWtJwIh2QHGIjpYVY
 nae+pf1Fklljm20whOb31QL78JTbaj8Eaw1/cEQoMNfe4PtauiIrbzHl7zsXWaeBqp6F
 /SgIWmOvu4zOzUNGQ1C9U+JBZCD6jZkc7l6h0RQiIDMONCWhb82qXoM4BRpGAZS1C4p+
 Z2NA==
X-Gm-Message-State: AGi0PuZ6hQfeZhRFvA1Gd6/Ma7uInGfehmMjQFnCCxW0kPFLSI81YGK+
 aGPbQHBKURjt2/d7G9MytSa7goaD9wJGJwqoWkWgGQ==
X-Google-Smtp-Source: APiQypKQjgXGPVpdtx8p9w+nrP8rvOLzevb6vFpHpUaJEVKIYzLAFAbdqna1vt22+43KryxqrLQnl31CR41crfy8aBQ=
X-Received: by 2002:a1c:5419:: with SMTP id i25mr7061026wmb.156.1588852610069; 
 Thu, 07 May 2020 04:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
 <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
 <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
 <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
 <CAECpkiM5ez8=iEe=fYKiDf5Pb6AHrTyt5uXqJQtQpQJHotupWA@mail.gmail.com>
 <CAAOTY__B+8XY=5n5C2AYBGskRhvOs2PmHVhjKJk7NmXDVM_-Nw@mail.gmail.com>
In-Reply-To: <CAAOTY__B+8XY=5n5C2AYBGskRhvOs2PmHVhjKJk7NmXDVM_-Nw@mail.gmail.com>
From: Anand Mistry <amistry@chromium.org>
Date: Thu, 7 May 2020 21:56:39 +1000
Message-ID: <CAECpkiO9P1+GpQi+aH_B2B8d5Bsba5XJnUKJDfL-kZk455Edcg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: Anand K Mistry <amistry@google.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0241150126=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0241150126==
Content-Type: multipart/alternative; boundary="0000000000006c8f1805a50d9359"

--0000000000006c8f1805a50d9359
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2020 at 10:59 PM Chun-Kuang Hu <chunkuang.hu@kernel.org>
wrote:
>
> Hi, Anand:
>
> Anand Mistry <amistry@chromium.org> =E6=96=BC 2020=E5=B9=B45=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:03=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Wed, May 6, 2020 at 10:25 AM Chun-Kuang Hu <chunkuang.hu@kernel.org>
wrote:
> > >
> > > Hi, Anand,
> > >
> > > Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2020=E5=B9=B44=E6=
=9C=8829=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:37=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > >
> > > > Hi, Anand,
> > > >
> > > > Anand K. Mistry <amistry@chromium.org> =E6=96=BC 2020=E5=B9=B44=E6=
=9C=8828=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=889:54=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > > >
> > > > > On Sun, 26 Apr 2020 at 18:04, Chun-Kuang Hu <
chunkuang.hu@kernel.org> wrote:
> > > > > >
> > > > > > Hi, Anand:
> > > > > >
> > > > > > Anand K Mistry <amistry@chromium.org> =E6=96=BC 2020=E5=B9=B44=
=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:09=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > > > > >
> > > > > > > If dma_map_sg() merges pages when creating the mapping, only
the first
> > > > > > > entries will have a valid sg_dma_address() and sg_dma_len(),
followed by
> > > > > > > entries with sg_dma_len() =3D=3D 0.
> > > > > > >
> > > > > > > Signed-off-by: Anand K Mistry <amistry@google.com>
> > >
> > > Author should sign off this patch, please give a sign off tag by
author.
> >
> > Sorry, email issues meant i sent the patch from a different account.
> > Should I re-send the
> > patch from the same account as the sign-off line? I'm still working my
> > way through the kernel patch process.
> >
>
> If you want to use chromium account, you could simply reply this email
> with a sign-off-by tag of chromium account.

Ack. As path of least resistance, here:

Signed-off-by: Anand K Mistry <amistry@chromium.org>


>
> Regards,
> Chun-Kuang.
>
> > >
> > > Regards,
> > > Chun-Kuang.
> > >
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
> > > > > > >  1 file changed, 3 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > > > > > > index b04a3c2b111e09..f8fd8b98c30e3d 100644
> > > > > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > > > > > > @@ -224,6 +224,9 @@ struct drm_gem_object
*mtk_gem_prime_import_sg_table(struct drm_device *dev,
> > > > > > >
> > > > > > >         expected =3D sg_dma_address(sg->sgl);
> > > > > > >         for_each_sg(sg->sgl, s, sg->nents, i) {
> > > > > > > +               if (!sg_dma_len(s))
> > > > > > > +                       break;
> > > > > >
> > > > > > I think this should be 'continue'
> > > > >
> > > > > scatterlist.h has the comment:
> > > > > /*
> > > > >  * These macros should be used after a dma_map_sg call has been
done
> > > > >  * to get bus addresses of each of the SG entries and their
lengths.
> > > > >  * You should only work with the number of sg entries dma_map_sg
> > > > >  * returns, or alternatively stop on the first sg_dma_len(sg)
which
> > > > >  * is 0.
> > > > >  */
> > > > >
> > > > > So breaking on the first sg_dma_len(sg) =3D=3D 0 appears to be (o=
ne
of)
> > > > > the documented approach.
> > > > >
> > > >
> > > > Okay, you're right. So
> > > >
> > > > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > >
> > > > > >
> > > > > > Regards,
> > > > > > Chun-Kuang.
> > > > > >
> > > > > > > +
> > > > > > >                 if (sg_dma_address(s) !=3D expected) {
> > > > > > >                         DRM_ERROR("sg_table is not
contiguous");
> > > > > > >                         ret =3D -EINVAL;
> > > > > > > --
> > > > > > > 2.26.1.301.g55bc3eb7cb9-goog
> > > > > > >
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > Linux-mediatek mailing list
> > > > > > > Linux-mediatek@lists.infradead.org
> > > > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek

--0000000000006c8f1805a50d9359
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, May 6, 2020 at 10:59 PM Chun-Kuang Hu &lt;<a href=
=3D"mailto:chunkuang.hu@kernel.org">chunkuang.hu@kernel.org</a>&gt; wrote:<=
br>&gt;<br>&gt; Hi, Anand:<br>&gt;<br>&gt; Anand Mistry &lt;<a href=3D"mail=
to:amistry@chromium.org">amistry@chromium.org</a>&gt; =E6=96=BC 2020=E5=B9=
=B45=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:03=E5=AF=AB=
=E9=81=93=EF=BC=9A<br>&gt; &gt;<br>&gt; &gt; On Wed, May 6, 2020 at 10:25 A=
M Chun-Kuang Hu &lt;<a href=3D"mailto:chunkuang.hu@kernel.org">chunkuang.hu=
@kernel.org</a>&gt; wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Hi, Anand,<b=
r>&gt; &gt; &gt;<br>&gt; &gt; &gt; Chun-Kuang Hu &lt;<a href=3D"mailto:chun=
kuang.hu@kernel.org">chunkuang.hu@kernel.org</a>&gt; =E6=96=BC 2020=E5=B9=
=B44=E6=9C=8829=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:37=E5=AF=
=AB=E9=81=93=EF=BC=9A<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; Hi, Ana=
nd,<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; Anand K. Mistry &lt;<a hr=
ef=3D"mailto:amistry@chromium.org">amistry@chromium.org</a>&gt; =E6=96=BC 2=
020=E5=B9=B44=E6=9C=8828=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=889:54=
=E5=AF=AB=E9=81=93=EF=BC=9A<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &=
gt; &gt; On Sun, 26 Apr 2020 at 18:04, Chun-Kuang Hu &lt;<a href=3D"mailto:=
chunkuang.hu@kernel.org">chunkuang.hu@kernel.org</a>&gt; wrote:<br>&gt; &gt=
; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Hi, Anand:<br>&gt; &=
gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Anand K Mistry &lt=
;<a href=3D"mailto:amistry@chromium.org">amistry@chromium.org</a>&gt; =E6=
=96=BC 2020=E5=B9=B44=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=
=8D=882:09=E5=AF=AB=E9=81=93=EF=BC=9A<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; If dma_map_sg() merges pages when cr=
eating the mapping, only the first<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; en=
tries will have a valid sg_dma_address() and sg_dma_len(), followed by<br>&=
gt; &gt; &gt; &gt; &gt; &gt; &gt; entries with sg_dma_len() =3D=3D 0.<br>&g=
t; &gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; Sign=
ed-off-by: Anand K Mistry &lt;<a href=3D"mailto:amistry@google.com">amistry=
@google.com</a>&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Author should sign =
off this patch, please give a sign off tag by author.<br>&gt; &gt;<br>&gt; =
&gt; Sorry, email issues meant i sent the patch from a different account.<b=
r>&gt; &gt; Should I re-send the<br>&gt; &gt; patch from the same account a=
s the sign-off line? I&#39;m still working my<br>&gt; &gt; way through the =
kernel patch process.<br>&gt; &gt;<br>&gt;<br>&gt; If you want to use chrom=
ium account, you could simply reply this email<br>&gt; with a sign-off-by t=
ag of chromium account.<br><br>Ack. As path of least resistance, here:<br><=
br>Signed-off-by: Anand K Mistry &lt;<a href=3D"mailto:amistry@chromium.org=
">amistry@chromium.org</a>&gt;<br><br><br>&gt;<br>&gt; Regards,<br>&gt; Chu=
n-Kuang.<br>&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Regards,<br>&gt; &gt; =
&gt; Chun-Kuang.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; --=
-<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0drivers/gpu/drm/mediatek/mtk_=
drm_gem.c | 3 +++<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A01 file change=
d, 3 insertions(+)<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/d=
rivers/gpu/drm/mediatek/mtk_drm_gem.c<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
 index b04a3c2b111e09..f8fd8b98c30e3d 100644<br>&gt; &gt; &gt; &gt; &gt; &g=
t; &gt; --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c<br>&gt; &gt; &gt; &gt;=
 &gt; &gt; &gt; +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c<br>&gt; &gt; &=
gt; &gt; &gt; &gt; &gt; @@ -224,6 +224,9 @@ struct drm_gem_object *mtk_gem_=
prime_import_sg_table(struct drm_device *dev,<br>&gt; &gt; &gt; &gt; &gt; &=
gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
expected =3D sg_dma_address(sg-&gt;sgl);<br>&gt; &gt; &gt; &gt; &gt; &gt; &=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 for_each_sg(sg-&gt;sgl, s, sg-&gt;nents, i)=
 {<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (!sg_dma_len(s))<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =
&gt; I think this should be &#39;continue&#39;<br>&gt; &gt; &gt; &gt; &gt;<=
br>&gt; &gt; &gt; &gt; &gt; scatterlist.h has the comment:<br>&gt; &gt; &gt=
; &gt; &gt; /*<br>&gt; &gt; &gt; &gt; &gt; =C2=A0* These macros should be u=
sed after a dma_map_sg call has been done<br>&gt; &gt; &gt; &gt; &gt; =C2=
=A0* to get bus addresses of each of the SG entries and their lengths.<br>&=
gt; &gt; &gt; &gt; &gt; =C2=A0* You should only work with the number of sg =
entries dma_map_sg<br>&gt; &gt; &gt; &gt; &gt; =C2=A0* returns, or alternat=
ively stop on the first sg_dma_len(sg) which<br>&gt; &gt; &gt; &gt; &gt; =
=C2=A0* is 0.<br>&gt; &gt; &gt; &gt; &gt; =C2=A0*/<br>&gt; &gt; &gt; &gt; &=
gt;<br>&gt; &gt; &gt; &gt; &gt; So breaking on the first sg_dma_len(sg) =3D=
=3D 0 appears to be (one of)<br>&gt; &gt; &gt; &gt; &gt; the documented app=
roach.<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt;=
 &gt; Okay, you&#39;re right. So<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &=
gt; Reviewed-by: Chun-Kuang Hu &lt;<a href=3D"mailto:chunkuang.hu@kernel.or=
g">chunkuang.hu@kernel.org</a>&gt;<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt;=
 &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; Regards,<br>&gt; &gt; &gt;=
 &gt; &gt; &gt; Chun-Kuang.<br>&gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &=
gt; &gt; &gt; &gt; &gt; +<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sg_dma_address(s) !=3D ex=
pected) {<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_ERROR(&quot;sg=
_table is not contiguous&quot;);<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ret =3D -EINVAL;<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>&gt; &g=
t; &gt; &gt; &gt; &gt; &gt; 2.26.1.301.g55bc3eb7cb9-goog<br>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt;=
 &gt; &gt; &gt; &gt; _______________________________________________<br>&gt=
; &gt; &gt; &gt; &gt; &gt; &gt; Linux-mediatek mailing list<br>&gt; &gt; &g=
t; &gt; &gt; &gt; &gt; <a href=3D"mailto:Linux-mediatek@lists.infradead.org=
">Linux-mediatek@lists.infradead.org</a><br>&gt; &gt; &gt; &gt; &gt; &gt; &=
gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-mediatek">=
http://lists.infradead.org/mailman/listinfo/linux-mediatek</a></div>

--0000000000006c8f1805a50d9359--

--===============0241150126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0241150126==--
