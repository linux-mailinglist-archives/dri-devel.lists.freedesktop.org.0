Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9174BC757
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C522A10F694;
	Sat, 19 Feb 2022 10:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F1210E492
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:13:26 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2d68d519a33so33976487b3.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 07:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ue09UYaxTaEqS175+LfKF6ZQhoNdq+QTxAZ6/A1fP2M=;
 b=DbdZsHSudW3XTJiY+K1xA58iiJbLUQuB5eSPGNbbgrAQPf8IlmE03xiqg1+9wuD6fz
 prwczh4o+KUv8m47n1jAFn1qlfpy8WgmxUtJU/UkjM4IEiFhE+lKg/ImrzVwLl9cfwfr
 2GNgce03dRItFvEmtPhz8UhPt0AuJ3S9+3H5wTMYIgsXFNpN0hjy4pN2DVvhRasuX/eq
 0p33LNW5rO3BP2q6hlTUU+N6+1LwrNkcul1fnfrspmH5cI+FTRtcmC5a1ODWbB+hX/vG
 PykTm84tq45e7zRH6B+axrW4X3oQ+cbMYPhhkaugixg9Db8CDpkGUKfZhEErAOW4Grp6
 C+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ue09UYaxTaEqS175+LfKF6ZQhoNdq+QTxAZ6/A1fP2M=;
 b=IRCaunzNoTlZ0axpNfsYHK0D45Aa4KbRV+kt7jNZZ5h9Kw/QZ1bmRTg0c+eZlpkwXk
 ikSqVP4xoq1HX3Au7kx2sf5og15hewen+Yy5qR2YxNaj7v2ejIE1q4o8wbab21utThlI
 cCWuuAhBUtDhjQ/7BkmDQJwjFmn18NKKQ07OTCIpzMw4JOjLVzWVRgtrVMnFlchFJzIr
 yFk3tiL3N72Tok9ZPtH2rFC5zQZGNsYh8LSy/26JoMf0C5/XHHWhbNu2aYAlfHm9+uf3
 odUr7oDhjPs6ITnZes5DsW4JY1xyy9pTYxSrSk21pmjjBF2XsCLj8c6slxaxsndTvzHI
 NFfg==
X-Gm-Message-State: AOAM530k98CMyA9t5zwjqXY+cP4gIrceMoROR78bKXayfxmxSxqdPWHd
 GlKFkKMzIhlif1hr9xMeYEgaF5XXlHM971rXrKtSeA==
X-Google-Smtp-Source: ABdhPJzbG6wC2LPbv8HnQDMoclI9DH40Jr8ukHtJRt4zE8if4FlSJ1G02bARjfum6c6K95QFlyMggt7miSl+zAX9Fpc=
X-Received: by 2002:a81:1516:0:b0:2d0:e7ca:2a5 with SMTP id
 22-20020a811516000000b002d0e7ca02a5mr2946109ywv.55.1645110804769; Thu, 17 Feb
 2022 07:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
 <20220217140441.1218045-6-andrzej.hajda@intel.com>
In-Reply-To: <20220217140441.1218045-6-andrzej.hajda@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 17 Feb 2022 07:13:13 -0800
Message-ID: <CANn89i+nCZ6LV_1E2OnJ4qWE0XkO2FGW+A6_tkmQpdxiiEh=LQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] lib/ref_tracker: improve allocation flags
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, netdev <netdev@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 6:05 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> Library can be called in non-sleeping context, so it should not use
> __GFP_NOFAIL. Instead it should calmly handle allocation fails, for
> this __GFP_NOWARN has been added as well.

Your commit changelog is misleading .

The GFP_NOFAIL issue has been fixed already in
commit c12837d1bb31032bead9060dec99ef310d5b9fb7 ("ref_tracker: use
__GFP_NOFAIL more carefully")


>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/ref_tracker.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> index 7b00bca300043..c8441ffbb058a 100644
> --- a/lib/ref_tracker.c
> +++ b/lib/ref_tracker.c
> @@ -59,7 +59,7 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
>         if (list_empty(&dir->list))
>                 return;
>
> -       sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT);
> +       sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT | __GFP_NOWARN);

This belongs to patch 3 in your series.

>
>         list_for_each_entry(tracker, &dir->list, head)
>                 ++total;
> @@ -154,11 +154,11 @@ int ref_tracker_alloc(struct ref_tracker_dir *dir,
>         unsigned long entries[REF_TRACKER_STACK_ENTRIES];
>         struct ref_tracker *tracker;
>         unsigned int nr_entries;
> -       gfp_t gfp_mask = gfp;

Simply change this line to : gfp_t gfp_mask = gfp | __GFP_NOFAIL;

> +       gfp_t gfp_mask;
>         unsigned long flags;
>

Then leave all this code as is ? I find current code more readable.

> -       if (gfp & __GFP_DIRECT_RECLAIM)
> -               gfp_mask |= __GFP_NOFAIL;
> +       gfp |= __GFP_NOWARN;
> +       gfp_mask = (gfp & __GFP_DIRECT_RECLAIM) ? (gfp | __GFP_NOFAIL) : gfp;
>         *trackerp = tracker = kzalloc(sizeof(*tracker), gfp_mask);
>         if (unlikely(!tracker)) {
>                 pr_err_once("memory allocation failure, unreliable refcount tracker.\n");
> @@ -191,7 +191,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
>         }
>         nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
>         nr_entries = filter_irq_stacks(entries, nr_entries);

lib/ref_tracker.c got patches in net-next, your patch series is going
to add conflicts.

git log --oneline 5740d0689096..4d449bdc5b26 --no-merges -- lib/ref_tracker.c
c2d1e3df4af59261777b39c2e47476acd4d1cbeb ref_tracker: remove
filter_irq_stacks() call
8fd5522f44dcd7f05454ddc4f16d0f821b676cd9 ref_tracker: add a count of
untracked references
e3ececfe668facd87d920b608349a32607060e66 ref_tracker: implement
use-after-free detection


> -       stack_handle = stack_depot_save(entries, nr_entries, GFP_ATOMIC);
> +       stack_handle = stack_depot_save(entries, nr_entries,
> +                                       GFP_NOWAIT | __GFP_NOWARN);

This is fine.

>
>         spin_lock_irqsave(&dir->lock, flags);
>         if (tracker->dead) {
> --
> 2.25.1
>
