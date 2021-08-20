Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678103F276A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7016EA15;
	Fri, 20 Aug 2021 07:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC276EA07;
 Fri, 20 Aug 2021 06:34:03 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id b15so17942697ejg.10;
 Thu, 19 Aug 2021 23:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1hDxkL1VFPjJfQJqcgqsWl8jQXZYtmj96t84+XZegig=;
 b=X3lZPbwolyuDumPuJZ+pUpsp8+hnhHxoNrk0a15VAMfV7FiMKOnHopRrB8y9Of4ihM
 iYBuVRriUoRo2v827ehOsG+JLu0lGt1rZqjBcK6HWNB66z0h7G6Wy9UjmG1keWYV7g3m
 mpHVN74xPeNXlGVwPHXq9lMqQuwWqVnnaaDtjoTK/algDvhD/kZ6JXC/1zlbEvs3CrEz
 JddL7A4tvDkhQqxwFxBSZ8JQnaG6uWeYnXJSRaozJCfrqWc2yiwjDJn25rEbmZcz0yAB
 kT9KS/4bYkKCU8Rxd0u8AJBOil4HUZ2SgEGbloP4l4B8dUGNvKUHQS92j0c8BsxRhpPC
 hA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1hDxkL1VFPjJfQJqcgqsWl8jQXZYtmj96t84+XZegig=;
 b=r9wwIkSTFkNMZS8uCktnEuncIfN5/tor5UqofGJ64tVqs8FrzfYzvoYs8RnYbIfCh+
 86J8O27NYNJzN0GZlJwUDQKJ65sm7w1RC2u1KUAX/bvMdNrXxH63dwsDnEqr+04x5QC8
 vHN2xkJhF/+ZjLBQsxe0sx9sIBE/HbiDOjrwkdxNZYgay7xVoycO11CxlLdLC0ilqJcf
 rxLE3WwntZf9tD5+dcrq2epSyg2ZjuUe4pfpxD3fluwiWupZw74w0yzJ6IMFA7sZMkbm
 DI6LEtqFD/M+I+UdBY81Fi1nAo2EhiXdDWwFHtHIAWBuD7ej4iFxCdWtls5S/bSPNzGD
 wWtA==
X-Gm-Message-State: AOAM531iKG9l4Setgibi+IwRTHvMaKqUx0I/4tvByMMlCJjKSYqgycbZ
 FXXZ2waZkQzei38rxWynqopQDH85vMcwh7ZA2Gk=
X-Google-Smtp-Source: ABdhPJyKprKZKMKnVeVwdJmowOfHCtnWE/FyEO9xJTJZcoTcB3hpw/07c0+OQ1yihGgnbSAHxbGMA5gnj0PlxKnbwgk=
X-Received: by 2002:a17:906:3b53:: with SMTP id
 h19mr19861285ejf.431.1629441242368; 
 Thu, 19 Aug 2021 23:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com>
 <20210815153713.GA32384@lst.de>
 <387d5f85-3d15-9a9e-2382-6ce3c14bc6d5@nvidia.com>
In-Reply-To: <387d5f85-3d15-9a9e-2382-6ce3c14bc6d5@nvidia.com>
From: Jerome Glisse <j.glisse@gmail.com>
Date: Thu, 19 Aug 2021 23:33:50 -0700
Message-ID: <CAH3drwYwFoPOmStOkimdmJds=0AnCjXviLOA3mxZPkSow3qTFA@mail.gmail.com>
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: John Hubbard <jhubbard@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Alex Sierra <alex.sierra@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-mm@kvack.org, 
 Ralph Campbell <rcampbell@nvidia.com>, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, jgg@nvidia.com,
 Jerome Glisse <jglisse@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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

Note that you do not want GUP to succeed on device page, i do not see
where that is handled in the new code.

On Sun, Aug 15, 2021 at 1:40 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 8/15/21 8:37 AM, Christoph Hellwig wrote:
> >> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >> index 8ae31622deef..d48a1f0889d1 100644
> >> --- a/include/linux/mm.h
> >> +++ b/include/linux/mm.h
> >> @@ -1218,7 +1218,7 @@ __maybe_unused struct page *try_grab_compound_head(struct page *page, int refs,
> >>   static inline __must_check bool try_get_page(struct page *page)
> >>   {
> >>      page = compound_head(page);
> >> -    if (WARN_ON_ONCE(page_ref_count(page) <= 0))
> >> +    if (WARN_ON_ONCE(page_ref_count(page) < (int)!is_zone_device_page(page)))
> >
> > Please avoid the overly long line.  In fact I'd be tempted to just not
> > bother here and keep the old, more lose check.  Especially given that
> > John has a patch ready that removes try_get_page entirely.
> >
>
> Yes. Andrew has accepted it into mmotm.
>
> Ralph's patch here was written well before my cleanup that removed
> try_grab_page() [1]. But now that we're here, if you drop this hunk then
> it will make merging easier, I think.
>
>
> [1] https://lore.kernel.org/r/20210813044133.1536842-4-jhubbard@nvidia.com
>
> thanks,
> --
> John Hubbard
> NVIDIA
>
