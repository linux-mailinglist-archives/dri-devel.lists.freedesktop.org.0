Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFpPHkgwemlq3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:50:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289D9A487A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AFE10E724;
	Wed, 28 Jan 2026 15:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="z5g8en+G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2XN42P5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z5g8en+G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2XN42P5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C828110E723
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 15:50:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 624FF5BCCA;
 Wed, 28 Jan 2026 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769615426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5xl2haCUI0hSbDXGPGJjYXdaOWzaQKGtYWRQOCdGmk=;
 b=z5g8en+G05pnMaNrzzDCXnf1qOdMVROErfW2cjLmhjMwUBS3nqT7MqPjMQ1soQOw95TLTo
 Xuu1CJXJHDc4ykhi5dXEd8DlyHOU/VPbnkfrQyMvP403e5vyhMNr2RE5XHX5nWp9NGKcPU
 HO4Eh1la/o/z3buNY93rhoQIoFEkvdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769615426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5xl2haCUI0hSbDXGPGJjYXdaOWzaQKGtYWRQOCdGmk=;
 b=z2XN42P5bGin/nEWebti+qMt69kcoJ1HxWoyBX5Ra2kIqBIQTO0F8xPzWqOas0ufx5A+2R
 jhMG61Ostvk8GKAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z5g8en+G;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z2XN42P5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769615426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5xl2haCUI0hSbDXGPGJjYXdaOWzaQKGtYWRQOCdGmk=;
 b=z5g8en+G05pnMaNrzzDCXnf1qOdMVROErfW2cjLmhjMwUBS3nqT7MqPjMQ1soQOw95TLTo
 Xuu1CJXJHDc4ykhi5dXEd8DlyHOU/VPbnkfrQyMvP403e5vyhMNr2RE5XHX5nWp9NGKcPU
 HO4Eh1la/o/z3buNY93rhoQIoFEkvdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769615426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5xl2haCUI0hSbDXGPGJjYXdaOWzaQKGtYWRQOCdGmk=;
 b=z2XN42P5bGin/nEWebti+qMt69kcoJ1HxWoyBX5Ra2kIqBIQTO0F8xPzWqOas0ufx5A+2R
 jhMG61Ostvk8GKAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E04173EA61;
 Wed, 28 Jan 2026 15:50:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k2B9MzwwemlHUQAAD6G6ig
 (envelope-from <pfalcato@suse.de>); Wed, 28 Jan 2026 15:50:20 +0000
Date: Wed, 28 Jan 2026 15:50:19 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Yury Norov <ynorov@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
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
Subject: Re: [PATCH v2 00/13] mm: add bitmap VMA flag helpers and convert all
 mmap_prepare to use them
Message-ID: <wqtf6zwf72i5mmq4jxzea5lg7nziinqrm7eyou6n76ticah4py@ju4i4mndzsr2>
References: <cover.1769097829.git.lorenzo.stoakes@oracle.com>
 <aXjDaN4pwEyyBy-I@yury>
 <5f764622-fd45-4c49-8ecb-7dc4d1fa48d6@lucifer.local>
 <aXkv7DSUbdY-RD5d@yury>
 <c7452c5f-e42f-4595-8680-bd1d5726be38@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7452c5f-e42f-4595-8680-bd1d5726be38@lucifer.local>
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
	FORGED_RECIPIENTS(0.00)[m:lorenzo.stoakes@oracle.com,m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:jarkko@kernel.org,m:dave.hansen@linux.intel.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:dan.j.williams@intel.com,m:vishal.l.verma@intel.com,m:dave.jiang@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:bcrl@kvack.org,m:xiang@kernel.org,m:chao@kernel.org,m:zbestahu@gmail.com,m:jefflexu@linux.alibaba.com,m:dhavale@google.com,m:lihongbo22@huawei.com,m:guochunhai@vivo.com,m:tytso@mit.edu,m:adilger.kernel@dilger.ca,m:muchun.song@linux.dev,m:osalvador@
 suse.de,m:david@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:hubcap@omnibond.com,m:martin@omnibond.com,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:babu.moger@amd.com,m:cem@kernel.org,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:willy@infradead.org,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:ziy@nvidia.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:jannh@google.com,m:dhowells@redhat.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux-sgx@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-cxl@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-fsdevel@vger.kernel.org,m:linux-aio@kvack.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@
 vger.kernel.org,m:linux-mm@kvack.org,m:ntfs3@lists.linux.dev,m:devel@lists.orangefs.org,m:linux-xfs@vger.kernel.org,m:keyrings@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:jgg@nvidia.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,kernel.org,linux.intel.com,redhat.com,alien8.de,zytor.com,arndb.de,linuxfoundation.org,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,zeniv.linux.org.uk,suse.cz,kvack.org,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,linux.dev,paragon-software.com,omnibond.com,arm.com,wdc.com,infradead.org,oracle.com,suse.com,paul-moore.com,namei.org,hallyn.com,rasmusvillemoes.dk,vger.kernel.org,lists.linux.dev,lists.freedesktop.org,lists.ozlabs.org,lists.orangefs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_GT_50(0.00)[94];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,open-std.org:url]
