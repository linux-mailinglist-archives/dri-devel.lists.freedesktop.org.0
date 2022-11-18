Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313A62FB0A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 18:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D9810E799;
	Fri, 18 Nov 2022 17:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF2D10E799;
 Fri, 18 Nov 2022 17:03:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D4BF31FDA4;
 Fri, 18 Nov 2022 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668790981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fK2sdLfZqlxwdzyzeVC6Yy7wx8vYkqbsaxCq7BgcB58=;
 b=LS+hNeQ4geGgj4IXWO5+0pS41T+O+kbhrtYk+pP+vVRIoeuKs+oW13F6Ht+tR7USTuEyYF
 w44h38vtDK2kFPU+O2RCals0tqkM1nJKUf86qC24NucyatqLyr4TTvgkMY8PsBAD2uBX+L
 cHUUR5s7utA0uOsl3r11W1mUfWblbh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668790981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fK2sdLfZqlxwdzyzeVC6Yy7wx8vYkqbsaxCq7BgcB58=;
 b=khb2AjlSZXqyWGI6UYbr+/ZmYWHGQEHMU8He9yK4yvl4DWCKZ0jYtp3ha5rFTfTmR/yC2u
 C7/yrrNfpsGvyLBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41DED1345B;
 Fri, 18 Nov 2022 17:03:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kEZlD8W6d2PfGAAAMHmgww
 (envelope-from <vbabka@suse.cz>); Fri, 18 Nov 2022 17:03:01 +0000
Message-ID: <e4dd50b8-7ae9-a6fd-8765-2b2dd90ea1a8@suse.cz>
Date: Fri, 18 Nov 2022 18:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH mm-unstable v1 05/20] mm: add early FAULT_FLAG_WRITE
 consistency checks
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-6-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20221116102659.70287-6-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/22 11:26, David Hildenbrand wrote:
> Let's catch abuse of FAULT_FLAG_WRITE early, such that we don't have to
> care in all other handlers and might get "surprises" if we forget to do
> so.
> 
> Write faults without VM_MAYWRITE don't make any sense, and our
> maybe_mkwrite() logic could have hidden such abuse for now.
> 
> Write faults without VM_WRITE on something that is not a COW mapping is
> similarly broken, and e.g., do_wp_page() could end up placing an
> anonymous page into a shared mapping, which would be bad.
> 
> This is a preparation for reliable R/O long-term pinning of pages in
> private mappings, whereby we want to make sure that we will never break
> COW in a read-only private mapping.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/memory.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index e014435a87db..c4fa378ec2a0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5170,6 +5170,14 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
>  		 */
>  		if (!is_cow_mapping(vma->vm_flags))
>  			*flags &= ~FAULT_FLAG_UNSHARE;
> +	} else if (*flags & FAULT_FLAG_WRITE) {
> +		/* Write faults on read-only mappings are impossible ... */
> +		if (WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE)))
> +			return VM_FAULT_SIGSEGV;
> +		/* ... and FOLL_FORCE only applies to COW mappings. */
> +		if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE) &&
> +				 !is_cow_mapping(vma->vm_flags)))
> +			return VM_FAULT_SIGSEGV;
>  	}
>  	return 0;
>  }

