Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945809084A1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE54A10EC48;
	Fri, 14 Jun 2024 07:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2F0cFcuJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QszfpGgo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZnuaXjoX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KrX2++MZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87D710EC2B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 04:55:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E611722897;
 Fri, 14 Jun 2024 04:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718340916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2Fib6epQ+O7wESFoNkMErJuX8tawNTH6TPqfoJ87DA=;
 b=2F0cFcuJbtmwRRIpL3eDTQGbe3X+3sEnUIoWhM3Mo3X/eqiHJ836tkiF3NNkdn0+0/DFoM
 Fff//cGwTk3gJ/zSf4BxDdF9DMcF4wyjibf18EYl8bng+3eBpb01CXJKEh3v7zmV230yZD
 kGaZkwd7OVGOkyo5Kf6I6Hw20RrhBts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718340916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2Fib6epQ+O7wESFoNkMErJuX8tawNTH6TPqfoJ87DA=;
 b=QszfpGgo6F7vfEgctwraQJ4jhtdSGsxmVxG1Z6W6qvvy1jzrs2dSa9seyKJZQOsbSqmV+j
 CD36/MfN1m2rLJAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718340915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2Fib6epQ+O7wESFoNkMErJuX8tawNTH6TPqfoJ87DA=;
 b=ZnuaXjoXT/vakk0Uf4Kw1B/qV3raFRHGRs90nYCroKbmwq0SzvJN0bZ2MsJOGXUEAcvP22
 3NSew2QlQGPs5R1SljRmyxbESUnPYvokWiZ5Adh79zJWQY65UauK1AxjhAJuxdXyBas5f0
 PZv1R7hYIuzIdGOKbIDV/p7WeeIo37o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718340915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2Fib6epQ+O7wESFoNkMErJuX8tawNTH6TPqfoJ87DA=;
 b=KrX2++MZzJLZR29tbZDPQIZOkwPGsW3NZCv9nZIxDmBzT8cuGfA2ixbBwEpg7sqNnPUhXa
 VFDbdMWSJb+Z7iAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B9EA13AAF;
 Fri, 14 Jun 2024 04:55:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kuAHCDPNa2YsLAAAD6G6ig
 (envelope-from <osalvador@suse.de>); Fri, 14 Jun 2024 04:55:15 +0000
Date: Fri, 14 Jun 2024 06:55:09 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH v15 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Message-ID: <ZmvNLSUgUgFETR0M@localhost.localdomain>
References: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
 <20240613214741.1029446-4-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613214741.1029446-4-vivek.kasireddy@intel.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:52 +0000
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

On Thu, Jun 13, 2024 at 02:42:05PM -0700, Vivek Kasireddy wrote:
> For drivers that would like to longterm-pin the folios associated
> with a memfd, the memfd_pin_folios() API provides an option to
> not only pin the folios via FOLL_PIN but also to check and migrate
> them if they reside in movable zone or CMA block. This API
> currently works with memfds but it should work with any files
> that belong to either shmemfs or hugetlbfs. Files belonging to
> other filesystems are rejected for now.
> 
> The folios need to be located first before pinning them via FOLL_PIN.
> If they are found in the page cache, they can be immediately pinned.
> Otherwise, they need to be allocated using the filesystem specific
> APIs and then pinned.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> (v2)
> Reviewed-by: David Hildenbrand <david@redhat.com> (v3)
> Reviewed-by: Christoph Hellwig <hch@lst.de> (v6)
> Acked-by: Dave Airlie <airlied@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
...
> +struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
> +{
> +#ifdef CONFIG_HUGETLB_PAGE
> +	struct folio *folio;
> +	int err;
> +
> +	if (is_file_hugepages(memfd)) {
> +		folio = alloc_hugetlb_folio_nodemask(hstate_file(memfd),
> +						     NUMA_NO_NODE,
> +						     NULL,
> +						     GFP_USER,
> +						     false);

I dislike the direct use of GFP_USER there, because it opens the door for new
users to start passing their own GFP_ flags directly into hugetlb code, which
is not optimal, and something I would really like to prevent.

Hugetlb pages, until now, they have been mapped only to userspace and only used
in there, and they can or cannot be migrated based on its size, and that is why
we have 'htlb_alloc_mask'.

Now, you need something special because 1) these pages might need to be accessible by
some DMA driver, so you have HIGHMEM contraints and 2) cannot be migrated away.
Ok, but I see this as an exception, and it should really be called out
here.

 gfp_t = htlb_alloc_mask;

 /*
  * These pages will be accessible by a DMA driver, so we have zone memory
  * constraints where we can alloc from.
  * Also, these pages will be pinned for an undefinied amount of time, so do
  * not expect them to be able to be migrated away.
  */
 gfp &=  ~(__GFP_HIGHMEM | __GFP_MOVABLE)

So it is clear what is going on here.

-- 
Oscar Salvador
SUSE Labs
