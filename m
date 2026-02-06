Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJpEF7RBhmmbLQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:32:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E7102C43
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EEC10E8F7;
	Fri,  6 Feb 2026 19:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P0//Ycw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8408010E8C2;
 Fri,  6 Feb 2026 19:31:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7517341A3F;
 Fri,  6 Feb 2026 19:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E60FC116C6;
 Fri,  6 Feb 2026 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1770406317;
 bh=sFmOLogLTpCWkUOE9qlbNa3u0BVXHcuyge59i+fnUfg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P0//Ycw7MamL01hmVUxrX954cfCW9uQM9dRODdcU5KIQuuE0qEyY1JS9AxdM8F96v
 5DofCLn88Bu4sHg6rPYalTvwkPcSbj6PjOltDumckh7j2RRU87blAz/W8ZmpRFjy+T
 5AbBbYyJ/4/G1l/2aQ5CJCldkjuxifDVAKZKSGfM=
Date: Fri, 6 Feb 2026 11:31:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>, Vishal Verma
 <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Benjamin LaHaise
 <bcrl@kvack.org>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Chunhai Guo <guochunhai@vivo.com>, Theodore Ts'o <tytso@mit.edu>, Andreas
 Dilger <adilger.kernel@dilger.ca>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mike
 Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>,
 Tony Luck <tony.luck@intel.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>, James Morse
 <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Carlos Maiolino
 <cem@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota
 <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, Matthew Wilcox
 <willy@infradead.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Hugh
 Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Zi
 Yan <ziy@nvidia.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Jann Horn
 <jannh@google.com>, David Howells <dhowells@redhat.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn"
 <serge@hallyn.com>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-sgx@vger.kernel.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-aio@kvack.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev,
 devel@lists.orangefs.org, linux-xfs@vger.kernel.org,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, Jason
 Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 09/13] mm: update all remaining mmap_prepare users to
 use vma_flags_t
Message-Id: <20260206113153.c443545459474cdef6dfd7ea@linux-foundation.org>
In-Reply-To: <hmc2or77xnhrdlncfzjsljljwljnp6zztqsvmgxspfilmzkyty@czxpjpdm66ov>
References: <cover.1769097829.git.lorenzo.stoakes@oracle.com>
 <fb1f55323799f09fe6a36865b31550c9ec67c225.1769097829.git.lorenzo.stoakes@oracle.com>
 <hmc2or77xnhrdlncfzjsljljwljnp6zztqsvmgxspfilmzkyty@czxpjpdm66ov>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oracle.com,kernel.org,linux.intel.com,redhat.com,alien8.de,zytor.com,arndb.de,linuxfoundation.org,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,zeniv.linux.org.uk,suse.cz,kvack.org,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,linux.dev,paragon-software.com,omnibond.com,arm.com,wdc.com,infradead.org,suse.com,nvidia.com,paul-moore.com,namei.org,hallyn.com,rasmusvillemoes.dk,vger.kernel.org,lists.linux.dev,lists.freedesktop.org,lists.ozlabs.org,lists.orangefs.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[93];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EF8E7102C43
X-Rspamd-Action: no action

On Fri, 6 Feb 2026 17:46:36 +0000 Pedro Falcato <pfalcato@suse.de> wrote:

> > -#define VM_REMAP_FLAGS (VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP)
> > +#define VMA_REMAP_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_PFNMAP_BIT,	\
> > +				     VMA_DONTEXPAND_BIT, VMA_DONTDUMP_BIT)
> 
> as a sidenote, these flags are no longer constant expressions and thus
> 
> static vma_flags_t flags = VMA_REMAP_FLAGS;
> 
> can't compile.

Yup, that isn't nice.  An all-caps thing with no () is a compile-time
constant.

It looks like we can make this a nice inlined (commented!) lower-cased
C function as a little low-priority cleanup.

> Rest LGTM though.
> 
> Acked-by: Pedro Falcato <pfalcato@suse.de>

Great, thanks.
