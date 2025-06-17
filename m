Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F54ADF654
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F3410E8F8;
	Wed, 18 Jun 2025 18:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pglRVmSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E423510E60C;
 Tue, 17 Jun 2025 11:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 77600A5000E;
 Tue, 17 Jun 2025 11:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBABEC4CEE3;
 Tue, 17 Jun 2025 11:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750160643;
 bh=L4F/xAE2aK6xDa/QOHjQNfrbZ+ldwQ/xxyXW1QOlMqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pglRVmSgsr6zVPCbLUxJit1HENECqtF+VKUELSm7DDvJTAXtRKCT9IonBR+vy/Pv+
 0KOSaKv4o78/UPxS/8WAJnS8XTOzb25DdQPvidNigl04+KbSBnUNdwYpWyPtjwUao2
 KVjU1eod47I9hfmAqu1HXs5NNkpj9ZmoKBDj9iEbYW+Iu4/Wq9ZnQvd/24RiYcCxU6
 ehoC5iKuDLDPBM85gO0tJ3zg29crJnqV/BFPF36D01IwNlhquecGAcdQBOYi0SfMgr
 iTlE7wC7JprLm5uHeq/OcqpnX3tE4351ouMdsYgL/8w6omsW5EvX+9RqdO82rtRfny
 Z7wz58Ln84EiQ==
Date: Tue, 17 Jun 2025 13:43:36 +0200
From: Christian Brauner <brauner@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Jens Axboe <axboe@kernel.dk>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
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
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 v9fs@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-aio@kvack.org, 
 linux-unionfs@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-mm@kvack.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, 
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-um@lists.infradead.org,
 linux-mtd@lists.infradead.org, 
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, 
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 nvdimm@lists.linux.dev
Subject: Re: [PATCH 04/10] fs/dax: make it possible to check dev dax support
 without a VMA
Message-ID: <20250617-sehgewohnheiten-getagt-47e1ee917d4f@brauner>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <b09de1e8544384074165d92d048e80058d971286.1750099179.git.lorenzo.stoakes@oracle.com>
 <aFB-Do9FE6H9SsGY@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFB-Do9FE6H9SsGY@casper.infradead.org>
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

On Mon, Jun 16, 2025 at 09:26:54PM +0100, Matthew Wilcox wrote:
> On Mon, Jun 16, 2025 at 08:33:23PM +0100, Lorenzo Stoakes wrote:
> >  fs/ext4/file.c      |  2 +-
> >  fs/xfs/xfs_file.c   |  3 ++-
> 
> Both of these already have the inode from the file ...
> 
> > +static inline bool daxdev_mapping_supported(vm_flags_t vm_flags,
> > +					    struct file *file,
> > +					    struct dax_device *dax_dev)
> >  {
> > -	if (!(vma->vm_flags & VM_SYNC))
> > +	if (!(vm_flags & VM_SYNC))
> >  		return true;
> > -	if (!IS_DAX(file_inode(vma->vm_file)))
> > +	if (!IS_DAX(file_inode(file)))
> >  		return false;
> >  	return dax_synchronous(dax_dev);
> 
> ... and the only thing this function uses from the file is the inode.
> So maybe pass in the inode rather than the file?

Agreed. I've converted this to take const struct inode *.
