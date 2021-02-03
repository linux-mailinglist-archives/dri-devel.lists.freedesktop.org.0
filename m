Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BAD30D4DA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396CA6E9EC;
	Wed,  3 Feb 2021 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CD689F24
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 02:02:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c12so22447177wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 18:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1d6YTsPbefNP98n7kugOKyTm/5Jjwmgp6qDjgryobQ=;
 b=YTpxuQQ56VEKPyP5QRwFOXD5rzq90h+zb0bL5zaHyoZAGpubAhVDWr6tVquoLfUHXY
 8Bgskv29OXx/jlR9EGtJIj2o0B36+WZncwc30a96duFnTOR6NIS20pOkUXRH1YLOzXjx
 rd796bWXm93rjoNLs5XewciYkKHyTn0eFOpN5IkEe8j0OFbNs/YrOetNsTJ6nmGccTFF
 ppqnrLaeHkAtN+jfTW3sILXbMs+y+eKWJtYUCP90lE6ejamVvj0wYtOVvAMo/jMCTtxl
 VNobZKCa1yOaQeNS8a2B0xxWxeuJgYXvbwrr101FjA/2VRquOyZZ58akT0yeyVEGoY5c
 ac0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1d6YTsPbefNP98n7kugOKyTm/5Jjwmgp6qDjgryobQ=;
 b=UZ7PvrkWmRBqaasbNZWMYpkB3SjoZBeAt6meCGhmOjbJQ3zHmzsHnkYdt8PYHil58U
 bvUv6pbS83YV3yhCoR7AsSqDTW1nVazaFog/PmmjNmoThQ82zDWbRGbADKDPjutSLm52
 zockNfW2iYyvx4No6AtedKMhb45lgb329GgJ54JXu7Cn9fD268nka5c1jmJJuIs4SGw3
 E0wBWWl9iXTOHn5KzGJ0O2SRYLFh1Trf1pP9rQOZY6mXjU99i/rPc4IgFD4bQVY8dBT+
 F8cIJSsaR7/Xgdx37vb0MdqTaNF7WeiAY/Dkajo+obTr8rDfEgSj2TUdWap4k11rToqf
 9ZtQ==
X-Gm-Message-State: AOAM530x6eq6RTuBjwq2FJZkiQQoeOj0Fl/fYXtAKQTy2KYKURdQJXWH
 RkqRDTCDEOup7eBTIOuVVU2oZ6Sumxft3mbp2zyv1A==
X-Google-Smtp-Source: ABdhPJyQn6YddfkLVWiIGgY37mm6xAPU8tZAWB5sXAvWUT2z2eLAGdHnF+0pzujgGtm+uL0SK+Mb5ISJFicsxp8PRdg=
X-Received: by 2002:adf:e50e:: with SMTP id j14mr860530wrm.162.1612317733369; 
 Tue, 02 Feb 2021 18:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203003134.2422308-2-surenb@google.com>
 <YBn+yWIE9eXbgQ2K@google.com>
In-Reply-To: <YBn+yWIE9eXbgQ2K@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Feb 2021 18:02:01 -0800
Message-ID: <CAJuCfpHCCD6ruxQAZP8pTZxz44F7pDKY59QznxFv0nQ+-9VaQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
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

On Tue, Feb 2, 2021 at 5:39 PM Minchan Kim <minchan@kernel.org> wrote:
>
> On Tue, Feb 02, 2021 at 04:31:34PM -0800, Suren Baghdasaryan wrote:
> > Currently system heap maps its buffers with VM_PFNMAP flag using
> > remap_pfn_range. This results in such buffers not being accounted
> > for in PSS calculations because vm treats this memory as having no
> > page structs. Without page structs there are no counters representing
> > how many processes are mapping a page and therefore PSS calculation
> > is impossible.
> > Historically, ION driver used to map its buffers as VM_PFNMAP areas
> > due to memory carveouts that did not have page structs [1]. That
> > is not the case anymore and it seems there was desire to move away
> > from remap_pfn_range [2].
> > Dmabuf system heap design inherits this ION behavior and maps its
> > pages using remap_pfn_range even though allocated pages are backed
> > by page structs.
> > Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
> > in [1]. This would allow correct PSS calculation for dmabufs.
> >
> > [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> > [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> > (sorry, could not find lore links for these discussions)
> >
> > Suggested-by: Laura Abbott <labbott@kernel.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Minchan Kim <minchan@kernel.org>
>
> A note: This patch makes dmabuf system heap accounted as PSS so
> if someone has relies on the size, they will see the bloat.
> IIRC, there was some debate whether PSS accounting for their
> buffer is correct or not. If it'd be a problem, we need to
> discuss how to solve it(maybe, vma->vm_flags and reintroduce
> remap_pfn_range for them to be respected).

I did not see debates about not including *mapped* dmabufs into PSS
calculation. I remember people were discussing how to account dmabufs
referred only by the FD but that is a different discussion. If the
buffer is mapped into the address space of a process then IMHO
including it into PSS of that process is not controversial.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
