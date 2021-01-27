Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CB93070E0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFF76E90E;
	Thu, 28 Jan 2021 08:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B2889CDB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 20:21:27 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id g5so1192485uak.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JkWQEhwAUNLuJiPKeTazkmms8jXTo1ixUZEQclL+Lbo=;
 b=r9q6TDXOq/oTKZfsDu88FKmFK1jFkobThy3I5RX5yDOWeZCqbXkAPofOZhwyzoX0S4
 lmw2aOQ11GEmGdt9SOTMz11LnKqrdTCNN4gnubxwe3dHZMhv+VsV8YZVjYxDcM5GYvec
 yEt+m/lAgrwWi3TGc166UztCAqnGYfmm3+WjObS9ymcp0mxV2NdAFelIasNCR9kP04OH
 EwBxAVdECFQaUOAnYMyIv8j85clAcXLfBlFscijmq8Zod7kAQCoW/+/203JvholLWk+4
 l4wJqVoFVxOmT+KnOdgd6PKD/9pTOcZiIb4GqWwjjWcspeNyAIXi9wFcN6CZ161qe0cV
 R4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkWQEhwAUNLuJiPKeTazkmms8jXTo1ixUZEQclL+Lbo=;
 b=OQ8fiIjle0SI6mrnZ3YtrKYpoXeNs1PW0zzLV/j879EmRBQIO5soFVWBUrkvwilQ11
 JEhhCrvfjPpWbQy2IMRTX4jezc5swC20NK9JJkmkWYsMjvPfW/kOm571HkPxwEWDMAlW
 WXPSeB3sk5iO69AetF4PNwSta0z6d7/M3yH2cv/XMkk91+eAXZaV9TkJ5NmlSfF5jglI
 uEl8Rl75pORLLjwpIR01dych/W5yceAKysZno9F+rnVXcKt0BKbSxkNnQzVA9tLUuwNf
 dAL42QXA0SBwwJAztMT8cBHWYoNVNuTD1b0FkkrfTsiblvMwRSEy2x+GlsGji1iVk+t5
 K/1w==
X-Gm-Message-State: AOAM530Oal5aZikxzVEqEF1woUxwY8+xlqR7lW0JEGJ095rtZCG2XZlK
 FzjAEafLqQTqWg/m49g4v1NQs7x8ZV/6D+HkyOc3mg==
X-Google-Smtp-Source: ABdhPJwGX8VLBXNChAV3Mpumim5+i60b+XOkzruAqORvpUqhkGg7ml8LK+TG1dC8IipynSj3q3fq1jXMWQAsSKX643o=
X-Received: by 2002:ab0:7584:: with SMTP id q4mr9773201uap.35.1611778886742;
 Wed, 27 Jan 2021 12:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20210123034655.102813-1-john.stultz@linaro.org>
 <20210123034655.102813-2-john.stultz@linaro.org>
In-Reply-To: <20210123034655.102813-2-john.stultz@linaro.org>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 27 Jan 2021 12:21:15 -0800
Message-ID: <CAE2F3rA3a-MWBHPZhGP9dMhEUqMkkvm6wXYYh6LDZ1zF9CAyUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 7:47 PM John Stultz <john.stultz@linaro.org> wrote:
> +static int system_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
> +{
> +       void *addr = vmap(pages, num, VM_MAP, pgprot);
> +
> +       if (!addr)
> +               return -ENOMEM;
> +       memset(addr, 0, PAGE_SIZE * num);
> +       vunmap(addr);
> +       return 0;
> +}

I thought that vmap/vunmap are expensive, and I am wondering if
there's a faster way that avoids vmap.

How about lifting this code from lib/iov_iter.c
static void memzero_page(struct page *page, size_t offset, size_t len)
{
        char *addr = kmap_atomic(page);
        memset(addr + offset, 0, len);
        kunmap_atomic(addr);
}

Or what about lifting that code from the old ion_cma_heap.c

if (PageHighMem(pages)) {
        unsigned long nr_clear_pages = nr_pages;
        struct page *page = pages;

        while (nr_clear_pages > 0) {
                void *vaddr = kmap_atomic(page);

                memset(vaddr, 0, PAGE_SIZE);
                kunmap_atomic(vaddr);
                page++;
                nr_clear_pages--;
        }
} else {
        memset(page_address(pages), 0, size);
}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
