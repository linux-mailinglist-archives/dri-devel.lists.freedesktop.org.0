Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08455C0D0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 13:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8009110F521;
	Tue, 28 Jun 2022 11:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5393B10F6FD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656417236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DZIBhwK0nu+d+e5Dn67t8pp9MEtfy3sJMXiRir3HYs=;
 b=LNu9OM9cAYgxrfyZeRwLmHBS7TAL0IaUoHUvTrzQ2mE1PK/LeF3yJx2YR+vIcXkeIwejV/
 ENAnqxoT2xF+d9rBpu46AxwrezwYDpLgAgh6duPHXQUMf36T2LZw2+XmOcnLANfqi/j07p
 cXDROtm2cLFqP4OB3XaRwbC+/pvfrjo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-30RF8yP-MqKaOA6AYQLxFw-1; Tue, 28 Jun 2022 07:53:55 -0400
X-MC-Unique: 30RF8yP-MqKaOA6AYQLxFw-1
Received: by mail-qv1-f69.google.com with SMTP id
 w18-20020a0ce112000000b0046e7f2c5a06so12062145qvk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 04:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9DZIBhwK0nu+d+e5Dn67t8pp9MEtfy3sJMXiRir3HYs=;
 b=wVgbbezzeketgoz4s3dAaVOcVtEnIHY6aCxBRH8uLEovGD/fp7b0Trv9Q+JmqguWLf
 XtPHXm4w2POf0qrNxWujEUTeWsM10UYG6blTBPLGJEWw5P4p8t4vwAHuUV3qCa/w4AyA
 DHQtCiqBGOzeE3NrHy+JqB/0qOfZpBlSqlAuvAEttgIw18Sc8SswkGIOqcQjm0wj8JJR
 AuSSytfrDybynCx117PtDqrCgBaCtewHfq6wMDMOj0ixzIUaDMl2HmEl/VfJtaG5fj0B
 GQMJKFXabydX4jV8J5iz3ZCObBT9Q8mMd7JWLv5+ARdV2YYEmP1OtZtfFxE7ocz7O01r
 KcHw==
X-Gm-Message-State: AJIora8KkAsJciHW2UUJy904zvdNll+Enw5MvFIVpuv7xY+uBfEpduuO
 8E4mad7x65Go/N/IHD73BBcKzEFuGUugC74vgHHtJteb7X4AK3leqWWMyyrw5l5ttGyJfgEaI2I
 x5R4TW0EkzEYWRe4XzIyhql7YjSeS
X-Received: by 2002:a37:a9d0:0:b0:6af:1ba4:c3e5 with SMTP id
 s199-20020a37a9d0000000b006af1ba4c3e5mr8500843qke.167.1656417234891; 
 Tue, 28 Jun 2022 04:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsML0jjLfuArn0V98uqgHi7yCfymN14awwvePjx5qt4Ac2aBE1EXWTFaiUYpN07axMfRvatg==
X-Received: by 2002:a37:a9d0:0:b0:6af:1ba4:c3e5 with SMTP id
 s199-20020a37a9d0000000b006af1ba4c3e5mr8500833qke.167.1656417234666; 
 Tue, 28 Jun 2022 04:53:54 -0700 (PDT)
Received: from bfoster (c-24-61-119-116.hsd1.ma.comcast.net. [24.61.119.116])
 by smtp.gmail.com with ESMTPSA id
 bw20-20020a05622a099400b00304bc2acc25sm8851128qtb.6.2022.06.28.04.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:53:54 -0700 (PDT)
Date: Tue, 28 Jun 2022 07:53:51 -0400
From: Brian Foster <bfoster@redhat.com>
To: Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH v2 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
Message-ID: <Yrrrz7MxMu8OoEPU@bfoster>
References: <20220623220613.3014268-1-kaleshsingh@google.com>
 <20220623220613.3014268-2-kaleshsingh@google.com>
MIME-Version: 1.0
In-Reply-To: <20220623220613.3014268-2-kaleshsingh@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bfoster@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stephen.s.brennan@oracle.com, Paul Gortmaker <paul.gortmaker@windriver.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 hch@infradead.org, kernel-team@android.com, linux-media@vger.kernel.org,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 viro@zeniv.linux.org.uk, surenb@google.com, tjmercier@google.com,
 Randy Dunlap <rdunlap@infradead.org>, ilkos@google.com,
 linux-kernel@vger.kernel.org, David.Laight@aculab.com,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, christian.koenig@amd.com,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 03:06:06PM -0700, Kalesh Singh wrote:
> To be able to account the amount of memory a process is keeping pinned
> by open file descriptors add a 'size' field to fdinfo output.
> 
> dmabufs fds already expose a 'size' field for this reason, remove this
> and make it a common field for all fds. This allows tracking of
> other types of memory (e.g. memfd and ashmem in Android).
> 
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
> 
> Changes in v2:
>   - Add Christian's Reviewed-by
> 
> Changes from rfc:
>   - Split adding 'size' and 'path' into a separate patches, per Christian
>   - Split fdinfo seq_printf into separate lines, per Christian
>   - Fix indentation (use tabs) in documentaion, per Randy
> 
>  Documentation/filesystems/proc.rst | 12 ++++++++++--
>  drivers/dma-buf/dma-buf.c          |  1 -
>  fs/proc/fd.c                       |  9 +++++----
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
...
> diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> index 913bef0d2a36..464bc3f55759 100644
> --- a/fs/proc/fd.c
> +++ b/fs/proc/fd.c
> @@ -54,10 +54,11 @@ static int seq_show(struct seq_file *m, void *v)
>  	if (ret)
>  		return ret;
>  
> -	seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\n",
> -		   (long long)file->f_pos, f_flags,
> -		   real_mount(file->f_path.mnt)->mnt_id,
> -		   file_inode(file)->i_ino);
> +	seq_printf(m, "pos:\t%lli\n", (long long)file->f_pos);
> +	seq_printf(m, "flags:\t0%o\n", f_flags);
> +	seq_printf(m, "mnt_id:\t%i\n", real_mount(file->f_path.mnt)->mnt_id);
> +	seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
> +	seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)->i_size);

Hi Kalesh,

Any reason not to use i_size_read() here?

Also not sure if it matters that much for your use case, but something
worth noting at least with shmem is that one can do something like:

# cat /proc/meminfo | grep Shmem:
Shmem:               764 kB
# xfs_io -fc "falloc -k 0 10m" ./file
# ls -alh file 
-rw-------. 1 root root 0 Jun 28 07:22 file
# stat file 
  File: file
  Size: 0               Blocks: 20480      IO Block: 4096   regular empty file
# cat /proc/meminfo | grep Shmem:
Shmem:             11004 kB

... where the resulting memory usage isn't reflected in i_size (but is
is in i_blocks/bytes).

Brian

>  
>  	/* show_fd_locks() never deferences files so a stale value is safe */
>  	show_fd_locks(m, file, files);
> -- 
> 2.37.0.rc0.161.g10f37bed90-goog
> 

