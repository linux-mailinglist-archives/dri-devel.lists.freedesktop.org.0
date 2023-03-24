Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084016C7C14
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2D210EBB4;
	Fri, 24 Mar 2023 09:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1710EBB4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:59:35 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-17aeb49429eso1222220fac.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1679651974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3S1jZpPFamxYpM15q1AsKfyrzurt5PTq4wNBIuUsWUI=;
 b=QYW+l3DBUnQ5ubmYmXBr0H1dxlZ4HSLqh7wMlwF3ocB1NGNlLlfABYYXqOkIlu/qWx
 chXDwyqc0t3c6D9QdQ4Jem9Okt6b6TJ2rlECoLD11Lovfw1LHQJajCmUaHHrTx5sZM0s
 b076vp1OwlQK4nnvJWTh/gCUBqGaYjFE6MKG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679651974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3S1jZpPFamxYpM15q1AsKfyrzurt5PTq4wNBIuUsWUI=;
 b=4VHEvZKGFMwGdip0xvZhuCPvD8ftSRnPRWw6eYldZjf/sSUkc08GbmOtERbsaUmUDM
 rR/fD/QiYWkgRLKIZGawQ0K4FCTAfpfOcqC3fJDZE8EJ7ngRaFFEZSNpL/T/rvLhHMtF
 gN6FVnkkR4X9uRpFVOo7hZkLVaZzJt5pfq9N3RRNE/GjsnCpjy2q2SY2RSd7PcfAW2Ac
 BoisFL5MRNZosk/ol3a10+x2+zkaqWqKeDR1boQ2qm6J5JbLFTWg/FpOP1lC/+/P3FRY
 zVL4IOntr8w/O5EUJqEipX7IdzlaVDUA7JVIxzPDHPoWXXUL8oY+ZkKs/MX2TzSCi6vz
 zWqw==
X-Gm-Message-State: AAQBX9fzVKEIsuXUqiydpFWdRlimek2xkSLmm7tUdhZohrjibYQu6X87
 R/QEVSNcRfb2EEm73k/H7HnOHoD45gGSZPR8Jl8IwA==
X-Google-Smtp-Source: AK7set8nnSsWs0sg/cfPv8YNM0ZQhXr8KxqRW4ooPSiAH3ue+FwWvT+JfLiS9Ro4hwDEE7/aUEiXBwoGKN/IAsNiCbA=
X-Received: by 2002:a05:6870:1050:b0:177:bf3e:5d4f with SMTP id
 16-20020a056870105000b00177bf3e5d4fmr837720oaj.8.1679651974508; Fri, 24 Mar
 2023 02:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230127221418.2522612-1-arnd@kernel.org>
 <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
 <20230308165644.GA1181835@dev-arch.thelio-3990X>
 <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
 <ZB1xWRo0rkhku2BS@phenom.ffwll.local>
In-Reply-To: <ZB1xWRo0rkhku2BS@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 Mar 2023 10:59:23 +0100
Message-ID: <CAKMK7uF4tYyw6Eio6YkWZpBej1J8_5+VLU_hvVbL-Lnk06=v1g@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
To: Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Nathan Chancellor <nathan@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Mar 2023 at 10:46, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Mar 08, 2023 at 05:28:06PM +0000, Jon Hunter wrote:
> >
> >
> > On 08/03/2023 16:56, Nathan Chancellor wrote:
> > > Ping? This warning is now in 6.3-rc1.
> >
> > Thierry is away at the moment.
> >
> > David, Daniel, do you want to pick this up directly in the meantime as a fix
> > for 6.3? Mikko has already reviewed and FWIW ...
>
> Generally first fallback should be drm-misc maintainers (or anyone else
> with commit rights), but since this fell through cracks for weeks it seems
> I'll pick it up to drm-fixes now directly.

Ok I think I found out why this fell through cracks, MAINTAINERS isn't
updated that host1x&tegra is maintained in drm-misc.

John, since Thierry is out, can you pls create the MAINTAINERS patch to
- point at drm-misc git repo everywhere needed
- add any missing host1x paths to the drm-misc entry so that
get_maintainers.pl adds the right people for this patch (currently it
doesn't)

Also should we have at least a 2nd person for tegra stuff (or well
maybe nvidia stuff in general) for drm-misc? Currently it's just
Thierry, and I don't think that's enough. Whomever gets volunteered
please follow

https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc

Thanks, Daniel


>
> >
> > Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> >
> > Thanks
> > Jon
> >
> >
> > > On Thu, Feb 23, 2023 at 09:28:28AM -0700, Nathan Chancellor wrote:
> > > > Hi Thierry, Daniel, and David,
> > > >
> > > > On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
> > > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > >
> > > > > The error handling for platform_get_irq() failing no longer
> > > > > works after a recent change, clang now points this out with
> > > > > a warning:
> > > > >
> > > > > drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
> > > > >          if (syncpt_irq < 0)
> > > > >              ^~~~~~~~~~
> > > > >
> > > > > Fix this by removing the variable and checking the correct
> > > > > error status.
> > > > >
> > > > > Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
> > > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > > > ---
> > > > >   drivers/gpu/host1x/dev.c | 5 ++---
> > > > >   1 file changed, 2 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > > > > index 4872d183d860..aae2efeef503 100644
> > > > > --- a/drivers/gpu/host1x/dev.c
> > > > > +++ b/drivers/gpu/host1x/dev.c
> > > > > @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
> > > > >   static int host1x_probe(struct platform_device *pdev)
> > > > >   {
> > > > >         struct host1x *host;
> > > > > -       int syncpt_irq;
> > > > >         int err;
> > > > >         host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> > > > > @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
> > > > >         }
> > > > >         host->syncpt_irq = platform_get_irq(pdev, 0);
> > > > > -       if (syncpt_irq < 0)
> > > > > -               return syncpt_irq;
> > > > > +       if (host->syncpt_irq < 0)
> > > > > +               return host->syncpt_irq;
> > > > >         mutex_init(&host->devices_lock);
> > > > >         INIT_LIST_HEAD(&host->devices);
> > > > > --
> > > > > 2.39.0
> > > > >
> > > >
> > > > Apologies if this has been reported already or has a solution in
> > > > progress but mainline is now broken because this change got separated
> > > > from the change it is fixing:
> > > >
> > > > https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4249931209/jobs/7391912774
> > > > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2M7y9HpiXB13qiC2mkHMyeZOcLW/build.log
> > > >
> > > > I see this change sitting in the drm-tegra tree [1], which is getting
> > > > merged into -next, so it is fixed there, which is why we did not notice
> > > > any issues until the drm-next tree was merged into mainline. Can this be
> > > > fast tracked to Linus to unbreak clang builds with -Werror?
> > > >
> > > > [1]: https://gitlab.freedesktop.org/drm/tegra/-/commit/b9930311641cf2ed905a84aabe27e8f3868aee4a
> >
> > --
> > nvpublic
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
