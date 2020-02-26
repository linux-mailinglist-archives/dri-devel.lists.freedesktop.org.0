Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E206716F558
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 02:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D226E0B9;
	Wed, 26 Feb 2020 01:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EA76E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 01:54:19 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CAE820732;
 Wed, 26 Feb 2020 01:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582682059;
 bh=LuY1aImj6PEVlETfQcjlClopOVm/sK8P/ZzP4XBR+/o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EE9BrAeaUKw0b4AC+J+IaooQvru8TwnlXy/gE1MLEOsM2l9haCbFKp1H23KixzFY3
 qFZTSOWbbcYB2IvvP5Gl/FEPR+o1e43H7tl+T4iFmxNK+9xKLkKpcSlkomJ3ddkASf
 8FQ7bZZqJb8EXIna6OyFsxxWDTWN+StwgpKDTOvI=
Date: Tue, 25 Feb 2020 17:54:18 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
Message-Id: <20200225175418.2d3af2180cbf895b727ce4b1@linux-foundation.org>
In-Reply-To: <20200225204446.11378-1-xiyou.wangcong@gmail.com>
References: <20200225204446.11378-1-xiyou.wangcong@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Chenbo Feng <fengc@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Feb 2020 12:44:46 -0800 Cong Wang <xiyou.wangcong@gmail.com> wrote:

> dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> it never gets freed.
> 
> Free it in dma_buf_release().
> 
> ...
>
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
>  		dma_resv_fini(dmabuf->resv);
>  
>  	module_put(dmabuf->owner);
> +	kfree(dmabuf->name);
>  	kfree(dmabuf);
>  	return 0;
>  }

ow.  Is that ioctl privileged?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
