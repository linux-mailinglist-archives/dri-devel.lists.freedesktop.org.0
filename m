Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12901CB418
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 17:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AEF6EB29;
	Fri,  8 May 2020 15:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763616EB29
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588953313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2NuVDMsNek1XqDZ23KXOT0aYU3U9mtuti+eij0cQ3Y=;
 b=HTy0LP80TBlJ0td1X6hUOfBc0VINV17hEJUBeOoqpmYBDJ5iV72NaVB8nREn37l0OCHTU8
 KrsIqbd0GeyrM/rC4YgsDVPFx1UUSX1JRfddT+4tUAIDhvGZJMvaoyiNDo7IY6r0TmgO7/
 y5iPg2bDQCjQGMV3BaakDuiKxYs0vTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-tB1ktjf7Nd6ZDjXX8AJRsw-1; Fri, 08 May 2020 11:55:11 -0400
X-MC-Unique: tB1ktjf7Nd6ZDjXX8AJRsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59A41107ACCA;
 Fri,  8 May 2020 15:55:09 +0000 (UTC)
Received: from w520.home (ovpn-113-111.phx2.redhat.com [10.3.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 615F6341E3;
 Fri,  8 May 2020 15:55:08 +0000 (UTC)
Date: Fri, 8 May 2020 09:55:07 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/12] vfio: use __anon_inode_getfd
Message-ID: <20200508095507.54051943@w520.home>
In-Reply-To: <20200508153634.249933-9-hch@lst.de>
References: <20200508153634.249933-1-hch@lst.de>
 <20200508153634.249933-9-hch@lst.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: bpf@vger.kernel.org, kvm@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  8 May 2020 17:36:30 +0200
Christoph Hellwig <hch@lst.de> wrote:

> Use __anon_inode_getfd instead of opencoding the logic using
> get_unused_fd_flags + anon_inode_getfile.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/vfio/vfio.c | 37 ++++++++-----------------------------
>  1 file changed, 8 insertions(+), 29 deletions(-)


Thanks!

Acked-by: Alex Williamson <alex.williamson@redhat.com>

> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 765e0e5d83ed9..33a88103f857f 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1451,42 +1451,21 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
>  		return ret;
>  	}
>  
> -	/*
> -	 * We can't use anon_inode_getfd() because we need to modify
> -	 * the f_mode flags directly to allow more than just ioctls
> -	 */
> -	ret = get_unused_fd_flags(O_CLOEXEC);
> -	if (ret < 0) {
> -		device->ops->release(device->device_data);
> -		vfio_device_put(device);
> -		return ret;
> -	}
> -
> -	filep = anon_inode_getfile("[vfio-device]", &vfio_device_fops,
> -				   device, O_RDWR);
> -	if (IS_ERR(filep)) {
> -		put_unused_fd(ret);
> -		ret = PTR_ERR(filep);
> -		device->ops->release(device->device_data);
> -		vfio_device_put(device);
> -		return ret;
> -	}
> -
> -	/*
> -	 * TODO: add an anon_inode interface to do this.
> -	 * Appears to be missing by lack of need rather than
> -	 * explicitly prevented.  Now there's need.
> -	 */
> +	ret = __anon_inode_getfd("[vfio-device]", &vfio_device_fops,
> +				   device, O_CLOEXEC | O_RDWR, &filep);
> +	if (ret < 0)
> +		goto release;
>  	filep->f_mode |= (FMODE_LSEEK | FMODE_PREAD | FMODE_PWRITE);
> -
>  	atomic_inc(&group->container_users);
> -
>  	fd_install(ret, filep);
>  
>  	if (group->noiommu)
>  		dev_warn(device->dev, "vfio-noiommu device opened by user "
>  			 "(%s:%d)\n", current->comm, task_pid_nr(current));
> -
> +	return ret;
> +release:
> +	device->ops->release(device->device_data);
> +	vfio_device_put(device);
>  	return ret;
>  }
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
