Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CE4ADF659
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6351A10E902;
	Wed, 18 Jun 2025 18:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="WmjG5byt";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pnny5t+1";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="V8XAlhZj";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZOSe9hUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE70610E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 10:28:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BECB9211C4;
 Tue, 17 Jun 2025 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750156098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=WmjG5bytiy7I3a/BBLvW+VsIqotD5+JByi3+kYC+pJMvBTbqXyJesHTAiZz3I9gAH/sqUN
 odZ44BsgYcizKb8oLgEt7TVYvcI+tsVcCM6mtUrfDsIhCmfjtb9owBPB4UGS70/DLklX3/
 Jo0XXlko/aZ2t3BgHpHVI8npx+gZ584=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750156098;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=pnny5t+1R3s5+oz10RPJdQZOZNrWl6PZC680u7CImBF6HezK9+Kt7F3opuQwryTFcHQpGE
 YCJF0/Vphg/IO3AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750156097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=V8XAlhZjNOq8a7kiGH50OFfxbQped1myZsJ2VgF89KEp1B7ttzza88fJJmn8NOg1DW9f4B
 dsvPKunu7OasSmWwBpOOEngmUB1By6xbruLi8CNwnB8xMEMKKX3pNnCpg41JdP5EXk1cj4
 +u3B2fWZyjPE8HDYsGAxwXD53Fd47Mk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750156097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=ZOSe9hUD5u6zOvVCb2BXorJhOv5ONladUC3MF82cZkGy3ZY15cD1s7zoZ2vwuLM5JGKDm5
 jOxbp0QBEPV9MGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A12C913AE1;
 Tue, 17 Jun 2025 10:28:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MhydJkFDUWjGHQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 17 Jun 2025 10:28:17 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 4465FA29F0; Tue, 17 Jun 2025 12:28:17 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:28:17 +0200
From: Jan Kara <jack@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jens Axboe <axboe@kernel.dk>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>, 
 Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Kent Overstreet <kent.overstreet@linux.dev>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>, 
 Kees Cook <kees@kernel.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
 Hongbo Li <lihongbo22@huawei.com>, Namjae Jeon <linkinjeon@kernel.org>, 
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Woodhouse <dwmw2@infradead.org>, 
 Dave Kleikamp <shaggy@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
 Anna Schumaker <anna@kernel.org>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, Bob Copeland <me@bobcopeland.com>, 
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, 
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, Hans de Goede <hdegoede@redhat.com>, 
 Carlos Maiolino <cem@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, 
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, 
 linux-afs@lists.infradead.org, linux-aio@kvack.org,
 linux-unionfs@vger.kernel.org, 
 linux-bcachefs@vger.kernel.org, linux-mm@kvack.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-um@lists.infradead.org,
 linux-mtd@lists.infradead.org, 
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, 
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 nvdimm@lists.linux.dev
Subject: Re: [PATCH 10/10] fs: replace mmap hook with .mmap_prepare for
 simple mappings
