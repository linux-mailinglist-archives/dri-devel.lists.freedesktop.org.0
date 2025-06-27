Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB23AEBC38
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 17:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0A110EA63;
	Fri, 27 Jun 2025 15:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7239610EA63;
 Fri, 27 Jun 2025 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=c3vCkFbhdgYVqqEDes1QFepeOfqXaiheP5+7KDv7Ebw=; b=n4oL3gypIqI5TK4THtINSLCpag
 SLp8q5VAaIR2EAkfhPLrL7o2dw/4U+ToS3OxEkKznV75IoTM1GcozkaWQ/8eEI33+FO5aDjg13dQ9
 DylQV6P3+OXB19c6sT+eReDIh97U+/GmnY8WvId1nHr4daVmwDz7ydeDjadHBnDQG7QrNElKKx/m9
 hFgxuHXLCzivX/7zTwZqwWToFNjne1uEIhM5GhdaBPk0i4oEdgw2GF8trCoksP0lS41SPzRnPF+R1
 pcmWZq+1ZNQMmJ4HglF5LEQKe1q2dAZxj5+MQJwTlZFK5lmsOXAISpwtg5rwx4xV34HpBgEEXMxOQ
 9Fo+Gong==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uVBGy-0000000EQ1q-4BPK;
 Fri, 27 Jun 2025 15:45:53 +0000
Date: Fri, 27 Jun 2025 16:45:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "brauner@kernel.org" <brauner@kernel.org>,
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
 "chentao325@qq.com" <chentao325@qq.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>
Subject: Re: [PATCH v3 3/4] fs: change write_begin/write_end interface to
 take struct kiocb *
Message-ID: <aF68sKzx24P1q54h@casper.infradead.org>
References: <20250627110257.1870826-1-chentaotao@didiglobal.com>
 <20250627110257.1870826-4-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627110257.1870826-4-chentaotao@didiglobal.com>
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

On Fri, Jun 27, 2025 at 11:03:11AM +0000, 陈涛涛 Taotao Chen wrote:
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 841a5b18e3df..fdc2fa1e5c41 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -532,10 +532,12 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
>  	return blkdev_issue_flush(inode->i_sb->s_bdev);
>  }
>  
> -static int exfat_extend_valid_size(struct file *file, loff_t new_valid_size)
> +static int exfat_extend_valid_size(const struct kiocb *iocb,
> +				   loff_t new_valid_size)
>  {
>  	int err;
>  	loff_t pos;
> +	struct file *file = iocb->ki_filp;
>  	struct inode *inode = file_inode(file);
>  	struct exfat_inode_info *ei = EXFAT_I(inode);
>  	struct address_space *mapping = inode->i_mapping;
> @@ -551,14 +553,14 @@ static int exfat_extend_valid_size(struct file *file, loff_t new_valid_size)
>  		if (pos + len > new_valid_size)
>  			len = new_valid_size - pos;
>  
> -		err = ops->write_begin(file, mapping, pos, len, &folio, NULL);
> +		err = ops->write_begin(iocb, mapping, pos, len, &folio, NULL);
>  		if (err)
>  			goto out;
>  
>  		off = offset_in_folio(folio, pos);
>  		folio_zero_new_buffers(folio, off, off + len);
>  
> -		err = ops->write_end(file, mapping, pos, len, len, folio, NULL);
> +		err = ops->write_end(iocb, mapping, pos, len, len, folio, NULL);
>  		if (err < 0)
>  			goto out;
>  		pos += len;
> @@ -604,7 +606,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
>  	}
>  
>  	if (pos > valid_size) {
> -		ret = exfat_extend_valid_size(file, pos);
> +		ret = exfat_extend_valid_size(iocb, pos);
>  		if (ret < 0 && ret != -ENOSPC) {
>  			exfat_err(inode->i_sb,
>  				"write: fail to zero from %llu to %llu(%zd)",
> @@ -655,8 +657,11 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
>  	struct file *file = vma->vm_file;
>  	struct inode *inode = file_inode(file);
>  	struct exfat_inode_info *ei = EXFAT_I(inode);
> +	struct kiocb iocb;
>  	loff_t start, end;
>  
> +	init_sync_kiocb(&iocb, file);
> +
>  	if (!inode_trylock(inode))
>  		return VM_FAULT_RETRY;
>  
> @@ -665,7 +670,7 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
>  			start + vma->vm_end - vma->vm_start);
>  
>  	if (ei->valid_size < end) {
> -		err = exfat_extend_valid_size(file, end);
> +		err = exfat_extend_valid_size(&iocb, end);
>  		if (err < 0) {
>  			inode_unlock(inode);
>  			return vmf_fs_error(err);

This is unnecessary work.  The only ->write_begin/write_end that we'll
see here is exfat_write_begin() / exfat_write_end() which don't actually
need iocb (or file).  Traditionally we pass NULL in these situations,
but the exfat people probably weren't aware of this convention.

exfat_extend_valid_size() only uses the file it's passed to get the
inode, and both callers already have the inode.  So I'd change
exfat_extend_valid_size() to take an inode instead of a file as its
first argument, then you can skip the creation of an iocb in
exfat_page_mkwrite().
