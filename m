Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJHVDAophmmuKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:46:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C2A10159D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417B410E87B;
	Fri,  6 Feb 2026 17:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RuDZk8rg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QaWMdLy1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RuDZk8rg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QaWMdLy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB4310E87B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 17:46:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8260B3E6E5;
 Fri,  6 Feb 2026 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770400003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qTlz2nZkPDxI9jBkmlvcEKM3D50RgjaUXvgFGDrKR3Q=;
 b=RuDZk8rgXjnZKWlFtjqE2zHm7XBTpP1jJz4vbGSXXStpnbrQb4F9mUAD4qLYmnNQToQ2tB
 qpdlW9S8k9NjQNGCM/lWDC0Pa8mzWUx/fj29ePeYi9puE0rofwy6v0n6k+AFv616rdK0Rr
 5R6mf2sj7WW33qHoze/GOAa9i6QYn7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770400003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qTlz2nZkPDxI9jBkmlvcEKM3D50RgjaUXvgFGDrKR3Q=;
 b=QaWMdLy1zPMgLdUBMmi+iijKOvqYya+oiX9LwRqbDIDtar1/QxaQsNaNVkeIFq4cjEv+wd
 CMYrNfi3IkKSt9Dg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RuDZk8rg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QaWMdLy1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770400003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qTlz2nZkPDxI9jBkmlvcEKM3D50RgjaUXvgFGDrKR3Q=;
 b=RuDZk8rgXjnZKWlFtjqE2zHm7XBTpP1jJz4vbGSXXStpnbrQb4F9mUAD4qLYmnNQToQ2tB
 qpdlW9S8k9NjQNGCM/lWDC0Pa8mzWUx/fj29ePeYi9puE0rofwy6v0n6k+AFv616rdK0Rr
 5R6mf2sj7WW33qHoze/GOAa9i6QYn7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770400003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qTlz2nZkPDxI9jBkmlvcEKM3D50RgjaUXvgFGDrKR3Q=;
 b=QaWMdLy1zPMgLdUBMmi+iijKOvqYya+oiX9LwRqbDIDtar1/QxaQsNaNVkeIFq4cjEv+wd
 CMYrNfi3IkKSt9Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3879B3EA63;
 Fri,  6 Feb 2026 17:46:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kva2Cv4ohmnsNAAAD6G6ig
 (envelope-from <pfalcato@suse.de>); Fri, 06 Feb 2026 17:46:38 +0000
Date: Fri, 6 Feb 2026 17:46:36 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
 Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>,
 Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, Tony Luck <tony.luck@intel.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>,
 James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, 
 Carlos Maiolino <cem@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Jann Horn <jannh@google.com>, 
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
 Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-sgx@vger.kernel.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, linux-aio@kvack.org,
 linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev, 
 devel@lists.orangefs.org, linux-xfs@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 09/13] mm: update all remaining mmap_prepare users to
 use vma_flags_t
