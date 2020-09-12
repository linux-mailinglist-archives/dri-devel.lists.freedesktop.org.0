Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77226786C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 09:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE5C6E072;
	Sat, 12 Sep 2020 07:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F036E072
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 07:02:31 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z17so8054905lfi.12
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sior-be.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxzV7OeV/u6WZ1FrNJGs1u2GFmJUBCevegoF1E8SEwA=;
 b=DX3RTFww1uIDcS70n/yaRr9/zxHH0SOYtbFEtl7FdPpk7jQEu9yLEwkr3gCIzOKAWE
 s3V5d3ibBFPFGFZoeUPPZR88DNqTC4ThXdXAH567M++OPwgPa+LGiUMaLKDItCEsiVVE
 dbG1/qhpJpgXfWEA7P3w53Mtkc5Kl/QgTIWzS9EjKjOyOQXLn1PTFdrdbNZ17awEZf7S
 aHi+JBwV66f4JXCfuspOHrNdskixeI4gZRwyy1k/BCaUaKUXhtOlreuJFZsMwWzzbhHt
 lHgKLh9xw+2rjstTlQl1p8eru5q3MzpZkqgBy/3mMyhCY8+ssGj3XEbvte4W6dAeRgF5
 tvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxzV7OeV/u6WZ1FrNJGs1u2GFmJUBCevegoF1E8SEwA=;
 b=f3g0v+X8forDcpBbvy3RZTfsQQan25oMMUZ0rrhp/IrOZO0Kgmx364jZiqDegbB4EZ
 Vay5H2Br9WQaGrTEqFpjxP3EsvidwB+areIYbAzLx0FHyfvQt/L6//3Rpx7hymtRKF81
 EuK01YOpx3kCco6a+ep4JfVAN7UJqhnEAtoRmyq3tNph/smFprHMqxgHk704sEPcaRNM
 XdtYQWgn7V9PdgkEh/sUfMAKKbnLiatbND3YQoauLbjILlD9tTZGOvS/chqtpvQC0dYP
 pItEq0EXG2Uf+T5dPW20SF5ndNdasXTzQ9k9SDlv0wJ/1vUdmgZcWlSW3eYoJ0woxmtM
 tCHA==
X-Gm-Message-State: AOAM533JZ19EJhSYriV3SVuZGzK7nfF298UvlhCjQcJK85tXdGztbQ2I
 cTSBvoN18D/Ga7cMCwBrJ+4+Pr8wtUoOgnrjmCzBT9RXNYCZf08T
X-Google-Smtp-Source: ABdhPJwihLBYNiYtj9myRi7INttgreLMwWGBdvOILa/JUNAMywIm8xDJAy5b4IOM1A9qiEQrm1uXPjInaGYIslEEQpQ=
X-Received: by 2002:a19:85d7:: with SMTP id h206mr1467608lfd.325.1599894149788; 
 Sat, 12 Sep 2020 00:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <743818af-fa38-e31a-1780-84a6a7e72e25@web.de>
 <20200908181122.9100-1-aho@sior.be>
 <20200911053923.GS28614@zhen-hp.sh.intel.com>
In-Reply-To: <20200911053923.GS28614@zhen-hp.sh.intel.com>
From: Aho Sior <aho@sior.be>
Date: Sat, 12 Sep 2020 09:02:33 +0200
Message-ID: <CABGf9v-VXpVZk_pq_-iPCMXbezRK1NZy5oY9ZwgXvGETi4EVEQ@mail.gmail.com>
Subject: Re: [Intel-gfx][PATCH v2] drm/i915/gvt: Prevent NULL pointer
 dereference in intel_vgpu_reg_rw_edid()
To: Zhenyu Wang <zhenyuw@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Perfect!
I can confirm it resolves the issue as well, thank you very much.

Have a great day,
Alejandro Sior.


