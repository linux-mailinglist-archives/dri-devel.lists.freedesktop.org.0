Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89AAE7969
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06910E68C;
	Wed, 25 Jun 2025 08:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iH1n489F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D1C10E68C;
 Wed, 25 Jun 2025 08:04:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C29543974;
 Wed, 25 Jun 2025 08:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A09C4CEEA;
 Wed, 25 Jun 2025 08:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750838669;
 bh=33Db58Zgs1Us82FoEGQ+AOZm9l1WltZ90kNW2vjvy6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iH1n489FRT/VUDCzbZstkBsRFo5c8F/QxvDELXrmnB0il6WHte0vIcyu5rPE+DJtw
 Cxj+2D7s/QNd1hV2OSvnvUCYXs9f+HD2SqK0g+PiI1SvSgeqDm9nok2idfvm+VXf06
 4OdwhvFB5kpZfqgJ+GdVYC2Ml0cj3Q56rUKQw4+RYwzv1PVFnVnNCqPmZRn6zEJ4My
 P7N7u+Xh82fg35P2Nz7WEIWKCtFSLfnHs513dkhYS7po6+vuc+GxIDdMOYuSQg1QQL
 OCxmz9soe8yvYONFgmprZloT7OqCjIdaLjJriPpYTxtdDX02YuE5PBV9CLKzDU5KrF
 x8SDdin5EAkhg==
Date: Wed, 25 Jun 2025 10:04:22 +0200
From: Christian Brauner <brauner@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>, 
 "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>, 
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, 
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, 
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "chentao325@qq.com" <chentao325@qq.com>
Subject: Re: [PATCH v2 3/5] fs: change write_begin/write_end interface to
 take struct kiocb *
Message-ID: <20250625-erstklassig-stilvoll-273282f0dd1b@brauner>
References: <20250624121149.2927-1-chentaotao@didiglobal.com>
 <20250624121149.2927-4-chentaotao@didiglobal.com>
 <aFqfZ9hiiW4qnYtO@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFqfZ9hiiW4qnYtO@casper.infradead.org>
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

On Tue, Jun 24, 2025 at 01:51:51PM +0100, Matthew Wilcox wrote:
> On Tue, Jun 24, 2025 at 12:12:08PM +0000, 陈涛涛 Taotao Chen wrote:
> > -static int blkdev_write_end(struct file *file, struct address_space *mapping,
> > +static int blkdev_write_end(struct kiocb *iocb, struct address_space *mapping,
> >  		loff_t pos, unsigned len, unsigned copied, struct folio *folio,
> >  		void *fsdata)
> >  {
> >  	int ret;
> > -	ret = block_write_end(file, mapping, pos, len, copied, folio, fsdata);
> > +	ret = block_write_end(iocb->ki_filp, mapping, pos, len, copied, folio, fsdata);
> 
> ... huh.  I thought block_write_end() had to have the same prototype as
> ->write_end because it was used by some filesystems as the ->write_end.
> I see that's not true (any more?).  Maybe I was confused with
> generic_write_end().  Anyway, block_write_end() doesn't use it's file
> argument, and never will, so we can just remove it.
> 
> > +++ b/include/linux/fs.h
> > @@ -446,10 +446,10 @@ struct address_space_operations {
> >  
> >  	void (*readahead)(struct readahead_control *);
> >  
> > -	int (*write_begin)(struct file *, struct address_space *mapping,
> > +	int (*write_begin)(struct kiocb *, struct address_space *mapping,
> >  				loff_t pos, unsigned len,
> >  				struct folio **foliop, void **fsdata);
> > -	int (*write_end)(struct file *, struct address_space *mapping,
> > +	int (*write_end)(struct kiocb *, struct address_space *mapping,
> >  				loff_t pos, unsigned len, unsigned copied,
> >  				struct folio *folio, void *fsdata);
> 
> Should we make this a 'const struct kiocb *'?  I don't see a need for
> filesystems to be allowed to modify the kiocb in future, but perhaps
> other people have different opinions.

Given I picked up Willy's change I'll wait for a resubmit of this series
on top of vfs-6.17.misc unless I hear otherwise?
