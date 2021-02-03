Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4293930D4F2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FF06EA0A;
	Wed,  3 Feb 2021 08:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1445F6E288
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 02:13:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a1so22466822wrq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 18:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vYDps8/+IhHaSDG5kMjkWUxFJUq2DFUOYgi2VmWXtI=;
 b=QT34eaYNV8fBLXWs/JBogWNBxvdF8ywloFrclidxZLbMY42rIDA48Y8pWRzaRg5kyn
 cJA/Pz4LjH28NykDdh27Y+YDF2VA1ob27B9AmZ+b+y8eFiRD3fKog+kSs9ztUIQwluk5
 G5LsE1Hmui8HoXHVY8szdjd48rhhZA4JUPeSSoXEZMxzn3bocg+h4SnDsxruSuxRv9QT
 bTpIhgtjAyR+m3tKilxDCcEYtYANNdJ3CrpkPwfxvl9JzsXtY4jEpaPrHe4emg1kiNRY
 Tub23wpwxyjLb6730Xg39sU0NDx1RWY4HzKlBzNT+btC4Ta9Vj6gI7TYaH3+g8P5rtUU
 HPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vYDps8/+IhHaSDG5kMjkWUxFJUq2DFUOYgi2VmWXtI=;
 b=LeAl4qpinZluYxkTq/9UVi88GeYjPRPbhl3uu+AuDmZPp89r2mNj9JGO1cR7ysEM3p
 jYb8Eiza0h9WZKjBgBtT6iHjCYbeWoFwbc42a9bfUPIiCYWJmCUE4fediNNdVeyFR5zT
 sDss0YYj6So4ZJKcLm8LJIN4rVKhRsNaRSvo07V31/IBhvLYfxmisysSKrN+lM1fvHkc
 w009O9vOnhpS+oTDK9Vu3+WnlOkDIX2MisHsNBzfy9SbDxe4UgAIKQWiw4wP/Lh+lxnF
 y0/Kvgjm+vt85JgTqoRYqbQUQikEROfChdm/SjO4tqdQudhxR1rvxqhCHhmXPF9gP0cm
 b19g==
X-Gm-Message-State: AOAM532jtKq+Crncn6UphE+gBGI1jIveoJ38EFloGL8IBkJlbSvFId1c
 /E1PLcLOFozCWhNwXnw1/TvQwfeH4DCzDtws+TrMfg==
X-Google-Smtp-Source: ABdhPJzwvb53VryiSIObA9yOm78VKVx2cE/HoZ+IGvTixGvWum4punD5XJ9toA2haG1k35oBs/GNn0NjBEvmjKg7phM=
X-Received: by 2002:a5d:453b:: with SMTP id j27mr895948wra.92.1612318417595;
 Tue, 02 Feb 2021 18:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203003134.2422308-2-surenb@google.com>
 <CALAqxLWJNDDx_MFvYHszFXy=aV9bZGi50L3zDtuGaiYUbHKHSA@mail.gmail.com>
In-Reply-To: <CALAqxLWJNDDx_MFvYHszFXy=aV9bZGi50L3zDtuGaiYUbHKHSA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Feb 2021 18:13:26 -0800
Message-ID: <CAJuCfpGJn9WLjs5N6m2WZ4CxgkZeHgGinoS_v2XhiqbOB90rfQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
To: John Stultz <john.stultz@linaro.org>
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
 Christian Koenig <christian.koenig@amd.com>,
 Android Kernel Team <kernel-team@android.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christoph Hellwig <hch@infradead.org>,
 Minchan Kim <minchan@kernel.org>, linux-mm <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 6:07 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Tue, Feb 2, 2021 at 4:31 PM Suren Baghdasaryan <surenb@google.com> wrote:
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
>
> For consistency, do we need something similar for the cma heap as well?

Good question. Let me look closer into it.

>
> thanks
> -john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