Message-ID: <6nktgdc7ygt6hncfnl33d2jlwvlydspiiklwf6oxiqxxcjhzs2@j6f36ktyv774>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
X-Spamd-Result: default: False [-0.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 FORGED_RECIPIENTS(2.00)[m:akpm@linux-foundation.org, m:axboe@kernel.dk,
 m:rodrigo.vivi@intel.com, m:airlied@gmail.com, m:simona@ffwll.ch,
 m:ericvh@kernel.org, m:lucho@ionkov.net, m:asmadeus@codewreck.org,
 m:linux_oss@crudebyte.com, m:marc.dionne@auristor.com,
 m:viro@zeniv.linux.org.uk, m:brauner@kernel.org, m:bcrl@kvack.org,
 m:amir73il@gmail.com, m:aivazian.tigran@gmail.com, m:kees@kernel.org,
 m:clm@fb.com, m:idryomov@gmail.com, m:jaharkes@cs.cmu.edu, m:coda@cs.cmu.edu,
 m:xiang@kernel.org, m:chao@kernel.org, m:zbestahu@gmail.com,
 m:dhavale@google.com, m:lihongbo22@huawei.com, m:linkinjeon@kernel.org,
 m:adilger.kernel@dilger.ca, m:jaegeuk@kernel.org, m:slava@dubeyko.com,
 m:frank.li@vivo.com, m:anton.ivanov@cambridgegreys.com,
 m:mikulas@artax.karlin.mff.cuni.cz, m:dwmw2@infradead.org, m:shaggy@kernel.org,
 m:trondmy@kernel.org, m:anna@kernel.org, m:konishi.ryusuke@gmail.com,
 m:mark@fasheh.com, m:jlbec@evilplan.org, m:me@bobcopeland.com,
 m:ronniesahlberg@gmail.com, m:chengzhihao1@huawei.com, m:cem@kernel.org,
 m:dlemoal@kernel.or
 g,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:dan.j.williams@intel.com,m:willy@infradead.org,m:jannh@google.com,m:linux-aio@kvack.org,m:linux-mm@kvack.org,m:codalist@coda.cs.cmu.edu,s:linux-mtd@lists.infradead.org,s:linux-um@lists.infradead.org,s:ntfs3@lists.linux.dev,s:nvdimm@lists.linux.dev,s:ocfs2-devel@lists.linux.dev,s:devel@lists.orangefs.org,s:samba-technical@lists.samba.org,s:jfs-discussion@lists.sourceforge.net,s:linux-f2fs-devel@lists.sourceforge.net,s:linux-karma-devel@lists.sourceforge.net];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,oracle.com:email,suse.cz:email,suse.com:email];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_LAST(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,kernel.dk,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,kernel.org,ionkov.net,codewreck.org,crudebyte.com,suse.com,redhat.com,auristor.com,zeniv.linux.org.uk,suse.cz,kvack.org,szeredi.hu,linux.dev,fb.com,toxicpanda.com,cs.cmu.edu,tyhicks.com,linux.alibaba.com,google.com,huawei.com,samsung.com,sony.com,mit.edu,dilger.ca,mail.parknet.co.jp,dubeyko.com,physik.fu-berlin.de,vivo.com,nod.at,cambridgegreys.com,sipsolutions.net,artax.karlin.mff.cuni.cz,infradead.org,paragon-software.com,fasheh.com,evilplan.org,bobcopeland.com,omnibond.com,samba.org,manguebit.org,microsoft.com,talpey.com,wdc.com,suse.de,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,coda.cs.cmu.edu,lists.ozlabs.org,lists.sourceforge.net,lists.orangefs.org,lists.samba.org];
 RCPT_COUNT_GT_50(0.00)[113]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLb58ib84xst5oy51ju4zaburj)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.30
X-Mailman-Approved-At: Wed, 18 Jun 2025 18:55:50 +0000
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

On Mon 16-06-25 20:33:29, Lorenzo Stoakes wrote:
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
> 
> This callback is invoked in the mmap() logic far earlier, so error handling
> can be performed more safely without complicated and bug-prone state
> unwinding required should an error arise.
> 
> This hook also avoids passing a pointer to a not-yet-correctly-established
> VMA avoiding any issues with referencing this data structure.
> 
> It rather provides a pointer to the new struct vm_area_desc descriptor type
> which contains all required state and allows easy setting of required
> parameters without any consideration needing to be paid to locking or
> reference counts.
> 
> Note that nested filesystems like overlayfs are compatible with an
> .mmap_prepare() callback since commit bb666b7c2707 ("mm: add mmap_prepare()
> compatibility layer for nested file systems").
> 
> In this patch we apply this change to file systems with relatively simple
> mmap() hook logic - exfat, ceph, f2fs, bcachefs, zonefs, btrfs, ocfs2,
> orangefs, nilfs2, romfs, ramfs and aio.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Two small nits below. Otherwise feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 60a621b00c65..37522137c380 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -2330,13 +2330,14 @@ static const struct vm_operations_struct ceph_vmops = {
>  	.page_mkwrite	= ceph_page_mkwrite,
>  };
>  
> -int ceph_mmap(struct file *file, struct vm_area_struct *vma)
> +int ceph_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	struct address_space *mapping = file->f_mapping;

Pointless local variable here...

>  
>  	if (!mapping->a_ops->read_folio)
>  		return -ENOEXEC;
> -	vma->vm_ops = &ceph_vmops;
> +	desc->vm_ops = &ceph_vmops;
>  	return 0;
>  }
>  
...
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 841a5b18e3df..d63213c8a823 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -683,13 +683,14 @@ static const struct vm_operations_struct exfat_file_vm_ops = {
>  	.page_mkwrite	= exfat_page_mkwrite,
>  };
>  
> -static int exfat_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int exfat_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;

Missing empty line here.

>  	if (unlikely(exfat_forced_shutdown(file_inode(file)->i_sb)))
>  		return -EIO;
>  
>  	file_accessed(file);
> -	vma->vm_ops = &exfat_file_vm_ops;
> +	desc->vm_ops = &exfat_file_vm_ops;
>  	return 0;
>  }
>  

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
