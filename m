Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0530254C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 14:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963F891E7;
	Mon, 25 Jan 2021 13:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCFF891E7;
 Mon, 25 Jan 2021 13:09:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC2AC230FF;
 Mon, 25 Jan 2021 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611580174;
 bh=y5SD7INd+SJt7jxXfJP2LnyGCDy2q11vfjo9M/wnIVg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CzHvKf0g4XRU3kZT+EAi1uu/b8urWuaKUoh7B2C4vgC224fDtXQv2oHgNFop9yhZT
 2NAVkLC7L51W5AAHJatCrAxQaZGGe8ikLSGTJyflMWj71WwoMujeWrPVS93iC1TKwI
 x8IXnE2nOh3LtWah61deyMxC6o408RKhwybxqQHAd+opNvhFi5a0T4aRl8m1xi1DH6
 wsKNG/eN4JKz1Sz+I59YIY7HdRNsZBImAyvqYbJLknXsqtZGg59Fa+dNZ2fW1Tb9ok
 XisCQGg02FTISRO4Tr0H83Lqk2GgUor15GeedhP0qyrOoICJ9TKfPHZdLC53amcu9N
 55hpWqNriPU0w==
Received: by mail-ot1-f50.google.com with SMTP id i20so12661192otl.7;
 Mon, 25 Jan 2021 05:09:34 -0800 (PST)
X-Gm-Message-State: AOAM533iFFiO4ltmg6eCi9M7bGeyifxdyjwgCMR+uOxhdYVBEBxWLaZg
 yWWILebaPdrigZxxLfSqySJBLjRAvjgLhKjj6YE=
X-Google-Smtp-Source: ABdhPJyuJJk9G4dOr5X/W/Oejpn00xm3L5Vgy94ryIckeQco5eZlFX7WU57R1TChXjR/NR+IHQywGOH1ZsrZxjRin3w=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr388999otk.210.1611580174003; 
 Mon, 25 Jan 2021 05:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20210125122650.4178417-1-arnd@kernel.org>
 <161157800073.27462.7610644354455990065@build.alporthouse.com>
In-Reply-To: <161157800073.27462.7610644354455990065@build.alporthouse.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Jan 2021 14:09:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2nWZnHfxqsKpq4iA1yYkJcVw01OewsZ9WSKUczoUR0+g@mail.gmail.com>
Message-ID: <CAK8P3a2nWZnHfxqsKpq4iA1yYkJcVw01OewsZ9WSKUczoUR0+g@mail.gmail.com>
Subject: Re: [PATCH] i915: Fix DRM_I915_WERROR dependencies
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 1:33 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Arnd Bergmann (2021-01-25 12:26:44)
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > CONFIG_DRM_I915_DEBUG now selects CONFIG_DRM_I915_WERROR, but fails
> > to honor its dependencies:
> >
> > WARNING: unmet direct dependencies detected for DRM_I915_WERROR
> >   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=y]
> >   Selected by [m]:
> >   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && EXPERT [=y] && DRM_I915 [=m]
>
> DRM_I915_DEBUG now depends on !COMPILE_TEST and EXPERT.

Works for me, thanks!

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
