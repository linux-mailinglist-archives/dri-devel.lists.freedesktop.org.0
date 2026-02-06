Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ0TI24hhmm/JwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:14:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270CB100D0A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F18E10E84F;
	Fri,  6 Feb 2026 17:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="j6+Jb2DU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+WIS4NGb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j6+Jb2DU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+WIS4NGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7129710E843
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 17:14:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 150CF3E6C2;
 Fri,  6 Feb 2026 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770398057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z73YqVi28uxxhcm78/EYnmwbNwCl8FOdS0dwqPt0f7Y=;
 b=j6+Jb2DUNuDTgyLkT8P3dkpO+CJ+tX2ecLNPiO/pp8qkcSVNK3jHeQUyaXVLnlnuRI5B8n
 0Va0mO+M0DejOC8cpnGzBuSoJ1/HWdb+y9LnG5gNjyig2YXtshRMvCrzsFY6HvX87PYZvf
 RmxhKvO5BrRs04UEmzHFp1pv1EJEWV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770398057;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z73YqVi28uxxhcm78/EYnmwbNwCl8FOdS0dwqPt0f7Y=;
 b=+WIS4NGbvV7/KSSc7+n9BNQHqhpKwo39WaYXAKAf/VXJOO7yQy2+H2qFwF+pyT/DpmqW4z
 KMiDKgBB2zApEGDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j6+Jb2DU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+WIS4NGb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770398057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z73YqVi28uxxhcm78/EYnmwbNwCl8FOdS0dwqPt0f7Y=;
 b=j6+Jb2DUNuDTgyLkT8P3dkpO+CJ+tX2ecLNPiO/pp8qkcSVNK3jHeQUyaXVLnlnuRI5B8n
 0Va0mO+M0DejOC8cpnGzBuSoJ1/HWdb+y9LnG5gNjyig2YXtshRMvCrzsFY6HvX87PYZvf
 RmxhKvO5BrRs04UEmzHFp1pv1EJEWV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770398057;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z73YqVi28uxxhcm78/EYnmwbNwCl8FOdS0dwqPt0f7Y=;
 b=+WIS4NGbvV7/KSSc7+n9BNQHqhpKwo39WaYXAKAf/VXJOO7yQy2+H2qFwF+pyT/DpmqW4z
 KMiDKgBB2zApEGDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFB943EA63;
 Fri,  6 Feb 2026 17:14:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ztnsLmMhhmm+LAAAD6G6ig
 (envelope-from <pfalcato@suse.de>); Fri, 06 Feb 2026 17:14:11 +0000
Date: Fri, 6 Feb 2026 17:14:10 +0000
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
Subject: Re: [PATCH v2 03/13] mm: add mk_vma_flags() bitmap flag macro helper
Message-ID: <mflwgdnyipdf4reufmbx7qarjcgouct5coe2bllticrabcu6rt@vf3bvmpunimw>
References: <cover.1769097829.git.lorenzo.stoakes@oracle.com>
 <fde00df6ff7fb8c4b42cc0defa5a4924c7a1943a.1769097829.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fde00df6ff7fb8c4b42cc0defa5a4924c7a1943a.1769097829.git.lorenzo.stoakes@oracle.com>
X-Spam-Score: -2.51
X-Spam-Level: 
X-Spam-Flag: NO
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
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[pfalcato@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:jarkko@kernel.org,m:dave.hansen@linux.intel.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:dan.j.williams@intel.com,m:vishal.l.verma@intel.com,m:dave.jiang@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:bcrl@kvack.org,m:xiang@kernel.org,m:chao@kernel.org,m:zbestahu@gmail.com,m:jefflexu@linux.alibaba.com,m:dhavale@google.com,m:lihongbo22@huawei.com,m:guochunhai@vivo.com,m:tytso@mit.edu,m:adilger.kernel@dilger.ca,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kern
 el.org,m:almaz.alexandrovich@paragon-software.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:babu.moger@amd.com,m:cem@kernel.org,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:willy@infradead.org,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:ziy@nvidia.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:jannh@google.com,m:dhowells@redhat.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux-sgx@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-cxl@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-aio@kvack.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:li
 nux-mm@kvack.org,m:ntfs3@lists.linux.dev,m:devel@lists.orangefs.org,m:linux-xfs@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:jgg@nvidia.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,linux.intel.com,redhat.com,alien8.de,zytor.com,arndb.de,linuxfoundation.org,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,zeniv.linux.org.uk,suse.cz,kvack.org,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,linux.dev,paragon-software.com,omnibond.com,arm.com,wdc.com,infradead.org,oracle.com,suse.com,nvidia.com,paul-moore.com,namei.org,hallyn.com,rasmusvillemoes.dk,vger.kernel.org,lists.linux.dev,lists.freedesktop.org,lists.ozlabs.org,lists.orangefs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[93];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oracle.com:email,nvidia.com:email,suse.de:email,suse.de:dkim]
X-Rspamd-Queue-Id: 270CB100D0A
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 04:06:12PM +0000, Lorenzo Stoakes wrote:
> This patch introduces the mk_vma_flags() macro helper to allow easy
> manipulation of VMA flags utilising the new bitmap representation
> implemented of VMA flags defined by the vma_flags_t type.
> 
> It is a variadic macro which provides a bitwise-or'd representation of all
> of each individual VMA flag specified.
> 
> Note that, while we maintain VM_xxx flags for backwards compatibility until
> the conversion is complete, we define VMA flags of type vma_flag_t using
> VMA_xxx_BIT to avoid confusing the two.
> 
> This helper macro therefore can be used thusly:
> 
> vma_flags_t flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT);
> 
> We allow for up to 5 flags to specified at a time which should accommodate
> all current kernel uses of combined VMA flags.
>

How do you allow up to 5 flags? I don't see any such limitation in the code?
 
> Testing has demonstrated that the compiler optimises this code such that it
> generates the same assembly utilising this macro as it does if the flags
> were specified manually, for instance:
> 
> vma_flags_t get_flags(void)
> {
> 	return mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT);
> }
> 
> Generates the same code as:
> 
> vma_flags_t get_flags(void)
> {
> 	vma_flags_t flags;
> 
> 	vma_flags_clear_all(&flags);
> 	vma_flag_set(&flags, VMA_READ_BIT);
> 	vma_flag_set(&flags, VMA_WRITE_BIT);
> 	vma_flag_set(&flags, VMA_EXEC_BIT);
> 
> 	return flags;
> }
> 
> And:
> 
> vma_flags_t get_flags(void)
> {
> 	vma_flags_t flags;
> 	unsigned long *bitmap = ACCESS_PRIVATE(&flags, __vma_flags);
> 
> 	*bitmap = 1UL << (__force int)VMA_READ_BIT;
> 	*bitmap |= 1UL << (__force int)VMA_WRITE_BIT;
> 	*bitmap |= 1UL << (__force int)VMA_EXEC_BIT;
> 
> 	return flags;
> }
> 
> That is:
> 
> get_flags:
>         movl    $7, %eax
>         ret
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