Message-ID: <hmc2or77xnhrdlncfzjsljljwljnp6zztqsvmgxspfilmzkyty@czxpjpdm66ov>
References: <cover.1769097829.git.lorenzo.stoakes@oracle.com>
 <fb1f55323799f09fe6a36865b31550c9ec67c225.1769097829.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb1f55323799f09fe6a36865b31550c9ec67c225.1769097829.git.lorenzo.stoakes@oracle.com>
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Spam-Level: 
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,linux.intel.com,redhat.com,alien8.de,zytor.com,arndb.de,linuxfoundation.org,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,zeniv.linux.org.uk,suse.cz,kvack.org,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,linux.dev,paragon-software.com,omnibond.com,arm.com,wdc.com,infradead.org,oracle.com,suse.com,nvidia.com,paul-moore.com,namei.org,hallyn.com,rasmusvillemoes.dk,vger.kernel.org,lists.linux.dev,lists.freedesktop.org,lists.ozlabs.org,lists.orangefs.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[pfalcato@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:jarkko@kernel.org,m:dave.hansen@linux.intel.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:dan.j.williams@intel.com,m:vishal.l.verma@intel.com,m:dave.jiang@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:bcrl@kvack.org,m:xiang@kernel.org,m:chao@kernel.org,m:zbestahu@gmail.com,m:jefflexu@linux.alibaba.com,m:dhavale@google.com,m:lihongbo22@huawei.com,m:guochunhai@vivo.com,m:tytso@mit.edu,m:adilger.kernel@dilger.ca,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kern
 el.org,m:almaz.alexandrovich@paragon-software.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:babu.moger@amd.com,m:cem@kernel.org,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:willy@infradead.org,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:ziy@nvidia.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:jannh@google.com,m:dhowells@redhat.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux-sgx@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-cxl@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-aio@kvack.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:li
 nux-mm@kvack.org,m:ntfs3@lists.linux.dev,m:devel@lists.orangefs.org,m:linux-xfs@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:jgg@nvidia.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[93];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 82C2A10159D
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 04:06:18PM +0000, Lorenzo Stoakes wrote:
> We will be shortly removing the vm_flags_t field from vm_area_desc so we
> need to update all mmap_prepare users to only use the dessc->vma_flags
> field.
> 
> This patch achieves that and makes all ancillary changes required to make
> this possible.
> 
> This lays the groundwork for future work to eliminate the use of vm_flags_t
> in vm_area_desc altogether and more broadly throughout the kernel.
> 
> While we're here, we take the opportunity to replace VM_REMAP_FLAGS with
> VMA_REMAP_FLAGS, the vma_flags_t equivalent.
> 
> No functional changes intended.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  drivers/char/mem.c       |  6 +++---
>  drivers/dax/device.c     | 10 +++++-----
>  fs/aio.c                 |  2 +-
>  fs/erofs/data.c          |  5 +++--
>  fs/ext4/file.c           |  4 ++--
>  fs/ntfs3/file.c          |  2 +-
>  fs/orangefs/file.c       |  4 ++--
>  fs/ramfs/file-nommu.c    |  2 +-
>  fs/resctrl/pseudo_lock.c |  2 +-
>  fs/romfs/mmap-nommu.c    |  2 +-
>  fs/xfs/xfs_file.c        |  4 ++--
>  fs/zonefs/file.c         |  3 ++-
>  include/linux/dax.h      |  8 ++++----
>  include/linux/mm.h       | 24 +++++++++++++++++++-----
>  kernel/relay.c           |  2 +-
>  mm/memory.c              | 17 ++++++++---------
>  16 files changed, 56 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index 52039fae1594..cca4529431f8 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -306,7 +306,7 @@ static unsigned zero_mmap_capabilities(struct file *file)
>  /* can't do an in-place private mapping if there's no MMU */
>  static inline int private_mapping_ok(struct vm_area_desc *desc)
>  {
> -	return is_nommu_shared_mapping(desc->vm_flags);
> +	return is_nommu_shared_vma_flags(&desc->vma_flags);
>  }
>  #else
>  
> @@ -360,7 +360,7 @@ static int mmap_mem_prepare(struct vm_area_desc *desc)
>  
>  	desc->vm_ops = &mmap_mem_ops;
>  
> -	/* Remap-pfn-range will mark the range VM_IO. */
> +	/* Remap-pfn-range will mark the range with the I/O flag. */
>  	mmap_action_remap_full(desc, desc->pgoff);
>  	/* We filter remap errors to -EAGAIN. */
>  	desc->action.error_hook = mmap_filter_error;
> @@ -520,7 +520,7 @@ static int mmap_zero_prepare(struct vm_area_desc *desc)
>  #ifndef CONFIG_MMU
>  	return -ENOSYS;
>  #endif
> -	if (desc->vm_flags & VM_SHARED)
> +	if (vma_desc_test_flags(desc, VMA_SHARED_BIT))
>  		return shmem_zero_setup_desc(desc);
>  
>  	desc->action.success_hook = mmap_zero_private_success;
> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> index 22999a402e02..528e81240c4d 100644
> --- a/drivers/dax/device.c
> +++ b/drivers/dax/device.c
> @@ -13,7 +13,7 @@
>  #include "dax-private.h"
>  #include "bus.h"
>  
> -static int __check_vma(struct dev_dax *dev_dax, vm_flags_t vm_flags,
> +static int __check_vma(struct dev_dax *dev_dax, vma_flags_t flags,
>  		       unsigned long start, unsigned long end, struct file *file,
>  		       const char *func)
>  {
> @@ -24,7 +24,7 @@ static int __check_vma(struct dev_dax *dev_dax, vm_flags_t vm_flags,
>  		return -ENXIO;
>  
>  	/* prevent private mappings from being established */
> -	if ((vm_flags & VM_MAYSHARE) != VM_MAYSHARE) {
> +	if (!vma_flags_test(&flags, VMA_MAYSHARE_BIT)) {
>  		dev_info_ratelimited(dev,
>  				"%s: %s: fail, attempted private mapping\n",
>  				current->comm, func);
> @@ -53,7 +53,7 @@ static int __check_vma(struct dev_dax *dev_dax, vm_flags_t vm_flags,
>  static int check_vma(struct dev_dax *dev_dax, struct vm_area_struct *vma,
>  		     const char *func)
>  {
> -	return __check_vma(dev_dax, vma->vm_flags, vma->vm_start, vma->vm_end,
> +	return __check_vma(dev_dax, vma->flags, vma->vm_start, vma->vm_end,
>  			   vma->vm_file, func);
>  }
>  
> @@ -306,14 +306,14 @@ static int dax_mmap_prepare(struct vm_area_desc *desc)
>  	 * fault time.
>  	 */
>  	id = dax_read_lock();
> -	rc = __check_vma(dev_dax, desc->vm_flags, desc->start, desc->end, filp,
> +	rc = __check_vma(dev_dax, desc->vma_flags, desc->start, desc->end, filp,
>  			 __func__);
>  	dax_read_unlock(id);
>  	if (rc)
>  		return rc;
>  
>  	desc->vm_ops = &dax_vm_ops;
> -	desc->vm_flags |= VM_HUGEPAGE;
> +	vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
>  	return 0;
>  }
>  
> diff --git a/fs/aio.c b/fs/aio.c
> index 0a23a8c0717f..59b67b8da1b2 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -394,7 +394,7 @@ static const struct vm_operations_struct aio_ring_vm_ops = {
>  
>  static int aio_ring_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	desc->vm_flags |= VM_DONTEXPAND;
> +	vma_desc_set_flags(desc, VMA_DONTEXPAND_BIT);
>  	desc->vm_ops = &aio_ring_vm_ops;
>  	return 0;
>  }
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index bb13c4cb8455..e7bc29e764c6 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -438,11 +438,12 @@ static int erofs_file_mmap_prepare(struct vm_area_desc *desc)
>  	if (!IS_DAX(file_inode(desc->file)))
>  		return generic_file_readonly_mmap_prepare(desc);
>  
> -	if ((desc->vm_flags & VM_SHARED) && (desc->vm_flags & VM_MAYWRITE))
> +	if (vma_desc_test_flags(desc, VMA_SHARED_BIT) &&
> +	    vma_desc_test_flags(desc, VMA_MAYWRITE_BIT))
>  		return -EINVAL;
>  
>  	desc->vm_ops = &erofs_dax_vm_ops;
> -	desc->vm_flags |= VM_HUGEPAGE;
> +	vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
>  	return 0;
>  }
>  #else
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 7a8b30932189..dfd5f4fe1647 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -822,13 +822,13 @@ static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
>  	 * We don't support synchronous mappings for non-DAX files and
>  	 * for DAX files if underneath dax_device is not synchronous.
>  	 */
> -	if (!daxdev_mapping_supported(desc->vm_flags, file_inode(file), dax_dev))
> +	if (!daxdev_mapping_supported(desc, file_inode(file), dax_dev))
>  		return -EOPNOTSUPP;
>  
>  	file_accessed(file);
>  	if (IS_DAX(file_inode(file))) {
>  		desc->vm_ops = &ext4_dax_vm_ops;
> -		desc->vm_flags |= VM_HUGEPAGE;
> +		vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
>  	} else {
>  		desc->vm_ops = &ext4_file_vm_ops;
>  	}
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 2e7b2e566ebe..2902fc6d9a85 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -347,7 +347,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
>  	struct inode *inode = file_inode(file);
>  	struct ntfs_inode *ni = ntfs_i(inode);
>  	u64 from = ((u64)desc->pgoff << PAGE_SHIFT);
> -	bool rw = desc->vm_flags & VM_WRITE;
> +	const bool rw = vma_desc_test_flags(desc, VMA_WRITE_BIT);
>  	int err;
>  
>  	/* Avoid any operation if inode is bad. */
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index 919f99b16834..c75aa3f419b1 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -411,8 +411,8 @@ static int orangefs_file_mmap_prepare(struct vm_area_desc *desc)
>  		     "orangefs_file_mmap: called on %pD\n", file);
>  
>  	/* set the sequential readahead hint */
> -	desc->vm_flags |= VM_SEQ_READ;
> -	desc->vm_flags &= ~VM_RAND_READ;
> +	vma_desc_set_flags(desc, VMA_SEQ_READ_BIT);
> +	vma_desc_clear_flags(desc, VMA_RAND_READ_BIT);
>  
>  	file_accessed(file);
>  	desc->vm_ops = &orangefs_file_vm_ops;
> diff --git a/fs/ramfs/file-nommu.c b/fs/ramfs/file-nommu.c
> index 77b8ca2757e0..0f8e838ece07 100644
> --- a/fs/ramfs/file-nommu.c
> +++ b/fs/ramfs/file-nommu.c
> @@ -264,7 +264,7 @@ static unsigned long ramfs_nommu_get_unmapped_area(struct file *file,
>   */
>  static int ramfs_nommu_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	if (!is_nommu_shared_mapping(desc->vm_flags))
> +	if (!is_nommu_shared_vma_flags(&desc->vma_flags))
>  		return -ENOSYS;
>  
>  	file_accessed(desc->file);
> diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
> index 0bfc13c5b96d..e81d71abfe54 100644
> --- a/fs/resctrl/pseudo_lock.c
> +++ b/fs/resctrl/pseudo_lock.c
> @@ -1044,7 +1044,7 @@ static int pseudo_lock_dev_mmap_prepare(struct vm_area_desc *desc)
>  	 * Ensure changes are carried directly to the memory being mapped,
>  	 * do not allow copy-on-write mapping.
>  	 */
> -	if (!(desc->vm_flags & VM_SHARED)) {
> +	if (!vma_desc_test_flags(desc, VMA_SHARED_BIT)) {
>  		mutex_unlock(&rdtgroup_mutex);
>  		return -EINVAL;
>  	}
> diff --git a/fs/romfs/mmap-nommu.c b/fs/romfs/mmap-nommu.c
> index 4b77c6dc4418..7c3a1a7fecee 100644
> --- a/fs/romfs/mmap-nommu.c
> +++ b/fs/romfs/mmap-nommu.c
> @@ -63,7 +63,7 @@ static unsigned long romfs_get_unmapped_area(struct file *file,
>   */
>  static int romfs_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	return is_nommu_shared_mapping(desc->vm_flags) ? 0 : -ENOSYS;
> +	return is_nommu_shared_vma_flags(&desc->vma_flags) ? 0 : -ENOSYS;
>  }
>  
>  static unsigned romfs_mmap_capabilities(struct file *file)
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 7874cf745af3..1238ec018bc7 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -1974,14 +1974,14 @@ xfs_file_mmap_prepare(
>  	 * We don't support synchronous mappings for non-DAX files and
>  	 * for DAX files if underneath dax_device is not synchronous.
>  	 */
> -	if (!daxdev_mapping_supported(desc->vm_flags, file_inode(file),
> +	if (!daxdev_mapping_supported(desc, file_inode(file),
>  				      target->bt_daxdev))
>  		return -EOPNOTSUPP;
>  
>  	file_accessed(file);
>  	desc->vm_ops = &xfs_file_vm_ops;
>  	if (IS_DAX(inode))
> -		desc->vm_flags |= VM_HUGEPAGE;
> +		vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
>  	return 0;
>  }
>  
> diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
> index c1e5e30e90a0..8a7161fc49e5 100644
> --- a/fs/zonefs/file.c
> +++ b/fs/zonefs/file.c
> @@ -333,7 +333,8 @@ static int zonefs_file_mmap_prepare(struct vm_area_desc *desc)
>  	 * ordering between msync() and page cache writeback.
>  	 */
>  	if (zonefs_inode_is_seq(file_inode(file)) &&
> -	    (desc->vm_flags & VM_SHARED) && (desc->vm_flags & VM_MAYWRITE))
> +	    vma_desc_test_flags(desc, VMA_SHARED_BIT) &&
> +	    vma_desc_test_flags(desc, VMA_MAYWRITE_BIT))
>  		return -EINVAL;
>  
>  	file_accessed(file);
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index 9d624f4d9df6..bf103f317cac 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -65,11 +65,11 @@ size_t dax_recovery_write(struct dax_device *dax_dev, pgoff_t pgoff,
>  /*
>   * Check if given mapping is supported by the file / underlying device.
>   */
> -static inline bool daxdev_mapping_supported(vm_flags_t vm_flags,
> +static inline bool daxdev_mapping_supported(const struct vm_area_desc *desc,
>  					    const struct inode *inode,
>  					    struct dax_device *dax_dev)
>  {
> -	if (!(vm_flags & VM_SYNC))
> +	if (!vma_desc_test_flags(desc, VMA_SYNC_BIT))
>  		return true;
>  	if (!IS_DAX(inode))
>  		return false;
> @@ -111,11 +111,11 @@ static inline void set_dax_nomc(struct dax_device *dax_dev)
>  static inline void set_dax_synchronous(struct dax_device *dax_dev)
>  {
>  }
> -static inline bool daxdev_mapping_supported(vm_flags_t vm_flags,
> +static inline bool daxdev_mapping_supported(const struct vm_area_desc *desc,
>  					    const struct inode *inode,
>  					    struct dax_device *dax_dev)
>  {
> -	return !(vm_flags & VM_SYNC);
> +	return !vma_desc_test_flags(desc, VMA_SYNC_BIT);
>  }
>  static inline size_t dax_recovery_write(struct dax_device *dax_dev,
>  		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index fd93317193e0..e31f72a021ef 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -550,17 +550,18 @@ enum {
>  /*
>   * Physically remapped pages are special. Tell the
>   * rest of the world about it:
> - *   VM_IO tells people not to look at these pages
> + *   IO tells people not to look at these pages
>   *	(accesses can have side effects).
> - *   VM_PFNMAP tells the core MM that the base pages are just
> + *   PFNMAP tells the core MM that the base pages are just
>   *	raw PFN mappings, and do not have a "struct page" associated
>   *	with them.
> - *   VM_DONTEXPAND
> + *   DONTEXPAND
>   *      Disable vma merging and expanding with mremap().
> - *   VM_DONTDUMP
> + *   DONTDUMP
>   *      Omit vma from core dump, even when VM_IO turned off.
>   */

I don't think it's useful to erase the VM_ prefix off the flags. These still
exist, so maybe the alternative would be to rename them to e.g VMA_IO in
comments, etc. I think just saying "IO" or "the I/O flag" above is ambiguous.

> -#define VM_REMAP_FLAGS (VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP)
> +#define VMA_REMAP_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_PFNMAP_BIT,	\
> +				     VMA_DONTEXPAND_BIT, VMA_DONTDUMP_BIT)

as a sidenote, these flags are no longer constant expressions and thus

static vma_flags_t flags = VMA_REMAP_FLAGS;

can't compile.

Rest LGTM though.

Acked-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
