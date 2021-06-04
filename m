Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6C39BBAA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 17:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03576F617;
	Fri,  4 Jun 2021 15:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD276F617
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622820055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4AbIlLedm5Mu+ovdpvNjPfOsXH7m99kQNtIejaRsUUU=;
 b=aeqKdawg7sPeFs5OAk/SZXNhGlTx0+oUowDFRIqBJlbei1qvU7oefc7LKk7MjK621tZebS
 iTKdhb46fY2pfj6P/zWd/cqLVJgaSXXMMuqrvDLycyJVSFcUdEtnYUNpPbr4g06Qgk/tdu
 uFLbyEB8tl/hcZHUEcF5An6yyjXiZyk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-FozbT41iPZiPsLXbBrscBg-1; Fri, 04 Jun 2021 11:20:51 -0400
X-MC-Unique: FozbT41iPZiPsLXbBrscBg-1
Received: by mail-qk1-f199.google.com with SMTP id
 z12-20020a05620a08ccb02902ea1e4a963dso6807848qkz.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4AbIlLedm5Mu+ovdpvNjPfOsXH7m99kQNtIejaRsUUU=;
 b=UHxI3fzyg582t5SVHbMZ2BV2BxwA6RYDsZuB+NCeEgFa77nU+Anx+VZEndiU3r4HCo
 UOiZIYFzJPzgTuQq8Y//muXFaHwlyzMgtfsrxu9rh5eWMHtekl6xJbPk0FUOCyrd4WNO
 Tt/pc9DZxbwKNHAYdRzEY06onbMn1n9O4VDl4+S8YUTB27JPhkz2+/+uF9TMs1u74q4r
 MUE4//uOacWsK90+6iHykgZYodg3XJnSADAEe6qLDgEmQVCLPADiy0AMJyzloZeAHYbo
 YxqcJSju9Xq+du/qGv46cgiveJh6S35R1lVGB69dgyzhcS3uhaF5j4KHltfkodich69i
 W9nw==
X-Gm-Message-State: AOAM53370BzIA/sRHM2KQ5975qPZ3ZeI98uLZpnD3my5oqsWlSghkmwS
 i1+xUgIhrQfcVG3n+y6ase+MUwG5UXAC4LwTHl2XOH+JrTUqqtP+2r2/xUtkhKnvH0HZ+rwMd1b
 oYiYI2K5VeFBkb6wlc0Z3CkogyodZ
X-Received: by 2002:a37:911:: with SMTP id 17mr2506634qkj.436.1622820051429;
 Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSkb15icJCjCC2a0yzUkFB8Tk/1b3Gxyat2dgZri3GuoK2EOI4ZaPq1ePBkTLwQGSCPYLtvg==
X-Received: by 2002:a37:911:: with SMTP id 17mr2506604qkj.436.1622820051225;
 Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id x9sm3701082qtf.76.2021.06.04.08.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:20:50 -0700 (PDT)
Date: Fri, 4 Jun 2021 11:20:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YLpE0U789jvD2zxN@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <3853054.AI2YdRgKcH@nvdebian> <YLjrjJXMP9Y3bvej@t490s>
 <10231977.pWpf7cJbZl@nvdebian>
MIME-Version: 1.0
In-Reply-To: <10231977.pWpf7cJbZl@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Balbir Singh <bsingharora@gmail.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 11:07:42AM +1000, Alistair Popple wrote:
> On Friday, 4 June 2021 12:47:40 AM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > On Thu, Jun 03, 2021 at 09:39:32PM +1000, Alistair Popple wrote:
> > > Reclaim won't run on the page due to the extra references from the special
> > > swap entries.
> > 
> > That sounds reasonable, but I didn't find the point that stops it, probably
> > due to my limited knowledge on the reclaim code.  Could you elaborate?
> 
> Sure, it isn't immediately obvious but it ends up being detected at the start 
> of is_page_cache_freeable() in the pageout code:
> 
> 
> static pageout_t pageout(struct page *page, struct address_space *mapping)
> {
> 
> [...]
> 
> 	if (!is_page_cache_freeable(page))
> 		return PAGE_KEEP;

I did look at pageout() but still missed this small helper indeed (while it's
so important to know..), thanks!

-- 
Peter Xu

