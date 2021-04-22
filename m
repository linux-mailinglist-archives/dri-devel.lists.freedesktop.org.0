Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0961367BCC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C625D6EA38;
	Thu, 22 Apr 2021 08:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFF56EA38
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:11:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y204so22184127wmg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=YzUSYaOgN9hxojeW0mU7pzbBG2m7ss1xHFD86VpZnFw=;
 b=SQBU2KUkg8eg+N+tMN7haZLLtl7EyaXi5aA3ujHphx/jCYBCM14EfIxYNwUyfBHKb4
 snU8IimoDnaoZJp5mAhiDqj430JufITSFQ4+HLTMZ3NXHi3TPOIkxL3m6gWEwikhLUrz
 t3K6p6XAEM+uZ19sV6Ln7bgwAmV/FiGMvgtls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=YzUSYaOgN9hxojeW0mU7pzbBG2m7ss1xHFD86VpZnFw=;
 b=cpgSO1hsWgKT5YPoyqou7p7E+8XWolnweE+a1zJQyopT4ftWJIJASFE4C6Dt4Ejv5s
 HuRR41Iwh8SyBZw2IBGmJsiR2+1fT6vMgTrWzCHVixCbSh++1Q6TBmaLT0/WSzoFlDRK
 TZuMpxBTM8pdxh9YQz7dTEEFbcARR25lCFqOns+Pv8dGaJ5BEWY2LjaqsdOrf2i2yIM1
 B9i5EnBGMKCbf5dMdg9EsKIbGgNBlmRWnvm2MZpqDSXBWM8A4CbHl7toxDSXlSW+7bGb
 FDrciL8z3s8S4XpDh3s1PgcuLvAOyFk+nbPS3ASLFl20ahKzyzZDhQFtcYeqL0bsNHFK
 qetA==
X-Gm-Message-State: AOAM531lQp/I8qZvlyylGpqHLaidxXEEOfDHaBtFdEeEKNKqbJd0NAUh
 WIQxzL9uACvh2sNQ+IK/puMYWQ==
X-Google-Smtp-Source: ABdhPJzQpl8oyp8JKOUGIeroE+P/ggioIzwSyjJLJwYdLC/3EQSRErDjzwQT8eDoqpZqalDMXfPETw==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr2436011wmd.54.1619079098208; 
 Thu, 22 Apr 2021 01:11:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l20sm2249188wmg.33.2021.04.22.01.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 01:11:37 -0700 (PDT)
Date: Thu, 22 Apr 2021 10:11:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] coda: fix reference counting in coda_file_mmap error
 path
Message-ID: <YIEvt01bQkKhxDSJ@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, dri-devel@lists.freedesktop.org,
 jgg@ziepe.ca, jaharkes@cs.cmu.edu, akpm@linux-foundation.org,
 miklos@szeredi.hu, coda@cs.cmu.edu
References: <20210421132012.82354-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421132012.82354-1-christian.koenig@amd.com>
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

On Wed, Apr 21, 2021 at 03:20:11PM +0200, Christian K=F6nig wrote:
> mmap_region() now calls fput() on the vma->vm_file.
> =

> So we need to drop the extra reference on the coda file instead of the
> host file.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Fixes: 1527f926fd04 ("mm: mmap: fix fput in error path v2")
> CC: stable@vger.kernel.org # 5.11+

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  fs/coda/file.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/fs/coda/file.c b/fs/coda/file.c
> index 128d63df5bfb..ef5ca22bfb3e 100644
> --- a/fs/coda/file.c
> +++ b/fs/coda/file.c
> @@ -175,10 +175,10 @@ coda_file_mmap(struct file *coda_file, struct vm_ar=
ea_struct *vma)
>  	ret =3D call_mmap(vma->vm_file, vma);
>  =

>  	if (ret) {
> -		/* if call_mmap fails, our caller will put coda_file so we
> -		 * should drop the reference to the host_file that we got.
> +		/* if call_mmap fails, our caller will put host_file so we
> +		 * should drop the reference to the coda_file that we got.
>  		 */
> -		fput(host_file);
> +		fput(coda_file);
>  		kfree(cvm_ops);
>  	} else {
>  		/* here we add redirects for the open/close vm_operations */
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
