Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEF8652C3B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 06:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5331D10E40F;
	Wed, 21 Dec 2022 05:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929D510E00B;
 Wed, 21 Dec 2022 05:01:38 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so8439182otu.7; 
 Tue, 20 Dec 2022 21:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDUOHVCc9K3hdDQtTl6zCt6I0//F7xbzgiL5zzmDHKU=;
 b=meh0/v7prpFdpKiPJ2jFndEeeaLwe28XcA3Wg4xD2/6znobuR8gOtGAT62vSkwC/y3
 bUaZKxv6XpNj0JW3vKL5hqC9tW5LPcucYX09ux9reWhiU9gIdavVc1E6DVwW2m1geAbz
 J+B+aL17Me09HsYZR3ecaY/VTK0codX/zMleIguScWjX/nZ5mnbnJTAzYqsCAf0hH8NS
 oapnDOL3/5601W6BxO5x1miXR1WtbM5i1M+eyppj8QT6SV32q+olRoVOm6TjiSecc9sF
 ltkd9asgtFUyObo5WUS6NtA2Ocw7oc258SBFzcjx3XrwaFYczF3+Np64hDi1usb8MRw1
 r5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uDUOHVCc9K3hdDQtTl6zCt6I0//F7xbzgiL5zzmDHKU=;
 b=M12arGmswzyADbjiIXPwyS4eSbMLHN3vZodfujVReyZSH1DqiIVeOLR+ZcgD1MDLrg
 LaVWwmO+ljjmMk78KKg5gysWzfcLlQXwdazoLgAdEcKPwqsoKBRG1+4TQUoEMH/SqIbY
 mD0K6lpGyEK27Bgk+yIQDN/zVYwYARzhIUz28Yey3e+1eBYyidte7Xm3GnSA1yx7xOIM
 6Olyr1upc7QhDqAEywsaR3i437gLP8h+yuxNXZ0rKc9FM/qCryU6ncaFLs8XE7tYX71P
 bS9HEWdNnFeAQ9vhtKJCARBJl40hun5ol8rV/K0jreEG4ov18nHghWsp7ZTv6f4GDc1I
 qHsQ==
X-Gm-Message-State: AFqh2kqzPpsPy0+f49HCT/EOUmoEkSnGoWnp+VfdHYW8dMKuXCuOfopc
 f4UvmIiT+i8tyQokDgAatrCCYnqo8dCYFddKrts=
X-Google-Smtp-Source: AMrXdXtS1JI4CuCqdbp9KkbNyVpLqhCpVOQBSeOh2PyUNfq8iexFzbkqPy13qZFcsTa54khLLs/pav+EzFCl8ZS6zV8=
X-Received: by 2002:a05:6830:3095:b0:670:7942:b562 with SMTP id
 g21-20020a056830309500b006707942b562mr41452ots.84.1671598897767; Tue, 20 Dec
 2022 21:01:37 -0800 (PST)
MIME-Version: 1.0
References: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
 <20221220094014.1128207-1-zyytlz.wz@163.com>
 <20221221025857.GG30028@zhen-hp.sh.intel.com>
In-Reply-To: <20221221025857.GG30028@zhen-hp.sh.intel.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Wed, 21 Dec 2022 13:01:26 +0800
Message-ID: <CAJedcCyvSW_RAOrzUkWM8Li8x6Jkd0FL6uCXCz2Jzk33dng4jQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
To: Zhenyu Wang <zhenyuw@linux.intel.com>
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
Cc: alex000young@gmail.com, security@kernel.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1002992920@qq.com, Zheng Wang <zyytlz.wz@163.com>,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zhenyu Wang <zhenyuw@linux.intel.com> =E4=BA=8E2022=E5=B9=B412=E6=9C=8821=
=E6=97=A5=E5=91=A8=E4=B8=89 11:01=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022.12.20 17:40:14 +0800, Zheng Wang wrote:
> > If intel_gvt_dma_map_guest_page failed, it will call
> >  ppgtt_invalidate_spt, which will finally free the spt. But the
> >  caller function ppgtt_populate_spt_by_guest_entry does not notice
> >  that, it will free spt again in its error path.
>
> indent

Yeap :)

> > +             if (ret)
> > +                     goto err;
> >               sub_se.val64 =3D se->val64;
> >
> >               /* Copy the PAT field from PDE. */
> > @@ -1231,6 +1229,18 @@ static int split_2MB_gtt_entry(struct intel_vgpu=
 *vgpu,
> >       ops->set_pfn(se, sub_spt->shadow_page.mfn);
> >       ppgtt_set_shadow_entry(spt, se, index);
> >       return 0;
> > +err:
> > +     /* Undone the existing mappings of DMA addr. */
>
> We need a verb here for Undo.

Get it.

>
> > +     for_each_present_shadow_entry(sub_spt, &sub_se, sub_index) {
> > +             gvt_vdbg_mm("invalidate 4K entry\n");
> > +             ppgtt_invalidate_pte(sub_spt, &sub_se);
> > +     }
> > +     /* Release the new allocated spt. */
> > +     trace_spt_change(sub_spt->vgpu->id, "release", sub_spt,
> > +             sub_spt->guest_page.gfn, sub_spt->shadow_page.type);
> > +     ppgtt_free_spt(sub_spt);
> > +     sub_spt =3D NULL;
>
> Not need to reset local variable that has no use then.
>
> I'll handle these trivial fixes during the merge.
>

Very thanks for that.

Best regards,
Zheng Wang
