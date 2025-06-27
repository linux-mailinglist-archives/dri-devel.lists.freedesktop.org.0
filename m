Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45659AEBC72
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 17:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F362A10E331;
	Fri, 27 Jun 2025 15:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Z0ceVbAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04F810E165;
 Fri, 27 Jun 2025 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Z+c/vMVBxvVliRM5Ba7u5qi1BNZCmTnatXuCT2DSf3s=; b=Z0ceVbAZOy3oDx3Jzp0zWCkcEC
 5+/Ux5Woml8GdpSfkIhVTxnoD/1Ma1995s/H+9SLhMV2WFdH9AnA9VE6AMi5lmgAUc/GeLJBH8dv8
 E+M91T3jrx+/xDUjfEcpMkKP2yciCidFInvaEizsorLfYjYs4vSQqrO5c8ROi7216sQU8i31mcYAN
 tujVt5eFpXiIQNYSJqIuB4VKAotXXyXWuUkTHDWgreQsgQoRPqOcBBnTBM8tXQMMJZ9gn6FY62Phu
 Xf2fu73K0hPBw9c5br2aSuebLqlrVwLN+UclnVhjVRg3/Iu1SkfzhW56ODmF5CZeO5B9qaQwK9fRF
 +21HmNKA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uVBN9-0000000EQf9-17Tf;
 Fri, 27 Jun 2025 15:52:15 +0000
Date: Fri, 27 Jun 2025 16:52:15 +0100
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
Message-ID: <aF6-L5Eu7XieS8aM@casper.infradead.org>
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
> @@ -1399,13 +1400,10 @@ static int write_end_fn(handle_t *handle, struct inode *inode,
>  }
>  
>  /*
> - * We need to pick up the new inode size which generic_commit_write gave us
> - * `file' can be NULL - eg, when called from page_symlink().
> - *

Why delete this?  It seems still true to me, other than s/file/iocb/

>   * ext4 never places buffers on inode->i_mapping->i_private_list.  metadata
>   * buffers are managed internally.
>   */
> -static int ext4_write_end(struct file *file,
> +static int ext4_write_end(const struct kiocb *iocb,
>  			  struct address_space *mapping,
>  			  loff_t pos, unsigned len, unsigned copied,
>  			  struct folio *folio, void *fsdata)
