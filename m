Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203532A2B10
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 13:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278576E4FE;
	Mon,  2 Nov 2020 12:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA0D6E4FE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:56:22 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id y22so1977030oti.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 04:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5ses3L4S0EGFIO147NO/jaN4EloOqduj8AeaQfFuV8=;
 b=T3p+MSLRVTQeTCxHlv2KtbWAgQXYXjF/NQ5vZEZ56cGWMPWmhzeFc9ZhAf24TyMNJy
 X8ZVYO+h7DmQjzrCGnwO7PCiNeRaaOGSFYoXqqakqdoymjMzjnu9kMLe6DLLbyq0pqc5
 IQ0xty7dRJBPKhniovuUncjzErvz8QtDqXg1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5ses3L4S0EGFIO147NO/jaN4EloOqduj8AeaQfFuV8=;
 b=kjXWqZCFQFeBF3VuecvioO05V5PyI3jIh/aUVls2M4Ji7ZvmsMqJEggavAmYbouBWO
 vpiBIccSM1UeYajDnVG9C7gRPbnNaF8wAuEhVoG/ge/ZC74e63Wvcvkg0L/v0T45ZxTp
 eLpnPgFrofAbaSxhfg9g8IsL91Z7OWWZEGUtBVqF1nlYgmev9Ong4+X1opVomLteFiyJ
 TUFpjZ73FEk9qp0+YY46V2snwc/s8VdwrdsoZ2fMyEq9sum+NF6Ity/M18F93ozHQFWe
 TnigPrA3SNOI4WrTst1tcUnIz5NRhokAiwHU3afhfAjB7bAMBQrGCCurXjm5tj4k37++
 0S3w==
X-Gm-Message-State: AOAM532CZLd5aJv2tdHJZo85qepHY9VGu+toDD8HVAkL52jUPI1hfZ1l
 FUDRLbU0DpSWz2vHehvV0cRieRMypzmmiMqGxYBMlw==
X-Google-Smtp-Source: ABdhPJxuikM8EweOBXPqOBWXx8bGKhMyIqIExlZHbYHppkEx5/UodSudDdaWfAmFL8eR0NFLmbTm21/CfypVpUHeCk4=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr12585840otr.281.1604321781980; 
 Mon, 02 Nov 2020 04:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
In-Reply-To: <20201102072931.GA16419@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 2 Nov 2020 13:56:10 +0100
Message-ID: <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, J??r??me Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > that by drivers/modules is together with an mmu_notifier, and that's
> > all _GPL stuff.
>
> I also think it also needs to be renamed to explicitly break any existing
> users out of tree or int the submission queue.

Ok I looked at the mmu notifier locking again and noticed that
mm->subscriptions has its own spinlock. Since there usually shouldn't
be a huge pile of these I think it's feasible to check for the mmu
notifier in follow_pfn. And that would stuff this gap for good. I'll
throw that on top as a final patch and see what people think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
