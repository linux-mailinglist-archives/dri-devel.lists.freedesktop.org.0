Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAUELF2+qmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:45:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1922E21FD58
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2568110E07F;
	Fri,  6 Mar 2026 11:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fSK/XAQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D26010E07F;
 Fri,  6 Mar 2026 11:45:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BCBCD60131;
 Fri,  6 Mar 2026 11:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A66C4CEF7;
 Fri,  6 Mar 2026 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772797528;
 bh=R0Pw6Rvi1Mhd+owNp6fekaCHGfNY8HGW5Ezw3BximRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fSK/XAQLAWrXgjeiTk3XlTolP/BrZo51IJvpeJZGw2osWtvnYdKil+TQMDx8gWiRi
 WjuQV6ZeyS/m6ni5W9gNsA2w9RKNJwzanT8/GnfMrboUr9Gbo4aVh2Mn/o2+vlLsjv
 4PWo7PC7OublPZdNgrtwgO4Z2w9v6j7fcHKxDxv09GvTy61OlC8iHrQfKGPJGqGONd
 M0ALOZf6QGWhuKnQcihp+k2WJXsFw4+ryjYEvUIiElVerrlDn/O4aKeIuaVu+rMseL
 zWWevBBNjgHPZpEgylrlPgorL36cHHh2UT5GUH7Mk8QSGuUi3c21N1pC1/msfyBSRQ
 8CjN9YQXQSKGA==
Date: Fri, 6 Mar 2026 11:45:24 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: David Howells <dhowells@redhat.com>, 
 Marc Dionne <marc.dionne@auristor.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Dan Williams <dan.j.williams@intel.com>,
 Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Paulo Alcantara <pc@manguebit.org>, Trond Myklebust <trondmy@kernel.org>, 
 Anna Schumaker <anna@kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, Steve French <sfrench@samba.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, 
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, 
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, 
 Brendan Jackman <jackmanb@google.com>, Zi Yan <ziy@nvidia.com>,
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-ext4@vger.kernel.org, netfs@lists.linux.dev, 
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-nilfs@vger.kernel.org, linux-xfs@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH v2 4/4] folio_batch: Rename PAGEVEC_SIZE to
 FOLIO_BATCH_SIZE
