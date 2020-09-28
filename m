Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A12E27BDA8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3298789DFB;
	Tue, 29 Sep 2020 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9B88843;
 Mon, 28 Sep 2020 09:57:28 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1070e9c8;
 Mon, 28 Sep 2020 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=3UT5Qurs6QFcvRuY8EVP0R+VoG0=; b=Mx27Z6
 TiPBYyjYl/C37E872vubFfeTJ14DDEVRLNbpEfkWYpS08Vr/R58Ho5PbaOuPi7/6
 OsnJ05rfQ60YVJuqakGi6bi/mWiV3cfNOll3dAIS9sHLgOEZQXYmCzmDpqJ4NcHW
 aL8Ywmg7tVpXmNH7kwbPOuZVN8KirN2y5992QEQi0kMoJVSw7YH+G8dHfrk9bOcE
 Nm5IeiU/8VBnIzA9FJw+gsnu3rgrHCynM9AZugD7YeuOTLzfJ1FesEMphiQJNdjJ
 tpWgVmKW8T1Nlj3GaVBplkQcKf0HMJ2bB81T7/EnbY1xtk2QiJ/BmZa7w8FVdgnp
 ng1oPsNhEUb/o5cw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8ec20811
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 28 Sep 2020 09:25:59 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q4so485556iop.5;
 Mon, 28 Sep 2020 02:57:26 -0700 (PDT)
X-Gm-Message-State: AOAM531fmJ88BJKo1wdRMUFv/ojJCbKC97eKz03d0WbUgxw/wzqI67r+
 AivFFhTay730g27foy46Cq0TNjyWlNU+IFD4Xi0=
X-Google-Smtp-Source: ABdhPJwY4ZTc5KCQXMLpQ/osGiTdHnD1LifiBaBrHxFZd7llNsCevSRxLzU462ezZN+RsIB5U1QP/UQOnsN4jbdvjKI=
X-Received: by 2002:a6b:7f4d:: with SMTP id m13mr6188872ioq.80.1601287045576; 
 Mon, 28 Sep 2020 02:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9odvKzyAG7HgzSE-1gLOfiU=HL1MB5w4z=AwOsjz9WJPA@mail.gmail.com>
In-Reply-To: <CAHmME9odvKzyAG7HgzSE-1gLOfiU=HL1MB5w4z=AwOsjz9WJPA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 28 Sep 2020 11:57:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9qPo_MNrVioY=qgOVNxYBVY1_i_eep5wzP-7Akq5fH1Xg@mail.gmail.com>
Message-ID: <CAHmME9qPo_MNrVioY=qgOVNxYBVY1_i_eep5wzP-7Akq5fH1Xg@mail.gmail.com>
Subject: Re: 5.9-rc7 null ptr deref in __i915_gem_userptr_get_pages_worker
To: Vasily Gorbik <gor@linux.ibm.com>, Linux-MM <linux-mm@kvack.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>
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
Cc: intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increasing the CC list a bit, as i915 didn't really get much churn
rc6->rc7, but mm/gup.c did, and mm has had a lot of recent changes.

On Mon, Sep 28, 2020 at 11:39 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Seeing a new crash in 5.9-rc7 I didn't have in 5.9-rc6:
>
> [ 1311.596896] BUG: kernel NULL pointer dereference, address: 0000000000000064
> [ 1311.596898] #PF: supervisor write access in kernel mode
> [ 1311.596899] #PF: error_code(0x0002) - not-present page
> [ 1311.596899] PGD 0 P4D 0
> [ 1311.596901] Oops: 0002 [#1] SMP
> [ 1311.596902] CPU: 10 PID: 1431 Comm: kworker/u33:1 Tainted: P S   U
>    O      5.9.0-rc7+ #140
> [ 1311.596903] Hardware name: LENOVO 20QTCTO1WW/20QTCTO1WW, BIOS
> N2OET47W (1.34 ) 08/06/2020
> [ 1311.596955] Workqueue: i915-userptr-acquire
> __i915_gem_userptr_get_pages_worker [i915]
> [ 1311.596959] RIP: 0010:__get_user_pages_remote+0xd7/0x310
> [ 1311.596960] Code: f5 01 00 00 83 7d 00 01 0f 85 ed 01 00 00 f7 c1
> 00 00 04 00 0f 84 58 01 00 00 65 48 8b 04 25 00 6d 01 00 48 8b 80 40
> 03 00 00 <c7> 40 64 01 00 00 00 65 48 8b 04 25 00 6d 01 00 48 c7 44 24
> 18 00
> [ 1311.596961] RSP: 0018:ffff888fdfe47de0 EFLAGS: 00010206
> [ 1311.596962] RAX: 0000000000000000 RBX: 00007fe188531000 RCX: 0000000000040001
> [ 1311.596962] RDX: 0000000000000001 RSI: 00007fe188531000 RDI: ffff888ff0748f00
> [ 1311.596963] RBP: ffff888fdfe47e54 R08: ffff888fedc7d7c8 R09: 0000000000000000
> [ 1311.596963] R10: 0000000000000018 R11: fefefefefefefeff R12: ffff888ff0748f00
> [ 1311.596963] R13: ffff888fedc7d7c8 R14: ffff888f81fe3a40 R15: 0000000000042003
> [ 1311.596964] FS:  0000000000000000(0000) GS:ffff888ffc480000(0000)
> knlGS:0000000000000000
> [ 1311.596965] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1311.596965] CR2: 0000000000000064 CR3: 0000000002009003 CR4: 00000000003706e0
> [ 1311.596966] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 1311.596966] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 1311.596967] Call Trace:
> [ 1311.596993]  __i915_gem_userptr_get_pages_worker+0xc8/0x260 [i915]
> [ 1311.596996]  process_one_work+0x1ca/0x390
> [ 1311.596997]  worker_thread+0x48/0x3c0
> [ 1311.596998]  ? rescuer_thread+0x3d0/0x3d0
> [ 1311.597000]  kthread+0x114/0x130
> [ 1311.597001]  ? kthread_create_worker_on_cpu+0x40/0x40
> [ 1311.597003]  ret_from_fork+0x1f/0x30
> [ 1311.597031] CR2: 0000000000000064
> [ 1311.597033] ---[ end trace e2b8ddde994a6f6d ]---
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
