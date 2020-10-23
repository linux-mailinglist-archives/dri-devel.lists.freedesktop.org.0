Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67C297189
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 16:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1D16F892;
	Fri, 23 Oct 2020 14:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7DD6F893
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 14:46:00 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id l4so2080967oii.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cmGjJdbt9z1UYbT5/ZpSCpz1o50MyYCTMK9AHq0Aakg=;
 b=Spx4hwCaXf34JyFBNZU5P3z2Yc6125/UltDMuzpO1FUom3Imvy74oVwjnfX6eEVi0B
 zjkOgtlhaqtz+7NG7zdnSLUt5Rs0WTD2wX6fxpxq0VZide9nyesLxotL7/nXMV4OBZYk
 nvC79EU7g32SfEqeva4RGwvPB0L1tnqWAT7KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cmGjJdbt9z1UYbT5/ZpSCpz1o50MyYCTMK9AHq0Aakg=;
 b=f7RfJ/Jkj3sXkgYxOAo++xZh7Ni7Sgef+Be754zyzrc/8A8wmpo1XPSmHMiFDvV1Ji
 Se82hCUO4CnBLiaOnXk2ONOIFL+ugfcDky8SIiqa5zg40x6l8FKJtsBctvYjh+yJuhnN
 e/qsPeWP+L/14F5JacLasz2HI7OBKDXVuBjVIQ81RnUQcKSnIeyPlRJvS0Obqt1tjBfU
 XTJx/HaQvoNreZOgoEa4KQN2Q57YK0aEcTH/Wb6kGwkvY3U7rjmBoZOk37F14ssVzQvv
 PYVq4Sxbr9nz2F02qj548YUhW6thBanmbhl/q8QKUGUvwn7eY4ed0xRKrCCs1c+no3CI
 GkPA==
X-Gm-Message-State: AOAM530k9BkbWjvQUupFw+jyn4MNC1DgzY1e1cOnAl91o/WVsA178IhV
 Ve6SZhnxr0W3Apxg0QZwPcbzrVVYTPB0MGN/18i2tg==
X-Google-Smtp-Source: ABdhPJxzM7Q4pHq2VPzHFl40r08AFCr6VXVCJPwfsZqO2s0Hja92tgFb3rm5wRQVurhNjcBpW7T188EV4zJA1keqdEo=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2005619oig.128.1603464360217; 
 Fri, 23 Oct 2020 07:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-4-daniel.vetter@ffwll.ch>
 <20201023141619.GC20115@casper.infradead.org>
 <CAKMK7uESHHHzEC2U3xVKQEBZqS5xwQJeYFpwMz3b8OaoFEYcUQ@mail.gmail.com>
In-Reply-To: <CAKMK7uESHHHzEC2U3xVKQEBZqS5xwQJeYFpwMz3b8OaoFEYcUQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 23 Oct 2020 16:45:49 +0200
Message-ID: <CAKMK7uHXJhFov96un9-itsTwkatzdKqSThGpFdJuaW_G-6w5Uw@mail.gmail.com>
Subject: Re: [PATCH 04/65] mm: Extract might_alloc() debug check
To: Matthew Wilcox <willy@infradead.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Chinner <david@fromorbit.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Michel Lespinasse <walken@google.com>,
 Ingo Molnar <mingo@kernel.org>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Waiman Long <longman@redhat.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Qian Cai <cai@lca.pw>, Thomas Gleixner <tglx@linutronix.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>,
 Randy Dunlap <rdunlap@infradead.org>, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 4:37 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, Oct 23, 2020 at 4:16 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Fri, Oct 23, 2020 at 02:21:15PM +0200, Daniel Vetter wrote:
> > > Note that unlike fs_reclaim_acquire/release gfpflags_allow_blocking
> > > does not consult the PF_MEMALLOC flags. But there is no flag
> > > equivalent for GFP_NOWAIT, hence this check can't go wrong due to
> > > memalloc_no*_save/restore contexts.
> >
> > I have a patch series that adds memalloc_nowait_save/restore.
>
> tbh this was a typoed git send-email, but thanks for the heads-up,
> I'll adjust the patch accordingly.

On 2nd thought I think your patch should update
gfpflags_allow_blocking to take into account the new ->memalloc_nowait
flag you're adding. I'll comment over there in that thread.
-Daniel

>
> > https://lore.kernel.org/linux-mm/20200625113122.7540-7-willy@infradead.org/
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
