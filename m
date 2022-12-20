Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6F2651CCE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652D410E09C;
	Tue, 20 Dec 2022 09:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437F410E09C;
 Tue, 20 Dec 2022 09:03:54 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1442977d77dso14692586fac.6; 
 Tue, 20 Dec 2022 01:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UzvNL+TsR6wJp/VVk0N1EHg2FFHt1BbH9bwtEX37Mi8=;
 b=l3PXEmY/Kh0b3BeAbHpZa0feNze1JUpM8+hStS2W1fAAhwIMr19+c7vde4hb3ClotP
 Je6KhjVpQ3nXGc+tmOdyLDy1po5FWDBYKeh3I0dcKWIb49j6tkB8f3AIgrICYeIEDYo6
 vwbcqk2Oz9ctUixuyecsbsY7PtYPFr5RuMYa2CAix4hdO/zOtysHwkRTIuW4Za+b8R0T
 fD0n7MzKKc8jibi1q4YkG7zWGsHs7/zmm35OhNU+w5QLrsyN1gZBG1PVQPHgTF3MMs9H
 4LkJytrnPymeTkXq5oXhKRy0tzt2k3W2V1XWQz0kOpmvPcCjQ23PtZWRsfyXpOxXk5yP
 jicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UzvNL+TsR6wJp/VVk0N1EHg2FFHt1BbH9bwtEX37Mi8=;
 b=Bgt+WNyRHY/hAdhQi9jKnoVht9MTZxE/ewEZZ56KBH4IrYRd9rKf0oNmdy3rI5LS1f
 nfeylwB58bbC4pkRVOBG8ghfhVu8EFpLFPxWfcrNfdd4S4c75n9bbvvOhrdjpLKZCT9y
 fy+6+ddAsu5mwWjwyNz2sd0d4QfwjCTU69NMaEoGeP8DVztBEIlDKK8j8LK/1bLaZfgK
 5OcpQh5lv8rygvqeaPnFhQSoqlZ7u8+KhQ8tamewRoweqSb/Np6/GDWMPlkUhSIER3vL
 PR3U0Yzv15qiHusXiwn5cLT8l/H67v0bGD48FbeElG0jqZHegwhaA9OP+YiDokVbRhHj
 hhMQ==
X-Gm-Message-State: AFqh2krpwtdc2jtbXPnaFY4lUNJaULNVult4h+TeO5sPymKcuVi5E1Kh
 z2j52fSwqKQ7ZN/hk2aYyN20prdNs18iXmo3Wh8=
X-Google-Smtp-Source: AMrXdXveFr80wwpqNX3EU58rZEURdkoOkmVxIfys7NPcpdUmvbzGH0j/NN1RcyEMJ4xghKpphstg1uEAj1cGVX+gMlU=
X-Received: by 2002:a05:6870:6083:b0:14b:7e0a:eefa with SMTP id
 t3-20020a056870608300b0014b7e0aeefamr1637834oae.49.1671527033285; Tue, 20 Dec
 2022 01:03:53 -0800 (PST)
MIME-Version: 1.0
References: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
 <20221219125204.1001149-1-zyytlz.wz@163.com>
 <20221220082255.GE30028@zhen-hp.sh.intel.com>
In-Reply-To: <20221220082255.GE30028@zhen-hp.sh.intel.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 20 Dec 2022 17:03:41 +0800
Message-ID: <CAJedcCzD6Zc=ncxH5821OA=zL49bUFqD2hYT=TruU2AVt+_2hg@mail.gmail.com>
Subject: Re: [RESEND PATCH v4] drm/i915/gvt: fix double free bug in
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

Zhenyu Wang <zhenyuw@linux.intel.com> =E4=BA=8E2022=E5=B9=B412=E6=9C=8820=
=E6=97=A5=E5=91=A8=E4=BA=8C 16:25=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022.12.19 20:52:04 +0800, Zheng Wang wrote:
> > If intel_gvt_dma_map_guest_page failed, it will call
> >  ppgtt_invalidate_spt, which will finally free the spt. But the caller =
does
> >  not notice that, it will free spt again in error path.
> >
>
> It's not clear from this description which caller is actually wrong,
> better to clarify the problem in ppgtt_populate_spt_by_guest_entry() func=
tion.
>

Get it, will do in the next fix.


> >                                                  PAGE_SIZE, &dma_addr);
> > -             if (ret) {
> > -                     ppgtt_invalidate_spt(spt);
> > -                     return ret;
> > -             }
> > +             if (ret)
> > +                     goto err;
>
> I think it's fine to remove this and leave to upper caller, but again ple=
ase
> describe the behavior change in commit message as well, e.g to fix the sa=
nity
> of spt destroy that leaving previous invalidate and free of spt to caller=
 function
> instead of within callee function.

Sorry for my bad habit. Will do in the next version.

> >               sub_se.val64 =3D se->val64;
> >
> >               /* Copy the PAT field from PDE. */
> > @@ -1231,6 +1229,47 @@ static int split_2MB_gtt_entry(struct intel_vgpu=
 *vgpu,
> >       ops->set_pfn(se, sub_spt->shadow_page.mfn);
> >       ppgtt_set_shadow_entry(spt, se, index);
> >       return 0;
> > +err:
> > +     /* Undone the existing mappings of DMA addr. */
> > +     for_each_present_shadow_entry(spt, &e, parent_index) {
>
> sub_spt? We're undoing what's mapped for sub_spt right?

Yes, will change it to sub_spt in the next version.

>
> > +             switch (e.type) {
> > +             case GTT_TYPE_PPGTT_PTE_4K_ENTRY:
> > +                     gvt_vdbg_mm("invalidate 4K entry\n");
> > +                     ppgtt_invalidate_pte(spt, &e);
> > +                     break;
> > +             case GTT_TYPE_PPGTT_PTE_64K_ENTRY:
> > +                     /* We don't setup 64K shadow entry so far. */
> > +                     WARN(1, "suspicious 64K gtt entry\n");
> > +                     continue;
> > +             case GTT_TYPE_PPGTT_PTE_2M_ENTRY:
> > +                     gvt_vdbg_mm("invalidate 2M entry\n");
> > +                     continue;
> > +             case GTT_TYPE_PPGTT_PTE_1G_ENTRY:
> > +                     WARN(1, "GVT doesn't support 1GB page\n");
> > +                     continue;
> > +             case GTT_TYPE_PPGTT_PML4_ENTRY:
> > +             case GTT_TYPE_PPGTT_PDP_ENTRY:
> > +             case GTT_TYPE_PPGTT_PDE_ENTRY:
>
> I don't think this all entry type makes sense, as here we just split
> 2M entry for multiple 4K PTE entry.

I got it. I will leave the code for handling 4K PTE entry only.

>
> > +                     gvt_vdbg_mm("invalidate PMUL4/PDP/PDE entry\n");
> > +                     ret1 =3D ppgtt_invalidate_spt_by_shadow_entry(
> > +                                     spt->vgpu, &e);
> > +                     if (ret1) {
> > +                             gvt_vgpu_err("fail: shadow page %p shadow=
 entry 0x%llx type %d\n",
> > +                             spt, e.val64, e.type);
> > +                             goto free_spt;
> > +                     }
>
> for above reason, I don't think this is valid.

Got it.


Thanks for your carefully reviewing. I'll try to fix that in the coming pat=
ch.

Best regards,
Zheng Wang
