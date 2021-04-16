Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C39E361E73
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 13:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5272A6E0AF;
	Fri, 16 Apr 2021 11:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557FF6EB79
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wricDXbRsfuITNqF2TYSCApfJgf/TrNtRqhvMhFAZJs=; b=Y26Meg6YAb9XQNiI4oEZ9AFQuy
 wWYeKyW7C8HS2jwil4L54VgZ33G3sI1oaIR7z8ndqNXOo2388OcOr6TTZCjNFkcJ2m+ytYNdxpb7E
 YwQgab6tdRx2Q02tudGG62J7NUz4fzFm+2Q2OMzUhiGofWME4QtAVudHl3QpPG4jClPZLPzaLSAqE
 bhVhHnQDYbGu1sqBqxrgJxy4Dr0zOOPeosynVnO0Uj33kcCQ3tyg91sUGnlxgg1z1CudTO/kri5LE
 h/etKdNOg4QTmPIhRJyi/XN5u7l0YvkwsvkMAp86iH2jLCcYgrldJnXbqQnev78jJOiDvmCBIIh0X
 zb00LSVw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXMLY-009rOM-P1; Fri, 16 Apr 2021 11:09:13 +0000
Date: Fri, 16 Apr 2021 12:09:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Peter Enderborg <peter.enderborg@sony.com>
Subject: Re: [PATCH] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <20210416110912.GI2531743@casper.infradead.org>
References: <20210416093719.6197-1-peter.enderborg@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416093719.6197-1-peter.enderborg@sony.com>
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
Cc: Michal Hocko <mhocko@suse.com>, NeilBrown <neilb@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Mike Rapoport <rppt@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Roman Gushchin <guro@fb.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 11:37:19AM +0200, Peter Enderborg wrote:
> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> index 6fa761c9cc78..3c1a82b51a6f 100644
> --- a/fs/proc/meminfo.c
> +++ b/fs/proc/meminfo.c
> @@ -16,6 +16,7 @@
>  #ifdef CONFIG_CMA
>  #include <linux/cma.h>
>  #endif
> +#include <linux/dma-buf.h>
>  #include <asm/page.h>
>  #include "internal.h"
>  
> @@ -145,6 +146,7 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
>  	show_val_kb(m, "CmaFree:        ",
>  		    global_zone_page_state(NR_FREE_CMA_PAGES));
>  #endif
> +	show_val_kb(m, "DmaBufTotal:    ", dma_buf_get_size());
>  
>  	hugetlb_report_meminfo(m);
>  

... and if CONFIG_DMA_SHARED_BUFFER is not set ...?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
