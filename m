Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B046C7BD1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD0910EB97;
	Fri, 24 Mar 2023 09:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A317E10EBA5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:46:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so2753475wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1679651164;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJJPNwdnhB7IEUXT0JnB6iYS0mxcFwN9Ppf5t8hZzl0=;
 b=Qa5OozZIoo53C5F+9azNMKZ21DB0vyydBQZAXgS8Chw91SQ1BJh/YnRGO1VlHf+QDW
 NqJGq+76prl0S1xv0UN00iYF2Bcwn9MwJ2u+hl338DaU0W7zfnh0k0xaTP+snNZR8wXB
 NVhLlHPLJoaHlxMr4jMkL1ELSluWeVhWBZxTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679651164;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJJPNwdnhB7IEUXT0JnB6iYS0mxcFwN9Ppf5t8hZzl0=;
 b=Yov76KwCscTtnaw5erMwWJC7bP5EDUBcon6XWoxUlCQjxbsSH4HViIBgYxHSJrRSNE
 21cSvi9sBuAbX72cnVFjuJhxW4WaT+OYhU9eSXLoGHSn3ABeTNsawnpedGJpgOxaIqwy
 wSEla89g4gUKhi8DWYGYRyDlcV0qEGIx4RBs54vlQLxQqBfDOoFDHYM7kAITjiOAYo6n
 v11Lg2OCeZaBe8m90NLEVWjLgRBNZJ9itWfCFg/Y5YRGi81pgqQfJxxGuUiu6YU8uEHA
 23NKiWoBtHZPqOWBu933JcpfKm5o40FVS3M17Jv6KOpWgIh9O5pC1+iMsgFwgedGdbly
 Vlww==
X-Gm-Message-State: AO0yUKU4GjWPyY0f+tcKsFwv+jlzk1nVVk7Zm33dascxvbnTdz9HcPdq
 VgO+9X1LvdPOQpwBY/PN4DwPsA==
X-Google-Smtp-Source: AK7set/XwgOJNEXGcex+NV0vGUZdreitg2m5Y+Upud+kwI0Y7U+h+kwJ6hiaNA1oq8/pyWeh2R5p1g==
X-Received: by 2002:a05:600c:4fc1:b0:3ed:2a41:8529 with SMTP id
 o1-20020a05600c4fc100b003ed2a418529mr1438389wmq.2.1679651164092; 
 Fri, 24 Mar 2023 02:46:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 14-20020a05600c024e00b003ed2384566fsm4369256wmj.21.2023.03.24.02.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:46:03 -0700 (PDT)
Date: Fri, 24 Mar 2023 10:46:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Message-ID: <ZB1xWRo0rkhku2BS@phenom.ffwll.local>
Mail-Followup-To: Jon Hunter <jonathanh@nvidia.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230127221418.2522612-1-arnd@kernel.org>
 <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
 <20230308165644.GA1181835@dev-arch.thelio-3990X>
 <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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

On Wed, Mar 08, 2023 at 05:28:06PM +0000, Jon Hunter wrote:
> 
> 
> On 08/03/2023 16:56, Nathan Chancellor wrote:
> > Ping? This warning is now in 6.3-rc1.
> 
> Thierry is away at the moment.
> 
> David, Daniel, do you want to pick this up directly in the meantime as a fix
> for 6.3? Mikko has already reviewed and FWIW ...

Generally first fallback should be drm-misc maintainers (or anyone else
with commit rights), but since this fell through cracks for weeks it seems
I'll pick it up to drm-fixes now directly.
-Daniel

> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Thanks
> Jon
> 
> 
> > On Thu, Feb 23, 2023 at 09:28:28AM -0700, Nathan Chancellor wrote:
> > > Hi Thierry, Daniel, and David,
> > > 
> > > On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > 
> > > > The error handling for platform_get_irq() failing no longer
> > > > works after a recent change, clang now points this out with
> > > > a warning:
> > > > 
> > > > drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
> > > >          if (syncpt_irq < 0)
> > > >              ^~~~~~~~~~
> > > > 
> > > > Fix this by removing the variable and checking the correct
> > > > error status.
> > > > 
> > > > Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > > ---
> > > >   drivers/gpu/host1x/dev.c | 5 ++---
> > > >   1 file changed, 2 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > > > index 4872d183d860..aae2efeef503 100644
> > > > --- a/drivers/gpu/host1x/dev.c
> > > > +++ b/drivers/gpu/host1x/dev.c
> > > > @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
> > > >   static int host1x_probe(struct platform_device *pdev)
> > > >   {
> > > >   	struct host1x *host;
> > > > -	int syncpt_irq;
> > > >   	int err;
> > > >   	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> > > > @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
> > > >   	}
> > > >   	host->syncpt_irq = platform_get_irq(pdev, 0);
> > > > -	if (syncpt_irq < 0)
> > > > -		return syncpt_irq;
> > > > +	if (host->syncpt_irq < 0)
> > > > +		return host->syncpt_irq;
> > > >   	mutex_init(&host->devices_lock);
> > > >   	INIT_LIST_HEAD(&host->devices);
> > > > -- 
> > > > 2.39.0
> > > > 
> > > 
> > > Apologies if this has been reported already or has a solution in
> > > progress but mainline is now broken because this change got separated
> > > from the change it is fixing:
> > > 
> > > https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4249931209/jobs/7391912774
> > > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2M7y9HpiXB13qiC2mkHMyeZOcLW/build.log
> > > 
> > > I see this change sitting in the drm-tegra tree [1], which is getting
> > > merged into -next, so it is fixed there, which is why we did not notice
> > > any issues until the drm-next tree was merged into mainline. Can this be
> > > fast tracked to Linus to unbreak clang builds with -Werror?
> > > 
> > > [1]: https://gitlab.freedesktop.org/drm/tegra/-/commit/b9930311641cf2ed905a84aabe27e8f3868aee4a
> 
> -- 
> nvpublic

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
