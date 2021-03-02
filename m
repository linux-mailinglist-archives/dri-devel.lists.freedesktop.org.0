Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324763295B0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 03:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B23F6E139;
	Tue,  2 Mar 2021 02:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE2D6E139
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 02:51:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id v9so11169191lfa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 18:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8E7jhhYaCr8C6xSxrpG64nSWDU98o0HEwhCAOn7PAok=;
 b=CtAXWUOUEPDunoQwsrVEycASyIeLXdyliiw3gjDfZoPH+mu6HRFJOGnvR+MXDvPlDm
 oJEoBKJceAIP2pSJHn+StAUkr8+FPr8L0aB9U0Vy1qM2/Mbuam3IoNYxT5pbkQ80CSz5
 v+n7Dc+u4gZ3D8doFYnzRKlLYdu9QORdgOB+hiY2Y5a++SWfH2tQYDboAkTDYnDaSE0Z
 JRvCN/hTYcNbxkcDEy80hNN15DwQWGSIOoLUUTwsvFme1NaGT/LGKe9KUqplff5A7xWE
 XyhzBmSQ2tNJ2WB0xFUzwBEFK5UX42BcM70Ib0iGxM8OhzGOBsql/eZGL2c4DYIhUEFD
 Xw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8E7jhhYaCr8C6xSxrpG64nSWDU98o0HEwhCAOn7PAok=;
 b=DxLCZwY+eg7h709dOon6VMkeGJqc9b8uNA28I6F7WG/HexeJfwkJpvWmgURKk0GHyo
 FKY+BKZn7EoH/rXBGY9UfZbKT7UxsBAURj3FocDZx134rgYGhuxIaydq+uPmmaVQ5fq1
 pgFos6lZt+spOSXthE7gRNPEjjsvmIn6XR09w8wZzeqztiKN/wRLp2LQ0Ew1jhVd6ugr
 g84fWm/L946+SnMRngvEksxksyM0a31P7JzHVEi2jOEUYl2gdnhrm3aEujk1z6OBYu+N
 SyLbOtW4o3nfnanAC6ENIA+ywu2IqQbk1f+Vlqg59jRnZMfqvubRr48PsEkXji1+tGqA
 A4Yw==
X-Gm-Message-State: AOAM531+irB/Y3Jhk+lfy+MaI05Z/ozoVBgEaY3UkShNHKdVvH/imtIR
 4CqE2guVJQPw3jj+YyxCQ5ZvIS2tlPmv27JaWLI3Ng==
X-Google-Smtp-Source: ABdhPJz39rZTCGPuL53OOyY7GEDe7aOcYzZlxQr263eEFf2vvM39BGGanu2WFzPxlDI0/hLiEweWlg9234LilyOgSj4=
X-Received: by 2002:a05:6512:547:: with SMTP id
 h7mr11428172lfl.529.1614653480706; 
 Mon, 01 Mar 2021 18:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20210226040908.3274666-1-john.stultz@linaro.org>
 <CAKMK7uHGutJiZ879NAweTHka=gZQBw9zWQSDJn6bTLS6bJwvvg@mail.gmail.com>
 <20210227094436.GA3130571@infradead.org>
In-Reply-To: <20210227094436.GA3130571@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 1 Mar 2021 18:51:09 -0800
Message-ID: <CALAqxLUcbAWiwxqLRmr4Ve4ecSAJ-jsZy-RDC3jqDONgoRht9Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set VM_PFNMAP in mmap for system and cma
 heaps
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, ??rjan Eide <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 27, 2021 at 1:44 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Feb 26, 2021 at 08:36:55AM +0100, Daniel Vetter wrote:
> > Also given that both deal with struct page there's a ton of divergence
> > between these two that doesn't make much sense. Maybe could even share
> > the code fully, aside from how you allocate the struct pages.
>
> I've been saying that since the code was first submitted.  Once pages
> are allocated from CMA they should be treated not different from normal
> pages.
>
> Please take a look at how the DMA contigous allocator manages to share
> all code for handling CMA vs alloc_pages pages.

I'll take a look at that! Thanks for the pointer!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
