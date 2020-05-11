Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B1C1CCFE7
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 04:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E2589FCA;
	Mon, 11 May 2020 02:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE83589FCA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:53:39 +0000 (UTC)
IronPort-SDR: V0OyHvaLr5CY/1NI4F5CbgayaDx5mUTH5mSHyC9jvRdDjCtK9WWXLrEHCgzXC3wMTIzPXBmFDK
 PJx4zbd7NdqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2020 19:53:38 -0700
IronPort-SDR: xpz1MBOyTve2Yi014woff74d4fibI1XxFdgYbe1xJfc2FdwzW8PAvDDMUi1L9EO8il9IriHxVH
 fK+DVivYQqdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,378,1583222400"; d="scan'208";a="261613973"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2020 19:53:38 -0700
Date: Sun, 10 May 2020 19:53:38 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: vmwgfx: include linux/highmem.h
Message-ID: <20200511025337.GA1823106@iweiny-DESK2.sc.intel.com>
References: <20200508220150.649044-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508220150.649044-1-arnd@arndb.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>, Helge Deller <deller@gmx.de>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 09, 2020 at 12:01:31AM +0200, Arnd Bergmann wrote:
> In order to call kmap_atomic() etc, we need to include linux/highmem.h:
> 
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c: In function 'vmw_bo_cpu_blit_line':
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:377:4: error: implicit declaration of function 'kunmap_atomic'; did you mean 'in_atomic'? [-Werror=implicit-function-declaration]
>   377 |    kunmap_atomic(d->src_addr);
>       |    ^~~~~~~~~~~~~
>       |    in_atomic
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:391:5: error: implicit declaration of function 'kmap_atomic_prot' [-Werror=implicit-function-declaration]
>   391 |     kmap_atomic_prot(d->dst_pages[dst_page],
>       |     ^~~~~~~~~~~~~~~~
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:390:16: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   390 |    d->dst_addr =
>       |                ^
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:403:16: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   403 |    d->src_addr =
>       |                ^
> 
> Fixes: 46385a895322 ("drm: remove drm specific kmap_atomic code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I'm curious about the config which failed...  Because this compiled for me.
Regardless it was stupid of me to not include this.

Thanks,

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> index 94d456a1d1a9..1629427d5734 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -27,6 +27,7 @@
>   **************************************************************************/
>  
>  #include "vmwgfx_drv.h"
> +#include <linux/highmem.h>
>  
>  /*
>   * Template that implements find_first_diff() for a generic
> -- 
> 2.26.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
