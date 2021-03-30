Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE12434ED15
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 18:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0689FCA;
	Tue, 30 Mar 2021 16:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9689FCA;
 Tue, 30 Mar 2021 16:03:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b9so16729813wrt.8;
 Tue, 30 Mar 2021 09:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6oj2QpU+iRP2QcXpQSoeLL823H9nv69wn1Ubcw3X/Kc=;
 b=oGf3rAc09tWox8W/AuayHxD57BYJkHett6R/hVoRJQkI/dsuvVQsdL+66QBQPYbZO8
 7THhwdyV51H945ZoxJJ5jgoQE1adMP2x6g1L6OVgqjahcsNzGiHVTu6IA/7mHr+IJoTe
 G2IRldQQOICbaa1RBtBbDZfRIbW4FXgw9hnfwAzpMP4E4foZcweEiry54xruXlagP21k
 XcoOokxVvs+Qse2Rf6Tt4VeNyK1jyyBHKCIvomFRhW/IRq3T5TGpU3ZuLfmOfUUI5hQs
 P/3sUmpZ5wxSwYnZxo9dJhApM9eLAmfB4ezalW1zrr0WOpAGs8ZoUsMpZDJ6ZjUb1W2R
 qWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oj2QpU+iRP2QcXpQSoeLL823H9nv69wn1Ubcw3X/Kc=;
 b=VqbMs5FhB5WXwhYKBPJsTf9LSE1oLamBE9T2UTuxO5XUFjnUHjfVgf/hv4ThH8Cza3
 jEoxvW3tQV/3v6MAXvzPIhpO/I4itVx8IjOyhkxo8ux7HxxmuAxZKAqczPneH1Peamvp
 VFykyoFX6fmh1tCx90ZqmEw0IC9AYQ4k+fSZd9F6e5NPYaSIlnBo4avU9MEe6asJ4WpM
 mtF4v80IejbXgD2nKWDYm4VjmXN95HRuYmReUv9EL+3GnrpMR9pKVCjy+iRHGQ6bMgfk
 QGaUOUhIhYv5vBOA3HpoZsT5KZobZMfwPFfELPfU5p7nr8TNp/nOIN+Q9iVhZUY+Bj6n
 s/2g==
X-Gm-Message-State: AOAM5338WH+tBjNlEF/xGktGLq3cM1A2I9UG39pJtAtT2C9qG8Wg1RAi
 bokAdzCl8VAVE4HxdtDd+g5KOn0Dhx5xTmxhK/8=
X-Google-Smtp-Source: ABdhPJyIo4QMtpT4Jjy6Aso1yAaVwCCbPHuaf9YAguVzhh4oj3SzRFzxG8rjYLqc6NicwaW7b/FSImz48Hamu6fJQ0Y=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr35756480wrh.28.1617120234562; 
 Tue, 30 Mar 2021 09:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210326231303.3071950-1-eric@anholt.net>
 <20210329144729.GB4203@willie-the-truck>
 <CAF6AEGugpEk396DVtWX=W+uf3p-wcgBfCSpSLWGQJE1vKpJ4aw@mail.gmail.com>
 <20210330093432.GB5281@willie-the-truck>
 <CAF6AEGvCCWvmRBhzY4MsdzgwfJ+GF2AUOS-_NTyhM8wtnDzY2Q@mail.gmail.com>
 <20210330153050.GB6567@willie-the-truck>
In-Reply-To: <20210330153050.GB6567@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 30 Mar 2021 09:07:18 -0700
Message-ID: <CAF6AEGs+gUZ+5kmyA0Xz4jz8QJRgLVfaWmvQzuwXZBBG4xAr5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
To: Will Deacon <will@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 8:31 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Mar 30, 2021 at 08:03:36AM -0700, Rob Clark wrote:
> > On Tue, Mar 30, 2021 at 2:34 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Mon, Mar 29, 2021 at 09:02:50PM -0700, Rob Clark wrote:
> > > > On Mon, Mar 29, 2021 at 7:47 AM Will Deacon <will@kernel.org> wrote:
> > > > >
> > > > > On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> > > > > > db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> > > > > > the GPU from wedging and then sometimes wedging the kernel after a
> > > > > > page fault), but it doesn't have separate pagetables support yet in
> > > > > > drm/msm so we can't go all the way to the TTBR1 path.
> > > > >
> > > > > What do you mean by "doesn't have separate pagetables support yet"? The
> > > > > compatible string doesn't feel like the right way to determine this.
> > > >
> > > > the compatible string identifies what it is, not what the sw
> > > > limitations are, so in that regard it seems right to me..
> > >
> > > Well it depends on what "doesn't have separate pagetables support yet"
> > > means. I can't tell if it's a hardware issue, a firmware issue or a driver
> > > issue.
> >
> > Just a driver issue (and the fact that currently we don't have
> > physical access to a device... debugging a5xx per-process-pgtables by
> > pushing untested things to the CI farm is kind of a difficult way to
> > work)
>
> But then in that case, this is using the compatible string to identify a
> driver issue, no?
>

Well, I suppose yes.. but OTOH it is keeping the problem out of the
dtb.  Once per-process pgtables works for a5xx, there would be no dtb
change, just a change to the quirk behavior in arm-smmu-qcom.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
