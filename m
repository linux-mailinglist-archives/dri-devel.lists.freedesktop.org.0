Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76227AE6577
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 14:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93D410E58B;
	Tue, 24 Jun 2025 12:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="O0ORMoVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089610E58B;
 Tue, 24 Jun 2025 12:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=YOojs8ETOh0nTkI9FVoRaG17pTblKI2h/qJphUDsFTg=; b=O0ORMoVA2HBFIa95a4tYoOnfak
 MlNH1yfUbdVu/C/pxQlWEsaEhdAx3u7SfeayvsOe9NUYSILkqFBRqkm4yIBf1E8pvaYTgHU8nzzvY
 y9JJ10OQ6HASMGlWlOnmVsnklPeMvsR+pzbKqhpAlJa+iKEYdPU8j+FtVvU+WBWkAqRtHAbbtF8t5
 eudvW7VJjfuSDpm7I/N24ZvaqCI5U+9SFvyDByBHQRUA97w0vqSV8Uv9Q4aWCqg4RF3hVL5G4FTxB
 yxwniFZbWrdvugPLzzqFJ9gn1vfOSJd+Vr5DzpRRDd0fnpYhXAZqoPh4iXN99K8hUZRhmK4+AG+Vl
 uuV/Unfw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uU37w-00000006bv4-0Kku;
 Tue, 24 Jun 2025 12:51:52 +0000
Date: Tue, 24 Jun 2025 13:51:51 +0100
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
 "chentao325@qq.com" <chentao325@qq.com>
Subject: Re: [PATCH v2 3/5] fs: change write_begin/write_end interface to
 take struct kiocb *
Message-ID: <aFqfZ9hiiW4qnYtO@casper.infradead.org>
References: <20250624121149.2927-1-chentaotao@didiglobal.com>
 <20250624121149.2927-4-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624121149.2927-4-chentaotao@didiglobal.com>
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

On Tue, Jun 24, 2025 at 12:12:08PM +0000, 陈涛涛 Taotao Chen wrote:
> -static int blkdev_write_end(struct file *file, struct address_space *mapping,
> +static int blkdev_write_end(struct kiocb *iocb, struct address_space *mapping,
>  		loff_t pos, unsigned len, unsigned copied, struct folio *folio,
>  		void *fsdata)
>  {
>  	int ret;
> -	ret = block_write_end(file, mapping, pos, len, copied, folio, fsdata);
> +	ret = block_write_end(iocb->ki_filp, mapping, pos, len, copied, folio, fsdata);

... huh.  I thought block_write_end() had to have the same prototype as
->write_end because it was used by some filesystems as the ->write_end.
I see that's not true (any more?).  Maybe I was confused with
generic_write_end().  Anyway, block_write_end() doesn't use it's file
argument, and never will, so we can just remove it.

> +++ b/include/linux/fs.h
> @@ -446,10 +446,10 @@ struct address_space_operations {
>  
>  	void (*readahead)(struct readahead_control *);
>  
> -	int (*write_begin)(struct file *, struct address_space *mapping,
> +	int (*write_begin)(struct kiocb *, struct address_space *mapping,
>  				loff_t pos, unsigned len,
>  				struct folio **foliop, void **fsdata);
> -	int (*write_end)(struct file *, struct address_space *mapping,
> +	int (*write_end)(struct kiocb *, struct address_space *mapping,
>  				loff_t pos, unsigned len, unsigned copied,
>  				struct folio *folio, void *fsdata);

Should we make this a 'const struct kiocb *'?  I don't see a need for
filesystems to be allowed to modify the kiocb in future, but perhaps
other people have different opinions.
