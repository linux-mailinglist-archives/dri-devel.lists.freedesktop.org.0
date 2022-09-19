Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72F85BC5DD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 11:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5C410E5E8;
	Mon, 19 Sep 2022 09:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6074610E5E8;
 Mon, 19 Sep 2022 09:55:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a41so28622958edf.4;
 Mon, 19 Sep 2022 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=vnJl0L26F6/cF4LoX36tFsaUdJl5yJVNsgmOYHfsRBo=;
 b=Vb58P5FPswub/ju264ON0G6rNOIDPCQ3GPgtbDnL9G5e9OBp6YY93sVXlx6LwidIDc
 Fo0wgvT7f3ra1kG8Qxo0C/PW+CW/jHl8oUXedW/ZeTrOMcu59U4vz6luprsm8n4rKs0o
 LL8/pP7VsWejZczbgFWn7bDQVLHvRSUsimYgLZaiusojf3ZnzqrJPYOddQNashyMTT3D
 6nbCCvedQcphnp7D/OpFqSZUvY9MMrkYFVDiovOKRP/e8NgwVnfH+d5GpLRl3vRmyevv
 YgjtVqSmTVsn4Pz7me5Mk+4fIBQRDlkSzXyxcoti6H2JR9XCFcnRo3xQKyVT50kpQm5+
 kpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vnJl0L26F6/cF4LoX36tFsaUdJl5yJVNsgmOYHfsRBo=;
 b=xeNsfyQSNOSsqhTRO15E7uOyJwn73MU0IC4RO+ir55MHcenYij4w5w7PfhsHHTGXIq
 oKdKRG8nWHX2yMt6Qsw2cd2/wxOQsA/lFzGRLj++L+YjQwcX1eQ2TcWO87GrOLjVgbo4
 BqyNvJZtvKIshjcessEiIpFRUXjHvtZ+Nk7g5FgVjQyl6Ju770Q2U6LYk9hHB1vVxQBl
 fEirfU/iyUZYHUI1tmzcy40Ms/+hbk5N3Bdl8RMK9pKtIRcSFj0bp7pXqBBt2I8C+s2e
 w76KTkSsF5TmxtJfk3utFCEqX0T38sCydUHa6WUzaWR4RKO7a+vH38IVAaV7J/pz3/Fp
 uqxg==
X-Gm-Message-State: ACrzQf2uwvVghFLTNUqQo5faF1tDItyYIi4/8DULMPnuj+AOMVUorKyK
 JKCBKmEd7EPqQuNUZ1Lfgb/ULtWantC8Nk7g1ZI=
X-Google-Smtp-Source: AMsMyM42HTbF/UFDvgdJ38PdEt0hijqa/khgCG00F9Fw/uY27h2or8B5g7sF95ObpJXZFD0OXeAG8T7xvZxPYQltuX0=
X-Received: by 2002:a05:6402:2b8f:b0:453:2e59:364d with SMTP id
 fj15-20020a0564022b8f00b004532e59364dmr14954390edb.254.1663581346809; Mon, 19
 Sep 2022 02:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_ED24158E83CB9885E8BDD173EB5896B51906@qq.com>
 <87pmfrpv7q.fsf@intel.com>
In-Reply-To: <87pmfrpv7q.fsf@intel.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Mon, 19 Sep 2022 17:55:35 +0800
Message-ID: <CAJedcCxWAjsB-zcGn_epE=1d=LTeX-ndNunLqQJ842+ptjy=Bw@mail.gmail.com>
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

Got it. I'll try again later.

Best Regards,
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
