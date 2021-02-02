Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7B30D4CC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36446E9E5;
	Wed,  3 Feb 2021 08:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3196E8F0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:44:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c12so19502394wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 00:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xF8qedlJolmxjBdAS9Sywdm5NC/I3fz6Ssj86vPbp9Q=;
 b=nmh/0ol5uk8pnSQmOGqt5K+oG9m/FjeGJIk0NTKlL8ZgvuGa8p1neScVJUkY7ukkQG
 AqsofN2KljvUHs5ZtCuSyeIYsxvqXegjpdJiq0Xfn+6czRRXlz8jU/EWBRoiTv0Hk47N
 hu04jb44kmVuStIgWubzXJXisr55AgYzM++/mqxGDul53FkOWZ6XxIZCYEXd0o/cU33Y
 4yrrbiFICwviSZL4z/hVtMmNW+9tgbjoST/WEhTcVa0GyEtWVkYg5IUMYNZwwYs1l4f+
 9QaKNKErlpGfCcVia2qHuffZFIj5v0lmyXBo7SgUdSelOi8phh7UQCjCNKL3Gf2tcOCe
 W5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xF8qedlJolmxjBdAS9Sywdm5NC/I3fz6Ssj86vPbp9Q=;
 b=qtpzsbLv576RPxVPAKlEd6+Y3WJVz1MzOpj81/OSaUtew9SbYyGwsvD56B0Dd+/lxb
 4Qx1DVQA3WcW6nR2fzRxStSc3/Jh+2jS0hk5RwO2XY+YHC5zFWIrbAr7NjiWfkGTyNkg
 1Xpf4/5lulaq9edl54pFnnC/lHG5p3XTEtr97n5nTzboIGg7tq/TA6uPLNYTNXpFo9cu
 KokR/Di6VK9F8cBujeHIzFIDpApexI9Frf5furUt3eO7jFurZo04JCZlJqXDUU/eZx5j
 o5glSeZgK2SLGvYSydkx0/azIWQHVOminjNPI9XFyijAejwB6liaD/2ZjXo2vlLGHtb3
 80mQ==
X-Gm-Message-State: AOAM532VmMj8mLtcBqfYTsjclNKGYRcTnLENYLw9htWM44QIRoD2q6xO
 u7ILV4gcwxF4mI9Kg3xqX2WaEGw1/4SOLA73N9SW1g==
X-Google-Smtp-Source: ABdhPJyIcGuuSym0awOVNMXB2Bhi1rD0SlTVRtk+EYonkDPzcHjZReKVITS7PVf3SKTHsvL5JyeM/K20x3otaInPs6I=
X-Received: by 2002:adf:ed45:: with SMTP id u5mr22294772wro.358.1612255495607; 
 Tue, 02 Feb 2021 00:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20210128083817.314315-1-surenb@google.com>
 <20210128091348.GA1962975@infradead.org>
 <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
 <YBMAGRIwcbPF17cU@google.com>
 <CAJuCfpF78RYedBoAgkDdgMdfSmNwC2AQk-zZxAqkhCdtBB9gtQ@mail.gmail.com>
 <CAJuCfpH5nwvtMR+32G0-xa_hY-b_Hnw=Figqq9xcsTGgJhOiww@mail.gmail.com>
 <20210202070336.GA3535861@infradead.org>
In-Reply-To: <20210202070336.GA3535861@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Feb 2021 00:44:44 -0800
Message-ID: <CAJuCfpHWVcL1Cw=nm4THf0EzEan0jyVgLRNOdKr2ZbXex3DUcg@mail.gmail.com>
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
 Christian K??nig <christian.koenig@amd.com>,
 kernel-team <kernel-team@android.com>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, ??rjan Eide <orjan.eide@arm.com>,
 labbott@redhat.com, Robin Murphy <robin.murphy@arm.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 1, 2021 at 11:03 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> IMHO the
>
>         BUG_ON(vma->vm_flags & VM_PFNMAP);
>
> in vm_insert_page should just become a WARN_ON_ONCE with an error
> return, and then we just need to gradually fix up the callers that
> trigger it instead of coming up with workarounds like this.

For the existing vm_insert_page users this should be fine since
BUG_ON() guarantees that none of them sets VM_PFNMAP. However, for the
system_heap_mmap I have one concern. When vm_insert_page returns an
error due to VM_PFNMAP flag, the whole mmap operation should fail
(system_heap_mmap returning an error leading to dma_buf_mmap failure).
Could there be cases when a heap user (DRM driver for example) would
be expected to work with a heap which requires VM_PFNMAP and at the
same time with another heap which requires !VM_PFNMAP? IOW, this
introduces a dependency between the heap and its
user. The user would have to know expectations of the heap it uses and
can't work with another heap that has the opposite expectation. This
usecase is purely theoretical and maybe I should not worry about it
for now?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
