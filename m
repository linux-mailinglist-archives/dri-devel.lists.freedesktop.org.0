Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F415CE14
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 23:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8402B6E03D;
	Thu, 13 Feb 2020 22:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB026E03D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 22:30:10 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e45cde40000>; Thu, 13 Feb 2020 14:29:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 13 Feb 2020 14:30:10 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 13 Feb 2020 14:30:10 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 22:30:09 +0000
Subject: Re: [Nouveau] [PATCH] nouveau: no need to check return value of
 debugfs_create functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ben Skeggs
 <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
References: <20200209105525.GA1620170@kroah.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <fdb35aa7-7e4a-c44f-94df-bd44585d4bef@nvidia.com>
Date: Thu, 13 Feb 2020 14:30:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200209105525.GA1620170@kroah.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581632996; bh=9W0hwZ76DDXzFxGzd0uc9O+YUPu2AdPnac7WTjFM8A8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ftA/Fy8sAYa6nCFlT9ozGE0SjdGknhiBTg/VDV4Sv39+iFpgBrUyEp1bCV5RXnI22
 IQgqG0mzkqcZtaBAHcAckJt3EVERGEh7UC9D2/IUbfC/T9ZQKrsrWl8N7hUOb2DgON
 GMX0PzxS+pRXuTD9M30SP7dDW5syDB5TTHZ3Om7LkNGsgBYv6GUBD0nX25IZW1Rz+k
 +Keld+606Q166ADr58jLqqWRUot2fkg1EUOc+vXyHNrKLic/SEHxw97Hsy+Mk66320
 rQm0gI+fTsNpUrCqGJLi2567Du6wkAWbh313iU3Aaj+iTwWOK3FbBtW2DRQQYTskGj
 C2GN//m2pXrLA==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/20 2:55 AM, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 

Should we follow that line of reasoning further, and simply return void
from the debugfs functions--rather than playing whack-a-mole with this
indefinitely?


thanks,
-- 
John Hubbard
NVIDIA

> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 080e964d49aa..d1c82fc45a68 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -224,14 +224,10 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
>  	struct dentry *dentry;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
> -		dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
> -					     S_IRUGO | S_IWUSR,
> -					     minor->debugfs_root, minor->dev,
> -					     nouveau_debugfs_files[i].fops);
> -		if (!dentry)
> -			return -ENOMEM;
> -	}
> +	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++)
> +		debugfs_create_file(nouveau_debugfs_files[i].name,
> +				    S_IRUGO | S_IWUSR, minor->debugfs_root,
> +				    minor->dev, nouveau_debugfs_files[i].fops);
>  
>  	drm_debugfs_create_files(nouveau_debugfs_list,
>  				 NOUVEAU_DEBUGFS_ENTRIES,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
