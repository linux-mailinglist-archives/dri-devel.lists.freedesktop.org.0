Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB28307ECD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FE16EA05;
	Thu, 28 Jan 2021 19:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F506E901
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 08:41:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id y187so3885334wmd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 00:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tz3WgXFPgDJH06BRPqiMzvbO9SluCp9ZzIIjw1Gx/70=;
 b=aH/QGbAv4jvj8FoWIw9gPBiYRFqgrDjIzsR/Q0qOJPjfpx9Z1Xbz+DlKgkIbdjL5Bp
 REdEQ0hqdGvXh8tiS0Lm8hR/dsoilS0sBlDM3HGjlEn9nmw9mzT9HPUDGXNoK9Mj0nKJ
 MXhQvZWD8Pzf3JPQML11qDmzYx4iTMY99xQqyhJy+vkORoV+T+WaoiNx5QoZxkA+neiZ
 0EDGQafi0d2unaJeM6oMYMuMZPqBVz9oGTEkHMFFZq6fMh++OJfe8lzMVBo1RbJWrrgQ
 rD5MFOEQ79DZXDMo5cDF2ZwBS69uOD+V13qTZdc3ZDpnhjidcCGrf+cPSTP1JLShGom+
 Fe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tz3WgXFPgDJH06BRPqiMzvbO9SluCp9ZzIIjw1Gx/70=;
 b=YAzjX1zw7djxDtyUMwbLyZsWFIp1PvAyWutNgdgHvus9CumrO7X0MXxKTDKIOKwoXn
 QWVPzzTdwZMm0HGhHsAZ//Y11+3sJ/nKR3BCOcO9XWuM9aRQ4hcgngA3skoKtMS9+FXL
 /OJN4ftq5zNGgMHaYqk+hm6+1PMdWQxHaZvlg0pLhJpMomwIrPDcqflVkBTrv+HrEzp6
 8ANRtEstB2v33jSiQbU27+sUIIp5WYxTX1Ye1glKsV4N5fXZ4fc3/uTD9D4IlVEx5cNi
 6pPopkwmBmcQnCNmUGpVz9NupA5ITpMdJ8Onq2h/HBZ4+R3aIusO9rKEg6eAyBQXWafU
 /osA==
X-Gm-Message-State: AOAM532Da05lTTU2OypOF0PqSCaZE8MRzyuo09vANLrByKk7TYrH9pFM
 0jfxVfcJjsE7u6Sugonoo4ZiqNJD6/9/ow6wOAI4kw==
X-Google-Smtp-Source: ABdhPJybFfYSYako7tYrbS7cIdHvjhegTnAmdT9SipLr0QTHAYBZpolB5GrAZ47/mXPmVL+zOKl+vtUE/ns/AmASesM=
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr7561817wmq.126.1611823314553; 
 Thu, 28 Jan 2021 00:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20210128083817.314315-1-surenb@google.com>
In-Reply-To: <20210128083817.314315-1-surenb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 28 Jan 2021 00:41:43 -0800
Message-ID: <CAJuCfpFn0bpk=6gWhwCBK717fh0VEzkpKjuyJqW36AAO43EDgQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
To: Sumit Semwal <sumit.semwal@linaro.org>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 kernel-team <kernel-team@android.com>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>, labbott@redhat.com,
 Robin Murphy <robin.murphy@arm.com>, christian.koenig@amd.com,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 12:38 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> Currently system heap maps its buffers with VM_PFNMAP flag using
> remap_pfn_range. This results in such buffers not being accounted
> for in PSS calculations because vm treats this memory as having no
> page structs. Without page structs there are no counters representing
> how many processes are mapping a page and therefore PSS calculation
> is impossible.
> Historically, ION driver used to map its buffers as VM_PFNMAP areas
> due to memory carveouts that did not have page structs [1]. That
> is not the case anymore and it seems there was desire to move away
> from remap_pfn_range [2].
> Dmabuf system heap design inherits this ION behavior and maps its
> pages using remap_pfn_range even though allocated pages are backed
> by page structs.
> Clear VM_IO and VM_PFNMAP flags when mapping memory allocated by the

Agrh, please ignore VM_IO in the description. The patch does not touch
that flag. I'll fix that in the next revision.

> system heap and replace remap_pfn_range with vm_insert_page, following
> Laura's suggestion in [1]. This would allow correct PSS calculation
> for dmabufs.
>
> [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> (sorry, could not find lore links for these discussions)
>
> Suggested-by: Laura Abbott <labbott@kernel.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 17e0e9a68baf..0e92e42b2251 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -200,11 +200,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>         struct sg_page_iter piter;
>         int ret;
>
> +       /* All pages are backed by a "struct page" */
> +       vma->vm_flags &= ~VM_PFNMAP;
> +
>         for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
>                 struct page *page = sg_page_iter_page(&piter);
>
> -               ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
> -                                     vma->vm_page_prot);
> +               ret = vm_insert_page(vma, addr, page);
>                 if (ret)
>                         return ret;
>                 addr += PAGE_SIZE;
> --
> 2.30.0.280.ga3ce27912f-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
