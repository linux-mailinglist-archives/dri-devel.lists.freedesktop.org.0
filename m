Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E9182A08
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 08:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025A89715;
	Thu, 12 Mar 2020 07:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D766A89715;
 Thu, 12 Mar 2020 07:55:51 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id 10so4716754ywv.5;
 Thu, 12 Mar 2020 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8PH8OwRLD6nQXDDi9y8VIf66Uz6y/cjwU3hUU4CHeQ=;
 b=NYpb5alec01RBygunaSyIwAvzoDgMhxcnYOM5Z0iWhI6ke8QJJuGbFWLgFtCkzOhSo
 GmBEWrvQPIhOxjn7HuZ7k5vG73LaHkos049KQPV5cc2hFNRvbijKNH9UqIw+VgasE4xn
 3u7y7elTcNfK1JzMXRbdFDFnqbOxqmLRe+0rUE5mK/coiDm/Xdd+K3y7vJXqETfNaKUl
 I7SRSFAGlpKQOP6enB7qLsjfHZagaBg0kGG8KnhuK9p/9Obksy8WCavX1brmWM52OIno
 Zyuu7bat/tQDr2/OE3y96UhIQ7QPveDoq0k2IxJJU4ACBvdTqQ5KLP5bueYl/O1MeTvH
 Bw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8PH8OwRLD6nQXDDi9y8VIf66Uz6y/cjwU3hUU4CHeQ=;
 b=Qcip4Xy/CePSf/5C7o2XJuB0dr7s7renKoZaUDiELDbr3XGTa3KDl1nJyu0dx797BA
 pHuSgxxbFa0/cQO0LJHyXim9xN3yOS0Wo70tHS+xOjpuHL7dvsDDUuDHnTdsTBFk7h5t
 yGGmCwhmuhVbWATbjztg6X58udmDHcu2lUUK0BI7kg1BgKPUgx0Xm/LH3jk47tlsoh+B
 FvAU4CZp90+zOlnMpAHEi5fK+ki19vDaxKAtVZw2Egttg//GWl4XFanJKykQaxm3RO6t
 X6hit9gDMZAB2TSu/Tnl2l5AX58Ii43cQjthKCoNJdfgDd/9XupVNZ2DOSbJUF8S+KXK
 84fQ==
X-Gm-Message-State: ANhLgQ2xEJ1RtSvFsvyQDESrUZppMc0os9HJ7ozFYIEKZNbtbIidRcUx
 IkyHXTs24G0FWeWH3G12owK9/x3vHdbQOuqdvho=
X-Google-Smtp-Source: ADFU+vts+xJgjvsNggC0oJn6T/AhhA6fIzZAK7IOhIRQgnxsxYNXe7MXAD02qS1EHhqhreTigQi0w6OWbvY0Klo8cyc=
X-Received: by 2002:a25:ace2:: with SMTP id x34mr7802951ybd.83.1583999750963; 
 Thu, 12 Mar 2020 00:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200304001339.8248-1-rcampbell@nvidia.com>
 <20200304001339.8248-2-rcampbell@nvidia.com>
In-Reply-To: <20200304001339.8248-2-rcampbell@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 12 Mar 2020 17:55:39 +1000
Message-ID: <CACAvsv4+od30K-FAr5Fet7kOz1APRDTXmHRc3fN4eiCVDhY02w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v3 1/4] nouveau/hmm: fix vma range check for
 migration
To: Ralph Campbell <rcampbell@nvidia.com>
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
Cc: linux-rdma@vger.kernel.org, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've taken all 4 patches in my tree.

Thanks Ralph,
Ben.

On Wed, 4 Mar 2020 at 10:14, Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> find_vma_intersection(mm, start, end) only guarantees that end is greater
> than or equal to vma->vm_start but doesn't guarantee that start is
> greater than or equal to vma->vm_start. The calculation for the
> intersecting range in nouveau_svmm_bind() isn't accounting for this and
> can call migrate_vma_setup() with a starting address less than
> vma->vm_start. This results in migrate_vma_setup() returning -EINVAL for
> the range instead of nouveau skipping that part of the range and migrating
> the rest.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index df9bf1fd1bc0..169320409286 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -179,6 +179,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>                 if (!vma)
>                         break;
>
> +               addr = max(addr, vma->vm_start);
>                 next = min(vma->vm_end, end);
>                 /* This is a best effort so we ignore errors */
>                 nouveau_dmem_migrate_vma(cli->drm, vma, addr, next);
> --
> 2.20.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