On Fri, 11 Sep 2020 at 07:58, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
>
> On 2020.09.08 20:11:21 +0200, Alejandro Sior wrote:
> > In the function intel_vgpu_reg_rw_edid of kvmgt.c, pos can be equal
> > to NULL for GPUs that do not properly support EDID. In those cases, when
> > pos gets passed to the handle_edid functions, it gets added a short offset
> > then it's dereferenced in memcpy's, leading to NULL pointer
> > dereference kernel oops.
> >
> > More concretely, that kernel oops renders some Broadwell GPUs users
> > unable to set up virtual machines with virtual GPU passthrough (virtual
> > machines hang indefinitely when trying to make use of the virtual GPU),
> > and make them unable to remove the virtual GPUs once the kernel oops has
> > happened (it hangs indefinitely, and notably too when the kernel tries to
> > shutdown). The issues that this causes and steps to reproduce are
> > discussed in more details in this github issue post:
> > https://github.com/intel/gvt-linux/issues/170#issuecomment-685806160
> >
> > Check if pos is equal to NULL, and if it is, set ret to a negative
> > value, making the module simply indicate that the access to EDID region
> > has failed, without any fatal repercussion.
> >
> > Signed-off-by: Alejandro Sior <aho@sior.be>
> >
> > ---
> > Changes in v2:
> > - removed middle name of author to comply with git name
> > - rephrased the patch description with imperative phrasing
> > - removed useless paragraph
> > - made a paragraph more concise
> > - fixed typos
> > - made individual lines shorter than 75 chars
> >
> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > index ad8a9df49f29..49163363ba4a 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -557,7 +557,9 @@ static size_t intel_vgpu_reg_rw_edid(struct intel_vgpu *vgpu, char *buf,
> >               (struct vfio_edid_region *)kvmgt_vdev(vgpu)->region[i].data;
> >       loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
> >
> > -     if (pos < region->vfio_edid_regs.edid_offset) {
> > +     if (pos == NULL) {
> > +             ret = -EINVAL;
> > +     } else if (pos < region->vfio_edid_regs.edid_offset) {
> >               ret = handle_edid_regs(vgpu, region, buf, count, pos, iswrite);
> >       } else {
> >               pos -= EDID_BLOB_OFFSET;
>
> Thanks for reporting this! Sorry that we failed to do sanity validation on older
> platform when enabling vfio edid function for all platform.
>
> Could you try below one to see if it fixes your problem? Instead of refusing
> possible read of edid, this fixes port number for BDW.
>
> From d5d9304b6bfdc31356fd2feb1ddbbf28073fe3d4 Mon Sep 17 00:00:00 2001
> From: Zhenyu Wang <zhenyuw@linux.intel.com>
> Date: Fri, 11 Sep 2020 13:50:20 +0800
> Subject: [PATCH] drm/i915/gvt: Fix port number for BDW on EDID region setup
>
> Current BDW virtual display port is initialized as PORT_B, so need
> to use same port for VFIO EDID region, otherwise invalid EDID blob
> pointer is assigned.
>
> Fixes: 0178f4ce3c3b ("drm/i915/gvt: Enable vfio edid for all GVT supported platform")
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/vgpu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> index 8fa9b31a2484..f6d7e33c7099 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -368,6 +368,7 @@ void intel_gvt_destroy_idle_vgpu(struct intel_vgpu *vgpu)
>  static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
>                 struct intel_vgpu_creation_params *param)
>  {
> +       struct drm_i915_private *dev_priv = gvt->gt->i915;
>         struct intel_vgpu *vgpu;
>         int ret;
>
> @@ -436,7 +437,10 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
>         if (ret)
>                 goto out_clean_sched_policy;
>
> -       ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
> +       if (IS_BROADWELL(dev_priv))
> +               ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
> +       else
> +               ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
>         if (ret)
>                 goto out_clean_sched_policy;
>
> --
> 2.28.0
>
>
>
> --
>
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
