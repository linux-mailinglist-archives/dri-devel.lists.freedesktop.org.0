Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B9B28DA2E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA31A6E9FE;
	Wed, 14 Oct 2020 07:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 343 seconds by postgrey-1.36 at gabe;
 Tue, 13 Oct 2020 18:42:45 UTC
Received: from pb-sasl-trial2.pobox.com (pb-sasl-trial2.pobox.com
 [64.147.108.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A48D6E3EE;
 Tue, 13 Oct 2020 18:42:45 +0000 (UTC)
Received: from pb-sasl-trial2.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id B35092F08C;
 Tue, 13 Oct 2020 14:36:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=1qdRcPgrMg9PaaTRWeHMHkWBgn4=; b=Epy+q5
 ans9ahJwXxlQvxdjICPrBYTo3ECIn9AzWxzmuo835zX7Go5RA+la+QVdJswbYHqY
 OA9uOWP+RHqwo1f/1Hjwskkbh9itwsmr5IKrZUme2Q4YRp5bQABuumhmd/Yh0NKM
 sMhZUgbkZQs79wJJn2wtIPZ7EN0v5uRSG8bTQ=
Received: from pb-smtp1.nyi.icgroup.com (pb-smtp1.pobox.com [10.90.30.53])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 7910C2F08B;
 Tue, 13 Oct 2020 14:36:58 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=/xoWviDLFg5PKRQ9rObRWDXVC++pmZtYhfbDb0DFq7E=;
 b=v5OoWtflZD131TYsBl2A9g0L/PCRe2nu6sy2IJY2ys8stI3sGPGydjk9hbVpZeTUKIjemrnRhLwKFlAM+dXEIGXz5t0LfwSiRA8m7hrB4WLH79+9F2ww8ICEhYu0fLjFgoDc1lKWqG4ZKNRDYjtbn/p6CJBipu1Te7ZvLuk/HMw=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id CD98F955F4;
 Tue, 13 Oct 2020 14:36:57 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id CF7492DA0BC7;
 Tue, 13 Oct 2020 14:36:56 -0400 (EDT)
Date: Tue, 13 Oct 2020 14:36:56 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new
 kmap_thread()
In-Reply-To: <20201009195033.3208459-34-ira.weiny@intel.com>
Message-ID: <nycvar.YSQ.7.78.906.2010131436200.2184@knanqh.ubzr>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-34-ira.weiny@intel.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 13301A02-0D83-11EB-84D0-D152C8D8090B-78420484!pb-smtp1.pobox.com
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, cluster-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Oct 2020, ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kmap() calls in this FS are localized to a single thread.  To avoid
> the over head of global PKRS updates use the new kmap_thread() call.
> 
> Cc: Nicolas Pitre <nico@fluxnic.net>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Acked-by: Nicolas Pitre <nico@fluxnic.net>

>  fs/cramfs/inode.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 912308600d39..003c014a42ed 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
>  		struct page *page = pages[i];
>  
>  		if (page) {
> -			memcpy(data, kmap(page), PAGE_SIZE);
> -			kunmap(page);
> +			memcpy(data, kmap_thread(page), PAGE_SIZE);
> +			kunmap_thread(page);
>  			put_page(page);
>  		} else
>  			memset(data, 0, PAGE_SIZE);
> @@ -826,7 +826,7 @@ static int cramfs_readpage(struct file *file, struct page *page)
>  
>  	maxblock = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
>  	bytes_filled = 0;
> -	pgdata = kmap(page);
> +	pgdata = kmap_thread(page);
>  
>  	if (page->index < maxblock) {
>  		struct super_block *sb = inode->i_sb;
> @@ -914,13 +914,13 @@ static int cramfs_readpage(struct file *file, struct page *page)
>  
>  	memset(pgdata + bytes_filled, 0, PAGE_SIZE - bytes_filled);
>  	flush_dcache_page(page);
> -	kunmap(page);
> +	kunmap_thread(page);
>  	SetPageUptodate(page);
>  	unlock_page(page);
>  	return 0;
>  
>  err:
> -	kunmap(page);
> +	kunmap_thread(page);
>  	ClearPageUptodate(page);
>  	SetPageError(page);
>  	unlock_page(page);
> -- 
> 2.28.0.rc0.12.gb6a658bd00c9
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
