Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E2620116
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 22:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1109C10E4CF;
	Mon,  7 Nov 2022 21:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC85D10E4CF;
 Mon,  7 Nov 2022 21:26:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 257536130E;
 Mon,  7 Nov 2022 21:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8111FC43470;
 Mon,  7 Nov 2022 21:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667856362;
 bh=SwQyXyRosovtBDcr7GfPt6fsp4ng05oq/t3fG7dB68g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ffvHIqojBVLH/R8RQOQEgXCeTITmfwvIoxefm2/kBiEz2OyLI9Io4TDxW06ogg/sN
 3fWSVwLP7C1LXRhdThBd1UCmwrb62aNwnwPhsnjD194IsHOpRrxOtn/gP3z8BLEjEE
 3a6gLv9bTBbYeKfi6puWXH9+gHFk4yKiM4mbbf1kJMaVXq4O7YS4IPezgSwqAiw6dg
 aWWwBH05mwWpElBiERd2AjzW1oA4IQ2N8kMYhhPV076879Sxylya1gjvFB6S75Ki6D
 YSxGBZQ+IsbaVRLSlTBJcnreOKfX2foV+YDEFOPtCI4Hb73C8fJ5KP2ecXZ+zVPCe3
 Yxz5zRAEx0Q+g==
Received: by mail-yb1-f171.google.com with SMTP id o70so15158519yba.7;
 Mon, 07 Nov 2022 13:26:02 -0800 (PST)
X-Gm-Message-State: ANoB5pmsQ27aYCJ0gGCvqVvx7H7C6awYPetTzb+JZy8rzFEIPHGuQBDg
 9z59er6eUx1ZScZG3mXTeakk4RTankyEGff+/pM=
X-Google-Smtp-Source: AA0mqf57IeLMapCs6BKe1PyHfS6JiZC8g/49BGtedtXgLWmUCCwX95DungbNLQq9eDdaj9K/AImhyOL53rs80CSF5uA=
X-Received: by 2002:a25:2389:0:b0:6d8:7f81:edaf with SMTP id
 j131-20020a252389000000b006d87f81edafmr3849061ybj.443.1667856361598; Mon, 07
 Nov 2022 13:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-20-david@redhat.com>
In-Reply-To: <20221107161740.144456-20-david@redhat.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 23:25:35 +0200
X-Gmail-Original-Message-ID: <CAFCwf12AtZ3jqJf8fTmq+bK5Z109N_k4WG1nuDmMXoBNA3KMmA@mail.gmail.com>
Message-ID: <CAFCwf12AtZ3jqJf8fTmq+bK5Z109N_k4WG1nuDmMXoBNA3KMmA@mail.gmail.com>
Subject: Re: [PATCH RFC 19/19] habanalabs: remove FOLL_FORCE usage
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 6:19 PM David Hildenbrand <david@redhat.com> wrote:
>
> FOLL_FORCE is really only for debugger access. As we unpin the pinned pages
> using unpin_user_pages_dirty_lock(true), the assumption is that all these
> pages are writable.
>
> FOLL_FORCE in this case seems to be due to copy-and-past from other
> drivers. Let's just remove it.
>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/misc/habanalabs/common/memory.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
> index ef28f3b37b93..e35cca96bbef 100644
> --- a/drivers/misc/habanalabs/common/memory.c
> +++ b/drivers/misc/habanalabs/common/memory.c
> @@ -2312,8 +2312,7 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
>         if (!userptr->pages)
>                 return -ENOMEM;
>
> -       rc = pin_user_pages_fast(start, npages,
> -                                FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +       rc = pin_user_pages_fast(start, npages, FOLL_WRITE | FOLL_LONGTERM,
>                                  userptr->pages);
>
>         if (rc != npages) {
> --
> 2.38.1
>
>
Acked-by: Oded Gabbay <ogabbay@kernel.org>
Thanks,
Oded
