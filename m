Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570AF8CCB00
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 05:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9C610E2EE;
	Thu, 23 May 2024 03:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="afOLqBif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C090A10E2EE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:13:25 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e428242a38so104359811fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716434004; x=1717038804; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A/Gtf76HOcyJDIMcic6r4R7wehZnNe29DHssJ4jbfEk=;
 b=afOLqBif0mFhs4MCS7R3KQbAtbTRxCzsT+ugXiHGNgSac5lDYt+KzdOrQwSgAAjAAL
 IcGbZ8x0iMtuqnjcjnu65aQMsAZytuP9rrdsjHS448koWFi1c4ZLl5lO/cifBsgx69r3
 /CM7+DZBh5crjltEWy6hkP/bvAX72x0vgvIty3C5Ls5JVRTXVZrvO7ojOastyyoGik8f
 EwEwM+CHzhMXfuU23gA5E9fJdPq0+8SZvrJpxFi4+T6P/b9nj8NdbOABWgUaS1wTtobG
 cOYFBLHqvN47du8QYVp1pJcYfCTepB83F31K23m8T2ydLYiO6bdlC5W6gfyXAEEsZb8u
 gBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716434004; x=1717038804;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A/Gtf76HOcyJDIMcic6r4R7wehZnNe29DHssJ4jbfEk=;
 b=D9asnOXiwRJbONTkanQlMOqfdbeCwlcw4/AkQuDczIKTqwmzZuwamSd0RLxTgsq3RG
 cZOa4bA1cviqk14wAZ4OK5AobD+gyo8qp/CnPLf+hik4TeNJx/PskoxXrzyxPaTYBCqs
 5kj9sNliRUz279zYE9+wxl4aHXEd/qoxIRyWzkw6AZbk1VKm57h7iGHST/+g+zxpGSmr
 yevOT9T539ohSAJyyxXfqCyoggb+UeeWAH3nnEH9dSCmAkPsmu/3JyWoS63B0m0DMIeD
 TbWQ3tBglb7r371TzTEZaY6TfGbuqtEK1AvdAVE0d8Vvevh/JZT6OPVN4QcLbqGNpk0Z
 8V1w==
X-Gm-Message-State: AOJu0Yz+Yo35K3TmeAzLdM3nFuQiVo/R6ShoFVKeV2ALE+Zj4AfxUubr
 2fetcLQn2JvHVFVQnE5LVcCSHdJCEN4mDSN+MafnLqfXKZ0vaO2UOc+X75KLafQHZe3k0wPiP2R
 QyCarDFedHfHSE2SYCSGdEYuVJFo=
X-Google-Smtp-Source: AGHT+IFAc3VYRAKI6ria71uUXIPWHgcd1C/YOtDb3dAt0oa75qD3sunTygcqHGKXSPHRJxZv9qjo1NPBW3BW8vbUy8Y=
X-Received: by 2002:a2e:8055:0:b0:2e7:2c84:4f65 with SMTP id
 38308e7fff4ca-2e9492beddbmr27130041fa.0.1716434003519; Wed, 22 May 2024
 20:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240411070157.3318425-1-vivek.kasireddy@intel.com>
In-Reply-To: <20240411070157.3318425-1-vivek.kasireddy@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 23 May 2024 13:13:11 +1000
Message-ID: <CAPM=9tyuX7DKxaQ1zT7b4NYqhnjA3uLHK-kxXgeiubTZcy42=w@mail.gmail.com>
Subject: Re: [PATCH v14 0/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
 Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, 
 Jason Gunthorpe <jgg@nvidia.com>, Dongwon Kim <dongwon.kim@intel.com>, 
 Junxiao Chang <junxiao.chang@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey

Gerd, do you have any time to look at this series again, I think at
v14 we should probably consider landing it.

I'm happy to give
Acked-by: Dave Airlie <airlied@redhat.com> for landing this via mm if
it makes the most sense.

One comment in passing, was I wonder if it makes sense for things like
vm_map_ram to have a folio variant in the future, to avoid that pages
temporary allocation.

Dave.

> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
>
> Vivek Kasireddy (8):
>   mm/gup: Introduce unpin_folio/unpin_folios helpers
>   mm/gup: Introduce check_and_migrate_movable_folios()
>   mm/gup: Introduce memfd_pin_folios() for pinning memfd folios
>   udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
>   udmabuf: Add back support for mapping hugetlb pages
>   udmabuf: Convert udmabuf driver to use folios
>   udmabuf: Pin the pages using memfd_pin_folios() API
>   selftests/udmabuf: Add tests to verify data after page migration
>
>  drivers/dma-buf/udmabuf.c                     | 231 +++++++++----
>  include/linux/memfd.h                         |   5 +
>  include/linux/mm.h                            |   5 +
>  mm/gup.c                                      | 307 +++++++++++++++---
>  mm/memfd.c                                    |  35 ++
>  .../selftests/drivers/dma-buf/udmabuf.c       | 214 ++++++++++--
>  6 files changed, 659 insertions(+), 138 deletions(-)
>
> --
> 2.43.0
>
