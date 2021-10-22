Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A1443707C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 05:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FFA6E5A0;
	Fri, 22 Oct 2021 03:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B7F6E5A0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 03:38:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB75D610A4;
 Fri, 22 Oct 2021 03:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1634873939;
 bh=9TMOq2xQPIJH4U6BSsyCI1yOB5IvYFxcsxgSaPT7PFY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nO0WJv17dRlACHIr/0GNZYQnsy6tXHHuwlZjcd6so1f3kCb3EvbBJHg4fkhQJg+7G
 O2kyXtKYneEt0ZLHZrHz4hrrKuI9UZqLBMfY3OoMRZg9Bz7xWV8Mpmk0UWDVOOFWX0
 Cf7x8TnbV/CLoKsyzLHZvgX+bod9cAwaAcGHJMuI=
Date: Thu, 21 Oct 2021 20:38:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Jani Nikula <jani.nikula@intel.com>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-mm
 <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org, Marco Elver
 <elver@google.com>, Vijayanand Jitta <vjitta@codeaurora.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Oliver Glitta <glittao@gmail.com>,
 Imran Khan <imran.f.khan@oracle.com>, lkft-triage@lists.linaro.org, Stephen
 Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next] [dragonboard 410c] Unable to handle kernel paging
 request at virtual address 00000000007c4240
Message-Id: <20211021203856.1151daebedef7b180fdfec22@linux-foundation.org>
In-Reply-To: <2a692365-cfa1-64f2-34e0-8aa5674dce5e@suse.cz>
References: <CA+G9fYv3jAjBKHM-CjrMzNgrptx-rpYVmGaD39OBiBeuz7osfg@mail.gmail.com>
 <80ab567d-74f3-e14b-3c30-e64bbd64b354@suse.cz>
 <87fssuojoc.fsf@intel.com>
 <2a692365-cfa1-64f2-34e0-8aa5674dce5e@suse.cz>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 19:51:20 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:

> >> Then we have to figure out how to order a fix between DRM and mmotm...
> > 
> > That is the question! The problem exists only in the merge of the
> > two. On current DRM side stack_depot_init() exists but it's __init and
> > does not look safe to call multiple times. And obviously my changes
> > don't exist at all in mmotm.
> > 
> > I guess one (admittedly hackish) option is to first add a patch in
> > drm-next (or drm-misc-next) that makes it safe to call
> > stack_depot_init() multiple times in non-init context. It would be
> > dropped in favour of your changes once the trees get merged together.
> > 
> > Or is there some way for __drm_stack_depot_init() to detect whether it
> > should call stack_depot_init() or not, i.e. whether your changes are
> > there or not?
> 
> Let's try the easiest approach first. AFAIK mmotm series is now split to
> pre-next and post-next part

It has been this way for many years!

> and moving my patch
> lib-stackdepot-allow-optional-init-and-stack_table-allocation-by-kvmalloc.patch
> with the following fixup to the post-next part should solve this. Would that
> work, Andrew? Thanks.

For this reason.  No probs, thanks.

I merge up the post-linux-next parts late in the merge window.  I do
need to manually check that the prerequisites are in mainline, because
sometimes the patches apply OK but don't make sense.
