Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78586332C30
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 17:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E46E0A1;
	Tue,  9 Mar 2021 16:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD566E0A1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615307708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Iv7BBIxQ8+W8sz1TqvejVKfcifyHSm+wQDXMt7okOA=;
 b=hrW4WBTcOqZVyeSjdge9B8wzEY1geSCkRBHo1NcsWIBrgWz4NU1fGZ1CrXB+kE/eX8LlY7
 NFeCgE8zs0Z/CbjcoFHVsltuc2/CBcwW//zdTWy4ZzEIVdg9ry9PIZ0p64/o9ofKQR11TV
 e8TkKbAtFCVlC7sNuDjFHdsRmHBFcKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-2LKAOAxWMcKIauY_Ng6y0g-1; Tue, 09 Mar 2021 11:28:28 -0500
X-MC-Unique: 2LKAOAxWMcKIauY_Ng6y0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90CCD108BD0B;
 Tue,  9 Mar 2021 16:28:26 +0000 (UTC)
Received: from [10.36.114.143] (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E403E10023AE;
 Tue,  9 Mar 2021 16:28:16 +0000 (UTC)
Subject: Re: [PATCH 5/9] vmw_balloon: remove the balloon-vmware file system
To: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-6-hch@lst.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8bdd6f30-3cd1-ad7f-df95-bbb85623ae64@redhat.com>
Date: Tue, 9 Mar 2021 17:28:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309155348.974875-6-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Nadav Amit <namit@vmware.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.03.21 16:53, Christoph Hellwig wrote:
> Just use the generic anon_inode file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/misc/vmw_balloon.c | 24 ++----------------------
>   1 file changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> index 5d057a05ddbee8..be4be32f858253 100644
> --- a/drivers/misc/vmw_balloon.c
> +++ b/drivers/misc/vmw_balloon.c
> @@ -16,6 +16,7 @@
>   //#define DEBUG
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
> +#include <linux/anon_inodes.h>
>   #include <linux/types.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> @@ -1735,20 +1736,6 @@ static inline void vmballoon_debugfs_exit(struct vmballoon *b)
>   
>   
>   #ifdef CONFIG_BALLOON_COMPACTION
> -
> -static int vmballoon_init_fs_context(struct fs_context *fc)
> -{
> -	return init_pseudo(fc, BALLOON_VMW_MAGIC) ? 0 : -ENOMEM;
> -}
> -
> -static struct file_system_type vmballoon_fs = {
> -	.name           	= "balloon-vmware",
> -	.init_fs_context	= vmballoon_init_fs_context,
> -	.kill_sb        	= kill_anon_super,
> -};
> -
> -static struct vfsmount *vmballoon_mnt;
> -
>   /**
>    * vmballoon_migratepage() - migrates a balloon page.
>    * @b_dev_info: balloon device information descriptor.
> @@ -1878,8 +1865,6 @@ static void vmballoon_compaction_deinit(struct vmballoon *b)
>   		iput(b->b_dev_info.inode);
>   
>   	b->b_dev_info.inode = NULL;
> -	kern_unmount(vmballoon_mnt);
> -	vmballoon_mnt = NULL;
>   }
>   
>   /**
> @@ -1895,13 +1880,8 @@ static void vmballoon_compaction_deinit(struct vmballoon *b)
>    */
>   static __init int vmballoon_compaction_init(struct vmballoon *b)
>   {
> -	vmballoon_mnt = kern_mount(&vmballoon_fs);
> -	if (IS_ERR(vmballoon_mnt))
> -		return PTR_ERR(vmballoon_mnt);
> -
>   	b->b_dev_info.migratepage = vmballoon_migratepage;
> -	b->b_dev_info.inode = alloc_anon_inode_sb(vmballoon_mnt->mnt_sb);
> -
> +	b->b_dev_info.inode = alloc_anon_inode();
>   	if (IS_ERR(b->b_dev_info.inode))
>   		return PTR_ERR(b->b_dev_info.inode);
>   
> 

Same comment regarding BALLOON_VMW_MAGIC and includes (mount.h, 
pseudo_fs.h).

Apart from that looks good.

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
