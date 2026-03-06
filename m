Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DUXKaS9qmmGWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:42:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578D21FC62
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167D010ECFB;
	Fri,  6 Mar 2026 11:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VmPUWeBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F330610ECFB;
 Fri,  6 Mar 2026 11:42:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B4B9A60127;
 Fri,  6 Mar 2026 11:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4FAC4CEF7;
 Fri,  6 Mar 2026 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772797342;
 bh=CA2vkPrs+KBRPBb6HWrkcW5f3nw7u13fgvwPYP4Knsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VmPUWeBaQkwHyNWrIgE+k6VTvF58sgBu9LcG+6SertLT2ce7KXBFZ0We86Id7A25U
 Q+HpvLqR5cHvWiwcCko03D2oM0ZKE14Cr+BxZZDDmzCKdHkCFk9RqTfMemJZDDnloC
 Ew767ufZJ7CKXy/CG6eJzT3vDrdM6zE9ZYv22SYiUP3CREBCfUFzOy3pucv0xCVXiW
 9MsH74masuCdJlZ8BntBknVUwyKbUCdud5oUJoRnrzrGTDqUqCnck040huUBGNP38a
 rVd+D+l7txMQlbfz48dBDZDt3rCVTj4/qKf0/Air3/s23aXm7SQiY2Tv5T9Owh5nxk
 DlcAdpF9cammw==
Date: Fri, 6 Mar 2026 11:42:19 +0000
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
Subject: Re: [PATCH v2 1/4] mm: Remove stray references to struct pagevec
Message-ID: <3f262490-ebed-49b5-99ff-7a8aaa12cada@lucifer.local>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-1-716868cc2d11@columbia.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-pagevec_cleanup-v2-1-716868cc2d11@columbia.edu>
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
X-Rspamd-Queue-Id: 1578D21FC62
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,columbia.edu:email,lucifer.local:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:44:25PM -0500, Tal Zussman wrote:
> struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
> pagevec"). Remove remaining forward declarations and change
> __folio_batch_release()'s declaration to match its definition.
>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Chris Li <chrisl@kernel.org>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  fs/afs/internal.h       | 1 -
>  fs/f2fs/f2fs.h          | 2 --
>  include/linux/pagevec.h | 2 +-
>  include/linux/swap.h    | 2 --
>  4 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/fs/afs/internal.h b/fs/afs/internal.h
> index 009064b8d661..599353c33337 100644
> --- a/fs/afs/internal.h
> +++ b/fs/afs/internal.h
> @@ -31,7 +31,6 @@
>
>  #define AFS_CELL_MAX_ADDRS 15
>
> -struct pagevec;
>  struct afs_call;
>  struct afs_vnode;
>  struct afs_server_probe;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index bb34e864d0ef..d9e8531a5301 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -28,8 +28,6 @@
>  #include <linux/fscrypt.h>
>  #include <linux/fsverity.h>
>
> -struct pagevec;
> -
>  #ifdef CONFIG_F2FS_CHECK_FS
>  #define f2fs_bug_on(sbi, condition)	BUG_ON(condition)
>  #else
> diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
> index 63be5a451627..007affabf335 100644
> --- a/include/linux/pagevec.h
> +++ b/include/linux/pagevec.h
> @@ -93,7 +93,7 @@ static inline struct folio *folio_batch_next(struct folio_batch *fbatch)
>  	return fbatch->folios[fbatch->i++];
>  }
>
> -void __folio_batch_release(struct folio_batch *pvec);
> +void __folio_batch_release(struct folio_batch *fbatch);
>
>  static inline void folio_batch_release(struct folio_batch *fbatch)
>  {
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 0effe3cc50f5..4b1f13b5bbad 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -20,8 +20,6 @@ struct notifier_block;
>
>  struct bio;
>
> -struct pagevec;
> -
>  #define SWAP_FLAG_PREFER	0x8000	/* set if swap priority specified */
>  #define SWAP_FLAG_PRIO_MASK	0x7fff
>  #define SWAP_FLAG_DISCARD	0x10000 /* enable discard for swap */
>
> --
> 2.39.5
>
