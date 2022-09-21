Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0585BFA5B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 11:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082E210E827;
	Wed, 21 Sep 2022 09:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45C910E827;
 Wed, 21 Sep 2022 09:13:13 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id f20so7664128edf.6;
 Wed, 21 Sep 2022 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=l1vyb533afax2OC0XKhODZY3BbHylHPbSqXDEOL933M=;
 b=lexMAsGpZ4uEBXdBTpjGyZOQZbhz7PxOKpVGZx8r1n6iEClWEb2QgJhRCqVNybC4Zb
 umXIRTZtp4aBvlzpZOZ2hzAxKU31SiyYYjtfU+gZPLt6b9qHhGA003E8M5qtNmH2fnFK
 nchHZWUfq5ISXapeTIsdxmnTtZBV/QEoave+BO/SB2lPbt07zYW7r4PJRZdFzPZyhG+X
 VgCsD3BKY5P8SsGT6h+idC632uotCVMDnO4bMEL8tfUssm3i662dpQJ2uawr5G4TWFBL
 UDBGMWnbgSJ2CzHoKasq1mzIfpXFz/m4ecRfLS/c5GepOMiYEU6cmSY1VVs1zXW/jrVX
 7caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=l1vyb533afax2OC0XKhODZY3BbHylHPbSqXDEOL933M=;
 b=xYfFfL1ZZf4KPTIMWxcY4hBDIDwPPDN7dpo9pWyyPBRNG/pQoaozOckNl9P7ztwq+S
 aPaEh8UdPH3GXjfImOiMMaE7YJ91w8WEEb3UBLlUO5dy4H/YJRGKOcVduhEBM1owU3Ip
 MRJaFV+EePiiS9C4WuNiyZXbRHiEyOXP4PBROCbs1lCCBu6hPO+NBYB45milS3QuUFSh
 t9xMDijl7vVY17rL1XDml06qmqHTR1+2Gwx7R4ZIkA/XSMaHNI2bdgvhWUX9y3am0WuA
 EwrGA9fIwuNjdlSOkXliBPiHjhMDEfHDdFno+V6UCU8q9yQp69rDzsOep87YSngr5hQg
 r2KA==
X-Gm-Message-State: ACrzQf1U0eDsfg07x3M1Usn88kR8e5HcadwwDwAyQKOT2hKXAmLn2o/V
 52A4aq6yHeN1hSpbl6nXcSo00WIXnqvzYRRoHKc=
X-Google-Smtp-Source: AMsMyM6qZWoSutaGxavU1l+b7Gm2hjgycXdK2iBnT1E6FzoR1kMbyw7qnFJJdbmwW2B+f+vp5HuJ/trMQxljKzrjOS4=
X-Received: by 2002:aa7:df87:0:b0:44e:2851:7e8d with SMTP id
 b7-20020aa7df87000000b0044e28517e8dmr24459923edy.106.1663751592281; Wed, 21
 Sep 2022 02:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_ED24158E83CB9885E8BDD173EB5896B51906@qq.com>
 <87pmfrpv7q.fsf@intel.com>
In-Reply-To: <87pmfrpv7q.fsf@intel.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Wed, 21 Sep 2022 17:13:00 +0800
Message-ID: <CAJedcCzjWw6v5Nt42jsCStdpwHuz13D+q-CD=6ycVWBczY+4mg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, security@kernel.org, alex000young@gmail.com,
 airlied@linux.ie, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zheng Wang <1002992920@qq.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've sent it using git send-email with another email account (zyytlz.wz@163=
.com)

Regards,
Zheng Wang

Jani Nikula <jani.nikula@linux.intel.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=881=
9=E6=97=A5=E5=91=A8=E4=B8=80 17:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 19 Sep 2022, Zheng Wang <1002992920@qq.com> wrote:
> >  From afe79848cb74cc8e45ab426d13fa2394c87e0422 Mon Sep 17 00:00:00 2001
> > From: xmzyshypnc <1002992920@qq.com>
> > Date: Fri, 16 Sep 2022 23:48:23 +0800
> > Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_ent=
ry
> >
> > There is a double-free security bug in split_2MB_gtt_entry.
> >
> > Here is a calling chain :
> > ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.
> >
> > If intel_gvt_dma_map_guest_page failed, it will call
> > ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
> > kfree(spt). But the caller does not notice that, and it will call
> > ppgtt_free_spt again in error path.
> >
> > Fix this by only freeing spt in ppgtt_invalidate_spt in good case.
> >
> > Signed-off-by: xmzyshypnc <1002992920@qq.com>
>
> Please use git send-email. The patch is whitespace broken and line
> wrapped, making it unusable.
>
> BR,
> Jani.
>
>
> > ---
> >   drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
> >   1 file changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/=
gtt.c
> > index ce0eb03709c3..550519f0acca 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct
> > intel_vgpu_ppgtt_spt *spt)
> >       return atomic_dec_return(&spt->refcount);
> >   }
> >
> > -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
> > +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int
> > is_error);
> >
> >   static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vg=
pu,
> >           struct intel_gvt_gtt_entry *e)
> > @@ -995,7 +995,7 @@ static int
> > ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
> >                   ops->get_pfn(e));
> >           return -ENXIO;
> >       }
> > -    return ppgtt_invalidate_spt(s);
> > +    return ppgtt_invalidate_spt(s, 0);
> >   }
> >
> >   static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *=
spt,
> > @@ -1016,7 +1016,7 @@ static inline void ppgtt_invalidate_pte(struct
> > intel_vgpu_ppgtt_spt *spt,
> >       intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
> >   }
> >
> > -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
> > +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int
> > is_error)
> >   {
> >       struct intel_vgpu *vgpu =3D spt->vgpu;
> >       struct intel_gvt_gtt_entry e;
> > @@ -1059,9 +1059,11 @@ static int ppgtt_invalidate_spt(struct
> > intel_vgpu_ppgtt_spt *spt)
> >           }
> >       }
> >
> > -    trace_spt_change(spt->vgpu->id, "release", spt,
> > +    if (!is_error) {
> > +        trace_spt_change(spt->vgpu->id, "release", spt,
> >                spt->guest_page.gfn, spt->shadow_page.type);
> > -    ppgtt_free_spt(spt);
> > +        ppgtt_free_spt(spt);
> > +    }
> >       return 0;
> >   fail:
> >       gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n"=
,
> > @@ -1215,7 +1217,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu
> > *vgpu,
> >           ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_in=
dex,
> >                              PAGE_SIZE, &dma_addr);
> >           if (ret) {
> > -            ppgtt_invalidate_spt(spt);
> > +            ppgtt_invalidate_spt(spt, 1);
> >               return ret;
> >           }
> >           sub_se.val64 =3D se->val64;
> > @@ -1393,7 +1395,7 @@ static int ppgtt_handle_guest_entry_removal(struc=
t
> > intel_vgpu_ppgtt_spt *spt,
> >               ret =3D -ENXIO;
> >               goto fail;
> >           }
> > -        ret =3D ppgtt_invalidate_spt(s);
> > +        ret =3D ppgtt_invalidate_spt(s, 0);
> >           if (ret)
> >               goto fail;
> >       } else {
>
> --
> Jani Nikula, Intel Open Source Graphics Center
