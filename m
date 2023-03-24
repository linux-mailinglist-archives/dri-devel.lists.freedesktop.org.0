Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A17C6C7CDC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 11:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE06310EBB9;
	Fri, 24 Mar 2023 10:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4670910EBAB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 10:50:26 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 f4-20020a9d0384000000b0069fab3f4cafso671762otf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1679655025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LA3Zcbbrd2EPDNxAP1qxAnsroRRZb68Sab3Jkh0P0Sc=;
 b=Ml2sbeXt/dJV+DVGdd+scTwplDkwCY6tNDAarNSO3EkTPvCC5TMw0SXUB/1GzsyHlb
 Q/hm5Fs1tVJHZiaUSjpj4ilnnjhayYRhd1Jb5N8YsoVyBUjufC8K2OsitmUyB/8AVL9F
 fH381F+xJ4iNHp8+pGopMBOJLEhExFdBuAkHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679655025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LA3Zcbbrd2EPDNxAP1qxAnsroRRZb68Sab3Jkh0P0Sc=;
 b=kWL6VwUbthLJxjIoKQvrkJTOt2mPpHPopmMInkIWGT6VCuyOrGPckf66n8rgK/lVW9
 5Dro/046VMkpBj/mPXyHgc8RDCwyvEdcy9ub05mc6kxQWfNpVP45O4oeWlYcgCDDRi5O
 1I5bFn8Y3hqINXzLMfSuqjlKwKGDs0Y0Hb+C87g6r+rpZW4D9IBDgp3mnuvih5qbYBrJ
 ZdoifQ9Qstr9EnVyjY7jszzm0VeCL0TibE+YqDGoKo//ZhvpBKYQDlDDuqFGrK8ow+ct
 vqd3sqPUZ0GBvFUKK+Od5j8H/ur5ldSEXirgvB9/hXBNeV0gBooMNE5dF3ledIb0rm3P
 fWjQ==
X-Gm-Message-State: AO0yUKU5508yqNxYanaA4n3cpmjJUm+kyeYdhbSoQDW4Fqn/PAdv852u
 DuhK+rS/TLXbAS47oFWHCK+LrJ9wAOJeGfeFzPCXjQ==
X-Google-Smtp-Source: AK7set9XwOprmvMSZxE219+neH4dJVe0b6v5IUqmo46jRmevl4lz/+ilhJWCP96nyC4V+5+FhrFrE2HhdAGzya1YoHU=
X-Received: by 2002:a9d:4f15:0:b0:699:7d71:d2dc with SMTP id
 d21-20020a9d4f15000000b006997d71d2dcmr916625otl.6.1679655025541; Fri, 24 Mar
 2023 03:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230127221418.2522612-1-arnd@kernel.org>
 <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
 <20230308165644.GA1181835@dev-arch.thelio-3990X>
 <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
 <ZB1xWRo0rkhku2BS@phenom.ffwll.local>
 <CAKMK7uF4tYyw6Eio6YkWZpBej1J8_5+VLU_hvVbL-Lnk06=v1g@mail.gmail.com>
 <ZB19rRHIeLxyzDrX@orome>
In-Reply-To: <ZB19rRHIeLxyzDrX@orome>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 Mar 2023 11:50:14 +0100
Message-ID: <CAKMK7uGP+n6CkMLq4N006Mctj6ta7NV3iSBt7qZiisptTBVv8w@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
To: Thierry Reding <thierry.reding@gmail.com>
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
 Jon Hunter <jonathanh@nvidia.com>, Nathan Chancellor <nathan@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Mar 2023 at 11:38, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Mar 24, 2023 at 10:59:23AM +0100, Daniel Vetter wrote:
> > On Fri, 24 Mar 2023 at 10:46, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Mar 08, 2023 at 05:28:06PM +0000, Jon Hunter wrote:
> > > >
> > > >
> > > > On 08/03/2023 16:56, Nathan Chancellor wrote:
> > > > > Ping? This warning is now in 6.3-rc1.
> > > >
> > > > Thierry is away at the moment.
> > > >
> > > > David, Daniel, do you want to pick this up directly in the meantime as a fix
> > > > for 6.3? Mikko has already reviewed and FWIW ...
> > >
> > > Generally first fallback should be drm-misc maintainers (or anyone else
> > > with commit rights), but since this fell through cracks for weeks it seems
> > > I'll pick it up to drm-fixes now directly.
> >
> > Ok I think I found out why this fell through cracks, MAINTAINERS isn't
> > updated that host1x&tegra is maintained in drm-misc.
> >
> > John, since Thierry is out, can you pls create the MAINTAINERS patch to
> > - point at drm-misc git repo everywhere needed
> > - add any missing host1x paths to the drm-misc entry so that
> > get_maintainers.pl adds the right people for this patch (currently it
> > doesn't)
> >
> > Also should we have at least a 2nd person for tegra stuff (or well
> > maybe nvidia stuff in general) for drm-misc? Currently it's just
> > Thierry, and I don't think that's enough. Whomever gets volunteered
> > please follow
> >
> > https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc
>
> We never actually moved host1x and Tegra DRM to drm-misc completely.
> There's still a separate tree that feeds into linux-next. This made
> sense a while ago because there was a lot going on, but development
> speed has decreased recently, so we may want to fix that. The big
> benefit is that drm-misc is better oiled than drm-tegra, so getting
> things merged would be easier for everyone.

Hm I thought you had a split where you feed -fixes through misc and
features through tegra.git? Just listing both trees would cover that.

> I'm all in favor of adding a second Tegra person to take pick up the
> slack when necessary.

Imo features still through tegra.git with just you is fine, there's
not going to be anyone else (like ci farms) blocked if that's held up
for a bit. It's more the bugfixes where a 2nd nvidia person would be
great.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
