Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B259030D4DB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE6C6E9ED;
	Wed,  3 Feb 2021 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BEB6E237
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 01:56:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id w4so2810789wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 17:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eqb0FQEG710LFOVTd7yEl7tin1eRbeirJikh0ogVzXs=;
 b=r4yYUo1RncgQIJ2OFCrbLrZmrY2T3kRRqBaZl+AROnou29V143R2jumKvvg19DLqCo
 F2V2aPSyfbh5iMz1kj+xBVJV5f3HQGt+xLXfaqUjvnBhUO3hfL/56qlxZDAIdOsWeEHT
 hgLIVPKdps71ba9B4KnrfwhUrjd8IWTghGyuq5RgmBTA4yN6F/I1hI7BqhdUhBiri6p5
 ti5ok3BitGiRKghlbB49tORC5hYAZPVoOOMlJELLKjTmtecV3vwGP9LPTSn9fwZ9iS2Z
 UEGUrjUGisH5nTtUYi/e4DuidkIQ991KCpyjJd8/CkA6Vn08ScJOtArwZ6K7oU0ZTpcH
 gASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqb0FQEG710LFOVTd7yEl7tin1eRbeirJikh0ogVzXs=;
 b=jFOUvU6duL/JXmRowqlnd8i31uDqd9iQv05QFF+8sK47Woh7mRCOBv2ArCtEpjaKax
 GOni/5WengbSrFDR9/Uu4fFcEHZYMEXqCJ7K4GXYKD9V4Nh41GX4YnPQuQ39UvXtC636
 FawDVy2l3dO2luVfBoNPntclDSniq3uEmKVc9Kuw4yHRNjl47FX7mtM8edldEy8kDjPV
 y4JJueWbiz/BrTKA5AJbS8ZC3N/Qpe0Mvb6OrRgcvo1Yb6qx1LUUBAXo3Zqp7Hu02MOv
 7A9bv6IUY1P0fg5WIleJBNstHVlreHjSUUMiI/jSWHjPH8dM7AmNHWKClVdlrR0w+2p2
 onZA==
X-Gm-Message-State: AOAM5316D4ZEqVrjeoYVkvyoazPvkDWhaBSRTjCi7iXKSLerncLRNxtt
 l9oD8f6fNZ3He1/RnD8r6qLvQvhsHE4JraDB253tIg==
X-Google-Smtp-Source: ABdhPJy8V/ouw2lofMtSb/Jdw++5KWj9ruCBYLUqtDkkx9ZA4byJWPoR5Az0VDn+L4rTDLhOT5LbVZqAi5I9Yc52fww=
X-Received: by 2002:a1c:acc9:: with SMTP id v192mr665311wme.22.1612317361941; 
 Tue, 02 Feb 2021 17:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <YBn81xAeCqHgudYb@google.com>
In-Reply-To: <YBn81xAeCqHgudYb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Feb 2021 17:55:50 -0800
Message-ID: <CAJuCfpEirOiisM-xouZB7JRBDpERdvWb2gfaq003+rs0b4M83Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return of
 an error
To: Minchan Kim <minchan@kernel.org>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel-team <kernel-team@android.com>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>, linux-mm <linux-mm@kvack.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, labbott@redhat.com,
 Robin Murphy <robin.murphy@arm.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 5:31 PM Minchan Kim <minchan@kernel.org> wrote:
>
> On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> > Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> > WARN_ON_ONCE and returning an error. This is to ensure users of the
> > vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> > and get an indication of an error without panicing the kernel.
> > This will help identifying drivers that need to clear VM_PFNMAP before
> > using dmabuf system heap which is moving to use vm_insert_page.
> >
> > Suggested-by: Christoph Hellwig <hch@infradead.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/memory.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index feff48e1465a..e503c9801cd9 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1827,7 +1827,8 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
> >               return -EINVAL;
> >       if (!(vma->vm_flags & VM_MIXEDMAP)) {
> >               BUG_ON(mmap_read_trylock(vma->vm_mm));
>
> Better to replace above BUG_ON with WARN_ON_ONCE, too?

If nobody objects I'll do that in the next respin. Thanks!

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
