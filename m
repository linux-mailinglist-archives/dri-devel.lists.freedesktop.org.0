Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C33A18DA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 17:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75766E44E;
	Wed,  9 Jun 2021 15:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB16E420;
 Wed,  9 Jun 2021 15:13:16 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id i17so26732601ilj.11;
 Wed, 09 Jun 2021 08:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6tH9AOagkax/O9BjJ9j1G1+5RQygul9R1dISwXADcHw=;
 b=a/5jHUeAhMVhK8wrcVbUr5KRMACc+WsTq7/EZ6Y3Or8PAmHSBXPJ77ObGTLyY+f3d3
 i9IZ7Bwtpa/3KMnKNBHvXtpbwR5GI83hkuhswDa5PMal0iGefqc0BQ+D/7L13aEa9yEA
 C1zlQeLdqCfYomPNXJckEQCMsEUZpcIUXN5y40WDq9w/+X8QvM9SR9OpFgs5ytCV+n+X
 T1v32i61zeUiJ7/Eg1Pg84rLCIT7BxdJHVuTuIy96P4rJnPxFgf54avx1sh+Fw3MSTKZ
 PAEe5Rl5FvYkW5VT2/Gi64q2L8FEQj9aCjy9MEP9/3sTpYZKmWEWv6gYngIGYWKh4hWg
 ADig==
X-Gm-Message-State: AOAM5335o+B1Hq+QMZlhz4eUWzXtNN2rnx+W56brVB66sUjM+h9fUKZv
 RIgZJBe/sRsh3agUT+64rKXeXauYc2Isf1/FlVwCDE1qvsM=
X-Google-Smtp-Source: ABdhPJxbB4VcVleBOfm2GHknEWMtgPQER9zM3CwQk5d08EKzfS/w15P5/P4q3Dny0FXMg4bRGYQPTSzMEDLCzeO+G6U=
X-Received: by 2002:a6b:c386:: with SMTP id t128mr23322633iof.65.1623251595657; 
 Wed, 09 Jun 2021 08:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
 <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
 <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
 <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
In-Reply-To: <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 9 Jun 2021 11:13:04 -0400
Message-ID: <CAKb7UvhX9mABdtOnq5Uu4zmKW6HLaJzfFakcXVB008U4hRsgng@mail.gmail.com>
Subject: Re: [Nouveau] Trouble with TTM patches w/nouveau in linux-next
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 matthew.auld@intel.com, linux-tegra <linux-tegra@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GEM init happens here:

https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/nouveau_g=
em.c#n221

Note the bo alloc / gem init / bo init dance.

I don't think there is a GEM object for internal allocations at all --
we just allocate bo's directly and that's it. Perhaps you meant
something else? I thought GEM was meant for externally-available
objects.

Cheers,

  -ilia

On Wed, Jun 9, 2021 at 10:58 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Good point, but I think that is unrelated.
>
> My suspicion is rather that nouveau is not initializing the underlying
> GEM object for internal allocations.
>
> So what happens is the same as on VMWGFX that TTM doesn't know anything
> about the size to of the BO resulting in a kmalloc() with a random value
> and eventually -ENOMEM.
>
> Good news is that I can reproduce it, so going to look into that later
> today.
>
> Regards,
> Christian.
>
> Am 09.06.21 um 16:52 schrieb Ilia Mirkin:
> > Christian - potentially relevant is that Tegra doesn't have VRAM at
> > all -- all GTT (or GART or whatever it's called nowadays). No
> > fake/stolen VRAM.
> >
> > Cheers,
> >
> >    -ilia
> >
> > On Wed, Jun 9, 2021 at 10:18 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Hi Mikko,
> >>
> >> strange sounds like Nouveau was somehow also using the GEM workaround
> >> for VMWGFX as well.
> >>
> >> But -12 means -ENOMEM which doesn't fits into the picture.
> >>
> >> I will try with a G710, but if that doesn't yields anything I need som=
e
> >> more input from you.
> >>
> >> Thanks for the report,
> >> Christian.
> >>
> >>
> >> Am 09.06.21 um 15:47 schrieb Mikko Perttunen:
> >>> Hi,
> >>>
> >>> I'm observing nouveau not initializing recently on linux-next on my
> >>> Tegra186 Jetson TX2 board. Specifically it looks like BO allocation i=
s
> >>> failing when initializing the sync subsystem:
> >>>
> >>> [   21.858149] nouveau 17000000.gpu: DRM: failed to initialise sync
> >>> subsystem, -28
> >>>
> >>> I have been bisecting and I have found two patches that affect this.
> >>> Firstly, things first break on
> >>>
> >>> d02117f8efaa drm/ttm: remove special handling for non GEM drivers
> >>>
> >>> starting to return error code -12. Then, at
> >>>
> >>> d79025c7f5e3 drm/ttm: always initialize the full ttm_resource v2
> >>>
> >>> the error code changes to the above -28.
> >>>
> >>> If I checkout one commit prior to d79025c7f5e3 and revert
> >>> d02117f8efaa, things work again. There are a bunch of other TTM
> >>> commits between this and HEAD, so reverting these on top of HEAD
> >>> doesn't work. However, I checked that both yesterday's and today's
> >>> nexts are also broken.
> >>>
> >>> Thank you,
> >>> Mikko
> >>>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.freedesktop.org%2Fmailman%2Flistinfo%2Fnouveau&amp;data=3D04%7C01%7Cchr=
istian.koenig%40amd.com%7Caaf09cbea0b04d8dc01208d92b5637ba%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637588472445308290%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;=
sdata=3DePoWVtHPXeK5RThkRuQSykKrfWCgPOzG5CLTzfw9%2Fuw%3D&amp;reserved=3D0
>
