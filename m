Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40BD27BDC9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52F889BD4;
	Tue, 29 Sep 2020 07:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640B189FE3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 12:00:00 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c2so619496qkf.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nnyy03xtiFPqmZlbmE+teLd8X53Eyq870inKRyNgjhU=;
 b=cpTT38evNw+rKQlt8Mlfz+BF1L43eGL86jpoXMo+Dx5radXSYHjzMU4Ix0wbNMvD0H
 fvZcy2qIWnsxh6v42+ZhCo25LYDNx1+q6ijgiffs3Iu24+bsigZ/TM0X65cDYdtsVZ6C
 t6vNqOrmQ9xjh2s/D20MAfG0vXooZEloQRp9WHymBxHn/JfNF7dIKcp4kOBU2+7OPoIg
 Uyv9GlNtnrkczuMmQjyYtC7TWKuZT15bnCNwPI2cOG2R/GZAY0Sjmi6Oy/qfPFQfA1p+
 KWxQxzawW7qf7uH2R0j1ReHvVA4h96xyCCAyEb60H0dWNZa71DG3pdblyQSdxENWNM9q
 v0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nnyy03xtiFPqmZlbmE+teLd8X53Eyq870inKRyNgjhU=;
 b=Ibxwr6qPXzbNvzuGDo10xCRK+/7Ot8K5qlZsL+pRj5Ror7gA6g8atVf0i+KqSF58zO
 DqxgGzJuVcwvK4jNzRtCmxjTL907HjVlA2nGD+8sTWB/msX4ZWIeG5AO5ONNv/yYgvBL
 SAX0NXrSblW8oeO20ogCO/uMbi4XpQF0dURAHHcTANnuP9OxtdYT6iLjMz0rhQAeZhzk
 +KFBnfci1p+798FHDXW5RXJ3YusjZ5ep0QDUIe734RUhntMVWOCtT25gOJtTv0R7c9LX
 ppq6zkTKxupprgrydGQKeX1uLdbTXQqGlsmIIkEiEtsUy/RyEU6fFu4yjD5Vg9Zn26zZ
 hROw==
X-Gm-Message-State: AOAM533zx/JgD59mv7YXWD7B/EQkUngzZ+piMMvDGHkO5+Nn2gr80GUL
 /a79WCy18x79oKqnRU/zkJNNGQ==
X-Google-Smtp-Source: ABdhPJy4ItawkHdUEb++0v6F8cioYGcvW7vFqwz9rqzCYPXyBaZkc0rsz2ludjLRsOxbhbldqcQIUA==
X-Received: by 2002:a37:b8c2:: with SMTP id i185mr968855qkf.87.1601294399390; 
 Mon, 28 Sep 2020 04:59:59 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id q72sm727727qka.22.2020.09.28.04.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 04:59:58 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kMroz-001tq4-Rn; Mon, 28 Sep 2020 08:59:57 -0300
Date: Mon, 28 Sep 2020 08:59:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] mm: do not rely on mm == current->mm in
 __get_user_pages_locked
Message-ID: <20200928115957.GM9916@ziepe.ca>
References: <CAHmME9ppPhLLtS4Vd5g-Yz9dZUUc7V_yjA8qOkYs4HsnGWtpcQ@mail.gmail.com>
 <20200928103507.2164-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928103507.2164-1-Jason@zx2c4.com>
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linux-mm@kvack.org, peterx@redhat.com,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 12:35:07PM +0200, Jason A. Donenfeld wrote:
> It seems likely this block was pasted from internal_get_user_pages_fast,
> which is not passed an mm struct and therefore uses current's. But
> __get_user_pages_locked is passed an explicit mm, and current->mm is not
> always valid. This was hit when being called from i915, which uses:
> 
>   pin_user_pages_remote->
>     __get_user_pages_remote->
>       __gup_longterm_locked->
>         __get_user_pages_locked
> 
> Before, this would lead to an OOPS:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000064
>   #PF: supervisor write access in kernel mode
>   #PF: error_code(0x0002) - not-present page
>   PGD 0 P4D 0
>   Oops: 0002 [#1] SMP
>   CPU: 10 PID: 1431 Comm: kworker/u33:1 Tainted: P S   U     O      5.9.0-rc7+ #140
>   Hardware name: LENOVO 20QTCTO1WW/20QTCTO1WW, BIOS N2OET47W (1.34 ) 08/06/2020
>   Workqueue: i915-userptr-acquire __i915_gem_userptr_get_pages_worker [i915]
>   RIP: 0010:__get_user_pages_remote+0xd7/0x310
>   Code: f5 01 00 00 83 7d 00 01 0f 85 ed 01 00 00 f7 c1 00 00 04 00 0f 84 58 01 00 00 65 48 8b 04 25 00 6d 01 00 48 8b 80 40 03 00 00 <c7> 40 64 01 00 00 00 65 48 8b 04 25 00 6d 01 00 48 c7 44 24 18 00
>   RSP: 0018:ffff888fdfe47de0 EFLAGS: 00010206
>   RAX: 0000000000000000 RBX: 00007fe188531000 RCX: 0000000000040001
>   RDX: 0000000000000001 RSI: 00007fe188531000 RDI: ffff888ff0748f00
>   RBP: ffff888fdfe47e54 R08: ffff888fedc7d7c8 R09: 0000000000000000
>   R10: 0000000000000018 R11: fefefefefefefeff R12: ffff888ff0748f00
>   R13: ffff888fedc7d7c8 R14: ffff888f81fe3a40 R15: 0000000000042003
>   FS:  0000000000000000(0000) GS:ffff888ffc480000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 0000000000000064 CR3: 0000000002009003 CR4: 00000000003706e0
>   DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>   Call Trace:
>    __i915_gem_userptr_get_pages_worker+0xc8/0x260 [i915]
>    process_one_work+0x1ca/0x390
>    worker_thread+0x48/0x3c0
>    ? rescuer_thread+0x3d0/0x3d0
>    kthread+0x114/0x130
>    ? kthread_create_worker_on_cpu+0x40/0x40
>    ret_from_fork+0x1f/0x30
>   CR2: 0000000000000064
> 
> This commit fixes the problem by using the mm pointer passed to the
> function rather than the bogus one in current.
> 
> Fixes: 008cfe4418b3 ("mm: Introduce mm_struct.has_pinned")
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  mm/gup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Yes this looks like the right fix

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
