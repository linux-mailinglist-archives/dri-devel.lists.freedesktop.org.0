Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE6367BD7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44386EA39;
	Thu, 22 Apr 2021 08:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E296EA39
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:13:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso2609934wmi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=y+2orF1pTAhlEapNdeXUHEPMIxuWbRepsrCfwxwKqPQ=;
 b=gHnwqNUV9ImgCFezmiVa76pK8wVFkRrxerF84m3fGkLrmxRPS22ANeM2+wardiWMau
 TIACxgmBON1oew/9mDWdVzRInBo7wiaCjCKjux8OlAWeeO77boWwGStL+p6m1yNjeC3R
 wCI3YUFG5nSBBAvTADfTufzcNHi3gNchFusrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=y+2orF1pTAhlEapNdeXUHEPMIxuWbRepsrCfwxwKqPQ=;
 b=p0NOmnNxCL99W9Ffo4lXDYXMUiIrNb75Bcy+VK0xjaJld4s75D3JvEALyX6Fdw6HZS
 iHRSp8PWuHlEt/yYb8HblKpOGOvQByH9xGs/J/9RKjEDzqDyAP+mXydkODDU1iwMBsvm
 wSBHNXJfI6zvZPU02pdAl/XsFucAwPJWgSQx9kt/msu7ret+zyaSihf+Ko5XP0X0AWmb
 IN7Gbhi0RBnJTjHrP7/VjLTeCwMsHYTMgkMBDvqt90PrNrh3k+BUZEtSt+VG/WcrQhvd
 GwfQpFy8pekfIs7DYqVuFrtOmxPftjyf4WTcqGYE30cug9FDUuLfjZyrVdUXGVJzeohe
 rovA==
X-Gm-Message-State: AOAM532u9nj/uMCBnlkUjaFNNYrAteFPYaKB04GugLBwqQkrnyHMTK5g
 lk51oA4437myb09Bz7qTkR0kfg==
X-Google-Smtp-Source: ABdhPJxj8Wjmw9peJ0Dkkr6S5qwG/1RIJTJQvvdMp6AsnTRfP/VbwnRDvQEbFil5LrRoQEP2bPFE4A==
X-Received: by 2002:a1c:4b11:: with SMTP id y17mr2401274wma.72.1619079217522; 
 Thu, 22 Apr 2021 01:13:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b12sm20494903wmj.1.2021.04.22.01.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 01:13:37 -0700 (PDT)
Date: Thu, 22 Apr 2021 10:13:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] ovl: fix reference counting in ovl_mmap error path
Message-ID: <YIEwL09isbCIM82+@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, dri-devel@lists.freedesktop.org,
 jgg@ziepe.ca, jaharkes@cs.cmu.edu, akpm@linux-foundation.org,
 miklos@szeredi.hu, coda@cs.cmu.edu
References: <20210421132012.82354-1-christian.koenig@amd.com>
 <20210421132012.82354-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421132012.82354-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: jaharkes@cs.cmu.edu, miklos@szeredi.hu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, codalist@coda.cs.cmu.edu, jgg@ziepe.ca,
 akpm@linux-foundation.org, linux-unionfs@vger.kernel.org, coda@cs.cmu.edu
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 03:20:12PM +0200, Christian K=F6nig wrote:
> mmap_region() now calls fput() on the vma->vm_file.
> =

> Fix this by using vma_set_file() so it doesn't need to be
> handled manually here any more.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Fixes: 1527f926fd04 ("mm: mmap: fix fput in error path v2")
> CC: stable@vger.kernel.org # 5.11+
> ---
>  fs/overlayfs/file.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> =

> diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
> index dbfb35fb0ff7..3847cdc069b5 100644
> --- a/fs/overlayfs/file.c
> +++ b/fs/overlayfs/file.c
> @@ -430,20 +430,11 @@ static int ovl_mmap(struct file *file, struct vm_ar=
ea_struct *vma)
>  	if (WARN_ON(file !=3D vma->vm_file))
>  		return -EIO;
>  =

> -	vma->vm_file =3D get_file(realfile);
> +	vma_set_file(vma, realfile);

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  =

>  	old_cred =3D ovl_override_creds(file_inode(file)->i_sb);
>  	ret =3D call_mmap(vma->vm_file, vma);
>  	revert_creds(old_cred);
> -
> -	if (ret) {
> -		/* Drop reference count from new vm_file value */
> -		fput(realfile);
> -	} else {
> -		/* Drop reference count from previous vm_file value */
> -		fput(file);
> -	}
> -
>  	ovl_file_accessed(file);
>  =

>  	return ret;
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
