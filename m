Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E54591CBF8C
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 11:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0293C6E2F0;
	Sat,  9 May 2020 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F626EB3F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 17:32:53 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x12so1923070qts.9
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 10:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8u1vbu5bJ69YihL8GWipXODDQVOvMStlxTqzIrRkPUQ=;
 b=CevGhA3drB9rx9GAhf7Jd40EnNtr3XglCd18jTPTpJsgn56s0Q9ZugmY0aQqMnSGTH
 7aagHQfF3X78TVXApqMaxjd66mhtOXvmL/4HYUWJW/adXA8e8n5GfPBPmQNAL19OfDE5
 LKmSVl8km7PxkynymVQEPV4lk577a7G6pryLd8OTLGPtsbCEaAV29/jnVDoGOchK+oXF
 ADZkHhl+hkYYLZCeFVTd3IXBBgi7Vcs9qr0dwPmfQ9/ULwOPvDSa/PgxDmkfuyvSzJ6H
 sC+yukRWl+pPdTIl3k+mflFAJ1SndgezVfhRdzQGFW2qCsOZjs94dn27Zb6+yY1dofoM
 xFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8u1vbu5bJ69YihL8GWipXODDQVOvMStlxTqzIrRkPUQ=;
 b=p/jf4Lltci9f4QJ6WRZYr1Yjw7Hd9di2x6NsPhgfSWoYTg/Ih/VZ8TAJHYnynyMGQK
 whmh9UOV00clhxAIDbwTcK0V1GqeDiAe7ZvA8nGvn/hjZKd5VdqaEZSVQR305asAG8oU
 RcCceK4QNDe+M1QIRZNRMw1oeS29YRnm4bMzw73By1LT5F0o1IcN/CGtOd2/JF8SrO8A
 8SsP4WvZPg/pP7f6czo3147C+MfH5QGUmc4gdee/+6EKcyro3p+GgxhyVhhpZEGpK8jh
 /ObpNlqzQ67S/cMD3/oVZlIXVmxIrt1sGAOmLb+GxQL/qOrTnAouAK1bmQnVVMirzf5d
 MjpA==
X-Gm-Message-State: AGi0PuYNe+iCEY13vTryMlaquye9VYbm/97FalpVWVPIX1jUQLNZVnOU
 gH3a2sfXGnpMuUYOUfRgerZ/dz7jzUkPuTA1yeQ=
X-Google-Smtp-Source: APiQypI1ltj7u5Bq7am8qePoEo4cQ/trbraNCdyogcK0LAAg4BY0jq2I7/GsLnM1GzSePjDroYbXz+4CAgFA1/GrFDU=
X-Received: by 2002:ac8:51d3:: with SMTP id d19mr4033765qtn.141.1588959172426; 
 Fri, 08 May 2020 10:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200508153634.249933-1-hch@lst.de>
 <20200508153634.249933-5-hch@lst.de>
In-Reply-To: <20200508153634.249933-5-hch@lst.de>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 8 May 2020 10:32:41 -0700
Message-ID: <CAEf4BzZ-gE87RVLPHGBfoNhHB+H7AnPbb7UUE7EGq8T5p_en_w@mail.gmail.com>
Subject: Re: [PATCH 04/12] bpf: use __anon_inode_getfd
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Sat, 09 May 2020 09:04:57 +0000
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
Cc: bpf <bpf@vger.kernel.org>, kvm@vger.kernel.org, linux-rdma@vger.kernel.org,
 Networking <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 8, 2020 at 8:39 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use __anon_inode_getfd instead of opencoding the logic using
> get_unused_fd_flags + anon_inode_getfile.  Also switch the
> bpf_link_new_file calling conventions to match __anon_inode_getfd.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/bpf.h  |  2 +-
>  kernel/bpf/cgroup.c  |  6 +++---
>  kernel/bpf/syscall.c | 31 +++++++++----------------------
>  3 files changed, 13 insertions(+), 26 deletions(-)
>

[...]

> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 64783da342020..cb2364e17423c 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -2307,23 +2307,10 @@ int bpf_link_new_fd(struct bpf_link *link)
>   * complicated and expensive operations and should be delayed until all the fd
>   * reservation and anon_inode creation succeeds.
>   */

The comment above explains the reason why we do want to split getting
fd, getting file, and installing fd later. I'd like to keep it this
way. Also, this code was refactored in bpf-next by [0] (it still uses
get_unused_fd_flag + anon_inode_getfile + fd_install, by design).

  [0] https://patchwork.ozlabs.org/project/netdev/patch/20200429001614.1544-3-andriin@fb.com/

> -struct file *bpf_link_new_file(struct bpf_link *link, int *reserved_fd)
> +int bpf_link_new_file(struct bpf_link *link, struct file **file)
>  {
> -       struct file *file;
> -       int fd;
> -
> -       fd = get_unused_fd_flags(O_CLOEXEC);
> -       if (fd < 0)
> -               return ERR_PTR(fd);
> -
> -       file = anon_inode_getfile("bpf_link", &bpf_link_fops, link, O_CLOEXEC);
> -       if (IS_ERR(file)) {
> -               put_unused_fd(fd);
> -               return file;
> -       }
> -
> -       *reserved_fd = fd;
> -       return file;
> +       return __anon_inode_getfd("bpf_link", &bpf_link_fops, link, O_CLOEXEC,
> +                       file);
>  }
>

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