X-Rspamd-Queue-Id: 289D9A487A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 09:33:44AM +0000, Lorenzo Stoakes wrote:
> On Tue, Jan 27, 2026 at 04:36:44PM -0500, Yury Norov wrote:
> > On Tue, Jan 27, 2026 at 02:40:03PM +0000, Lorenzo Stoakes wrote:
> > > On Tue, Jan 27, 2026 at 08:53:44AM -0500, Yury Norov wrote:
> > > > On Thu, Jan 22, 2026 at 04:06:09PM +0000, Lorenzo Stoakes wrote:
> >
> > ...
> >
> > > > Even if you expect adding more flags, u128 would double your capacity,
> > > > and people will still be able to use language-supported operation on
> > > > the bits in flag. Which looks simpler to me...
> > >
> > > u128 isn't supported on all architectures, VMA flags have to have absolutely
> >
> > What about big integers?
> >
> >         typedef unsigned _BitInt(VMA_FLAGS_COUNT) vma_flags_t
> 
> There is no use of _BitInt anywhere in the kernel. That seems to be a
> C23-only feature with limited compiler support that we simply couldn't use
> yet.
> 
> https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2025/p3639r0.html tells
> me that it's supported in clang 16+ and gcc 14+.
> 
> We cannot put such a restriction on compilers in the kernel, obviously.
> 
> >
> > > We want to be able to arbitrarily extend this as we please in the future. So
> > > using u64 wouldn't buy us _anything_ except getting the 32-bit kernels in line.
> >
> > So enabling 32-bit arches is a big deal, even if it's a temporary
> > solution. Again, how many flags in your opinion are blocked because of
> > 32-bit integer limitation? How soon 64-bit capacity will get fully
> > used?
> 
> In my opinion? I'm not sure where my opinion comes into this? There are 43 VMA
> flags and 32-bits available in 32-bit kernels.
> 
> As I said to you before Yury, when adding new flags you have to add a whole
> load of mess of #ifdef CONFIG_64BIT ... #endif etc. around things that have
> nothing to do with 64-bit vs 32-bit architecture as a result.
> 
> It's a mess, we've run out.
> 
> Also something that might not have occurred to you - there is a chilling
> effect of limited VMA flag availability - the bar to adding flags is
> higher, and features that might have used VMA flags but need general kernel
> support (incl. 32-bit) have to find other ways to store state like this.
> 

For the record, I fully agree with all of the points you made. I don't think
it makes sense to hold this change back waiting for a feature that right
now is relatively unobtainable (also IIRC the ABI around _BitInt was a bit
unstable and confusing in general, I don't know if that changed).

The goals are to:
1) get more than sizeof(unsigned long) * 8 flags so we don't have to uglify
and gatekeep things behind 64-bit. Also letting us use VMA flags more freely.
2) not cause any performance/codegen regression

Yes, the current patchset (and the current state of things too) uglifies
things a bit, but it also provides things like type safety which are sorely
needed here. And which 128-bit integers, or N-bit integers would not provide.

And if any of the above suddenly become available to us in the future, it
will be trivial to change because the VMA flags types will be fully
encapsulated with proper accessors.

Or perhaps we'll rewrite it all in rust by the end of the decade and this is
all a moot point, who knows ;)

-- 
Pedro