Message-ID: <56265c07-962d-4bfc-b332-17f04c97429e@lucifer.local>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
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
X-Rspamd-Queue-Id: 1922E21FD58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[redhat.com,auristor.com,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,tencent.com,huaweicloud.com,gmail.com,infradead.org,intel.com,suse.cz,zeniv.linux.org.uk,mit.edu,dilger.ca,manguebit.org,fasheh.com,evilplan.org,linux.alibaba.com,samba.org,microsoft.com,talpey.com,linux.intel.com,suse.de,ffwll.ch,ursulin.net,fb.com,dubeyko.com,linux.dev,brown.name,ziepe.ca,nvidia.com,cmpxchg.org,bytedance.com,lists.infradead.org,vger.kernel.org,lists.sourceforge.net,kvack.org,lists.linux.dev,lists.samba.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[97];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[columbia.edu:email,lucifer.local:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:44:28PM -0500, Tal Zussman wrote:
> struct pagevec no longer exists. Rename the macro appropriately.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Nice thanks for this! LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  fs/btrfs/extent_io.c        | 4 ++--
>  include/linux/folio_batch.h | 6 +++---
>  include/linux/folio_queue.h | 6 +++---
>  mm/shmem.c                  | 4 ++--
>  mm/swap.c                   | 2 +-
>  mm/swap_state.c             | 2 +-
>  mm/truncate.c               | 6 +++---
>  7 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index c373d113f1e7..d82ca509503f 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -2095,13 +2095,13 @@ static void buffer_tree_tag_for_writeback(struct btrfs_fs_info *fs_info,
>  struct eb_batch {
>  	unsigned int nr;
>  	unsigned int cur;
> -	struct extent_buffer *ebs[PAGEVEC_SIZE];
> +	struct extent_buffer *ebs[FOLIO_BATCH_SIZE];
>  };
>
>  static inline bool eb_batch_add(struct eb_batch *batch, struct extent_buffer *eb)
>  {
>  	batch->ebs[batch->nr++] = eb;
> -	return (batch->nr < PAGEVEC_SIZE);
> +	return (batch->nr < FOLIO_BATCH_SIZE);
>  }
>
>  static inline void eb_batch_init(struct eb_batch *batch)
> diff --git a/include/linux/folio_batch.h b/include/linux/folio_batch.h
> index a2f3d3043f7e..b45946adc50b 100644
> --- a/include/linux/folio_batch.h
> +++ b/include/linux/folio_batch.h
> @@ -12,7 +12,7 @@
>  #include <linux/types.h>
>
>  /* 31 pointers + header align the folio_batch structure to a power of two */
> -#define PAGEVEC_SIZE	31
> +#define FOLIO_BATCH_SIZE	31
>
>  struct folio;
>
> @@ -29,7 +29,7 @@ struct folio_batch {
>  	unsigned char nr;
>  	unsigned char i;
>  	bool percpu_pvec_drained;
> -	struct folio *folios[PAGEVEC_SIZE];
> +	struct folio *folios[FOLIO_BATCH_SIZE];
>  };
>
>  /**
> @@ -58,7 +58,7 @@ static inline unsigned int folio_batch_count(const struct folio_batch *fbatch)
>
>  static inline unsigned int folio_batch_space(const struct folio_batch *fbatch)
>  {
> -	return PAGEVEC_SIZE - fbatch->nr;
> +	return FOLIO_BATCH_SIZE - fbatch->nr;
>  }
>
>  /**
> diff --git a/include/linux/folio_queue.h b/include/linux/folio_queue.h
> index 0d3765fa9d1d..f6d5f1f127c9 100644
> --- a/include/linux/folio_queue.h
> +++ b/include/linux/folio_queue.h
> @@ -29,12 +29,12 @@
>   */
>  struct folio_queue {
>  	struct folio_batch	vec;		/* Folios in the queue segment */
> -	u8			orders[PAGEVEC_SIZE]; /* Order of each folio */
> +	u8			orders[FOLIO_BATCH_SIZE]; /* Order of each folio */
>  	struct folio_queue	*next;		/* Next queue segment or NULL */
>  	struct folio_queue	*prev;		/* Previous queue segment of NULL */
>  	unsigned long		marks;		/* 1-bit mark per folio */
>  	unsigned long		marks2;		/* Second 1-bit mark per folio */
> -#if PAGEVEC_SIZE > BITS_PER_LONG
> +#if FOLIO_BATCH_SIZE > BITS_PER_LONG
>  #error marks is not big enough
>  #endif
>  	unsigned int		rreq_id;
> @@ -70,7 +70,7 @@ static inline void folioq_init(struct folio_queue *folioq, unsigned int rreq_id)
>   */
>  static inline unsigned int folioq_nr_slots(const struct folio_queue *folioq)
>  {
> -	return PAGEVEC_SIZE;
> +	return FOLIO_BATCH_SIZE;
>  }
>
>  /**
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 149fdb051170..5e7dcf5bc5d3 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1113,7 +1113,7 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>  	pgoff_t start = (lstart + PAGE_SIZE - 1) >> PAGE_SHIFT;
>  	pgoff_t end = (lend + 1) >> PAGE_SHIFT;
>  	struct folio_batch fbatch;
> -	pgoff_t indices[PAGEVEC_SIZE];
> +	pgoff_t indices[FOLIO_BATCH_SIZE];
>  	struct folio *folio;
>  	bool same_folio;
>  	long nr_swaps_freed = 0;
> @@ -1510,7 +1510,7 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type)
>  	struct address_space *mapping = inode->i_mapping;
>  	pgoff_t start = 0;
>  	struct folio_batch fbatch;
> -	pgoff_t indices[PAGEVEC_SIZE];
> +	pgoff_t indices[FOLIO_BATCH_SIZE];
>  	int ret = 0;
>
>  	do {
> diff --git a/mm/swap.c b/mm/swap.c
> index 2e517ede6561..78b4aa811fc6 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -1018,7 +1018,7 @@ EXPORT_SYMBOL(folios_put_refs);
>  void release_pages(release_pages_arg arg, int nr)
>  {
>  	struct folio_batch fbatch;
> -	int refs[PAGEVEC_SIZE];
> +	int refs[FOLIO_BATCH_SIZE];
>  	struct encoded_page **encoded = arg.encoded_pages;
>  	int i;
>
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index a0c64db2b275..6313b59d7eab 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -385,7 +385,7 @@ void free_folio_and_swap_cache(struct folio *folio)
>  void free_pages_and_swap_cache(struct encoded_page **pages, int nr)
>  {
>  	struct folio_batch folios;
> -	unsigned int refs[PAGEVEC_SIZE];
> +	unsigned int refs[FOLIO_BATCH_SIZE];
>
>  	folio_batch_init(&folios);
>  	for (int i = 0; i < nr; i++) {
> diff --git a/mm/truncate.c b/mm/truncate.c
> index df0b7a7e6aff..2931d66c16d0 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -369,7 +369,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
>  	pgoff_t		start;		/* inclusive */
>  	pgoff_t		end;		/* exclusive */
>  	struct folio_batch fbatch;
> -	pgoff_t		indices[PAGEVEC_SIZE];
> +	pgoff_t		indices[FOLIO_BATCH_SIZE];
>  	pgoff_t		index;
>  	int		i;
>  	struct folio	*folio;
> @@ -534,7 +534,7 @@ EXPORT_SYMBOL(truncate_inode_pages_final);
>  unsigned long mapping_try_invalidate(struct address_space *mapping,
>  		pgoff_t start, pgoff_t end, unsigned long *nr_failed)
>  {
> -	pgoff_t indices[PAGEVEC_SIZE];
> +	pgoff_t indices[FOLIO_BATCH_SIZE];
>  	struct folio_batch fbatch;
>  	pgoff_t index = start;
>  	unsigned long ret;
> @@ -672,7 +672,7 @@ int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
>  int invalidate_inode_pages2_range(struct address_space *mapping,
>  				  pgoff_t start, pgoff_t end)
>  {
> -	pgoff_t indices[PAGEVEC_SIZE];
> +	pgoff_t indices[FOLIO_BATCH_SIZE];
>  	struct folio_batch fbatch;
>  	pgoff_t index;
>  	int i;
>
> --
> 2.39.5
>
